Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF08C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:20:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21839.1787664035988075487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 06:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tMiksz3F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 587D51A1814;
	Tue, 25 Aug 2026 13:20:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BA9A604C4;
	Tue, 25 Aug 2026 13:20:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABF7811C79364;
	Tue, 25 Aug 2026 15:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787664029; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vMJk0MnGw97TCIZ7blhHdYxZFqrp+zGSzPbgmgQ9HRI=;
	b=tMiksz3FUdJtqDg97VzMKI38c/YML9Bi/AOXDWzb/C1N16KUDXfyR5kuMMDL0XUOSM4ZK/
	BpWZXrQ4Ng4B1lq0i+Ba41F+HQtUUD1v2t/0BGtGQz4l0AI9Vy98XzJ3dN5yOn55RcXQNB
	QRr8Wjr9vsVqdhSeGqH2PEodogFjHFhFPmCIs92F4N12kFr+YDnXvXN5vUqxSFKCC/6Aci
	I3GTfb0ssF5g1PKJHLxfdPcYkN9DKp0I/xeeo9BDwMjkcRD5kVCkVFnmOaAs6WXCtmv1dT
	ZP5pFh7zlpR7IyVxi6ytgqbkMYSBkI/pb/c3r1x6BSqU/r8gsD3fz9PZ5Npc5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 15:20:25 +0200
Message-Id: <DKY20BXL5Q41.3JPBK3LLA78H4@bootlin.com>
Subject: Re: [PATCH v17 00/14] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244238

On Tue Aug 25, 2026 at 3:32 AM CEST, Sumanth Gavini wrote:
> * V17:
>     - patch 14: replaced non-ASCII arrow with ASCII in commit message to=
=20
>       fix DKIM signature verification failure on patch 14( v16 patch 14=
=20
>       could not be applied via b4 due to BADSIG)
>     - all other patches identical to v16
>
> * V16:
>     - patch 01-09: unchanged from v15
>     - patch 10: updated - rename target path from pkg-config_3.0.5.bb to
>       pkg-config_3.0.6.bb to track the pkg-config version bump that
>       occured after v15 was submitted
>     - patches 11-12: unchanged from v15
>     - Added "package_rpm.bbclass: suppress RPM 6 fileattr dependency
>       generators" (0013 patch). Suppress all RPM 6 per-filetype=20
>       fileattr dep generator macros
>     - Added "lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on
>       %post failure" (0014 patch). RPM 6 #3819 causes rpmtsRun() to=20
>       return -1 for warn-only %post failures via ts->scriptError;
>       intercept in _invoke_dnf() so install_pkgs()'s existing=20
>       scriptlet scan runs as it did with RPM 4.
>

Hi Sumanth,

Thanks for the new version. Tests went way better than last week build.

a-full build is here: https://autobuilder.yoctoproject.org/valkyrie/#/build=
ers/58/builds/2191

So far, we just have a reproducibility failure:

AssertionError: The following rpm packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./noarch/hicolor-icon-theme-dev-0.18-r0.noarch.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./noarch/iso-codes-dev-4.20.1-r0.noarch.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./noarch/wayland-protocols-dev-1.49-r0.noarch.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/mobile-broadband-provider-info-dev-20251101-=
r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4804

Diffoscope output can be seen here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260825-hcfdo3x9/=
packages/

This looks like pkgconfig is trying to bother us one last time. Can you
have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


