Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF358CA9EDE
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7530.1685693432522898609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DaTurziE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b288020-c7490ccf-1490-4b50-b057-c751685cf981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CexDPB6zVpiAxGuI5t4fP+DKDO8ZBIw0J9RPqIBEU/E=;
	b=DaTurziEEK6v6sbZXdTlsCU28gUmP3eYIPnwQkmPxMvds4fTSO6weh59seGoo/Ue
	1DK1XWDt0PcGQYPU6GHy6XTqWelO8/Gbeo/+qunXEnwc/5AWVXST2iKZX8bOwi3CD6J
	mK0rFn4oELnVVNRLT5l1UCBYAR4eeQlGw2yALyCc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CexDPB6zVpiAxGuI5t4fP+DKDO8ZBIw0J9RPqIBEU/E=;
	b=X4nCYZSQy85oEQmymslVij5PEvWx4EiczvEdn/OPj2u0eq8ZIqf0ScJ/tEWSpY+v
	AissyfFoG9YhWFwKA6yXIXrcQaQzWA3v34FLnyQpFkeFSlbqhidXL5Tc/Pqya540Ba6
	0cAhiJKDFJgYqNRec5NReJWRgpGDrJJqWSQSI7JM=
Content-Type: multipart/mixed; boundary="===============3396149182000495501=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] orc: upgrading to 0.4.34 SUCCEEDED
Message-ID: <010101887b288020-c7490ccf-1490-4b50-b057-c751685cf981-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182182

--===============3396149182000495501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *orc* to *0.4.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.33-0.4.34.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3396149182000495501==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.33-0.4.34.patch"

RnJvbSA1ZDE0NzI3MjkxYWY2NTcwODUyMDc1MWE5OWI0OTQ3YTY5NWUwM2JkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMzoxNjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9y
YzogdXBncmFkZSAwLjQuMzMgLT4gMC40LjM0CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9v
cmMve29yY18wLjQuMzMuYmIgPT4gb3JjXzAuNC4zNC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvb3JjL3tvcmNfMC40LjMzLmJiID0+IG9yY18wLjQuMzQuYmJ9ICg5MiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjMzLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC4zMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM0LmJiCmluZGV4IDg3M2ZlMzkyMGIu
LjgwMWQ2MDRiZGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAu
NC4zMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuMzQuYmIKQEAg
LTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTQwMGJkOWQwOWU4YWY1NmI5ZWM5
ODJiM2Q4NTc5N2UiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5v
cmcvc3JjL29yYy9vcmMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0NGU2
ZDdkYjgwODZmNzkzZjU3NjE4ZDNkNGI2OGQyOWQ5OWIxNjAzNGU3MTQzMGRmM2MyMWNmZDNjMzU0
MmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGY0N2FiYjNmMDk3MTcxZTQ0ZWI4MDdhZGNkYWJk
ODYwZmJhMmVmZmQzN2Q4ZDNjNGZiZDVmMzQxY2FkZDQxZiIKIAogaW5oZXJpdCBtZXNvbiBwa2dj
b25maWcgZ3RrLWRvYwogCi0tIAoyLjM5LjIKCg==

--===============3396149182000495501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.33.0", added "/usr/lib/liborc-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.33.0", added "/usr/lib/liborc-test-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/orc-staticdev: PKGSIZE changed from 91710 to 0 (-100%)
packages/core2-32-poky-linux/orc/orc-staticdev: FILELIST: removed all items "/usr/lib/liborc-test-0.4.a"
Changes to packages/core2-32-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.33.0 to liborc-0.4.so.0.34.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.33.0 to liborc-test-0.4.so.0.34.0
  /usr/lib/liborc-0.4.so.0.33.0 moved to /usr/lib/liborc-0.4.so.0.34.0
  /usr/lib/liborc-test-0.4.so.0.33.0 moved to /usr/lib/liborc-test-0.4.so.0.34.0
  /usr/lib/liborc-test-0.4.a was removed

--===============3396149182000495501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/orc: SRC_URI changed from "http://gstreamer.freedesktop.org/src/orc/orc-0.4.33.tar.xz" to "http://gstreamer.freedesktop.org/src/orc/orc-0.4.34.tar.xz"
packages/core2-32-poky-linux/orc: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/liborc-0.4: FILES: removed "/usr/lib/liborc-0.4.so.0.33.0", added "/usr/lib/liborc-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/liborc-0.4: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/liborc-0.4: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.33.0", added "/usr/lib/liborc-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/liborc-test-0.4: FILES: removed "/usr/lib/liborc-test-0.4.so.0.33.0", added "/usr/lib/liborc-test-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/liborc-test-0.4: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/liborc-test-0.4: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.33.0", added "/usr/lib/liborc-test-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/orc-dbg: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-dbg: PKGSIZE changed from 1249280 to 1264784 (+1%)
packages/core2-32-poky-linux/orc/orc-dbg: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-dbg: FILELIST: removed "/usr/lib/.debug/liborc-0.4.so.0.33.0 /usr/lib/.debug/liborc-test-0.4.so.0.33.0", added "/usr/lib/.debug/liborc-0.4.so.0.34.0 /usr/lib/.debug/liborc-test-0.4.so.0.34.0"
packages/core2-32-poky-linux/orc/orc-dev: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-dev: PKGSIZE changed from 193890 to 197705 (+2%)
packages/core2-32-poky-linux/orc/orc-dev: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-doc: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-doc: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-examples: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-examples: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-locale: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-locale: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-src: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-src: PKGSIZE changed from 1437847 to 1456700 (+1%)
packages/core2-32-poky-linux/orc/orc-src: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-src: FILELIST: directory renamed /usr/src/debug/orc/0.4.33-r0/tools -> /usr/src/debug/orc/0.4.34-r0/tools, directory renamed /usr/src/debug/orc/0.4.33-r0/orc-test -> /usr/src/debug/orc/0.4.34-r0/orc-test, removed "/usr/src/debug/orc/0.4.33-r0/orc/orccpu-x86.c /usr/src/debug/orc/0.4.33-r0/orc/orc.c /usr/src/debug/orc/0.4.33-r0/orc/orccodemem.c /usr/src/debug/orc/0.4.33-r0/orc/orc.h /usr/src/debug/orc/0.4.33-r0/orc/orccode.c /usr/src/debug/orc/0.4.33-r0/orc/orcmips.c /usr/src/debug/orc/0.4.33-r0/orc/orconce.c /usr/src/debug/orc/0.4.33-r0/orc/orcrule.c /usr/src/debug/orc/0.4.33-r0/orc/orccompiler.c /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-sse.c /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-mmx.c /usr/src/debug/orc/0.4.33-r0/orc/opcodes.h /usr/src/debug/orc/0.4.33-r0/orc/orcmips.h /usr/src/debug/orc/0.4.33-r0/orc/orcneon.h /usr/src/debug/orc/0.4.33-r0/orc/orconce.h /usr/src/debug/orc/0.4.33-r0/orc/orccode.h /usr/src/debug/orc/0.4.33-r0/orc/orcinstruc
 tion.h /usr/src/debug/orc/0.4.33-r0/orc/orccompiler.h /usr/src/debug/orc/0.4.33-r0/orc/orcrule.h /usr/src/debug/orc/0.4.33-r0/orc/orcrules-altivec.c /usr/src/debug/orc/0.4.33-r0/orc/orcexecutor.c /usr/src/debug/orc/0.4.33-r0/orc/orctarget.h /usr/src/debug/orc/0.4.33-r0/orc/orcutils.h /usr/src/debug/orc/0.4.33-r0/orc/orcrules-sse.c /usr/src/debug/orc/0.4.33-r0/orc/orcexecutor.h /usr/src/debug/orc/0.4.33-r0/orc/orcutils.c /usr/src/debug/orc/0.4.33-r0/orc/orcpowerpc.h /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-mips.c /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-neon.c /usr/src/debug/orc/0.4.33-r0/orc/orcx86insn.c /usr/src/debug/orc/0.4.33-r0/orc/orcpowerpc.c /usr/src/debug/orc/0.4.33-r0/orc/orccpuinsn.h /usr/src/debug/orc/0.4.33-r0/orc/orcrules-neon.c /usr/src/debug/orc/0.4.33-r0/orc/orcx86insn.h /usr/src/debug/orc/0.4.33-r0/orc/orcemulateopcodes.h /usr/src/debug/orc/0.4.33-r0/orc/orcparse.h /usr/src/debug/orc/0.4.33-r0/orc/orcprogram.h /usr/src/debug/orc/0.4.33-r0/orc/orcopcodes.c /us
 r/src/debug/orc/0.4.33-r0/orc/orcparse.c /usr/src/debug/orc/0.4.33-r0/orc/orcrules-mmx.c /usr/src/debug/orc/0.4.33-r0/orc/orcemulateopcodes.c /usr/src/debug/orc/0.4.33-r0/orc/orcprogram.c /usr/src/debug/orc/0.4.33-r0/orc/orcdebug.h /usr/src/debug/orc/0.4.33-r0/orc/orcbytecodes.h /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-altivec.c /usr/src/debug/orc/0.4.33-r0/orc/orcconstant.h /usr/src/debug/orc/0.4.33-r0/orc/orcinternal.h /usr/src/debug/orc/0.4.33-r0/orc/orcbytecode.c /usr/src/debug/orc/0.4.33-r0/orc/orcrules-mips.c /usr/src/debug/orc/0.4.33-r0/orc/orcdebug.c /usr/src/debug/orc/0.4.33-r0/orc/orcbytecode.h /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-c64x-c.c /usr/src/debug/orc/0.4.33-r0/orc/orcopcode.h /usr/src/debug/orc/0.4.33-r0/orc/orcprogram-c.c /usr/src/debug/orc/0.4.33-r0/orc/orcarm.h /usr/src/debug/orc/0.4.33-r0/orc/orccpu.h /usr/src/debug/orc/0.4.33-r0/orc/orcmmx.h /usr/src/debug/orc/0.4.33-r0/orc/orcsse.h /usr/src/debug/orc/0.4.33-r0/orc/orcx86.h /usr/src/debug/orc/0.4.33-
 r0/orc/orcvariable.h /usr/src/debug/orc/0.4.33-r0/orc/orcarm.c /usr/src/debug/orc/0.4.33-r0/orc/orcmmx.c /usr/src/debug/orc/0.4.33-r0/orc/orcsse.c /usr/src/debug/orc/0.4.33-r0/orc/orcx86.c /usr/src/debug/orc/0.4.33-r0/orc/orclimits.h /usr/src/debug/orc/0.4.33-r0/orc/orcfunctions.c", added "/usr/src/debug/orc/0.4.34-r0/orc/orclimits.h /usr/src/debug/orc/0.4.34-r0/orc/orcemulateopcodes.c /usr/src/debug/orc/0.4.34-r0/orc/orconce.c /usr/src/debug/orc/0.4.34-r0/orc/orccode.c /usr/src/debug/orc/0.4.34-r0/orc/orcmips.c /usr/src/debug/orc/0.4.34-r0/orc/orcrule.c /usr/src/debug/orc/0.4.34-r0/orc/orcvariable.h /usr/src/debug/orc/0.4.34-r0/orc/opcodes.h /usr/src/debug/orc/0.4.34-r0/orc/orccode.h /usr/src/debug/orc/0.4.34-r0/orc/orcemulateopcodes.h /usr/src/debug/orc/0.4.34-r0/orc/orcmips.h /usr/src/debug/orc/0.4.34-r0/orc/orcneon.h /usr/src/debug/orc/0.4.34-r0/orc/orconce.h /usr/src/debug/orc/0.4.34-r0/orc/orcrule.h /usr/src/debug/orc/0.4.34-r0/orc/orcdebug.c /usr/src/debug/orc/0.4.34-r0/orc/o
 rcpowerpc.c /usr/src/debug/orc/0.4.34-r0/orc/orcrules-sse.c /usr/src/debug/orc/0.4.34-r0/orc/orcpowerpc.h /usr/src/debug/orc/0.4.34-r0/orc/orcdebug.h /usr/src/debug/orc/0.4.34-r0/orc/orcrules-altivec.c /usr/src/debug/orc/0.4.34-r0/orc/orcarm.c /usr/src/debug/orc/0.4.34-r0/orc/orcutils.h /usr/src/debug/orc/0.4.34-r0/orc/orcconstant.h /usr/src/debug/orc/0.4.34-r0/orc/orcutils.c /usr/src/debug/orc/0.4.34-r0/orc/orcx86.c /usr/src/debug/orc/0.4.34-r0/orc/orc.h /usr/src/debug/orc/0.4.34-r0/orc/orcmmx.c /usr/src/debug/orc/0.4.34-r0/orc/orcprogram-c64x-c.c /usr/src/debug/orc/0.4.34-r0/orc/orcprogram-mips.c /usr/src/debug/orc/0.4.34-r0/orc/orccpu-x86.c /usr/src/debug/orc/0.4.34-r0/orc/orccodemem.c /usr/src/debug/orc/0.4.34-r0/orc/orcprogram-neon.c /usr/src/debug/orc/0.4.34-r0/orc/orc.c /usr/src/debug/orc/0.4.34-r0/orc/orcprogram.c /usr/src/debug/orc/0.4.34-r0/orc/orcprogram.h /usr/src/debug/orc/0.4.34-r0/orc/orcbytecodes.h /usr/src/debug/orc/0.4.34-r0/orc/orcexecutor.c /usr/src/debug/orc/0.4
 .34-r0/orc/orcprogram-c.c /usr/src/debug/orc/0.4.34-r0/orc/orcexecutor.h /usr/src/debug/orc/0.4.34-r0/orc/orccompiler.h /usr/src/debug/orc/0.4.34-r0/orc/orccpuinsn.h /usr/src/debug/orc/0.4.34-r0/orc/orcx86insn.h /usr/src/debug/orc/0.4.34-r0/orc/orccompiler.c /usr/src/debug/orc/0.4.34-r0/orc/orcx86insn.c /usr/src/debug/orc/0.4.34-r0/orc/orcbytecode.c /usr/src/debug/orc/0.4.34-r0/orc/orcutils-private.h /usr/src/debug/orc/0.4.34-r0/orc/orcrules-mips.c /usr/src/debug/orc/0.4.34-r0/orc/orcparse.c /usr/src/debug/orc/0.4.34-r0/orc/orcrules-neon.c /usr/src/debug/orc/0.4.34-r0/orc/orcbytecode.h /usr/src/debug/orc/0.4.34-r0/orc/orcprogram-mmx.c /usr/src/debug/orc/0.4.34-r0/orc/orcfunctions.c /usr/src/debug/orc/0.4.34-r0/orc/orcparse.h /usr/src/debug/orc/0.4.34-r0/orc/orcopcode.h /usr/src/debug/orc/0.4.34-r0/orc/orcprogram-altivec.c /usr/src/debug/orc/0.4.34-r0/orc/orcprogram-sse.c /usr/src/debug/orc/0.4.34-r0/orc/orcrules-mmx.c /usr/src/debug/orc/0.4.34-r0/orc/orcarm.h /usr/src/debug/orc/0.4.
 34-r0/orc/orccpu.h /usr/src/debug/orc/0.4.34-r0/orc/orcinstruction.h /usr/src/debug/orc/0.4.34-r0/orc/orcinternal.h /usr/src/debug/orc/0.4.34-r0/orc/orcmmx.h /usr/src/debug/orc/0.4.34-r0/orc/orcsse.h /usr/src/debug/orc/0.4.34-r0/orc/orcx86.h /usr/src/debug/orc/0.4.34-r0/orc/orcopcodes.c /usr/src/debug/orc/0.4.34-r0/orc/orcsse.c /usr/src/debug/orc/0.4.34-r0/orc/orctarget.h"
packages/core2-32-poky-linux/orc/orc-staticdev: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc-staticdev: PKGSIZE changed from 91710 to 0 (-100%)
packages/core2-32-poky-linux/orc/orc-staticdev: PV changed from "0.4.33" to "0.4.34"
packages/core2-32-poky-linux/orc/orc-staticdev: FILELIST: removed all items "/usr/lib/liborc-test-0.4.a"
packages/core2-32-poky-linux/orc/orc: PKGV changed from 0.4.33 [default] to 0.4.34 [default]
packages/core2-32-poky-linux/orc/orc: PV changed from "0.4.33" to "0.4.34"
Changes to packages/core2-32-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.33.0 to liborc-0.4.so.0.34.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.33.0 to liborc-test-0.4.so.0.34.0
  /usr/lib/liborc-0.4.so.0.33.0 moved to /usr/lib/liborc-0.4.so.0.34.0
  /usr/lib/liborc-test-0.4.so.0.33.0 moved to /usr/lib/liborc-test-0.4.so.0.34.0
  /usr/lib/liborc-test-0.4.a was removed

--===============3396149182000495501==--

