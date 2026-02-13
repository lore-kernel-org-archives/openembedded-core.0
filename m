Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CB6EDF170
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 14:39:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73239.1770993557655420133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 06:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I31nQBXk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 402EE4E40D42;
	Fri, 13 Feb 2026 14:39:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC8B6606BE;
	Fri, 13 Feb 2026 14:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2692310368EAD;
	Fri, 13 Feb 2026 15:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770993554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oM5HpL3VoZaK0P8KlwZS7g4pgd+HNiBJP9s3ifWhziA=;
	b=I31nQBXkZlN0k0HHE+C7ksNHDhVqJkhwy4XbeH42KHe+FKLopGtdu016FSC0PfHAxPrT29
	C0PptKmBQPnrmpsB9lOW5vj2Dc/o98SGJnPqBnvLeb7J3XNUMZ6KOXobFarphTGdA56X05
	5gMDXisH8RIabguSyQVWNoh9COos9VY+qEO2xAvDOC2qKxpaGJ/Q0OlNFPhCWStlivKkMl
	IMGMgUoiXFHqJzubCTfclE6N/QPlrZg12KfJQlY8ceSygffqogBIZeGsj6NZq/OosxMT3Y
	pL6wYoAKqWM7uy5tFDj0QJAu1kNV6t26pl78cxecocYpG4TUKXt/MshC7mPtCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:39:12 +0100
Message-Id: <DGDWTI56DB4D.1I1SUNULX6S5R@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.46 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260212142933.3543788-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260212142933.3543788-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 14:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231120

On Thu Feb 12, 2026 at 3:29 PM CET, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> New Features:
> Support for new instructions added to AMD, ARM and RISC-V architectures.
> Support for version 3 of the SFrame standard.
> The readelf program can now display the contents of Global Offset Tables.
> Improved linker tagging support.
>
> Detailed release notes are here [1]
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00006.html
>
> Dropped patches:
> 0001-aarch64-constify-BTI-and-GCS-report-functions.patch
> Since the fix is already included in binutils 2.46.
>
> CVE patches: CVE-2025-11081,CVE-2025-11082,CVE-2025-11083,
> CVE-2025-11839,CVE-2025-11840,CVE-2025-11412,CVE-2025-11413,
> CVE-2025-11414,CVE-2025-11494,CVE-2025-11495.
> These were dropped because they are already addressed in binutils 2.46.
>
> Drop CVE_STATUS:
> binutils 2.46 has needed fixes for CVE-2025-7545 and CVE-2025-7546.
>
> Rebase existing patches with binutils 2.46.
>
> Testing Results:
> +----------------------+--------+--------+------+
> | Result               | 2.45.1 |  2.46  | Diff |
> +----------------------+--------+--------+------+
> | Expected Passes      | 318    |  331   | +13  |
> | Untested Testcases   | 5      |  5     |  0   |
> | Unsupported Tests    | 8      |  6     | -2   |
> +----------------------+--------+--------+------+
>
> Testcases changes:
> -------------------------------------------------------------------------=
------
> Testcase-name                                             2.45.1        2=
.46
> -------------------------------------------------------------------------=
------
> nm --ifunc-chars=3D-- (global ifunc)                          -          =
 PASS
> nm --ifunc-chars=3D-- (local ifunc)                           -          =
 PASS
> copy with unknown section flag                              -           P=
ASS
> objcopy tek2bin                                             -           P=
ASS
> binary symbol (implicit)                                    -           P=
ASS
> binary symbol (explicit)                                    -           P=
ASS
> readelf SFrame V2 (x86-64/test-v2-ET_EXEC.sframe)           -           P=
ASS
> objdump SFrame V2 (x86-64/test-v2-ET_EXEC.sframe)           -           P=
ASS
> readelf SFrame V2 (x86-64/test-v2-ET_REL.sframe)            -           P=
ASS
> objdump SFrame V2 (x86-64/test-v2-ET_REL.sframe)            -           P=
ASS
> run objcopy of executable                                UNSUPPORTED    P=
ASS
> run stripped executable                                  UNSUPPORTED    P=
ASS
> run stripped executable with saving a symbol             UNSUPPORTED    P=
ASS
> Copy object attributes v2 data from an object to another    -        UNSU=
PPORTED
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for the upgrade.

It looks like some patch needs to be refreshed or dropped. It's only
applied for class-nativesdk, so that's probably why it does not show in
most builds.

ERROR: Task (virtual:nativesdk:/srv/pokybuild/yocto-worker/genericx86-64/bu=
ild/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.b=
b:do_patch) failed with exit code '1'
...
ERROR: nativesdk-binutils-2.46-r0 do_patch: Applying patch '/srv/pokybuild/=
yocto-worker/genericx86-64/build/layers/openembedded-core/meta/recipes-devt=
ools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so=
.conf.patch' on target directory '/srv/pokybuild/yocto-worker/genericx86-64=
/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-binutils/2.4=
6/sources/binutils-2.46'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3189

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


