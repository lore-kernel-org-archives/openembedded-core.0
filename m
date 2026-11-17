Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116.1794940976085907691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KHdf6UsR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE5FB4E415EE;
	Tue, 17 Nov 2026 18:42:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78B945FDAD;
	Tue, 17 Nov 2026 18:42:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5802F11BC00A5;
	Tue, 17 Nov 2026 19:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794940969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jsJmCWkqeNm/8784BFeyLLHNo8ikekKROVD3kQr36Ro=;
	b=KHdf6UsRJi6B48sZ9+Nbhea731vZB6qoDYeXrPOsqGVrbQXCLZrDxKCX0i9FsFHl7hKHTG
	+0wI4sjrpO2qMrED4FHoVhqv+WXEVpn1VW8QpoLyBbAn7juPU1ZVu35TY7uF9u8FcmCu9k
	rMCNKU2iTczK0Jp3HmPLGS/+L2hm7k9vzL1p5N60UlXopOZnWAYUfGfZvRtuoEKEivRfYH
	03jYuLCSE7A/TwWYwX+aKBPh1vWXX3BBLNOKsBlPib7NPJKgA7Ymj1U4s0O5zd/u2lJjLY
	yEWlwew6U2QpnJizAebpAtIp2JEloaewlbpF3AhPnuO/pv8Zl5hE1frn/a0c5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 19:42:45 +0100
Message-Id: <DMXPGW66H9CP.1ATNO2XD1FDS3@bootlin.com>
Cc: "Ross Burton" <ross.burton@arm.com>, "Jon Mason" <jon.mason@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] grub: update upstream-check
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261116224959.197150-1-peter.marko@siemens.com>
In-Reply-To: <20261116224959.197150-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250485

On Mon Nov 16, 2026 at 11:49 PM CET, Peter Marko via openembedded-core wrot=
e:
> From: Peter Marko <peter.marko@siemens.com>
>
> Repository has moved, see [1].
> Old location does not contain new releases anymore.
>
> [1] https://www.phoronix.com/news/GNU-GRUB-To-FreeDesktop
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for your patches. It looks like this is breaking meta-arm builds.
Technically, this does not prevent from merging it into
openembedded-core, yet I'm a bit surprised by that.

If any of you has an idea of why qemu is failing here, I'd be happy to
hear about it. The QEMU boot log just contains what looks like a few
aborted boots:

NOTICE:  Booting Trusted Firmware
NOTICE:  BL1: v2.14.9(release):lts-v2.14.9-dirty
NOTICE:  BL1: Built : 06:59:21, Sep 25 2026
NOTICE:  BL1: Booting BL2
NOTICE:  BL2: v2.14.9(release):lts-v2.14.9-dirty
NOTICE:  BL2: Built : 06:59:21, Sep 25 2026
NOTICE:  BL1: Booting BL31
NOTICE:  BL31: v2.14.9(release):lts-v2.14.9-dirty
NOTICE:  BL31: Built : 06:59:21, Sep 25 2026
UEFI firmware (version 1.0 built at 06:19:29 on Sep 22 2026)
ESC[2JESC[004DESC[=3D3hESC[2JESC[009DNOTICE:  Booting Trusted Firmware
NOTICE:  BL1: v2.14.9(release):lts-v2.14.9-dirty
NOTICE:  BL1: Built : 06:59:21, Sep 25 2026
...
(the whole boot sequence is repeated 5 times)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/4883

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

