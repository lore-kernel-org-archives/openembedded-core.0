Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07C3CA0FE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11328.1755263222545878663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yL8rqPIs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=a12K3qFx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add74039-aed7626b-b148-40b5-b0cd-e4048ff42e2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b3uiw1H1fKsUrXMNgYYLmN6fD0qzhaRlJqh5QPAKbck=;
	b=yL8rqPIs1RGcD9STbkhz2jrSNBGtjkqqEQdl2Oq3C5SXjXE9Da6IBXta0RcCf77s
	eFwIH9xyfz7uNmbuHRksqUDbzZEVXCt4mmJ6rjnz2YlSdWs6GPw+3tL2GcpJ3A730wz
	5PNhg8YevLZGL2mOafjkyVd3sTBdevZdYLfcj3LI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b3uiw1H1fKsUrXMNgYYLmN6fD0qzhaRlJqh5QPAKbck=;
	b=a12K3qFx3hlgK2fl4rs0Orsy8IRERmiTyQ8jGWAYw4153nK+BfZ2joSErKSbkyAQ
	poFTz/vxalk6llMs9AXNDlDsIEOevtWK6s9Y9rJteTuJ/HHemreX0r19ncChBRujaLj
	8dc5HzNgo8T+X11dpyZmrE4TZ33DGh/gVLmnttlg=
Content-Type: multipart/mixed; boundary="===============2660581132564226993=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.16 SUCCEEDED
Message-ID: <01010198add74039-aed7626b-b148-40b5-b0cd-e4048ff42e2c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221900

--===============2660581132564226993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.15-6.16.patch
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

-- >8 --
From aa9d5d9a0645718c093345521cbd17e9f9e9f97d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:32:22 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.15 -> 6.16

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.15.bb => btrfs-tools_6.16.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.15.bb => btrfs-tools_6.16.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 2cd66d2722..a254d1c955 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
+From 474b007dc961d3e6e283edfe3574ef7b4e535c5e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 7e36aa42..edff7d5b 100644
+index 7bc22466..0c4b0a88 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -996,7 +996,7 @@ endif
+@@ -997,7 +997,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
index 88a6d11354..ef809d384b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "3da67f1c78bcbd7556f04d89e31aa4621face50b"
+SRCREV = "54694de98fdc4ea5678cdd77b920c044bbf64f26"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============2660581132564226993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.15-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info

--===============2660581132564226993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27101024 to 27071488 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4256376 to 4256836 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5885439 to 5869055 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.15 [default] to 6.16 [default]
packages/core2-64-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.15 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.16 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.15" to "6.16"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.15 [default] to 6.16 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.15-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info

--===============2660581132564226993==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.15-6.16.patch"

RnJvbSBhYTlkNWQ5YTA2NDU3MThjMDkzMzQ1NTIxY2JkMTdlOWY5ZTlmOTdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6MzI6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjE1IC0+IDYuMTYKCi0tLQogLi4uZC1hLXBvc3NpYmlsaXR5
LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L3tidHJmcy10b29sc182LjE1LmJiID0+IGJ0cmZzLXRvb2xzXzYuMTYuYmJ9ICAgICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYu
MTUuYmIgPT4gYnRyZnMtdG9vbHNfNi4xNi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJp
bGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxp
dHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAppbmRleCAyY2Q2NmQy
NzIyLi5hMjU0ZDFjOTU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMt
dG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJl
LXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJm
cy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hl
cmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAzMGVjODFj
MGRhYzFlMDY3ZmFmNDk5MjRkNTYzMWJiMjJjY2M5MGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDQ3NGIwMDdkYzk2MWQzZTZlMjgzZWRmZTM1NzRlZjdiNGU1MzVjNWUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgTWF5IDIwMTggMjE6MjA6MzUgKzAzMDAKIFN1YmplY3Q6
IFtQQVRDSF0gQWRkIGEgcG9zc2liaWxpdHkgdG8gc3BlY2lmeSB3aGVyZSBweXRob24gbW9kdWxl
cyBhcmUKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKLWlu
ZGV4IDdlMzZhYTQyLi5lZGZmN2Q1YiAxMDA2NDQKK2luZGV4IDdiYzIyNDY2Li4wYzRiMGE4OCAx
MDA2NDQKIC0tLSBhL01ha2VmaWxlCiArKysgYi9NYWtlZmlsZQotQEAgLTk5Niw3ICs5OTYsNyBA
QCBlbmRpZgorQEAgLTk5Nyw3ICs5OTcsNyBAQCBlbmRpZgogIGlmZXEgKCQoUFlUSE9OX0JJTkRJ
TkdTKSwxKQogIGluc3RhbGxfcHl0aG9uOiBsaWJidHJmc3V0aWxfcHl0aG9uCiAgCSQoUSljZCBs
aWJidHJmc3V0aWwvcHl0aG9uOyBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29sc182LjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE1
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4xNi5iYgppbmRleCA4OGE2ZDExMzU0Li5lZjgwOWQzODRiIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNi5iYgpAQCAt
MTgsNyArMTgsNyBAQCBERVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9rZGF2ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwczt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ1JFViA9ICIzZGE2N2YxYzc4YmNiZDc1NTZmMDRkODllMzFhYTQ2MjFmYWNlNTBi
IgorU1JDUkVWID0gIjU0Njk0ZGU5OGZkYzRlYTU2NzhjZGQ3N2I5MjBjMDQ0YmJmNjRmMjYiCiAK
IFBBQ0tBR0VDT05GSUcgPz89ICIgXAogICAgIHByb2dyYW1zIFwKLS0gCjIuNDcuMQoK

--===============2660581132564226993==--

