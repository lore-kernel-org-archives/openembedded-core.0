Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A01110BA44B
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:37:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68507.1774600664715150490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K75J0o4B;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DD1FCC406B4;
	Fri, 27 Mar 2026 08:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 386F560230;
	Fri, 27 Mar 2026 08:37:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9072E10450F15;
	Fri, 27 Mar 2026 09:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774600661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uIdxRlS6C6Ek7e9TXsqtfmMTDfR21Axg8+5CLruoDS8=;
	b=K75J0o4BaCRCBg5lkin5WWWj9F94A4kku3TXGT9mcwonXdkZ0LEk9Npm6rMTPIku+CcSkf
	xRqMoo1KqDsy1Qc2aC2dAti1VqLFjyHmf699/xq7PMsvJXyxT/19nqPhaLz0L4meJS/+ND
	qZ6YxLpyrxHRYeXs/Td5booBF6pBUx1vsXJIq79MgKSFz3gG1QlcK0IYgYrrRX08Tr1fBl
	mFHxLJcc+KED+cRMbO7nfFrcgk7D7+WSpAGfSQKz+oQSnZiWm9N927HVmo2zavRNFb468c
	vxCLXVC+15rsvXfgvOzhAbH/0m/8THjZ1+6geetmN/2HisO0FOQrUETX764r6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 09:37:40 +0100
Message-Id: <DHDFFKPALHBR.U69UUGIUROAO@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 01/12] python3: Add warning comment before
 PACKAGECONFIG[freethreading]
Cc: "Khem Raj" <raj.khem@gmail.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Trevor Gamblin" <tgamblin@baylibre.com>, "Alexander
 Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234069

On Thu Mar 26, 2026 at 3:30 PM CET, Zoltan Boszormenyi via lists.openembedd=
ed.org wrote:
> The warning comment is really needed. While Python 3.14 supports
> free-threading officially, the ecosystem around it does not yet.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

Thanks for your patch. We are seeing two issues on the autobuilder:

First, some file is not shipped:
ERROR: nativesdk-python3-3.14.3-r0 do_package: QA Issue: nativesdk-python3:=
 Files/directories were installed but not shipped in any package:
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/b=
in/python3.14.real

Then, some package conflict:
ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command '/sr=
v/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-p=
oky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmver=
bosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/genericx86_64-poky-linux/core-image-sato/1.0/rootfs/etc/dnf/dnf.con=
f --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worker/genericx86-64/build/bui=
ld/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/rootfs/etc/yum.rep=
os.d --installroot=3D/srv/pokybuild/yocto-worker/genericx86-64/build/build/=
tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/rootfs --setopt=3Dlog=
dir=3D/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/generi=
cx86_64-poky-linux/core-image-sato/1.0/temp --repofrompath=3Doe-repo,/srv/p=
okybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky=
-linux/core-image-sato/1.0/oe-rootfs-repo --nogpgcheck install dnf packageg=
roup-base-extended packagegroup-core-boot packagegroup-core-ssh-dropbear pa=
ckagegroup-core-x11-base packagegroup-core-x11-sato psplash rpm run-postins=
ts locale-base-c locale-base-en-us locale-base-en-gb' returned 1:
DNF version: 4.24.0
cachedir: /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/ge=
nericx86_64-poky-linux/core-image-sato/1.0/rootfs/var/cache/dnf
Added oe-repo repo from /srv/pokybuild/yocto-worker/genericx86-64/build/bui=
ld/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo
User-Agent: falling back to 'libdnf': could not detect OS or basearch
repo: using cache for: oe-repo
oe-repo: using metadata from Thu 26 Mar 2026 09:57:24 PM UTC.
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem 1: conflicting requests
  - nothing provides python3-compression needed by dnf-4.24.0-r0.core2_64 f=
rom oe-repo
  - nothing provides python3-ctypes needed by dnf-4.24.0-r0.core2_64 from o=
e-repo
  - nothing provides python3-email needed by dnf-4.24.0-r0.core2_64 from oe=
-repo
  - nothing provides python3-json needed by dnf-4.24.0-r0.core2_64 from oe-=
repo
  - nothing provides python3-logging needed by dnf-4.24.0-r0.core2_64 from =
oe-repo
  - nothing provides python3-shell needed by dnf-4.24.0-r0.core2_64 from oe=
-repo
  - nothing provides python3-threading needed by dnf-4.24.0-r0.core2_64 fro=
m oe-repo
  - nothing provides python3-codecs needed by dnf-4.24.0-r0.core2_64 from o=
e-repo
  - nothing provides python3-curses needed by dnf-4.24.0-r0.core2_64 from o=
e-repo
  - nothing provides python3-netclient needed by dnf-4.24.0-r0.core2_64 fro=
m oe-repo
  - nothing provides python3-sqlite3 needed by dnf-4.24.0-r0.core2_64 from =
oe-repo
 Problem 2: package packagegroup-core-x11-sato-base-1.0-r0.genericx86_64 fr=
om oe-repo requires settings-daemon, but none of the providers can be insta=
lled
  - package packagegroup-core-x11-sato-1.0-r0.genericx86_64 from oe-repo re=
quires packagegroup-core-x11-sato-base, but none of the providers can be in=
stalled
  - package settings-daemon-0.0.2+git0+df669c6579-r0.core2_64 from oe-repo =
requires libgconf-2.so.4()(64bit), but none of the providers can be install=
ed
  - package settings-daemon-0.0.2+git0+df669c6579-r0.core2_64 from oe-repo =
requires gconf >=3D 3.2.6, but none of the providers can be installed
  - conflicting requests
  - nothing provides python3-xml needed by gconf-3.2.6-r0.core2_64 from oe-=
repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3478

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


