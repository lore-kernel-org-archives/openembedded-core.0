Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03BFC6FA8F
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.12459.1662040786867902367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MDVmWJbQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182f959c8d8-e39c01a8-3ba0-43e1-999a-fab34f4a1741-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SN+YgsgPzSTG1/Yba+pG146sCzLU7wplQplSuJjUUiA=;
	b=MDVmWJbQsuXnvEK2hy2Tm866LkrXDF+28I+j+SpOYKQVEmIGVFyyph+MRerUOeyi
	5pH0bM5YORFMrmt4A6A+WXAlW0ws/+vSMUb2UJesCP2hwRJXXVRRShuaspBxFS1tNiw
	4K3dCiduxhGh0jXiVvgSASqlLFtAPDBZEy+kguUw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SN+YgsgPzSTG1/Yba+pG146sCzLU7wplQplSuJjUUiA=;
	b=APGPzXeJSqokNRlkeNwS3Mg22+z5BTM9jU6M37RPF7mj75npMeTBsfV4jldLBZKT
	oFiN9wtK8k86DV44Y6Rplv82fmFNRYePxjV5RGL4oRxiK4LgrUrDIdsu5Y70NQYvvPj
	E1XJ/nPBfk3YL5Qh9VmOIWwaQCbDnlUl7fLzai5w=
Content-Type: multipart/mixed; boundary="===============5534423446633310489=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtasn1: upgrading to 4.19.0 SUCCEEDED
Message-ID: 
 <01010182f959c8d8-e39c01a8-3ba0-43e1-999a-fab34f4a1741-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170201

--===============5534423446633310489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtasn1* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtasn1-upgrade-4.18.0-4.19.0.patch
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
--===============5534423446633310489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libtasn1: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1: SRC_URI changed from "https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.18.0.tar.gz file://dont-depend-on-help2man.patch" to "https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz file://dont-depend-on-help2man.patch"
packages/core2-32-poky-linux/libtasn1/libtasn1-bin: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-bin: PKGSIZE changed from 53536 to 74052 (+38%)
packages/core2-32-poky-linux/libtasn1/libtasn1-bin: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1-dbg: FILELIST: removed "/usr/lib/.debug/libtasn1.so.6.6.2", added "/usr/lib/.debug/libtasn1.so.6.6.3"
packages/core2-32-poky-linux/libtasn1/libtasn1-dbg: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-dbg: PKGSIZE changed from 280332 to 316824 (+13%)
packages/core2-32-poky-linux/libtasn1/libtasn1-dbg: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1-dev: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-dev: PKGSIZE changed from 19156 to 19197 (+0%)
packages/core2-32-poky-linux/libtasn1/libtasn1-dev: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1-doc: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-doc: PKGSIZE changed from 155104 to 155102 (-0%)
packages/core2-32-poky-linux/libtasn1/libtasn1-doc: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1-locale: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-locale: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1-src: FILELIST: directory renamed /usr/src/debug/libtasn1/4.18.0-r0/lib/gl -> /usr/src/debug/libtasn1/4.19.0-r0/lib/gl, directory renamed /usr/src/debug/libtasn1/4.18.0-r0/lib/includes -> /usr/src/debug/libtasn1/4.19.0-r0/lib/includes, directory renamed /usr/src/debug/libtasn1/4.18.0-r0/lib -> /usr/src/debug/libtasn1/4.19.0-r0/lib, directory renamed /usr/src/debug/libtasn1/4.18.0-r0/src -> /usr/src/debug/libtasn1/4.19.0-r0/src, removed "/usr/src/debug/libtasn1/4.18.0-r0/src/gl/version-etc.h /usr/src/debug/libtasn1/4.18.0-r0/src/gl/progname.c /usr/src/debug/libtasn1/4.18.0-r0/src/gl/version-etc.c /usr/src/debug/libtasn1/4.18.0-r0/src/gl/string.h /usr/src/debug/libtasn1/4.18.0-r0/src/gl/progname.h /usr/src/debug/libtasn1/4.18.0-r0/src/gl/read-file.h /usr/src/debug/libtasn1/4.18.0-r0/src/gl/stdio.h /usr/src/debug/libtasn1/4.18.0-r0/src/gl/version-etc-fsf.c /usr/src/debug/libtasn1/4.18.0-r0/src/gl/timespec.h /usr/src/debug/libtasn1/4.18.0-r0/
 src/gl/read-file.c /usr/src/debug/libtasn1/4.18.0-r0/src/gl/gettime.c /usr/src/debug/libtasn1/4.18.0-r0/src/gl/stdlib.h", added "/usr/src/debug/libtasn1/4.19.0-r0/src/gl/gettime.c /usr/src/debug/libtasn1/4.19.0-r0/src/gl/string.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/getopt-ext.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/version-etc.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/read-file.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/timespec.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/progname.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/version-etc-fsf.c /usr/src/debug/libtasn1/4.19.0-r0/src/gl/version-etc.c /usr/src/debug/libtasn1/4.19.0-r0/src/gl/getopt_int.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/stdlib.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/getopt1.c /usr/src/debug/libtasn1/4.19.0-r0/src/gl/progname.c /usr/src/debug/libtasn1/4.19.0-r0/src/gl/getopt-core.h /usr/src/debug/libtasn1/4.19.0-r0/src/gl/getopt.c /usr/src/debug/libtasn1/4.19.0-r0/src/gl/read-file.c /usr/src/debug/libtasn
 1/4.19.0-r0/src/gl/stdio.h"
packages/core2-32-poky-linux/libtasn1/libtasn1-src: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-src: PKGSIZE changed from 751738 to 794596 (+6%)
packages/core2-32-poky-linux/libtasn1/libtasn1-src: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1-staticdev: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1-staticdev: PV changed from "4.18.0" to "4.19.0"
packages/core2-32-poky-linux/libtasn1/libtasn1: FILELIST: removed "/usr/lib/libtasn1.so.6.6.2", added "/usr/lib/libtasn1.so.6.6.3"
packages/core2-32-poky-linux/libtasn1/libtasn1: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/libtasn1/libtasn1: PV changed from "4.18.0" to "4.19.0"
Changes to packages/core2-32-poky-linux/libtasn1 (sysroot):
  /usr/lib/libtasn1.so.6 changed symlink target from libtasn1.so.6.6.2 to libtasn1.so.6.6.3
  /usr/lib/libtasn1.so changed symlink target from libtasn1.so.6.6.2 to libtasn1.so.6.6.3
  /usr/lib/libtasn1.so.6.6.2 moved to /usr/lib/libtasn1.so.6.6.3

--===============5534423446633310489==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtasn1-upgrade-4.18.0-4.19.0.patch"

RnJvbSAyMzk3YTU2MDAyNzJlMTQ3Njk5NGNhNzhkN2M5YTliY2U0ODI2MjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMzozNToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRhc24xOiB1cGdyYWRlIDQuMTguMCAtPiA0LjE5LjAKCi0tLQogLi4uL2dudXRscy97bGlidGFz
bjFfNC4xOC4wLmJiID0+IGxpYnRhc24xXzQuMTkuMC5iYn0gICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251dGxzL3tsaWJ0YXNuMV80LjE4LjAuYmIgPT4gbGlidGFzbjFfNC4x
OS4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9s
aWJ0YXNuMV80LjE4LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvbGlidGFzbjFf
NC4xOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXRscy9saWJ0YXNuMV80LjE4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXRscy9saWJ0YXNuMV80LjE5LjAuYmIKaW5kZXggZGI0OWFkYzFjMi4uNWZiOGI1
NGMwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2xpYnRhc24xXzQu
MTguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvbGlidGFzbjFfNC4xOS4w
LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9saWJ0YXNuMS9s
aWJ0YXNuMS0ke1BWfS50YXIuZ3ogXAogCiBERVBFTkRTID0gImJpc29uLW5hdGl2ZSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjQzNjVjMTU0OTUzNTYzZDY0YzY3YTAyNGI2MDdkMWVlNzVjNmRi
NzZlMGQwZjY1NzA5ZWE4MGEzMzRjZDE4OTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTYxM2Yw
YWMxY2Y0ODRkNmVjMGNlM2I4YzA2ZDU2MjYzY2M3MjQyZjFjMjNiMzBkODJkMjNkZTM0NWE2M2Y3
YSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdGV4aW5mbyBsaWJfcGFja2FnZSBndGstZG9jCiAKLS0g
CjIuMzEuMQoK

--===============5534423446633310489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libtasn1/libtasn1-bin: PKGSIZE changed from 53536 to 74052 (+38%)
packages/core2-32-poky-linux/libtasn1/libtasn1-dbg: PKGSIZE changed from 280332 to 316824 (+13%)
packages/core2-32-poky-linux/libtasn1/libtasn1: FILELIST: removed "/usr/lib/libtasn1.so.6.6.2", added "/usr/lib/libtasn1.so.6.6.3"
Changes to packages/core2-32-poky-linux/libtasn1 (sysroot):
  /usr/lib/libtasn1.so.6 changed symlink target from libtasn1.so.6.6.2 to libtasn1.so.6.6.3
  /usr/lib/libtasn1.so changed symlink target from libtasn1.so.6.6.2 to libtasn1.so.6.6.3
  /usr/lib/libtasn1.so.6.6.2 moved to /usr/lib/libtasn1.so.6.6.3

--===============5534423446633310489==--

