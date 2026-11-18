Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15700.1795016948963221508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=muDOTRD8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 94D3DC79A9F
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:49:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B55A65FE9B;
	Wed, 18 Nov 2026 15:49:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D62911BC2564;
	Wed, 18 Nov 2026 16:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795016946; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Srveh/2j6UZNkC6OYFEsJz1FBaxQnNtULyyhOwhGCxc=;
	b=muDOTRD8f5mFP83ZYTL3ugdfqurPKMd71hIN1wrIQxtYrqWXQI/IV0fWWQxt4+LzN5iZhm
	Nt4C5ztSCXvNYR6/+Xoynd5u1xv/gZyZy6Bl3jbcuTy9Qxhl0v5rXvo3v0i5CRKox+R82J
	Z3E/tZr5CI0+LkHbY3tUiOHOJgMwPWrigl3I0wpEuX2d3pJ3H1lGY3H5EWr6MJ8rqwqAXj
	jZ4tAK2+6Y3zG8XwCIqxkyx39BD0y5vJrag8UCzUT3+r1Odeqq9VJg5j+9o3+QvScf8hMb
	b9T8+Ur0eoaRH4W9NKmDvV9WIq/Tk0WAM6gykgeM9CiKs3OIafHemVTNYTYBow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 16:49:04 +0100
Message-Id: <DMYGEG68G3D5.1V4ZHX7E9QGS7@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/3] gstreamer1.0-plugins-rs recipe fixes and
 upgrade
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250567

On Wed Nov 18, 2026 at 7:34 AM CET, Jaipaul Cheernam wrote:
> Fixes issue with AUH https://lists.openembedded.org/g/openembedded-core/m=
essage/249722
>
> Jaipaul Cheernam (3):
>   gstreamer1.0-plugins-rs: fix annotated tag match
>   gstreamer1.0-plugins-rs: drop S override and fix LIC_FILES_CHKSUM
>     paths
>   gstreamer1.0-plugins-rs: Upgrade 0.15.3 -> 0.15.4
>
>  .../gstreamer1.0-plugins-rs-crates.inc        | 1174 ++++++++---------
>  ...3.bb =3D> gstreamer1.0-plugins-rs_0.15.4.bb} |   10 +-
>  2 files changed, 541 insertions(+), 643 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-rs_0.15.3=
.bb =3D> gstreamer1.0-plugins-rs_0.15.4.bb} (96%)

Hi Jaipaul,

Thanks for the upgrade.

This is failing to configure for several architectures:

ERROR: gstreamer1.0-plugins-rs-0.15.4-r0 do_configure: Execution of '/srv/p=
okybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-lin=
ux/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_configure.354772' failed with=
 exit code 2
...
| sed: can't read /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp=
/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/sources/gstreamer=
1.0-plugins-rs-0.15.4//gstreamer1.0-plugins-rs-0.15.4/Cargo.toml: No such f=
ile or directory
| WARNING: exit code 2 from a shell command.
NOTE: recipe gstreamer1.0-plugins-rs-0.15.4-r0: task do_configure: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/qemux86-world/build/layers/openemb=
edded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.4=
.bb:do_configure) failed with exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/5065

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

