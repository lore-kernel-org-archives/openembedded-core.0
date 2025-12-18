Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BF1D6D221
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:40:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42134.1766065220949880386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=am4L1LB6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C551E1A22AC
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:40:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93FF7606B6;
	Thu, 18 Dec 2025 13:40:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E041E102F0B44;
	Thu, 18 Dec 2025 14:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766065217; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ty2n1XyH9rYIgbpFSLotgTOyPBmGIFMr6qAC3iFiyPo=;
	b=am4L1LB6Odmw3hbIBJvYKMVD+JfSK5oUvHzE+YZBK4aPPY/myS+K1kIofRsBiJIMn/cvaO
	NtpMuwykkXhZAjnxWVZC/ltpQYIUj7O9qBmipTgdH2yf3hTud4OXIqon/plobDuC6hFZZA
	WaRJjiIEy2lKInl2bZLvl3CMLY40h4WeGRbuZ4j/ypxFyK4XZkoZX+dDU+XIctc1m6g6Ml
	rtVA1+JLUBDsIV9jgHRXdW6iF1bdhE9yJqLEW/wCSdkizsSIJ3kizLofoMiDzGkuc47LE6
	Dsxd/cNcUslqWAvMMDMv9Yi+IVw7T/ZKHLC7jKpHy3HeL1RJIJioAqNxaRY9Vg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 14:40:15 +0100
Message-Id: <DF1DVBTU8KF4.DKISQQI02FOC@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/3] python3-pyzstd: import 0.17.0 from
 meta-python
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <koen.kooi@oss.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
 <20251217150828.1044438-2-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20251217150828.1044438-2-koen.kooi@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228121

On Wed Dec 17, 2025 at 4:08 PM CET, Koen Kooi via lists.openembedded.org wr=
ote:
> From the upstream website:
> 	Pyzstd module provides classes and functions for compressing and
> 	decompressing data, using Facebook's Zstandard (or zstd as short name)
> 	algorithm.
>
> This recipe is being moved over for systemd 258.x, the 'ukify' tool
> depends on this.
>
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---

Hi Koen,

Thanks for the new version.

> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> new file mode 100644
> index 0000000000..0ed6cd47c7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb

A new entry should be added in meta/conf/distro/include/maintainers.inc
for this recipe:

2025-12-18 08:49:56,223 - oe-selftest - INFO - distrodata.Distrodata.test_m=
aintainers (subunit.RemotedTestCase)
2025-12-18 08:49:56,223 - oe-selftest - INFO -  ... FAIL
...
2025-12-18 08:49:56,224 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/distrodata.py", line 105, in test_m=
aintainers
    self.fail("""
  File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
    raise self.failureException(msg)
AssertionError:
The following recipes do not have a maintainer assigned to them. Please add=
 an entry to meta/conf/distro/include/maintainers.inc file.
python3-pyzstd (/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers=
/openembedded-core/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2854
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2747

> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Pyzstd module provides classes and functions for compre=
ssing and \
> +decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short=
 name) algorithm."
> +HOMEPAGE =3D "https://github.com/animalize/pyzstd"
> +SECTION =3D "devel/python"
> +

You also need to add a SUMMARY line here. QA complains:

WARNING: python3-pyzstd-0.17.0-r0 do_recipe_qa: QA Issue: Recipe python3-py=
zstd in /srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb does not co=
ntain a SUMMARY. Please add an entry. [missing-metadata]
WARNING: python3-pyzstd-0.17.0-r0 do_recipe_qa: QA Issue: Recipe python3-py=
zstd in /srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb does not ha=
ve an assigned maintainer. Please add an entry into meta/conf/distro/includ=
e/maintainers.inc. [missing-maintainer]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/848

Aside of this, other tests are succeeding.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


