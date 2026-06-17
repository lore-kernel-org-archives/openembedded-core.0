Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448FECD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12264.1781692548690410265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 03:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zC09XoPq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E767C49F72
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 10:35:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F139601AA;
	Wed, 17 Jun 2026 10:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36CEC106CA260;
	Wed, 17 Jun 2026 12:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781692546; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kkLJdgw8crzBsraZ35B7Fks9P62AcFb9cibLE0e2WYQ=;
	b=zC09XoPqDwlB9A8CJ+dFIBcPlB+4ei9YpgruSy0yp6kinBCuZrPQFD4t75DDE0VVIVTdQg
	P/dBKGHho4DtcRqb9+9OkzYEr3S32TUxqw4gnmki2vruKJG84/EwYyb2Nsf+3YrZTTHkXs
	HS0IfyrvuduAEuVq+OGMyXwbVdtYNPMIciyykZ4jZuFciknK4EfBsCx68G1qyvNN3pQcy4
	dek42UCpbLL0Yb6Ekkf+wnqnvFtcmz7Uumu4dQ8I2yjBvsJ6LKMDyumZTm2LQIjWfHWrQ1
	yYes9BH+RJ5kIE8fQFX4enSqs6u7mHzVXkpEl7Xd4C+/Uv01dn2wlNC09xlWqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 12:35:44 +0200
Message-Id: <DJB9ANBS943K.UFIZ5E6NY3GB@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/3] libpcre: remove recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260616194959.3748347-1-peter.marko@siemens.com>
 <20260616194959.3748347-2-peter.marko@siemens.com>
In-Reply-To: <20260616194959.3748347-2-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 10:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239031

On Tue Jun 16, 2026 at 9:49 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>

Hi Peter,

Thanks for your patch.

> libpcre is obsolete project replaced by libpcre2.
> It was not updated for last 5 years.
> There is no consumer of this recipe in oe-core anymore.
>

Or maybe there is one :)

ERROR: Nothing PROVIDES 'pcre' (but /srv/pokybuild/yocto-worker/qemuriscv64=
-ptest/build/layers/openembedded-core/meta/recipes-extended/slang/slang_2.3=
.3.bb DEPENDS on or otherwise requires it). Close matches:
  pcre2
NOTE: Runtime target 'slang-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['slang-ptest', 'pcre']
NOTE: Runtime target 'core-image-ptest-all-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-ptest-all-dev', '=
core-image-ptest-slang', 'slang-ptest', 'pcre']
NOTE: Runtime target 'core-image-ptest-all' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-ptest-all', 'core=
-image-ptest-slang', 'slang-ptest', 'pcre']
NOTE: Runtime target 'core-image-ptest-slang' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-ptest-slang', 'sl=
ang-ptest', 'pcre']
ERROR: Nothing RPROVIDES 'slang' (but /srv/pokybuild/yocto-worker/qemuriscv=
64-ptest/build/layers/openembedded-core/meta/recipes-extended/slang/slang_2=
.3.3.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'slang'
NOTE: Runtime target 'slang' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['slang']
ERROR: Nothing RPROVIDES 'slang-dev' (but /srv/pokybuild/yocto-worker/qemur=
iscv64-ptest/build/layers/openembedded-core/meta/recipes-extended/slang/sla=
ng_2.3.3.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'slang-dev'
NOTE: Runtime target 'slang-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['slang-dev']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1764
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3838

This is because of a PACKAGECONFIG, if there is no way to use libpcre2,
maybe it can be disabled by default?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


