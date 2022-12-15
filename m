Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B29C71156
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.145433.1671136351198038392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fbUtsfAU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d10a6-1f0f7b3c-a951-400e-bf1d-0f455bcf5e91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rhxBkLQ3dE6045NltpD51bu+bWPXloo9cvoWBk6+gKo=;
	b=fbUtsfAUKzZWQIe17Y2KobPCOVjo4BWn+I8bpgjMK1rR2Juqp9iUIyS4Jt+tT7Su
	FAucbooQ3vIesa4D5z3O1M++8XofqHDsyd0IPFkatU8lReUf59SH9cMxLExsiylrRCT
	03mVNOsSN7XU3Ncc6TtBVLV+RradjjFv6ndzR8AM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rhxBkLQ3dE6045NltpD51bu+bWPXloo9cvoWBk6+gKo=;
	b=ToLz/jRhjyhrSzJSBj8KbsTcSYA9Tx1+emQ0YH1LeqohJbc1IqJtwbPXfd0+WrkU
	/JjDyuhtUnTvjVroBJILtlmrqGEdYqC3Sl49leuuyAEwCH4v0HrHlx9bEQcYit38HuU
	nC3/OCRG4X91DMAzMYRmEsnSdtEMUzl4HpEFcf0s=
Content-Type: multipart/mixed; boundary="===============7613777838573444247=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.2 FAILED
Message-ID: <01010185177d10a6-1f0f7b3c-a951-400e-bf1d-0f455bcf5e91-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174634

--===============7613777838573444247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jquery* to *3.6.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-jquery-upgrade-3.6.1-3.6.2.patch
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
--===============7613777838573444247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0a5433d96b07924050a2288979fac36523296d9f"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 7 Local 0 Mirrors 0 Missed 7 Current 106 (0% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.2.bb:do_fetch)
NOTE: recipe jquery-3.6.2-r0: task do_fetch: Started
WARNING: jquery-3.6.2-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.6.2.min.js;name=min;subdir=jquery-3.6.2 - will attempt other sources if available
NOTE: recipe jquery-3.6.2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 478 tasks of which 477 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.2.bb:do_fetch
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.6.2-r0 do_fetch: Fetcher failure for URL: 'https://code.jquery.com/jquery-3.6.2.min.js;name=min;subdir=jquery-3.6.2'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.2.min.js.tmp' has sha256 checksum 'da4ad864a87ffcf71c851b5df87f95cb242867f7b711cae4c6133cc9cc0048f0' when 'a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[min.sha256sum] = "da4ad864a87ffcf71c851b5df87f95cb242867f7b711cae4c6133cc9cc0048f0"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: jquery-3.6.2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://code.jquery.com/jquery-3.6.2.min.js;name=min;subdir=jquery-3.6.2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.2-r0/temp/log.do_fetch.84473
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.2.bb:do_fetch) failed with exit code '1'

--===============7613777838573444247==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.1-3.6.2.patch"

RnJvbSAyOTAyMDhmNTQ5ZWMyYTkzYWJlYmI2M2VhZjA3ZDllMWE2ZDFkMDEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDk6MjI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
cXVlcnk6IHVwZ3JhZGUgMy42LjEgLT4gMy42LjIKCi0tLQogLi4uL2pxdWVyeS97anF1ZXJ5XzMu
Ni4xLmJiID0+IGpxdWVyeV8zLjYuMi5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2pxdWVyeS97anF1ZXJ5XzMuNi4xLmJiID0+IGpxdWVyeV8zLjYuMi5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8z
LjYuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4yLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVl
cnkvanF1ZXJ5XzMuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5
L2pxdWVyeV8zLjYuMi5iYgppbmRleCBhNDc0ODg5MDk5Li5iOWM0YjJhMWNlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuMi5iYgpAQCAtMTMsNyArMTMsNyBA
QCBTUkNfVVJJID0gIlwKICAgICBodHRwczovL2NvZGUuanF1ZXJ5LmNvbS8ke0JQfS5taW4ubWFw
O25hbWU9bWFwO3N1YmRpcj0ke0JQfSBcCiAgICAgIgogCi1TUkNfVVJJW2pzLnNoYTI1NnN1bV0g
PSAiZGYzOTQxZTZjZGFlYzI4NTMzYWQ3MmI3MDUzZWMwNWY3MTcyYmU4OGVjYWRhMzQ1YzQyNzM2
YmMyZmZiYTRkMiIKK1NSQ19VUklbanMuc2hhMjU2c3VtXSA9ICJhNjQ5ZjYwOTQ2NjY4NWU0OWVj
YWNiMThjMzdiY2NhNzVmYjFjYWU2Zjg5YmU3YmU0MGFlMmM0MmM5MmZiYThlIgogU1JDX1VSSVtt
aW4uc2hhMjU2c3VtXSA9ICJhM2NmMDBjMTA5ZDkwN2U1NDNiYzRmNmRiYzg1ZWIzMTA2OGY5NDUx
NTI1MTM0N2U5ZTU3NTA5YjUyZWUzZDc0IgogU1JDX1VSSVttYXAuc2hhMjU2c3VtXSA9ICI4NTZl
ZTYyMGNlYmFjNTZlODcyZDZlOTliMDlkZTA1ZjgxY2NkM2YzZGMzNDZlOWI1NWViNjk0NjExYTZk
NWUxIgogCi0tIAoyLjM3LjMKCg==

--===============7613777838573444247==--

