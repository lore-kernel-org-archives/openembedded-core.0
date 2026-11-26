Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12979.1795696670404432850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 04:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n/nkOpwO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D3C7E4E41794;
	Thu, 26 Nov 2026 12:37:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9907D604ED;
	Thu, 26 Nov 2026 12:37:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 853A211E6806D;
	Thu, 26 Nov 2026 13:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795696663; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vqNELWFY4QYLX2meYH0Fjmuczidhp1bzD75+y7ARZ18=;
	b=n/nkOpwOt16TSoddzoPfVMgoqIVoIjAiBpuWwn2GYNPHIq5LSVSWTg/gSBSVKmpZW3q7D1
	eJ6nkRKzrThG5ahRfnoNV+RrIXIl5MkxjQq8Lwo2FixgsA19gdGVpRzDj6FjwSPKC96sAK
	N4fx0kP74ytraDnMY+hxMmZcjB4psIDCYUNGMf9HQfYI0UYA6suv/xnWCxrJh22NIE6VnQ
	9zyPO3idEhqDOMjZUtC/tCi+neN/20giVRy51EwL2vQfG2dj/WwGrEPw0YzTk2jUWqo0nc
	P4PU5VNcSgzs6gIgZvSgkpADDicrNU5EkuSky69zOC0f4Nnv1o73OSacoV2p/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 13:37:39 +0100
Message-Id: <DN55C99MPJSJ.3T2UJVJK58BA8@bootlin.com>
Subject: Re: [OE-core] [PATCH 06/11] ovmf: upgrade edk2-stable202605 ->
 edk2-stable202611
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
 <20261124171807.74394-7-jaipaul.cheernam@est.tech>
 <1281564.1795692854389261236@lists.openembedded.org>
In-Reply-To: <1281564.1795692854389261236@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 12:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251294

On Thu Nov 26, 2026 at 12:34 PM CET, Jaipaul Cheernam wrote:
> Hi Richard/Ross,
>
> After patch review meeting, I checked my local branch and patch=C2=A0 loo=
ks okay and same in patchwork also.
> Looks like the patch we reviewed in oe-core-contrib master-next is broken=
 for this commit as its missed "0005-CryptoPkg-IntrinsicLib-fix-memcpy-alia=
s-prototype-fo.patch" , I noticed its missing from Mathieu's branch also.
>
> Complete change is present in here but somehow missed on those branches .
>
> Can you take patch from here https://lists.openembedded.org/g/openembedde=
d-core/message/251058 or https://patchwork.yoctoproject.org/project/oe-core=
/patch/20261124171807.74394-7-jaipaul.cheernam@est.tech/
>
> Regards,
> Jaipaul

Hi Jaipaul,

This is probably my fault: picking ovmf patches from the mailing list is
always a bit tricky, because of the Windows line breaks. This one looked
fairly simple, so I tried to fix the issues manually, but obviously I
failed.

Is there a public git where you can push this patch? It will be easier
for us.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

