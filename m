Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F023C0218F
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11497.1735723947549676127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EMAtWnXn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AnHVjyGQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019421359251-392fd619-e54c-4672-add4-e7f038d25b4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sIWFh6tT/w5dgfPpo8G5a8UDq4VSTg71HhbzoQuLiyo=;
	b=EMAtWnXn3JrVCKApIymLaYIrUigGlcyAZhz+bxcjkJqXxcFXd/F7O8egvM0sxTHL
	7tTEfkzDAZP+lOo2kyQPW+zTCnY2Y4HQsVl4GU90vGup3uFY5eSQTp4nSpt0YS4sIAu
	Ck/YplEl1lmFpu/q9RxEYLatgHg+dhVS417yTbJw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sIWFh6tT/w5dgfPpo8G5a8UDq4VSTg71HhbzoQuLiyo=;
	b=AnHVjyGQ4sUTMQ9GP15qh3XmL5xQW3KAv8FmRjK8IVNH7a2ibCQOAqL8Sru1X2wa
	84XiEXlmfN91NdWfTv9+ulchAz8jVi0NVFrlUy8EMeTFySB0DU8wI6Y2R3uHfDhV9Tu
	V72K0jYJTZPCDsa3Ow7NA9hs5OAlTM1mNQ2k3yTA=
Content-Type: multipart/mixed; boundary="===============7757453996539253180=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.22.3 SUCCEEDED
Message-ID: <0101019421359251-392fd619-e54c-4672-add4-e7f038d25b4e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209216

--===============7757453996539253180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.21.0-0.22.3.patch
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
From 13ea1fb8d7fc76b04825fc85323ec94fc00bc831 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:21:24 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.21.0 -> 0.22.3

---
 .../python/python3-rpds-py-crates.inc         | 24 +++++++++----------
 ...py_0.21.0.bb => python3-rpds-py_0.22.3.bb} |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.21.0.bb => python3-rpds-py_0.22.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index fc954d69b8..7022cbdcc8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -13,12 +13,12 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.6 \
-    crate://crates.io/pyo3-build-config/0.22.6 \
-    crate://crates.io/pyo3-ffi/0.22.6 \
-    crate://crates.io/pyo3-macros/0.22.6 \
-    crate://crates.io/pyo3-macros-backend/0.22.6 \
-    crate://crates.io/python3-dll-a/0.2.10 \
+    crate://crates.io/pyo3/0.23.3 \
+    crate://crates.io/pyo3-build-config/0.23.3 \
+    crate://crates.io/pyo3-ffi/0.23.3 \
+    crate://crates.io/pyo3-macros/0.23.3 \
+    crate://crates.io/pyo3-macros-backend/0.23.3 \
+    crate://crates.io/python3-dll-a/0.2.11 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
     crate://crates.io/syn/2.0.69 \
@@ -39,12 +39,12 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.6.sha256sum] = "f402062616ab18202ae8319da13fa4279883a2b8a9d9f83f20dbade813ce1884"
-SRC_URI[pyo3-build-config-0.22.6.sha256sum] = "b14b5775b5ff446dd1056212d778012cbe8a0fbffd368029fd9e25b514479c38"
-SRC_URI[pyo3-ffi-0.22.6.sha256sum] = "9ab5bcf04a2cdcbb50c7d6105de943f543f9ed92af55818fd17b660390fc8636"
-SRC_URI[pyo3-macros-0.22.6.sha256sum] = "0fd24d897903a9e6d80b968368a34e1525aeb719d568dba8b3d4bfa5dc67d453"
-SRC_URI[pyo3-macros-backend-0.22.6.sha256sum] = "36c011a03ba1e50152b4b394b479826cad97e7a21eb52df179cd91ac411cbfbe"
-SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
+SRC_URI[pyo3-0.23.3.sha256sum] = "e484fd2c8b4cb67ab05a318f1fd6fa8f199fcc30819f08f07d200809dba26c15"
+SRC_URI[pyo3-build-config-0.23.3.sha256sum] = "dc0e0469a84f208e20044b98965e1561028180219e35352a2afaf2b942beff3b"
+SRC_URI[pyo3-ffi-0.23.3.sha256sum] = "eb1547a7f9966f6f1a0f0227564a9945fe36b90da5a93b3933fc3dc03fae372d"
+SRC_URI[pyo3-macros-0.23.3.sha256sum] = "fdb6da8ec6fa5cedd1626c886fc8749bdcbb09424a86461eb8cdf096b7c33257"
+SRC_URI[pyo3-macros-backend-0.23.3.sha256sum] = "38a385202ff5a92791168b1136afae5059d3ac118457bb7bc304c197c2d33e7d"
+SRC_URI[python3-dll-a-0.2.11.sha256sum] = "9b9e268ee1be609e93a13eb06839f68f67e5fe0fb4049834d261c2d5091c1b6d"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
 SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
index 81a8cb79a4..0b5ee7799b 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "ed6378c9d66d0de903763e7706383d60c33829581f0adff47b6535f1802fa6db"
+SRC_URI[sha256sum] = "e32fee8ab45d3c2db6da19a5323bc3362237c8b653c70194414b892fd06a080d"
 
 require ${BPN}-crates.inc
 
-- 
2.44.1


--===============7757453996539253180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rpds-py: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.21.0.tar.gz;downloadfilename=rpds_py-0.21.0.tar.gz file://run-ptest crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.6 crate://crates.io/pyo3-build-config/0.22.6 crate://crates.io/pyo3-ffi/0.22.6 crate://crates.io/pyo3-macros/0.22.6 crate://crates.io/pyo3-macros-backend/0.22.6 crate://crates.io/python3-dll-a/0.2.10 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/triomphe/0.1.13 crate://crates.io/unicode-ident/1.0.12 crate
 ://crates.io/unindent/0.2.3" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.22.3.tar.gz;downloadfilename=rpds_py-0.22.3.tar.gz file://run-ptest crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.23.3 crate://crates.io/pyo3-build-config/0.23.3 crate://crates.io/pyo3-ffi/0.23.3 crate://crates.io/pyo3-macros/0.23.3 crate://crates.io/pyo3-macros-backend/0.23.3 crate://crates.io/python3-dll-a/0.2.11 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/triomphe/0.1.13 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3"
packages/core2-64-poky-linux/python3-rpds-py: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 264600 to 271208 (+2%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 29520 to 29949 (+1%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.21.0" to "0.22.3"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 749258 to 802322 (+7%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.21.0 [default] to 0.22.3 [default]
Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.21.0.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.22.3.dist-info

--===============7757453996539253180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.21.0.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.22.3.dist-info

--===============7757453996539253180==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.21.0-0.22.3.patch"

RnJvbSAxM2VhMWZiOGQ3ZmM3NmIwNDgyNWZjODUzMjNlYzk0ZmMwMGJjODMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzoyMToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnBkcy1weTogdXBncmFkZSAwLjIxLjAgLT4gMC4yMi4zCgotLS0KIC4uLi9weXRob24v
cHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMgICAgICAgICB8IDI0ICsrKysrKysrKy0tLS0tLS0t
LS0KIC4uLnB5XzAuMjEuMC5iYiA9PiBweXRob24zLXJwZHMtcHlfMC4yMi4zLmJifSB8ICAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnBkcy1weV8wLjIxLjAu
YmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjIuMy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwppbmRl
eCBmYzk1NGQ2OWI4Li43MDIyY2JkY2M4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKQEAgLTEzLDEyICsxMywx
MiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29uY2VfY2VsbC8xLjE5
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjYuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjg2IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLzAuMjIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25m
aWcvMC4yMi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIyLjYgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIyLjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5dGhvbjMtZGxsLWEvMC4yLjEwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjMu
MyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yMy4zIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIzLjMgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3B5bzMtbWFjcm9zLzAuMjMuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNy
b3MtYmFja2VuZC8wLjIzLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5dGhvbjMtZGxsLWEv
MC4yLjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzYgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3JwZHMvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAu
NjkgXApAQCAtMzksMTIgKzM5LDEyIEBAIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1NnN1
bV0gPSAiNDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0CiBTUkNfVVJJ
W29uY2VfY2VsbC0xLjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYx
YWE0NjdjMjQzODg1OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgogU1JDX1VSSVtwb3J0YWJs
ZS1hdG9taWMtMS42LjAuc2hhMjU2c3VtXSA9ICI3MTcwZWY5OTg4YmMxNjliYTE2ZGQzNmE3ZmEw
NDFlNWM0Y2JlYjZhMzViNzZkNGMwM2RhZGVkMzcxZWFlN2MwIgogU1JDX1VSSVtwcm9jLW1hY3Jv
Mi0xLjAuODYuc2hhMjU2c3VtXSA9ICI1ZTcxOWU4ZGY2NjVkZjBkMWM4ZmJmZDIzODAxNTc0NDcz
NjE1MWQ0NDQ1ZWMwODM2YjhlNjI4YWFlMTAzYjc3IgotU1JDX1VSSVtweW8zLTAuMjIuNi5zaGEy
NTZzdW1dID0gImY0MDIwNjI2MTZhYjE4MjAyYWU4MzE5ZGExM2ZhNDI3OTg4M2EyYjhhOWQ5Zjgz
ZjIwZGJhZGU4MTNjZTE4ODQiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjIuNi5zaGEy
NTZzdW1dID0gImIxNGI1Nzc1YjVmZjQ0NmRkMTA1NjIxMmQ3NzgwMTJjYmU4YTBmYmZmZDM2ODAy
OWZkOWUyNWI1MTQ0NzljMzgiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjIuNi5zaGEyNTZzdW1dID0g
IjlhYjViY2YwNGEyY2RjYmI1MGM3ZDYxMDVkZTk0M2Y1NDNmOWVkOTJhZjU1ODE4ZmQxN2I2NjAz
OTBmYzg2MzYiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjIuNi5zaGEyNTZzdW1dID0gIjBmZDI0
ZDg5NzkwM2E5ZTZkODBiOTY4MzY4YTM0ZTE1MjVhZWI3MTlkNTY4ZGJhOGIzZDRiZmE1ZGM2N2Q0
NTMiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yMi42LnNoYTI1NnN1bV0gPSAiMzZj
MDExYTAzYmExZTUwMTUyYjRiMzk0YjQ3OTgyNmNhZDk3ZTdhMjFlYjUyZGYxNzljZDkxYWM0MTFj
YmZiZSIKLVNSQ19VUklbcHl0aG9uMy1kbGwtYS0wLjIuMTAuc2hhMjU2c3VtXSA9ICJiZDBiNzgx
NzFhOTBkODA4YjMxOWFjZmFkMTY2YzQ3OTBkOWU5NzU5YmJjMTRhYzgyNzNmZTEzMzY3M2RkNDFi
IgorU1JDX1VSSVtweW8zLTAuMjMuMy5zaGEyNTZzdW1dID0gImU0ODRmZDJjOGI0Y2I2N2FiMDVh
MzE4ZjFmZDZmYThmMTk5ZmNjMzA4MTlmMDhmMDdkMjAwODA5ZGJhMjZjMTUiCitTUkNfVVJJW3B5
bzMtYnVpbGQtY29uZmlnLTAuMjMuMy5zaGEyNTZzdW1dID0gImRjMGUwNDY5YTg0ZjIwOGUyMDA0
NGI5ODk2NWUxNTYxMDI4MTgwMjE5ZTM1MzUyYTJhZmFmMmI5NDJiZWZmM2IiCitTUkNfVVJJW3B5
bzMtZmZpLTAuMjMuMy5zaGEyNTZzdW1dID0gImViMTU0N2E3Zjk5NjZmNmYxYTBmMDIyNzU2NGE5
OTQ1ZmUzNmI5MGRhNWE5M2IzOTMzZmMzZGMwM2ZhZTM3MmQiCitTUkNfVVJJW3B5bzMtbWFjcm9z
LTAuMjMuMy5zaGEyNTZzdW1dID0gImZkYjZkYThlYzZmYTVjZWRkMTYyNmM4ODZmYzg3NDliZGNi
YjA5NDI0YTg2NDYxZWI4Y2RmMDk2YjdjMzMyNTciCitTUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tl
bmQtMC4yMy4zLnNoYTI1NnN1bV0gPSAiMzhhMzg1MjAyZmY1YTkyNzkxMTY4YjExMzZhZmFlNTA1
OWQzYWMxMTg0NTdiYjdiYzMwNGMxOTdjMmQzM2U3ZCIKK1NSQ19VUklbcHl0aG9uMy1kbGwtYS0w
LjIuMTEuc2hhMjU2c3VtXSA9ICI5YjllMjY4ZWUxYmU2MDllOTNhMTNlYjA2ODM5ZjY4ZjY3ZTVm
ZTBmYjQwNDk4MzRkMjYxYzJkNTA5MWMxYjZkIgogU1JDX1VSSVtxdW90ZS0xLjAuMzYuc2hhMjU2
c3VtXSA9ICIwZmE3NmFhZjM5MTAxYzQ1NzgzNmFlYzBjZTIzMTZkYmRjM2FiNzIzY2RkYTFjNmJk
NGU2YWQ0MjA4YWNhY2E3IgogU1JDX1VSSVtycGRzLTEuMS4wLnNoYTI1NnN1bV0gPSAiYTBlMTU1
MTVkM2NlMzMxMzMyNGQ4NDI2MjllYTQ5MDVjMjVhMTNmODE5NTNlYWRiODhmODU1MTZmNTkyOTBh
NCIKIFNSQ19VUklbc3luLTIuMC42OS5zaGEyNTZzdW1dID0gIjIwMWZjZGEzODQ1YzIzZTgyMTJj
ZDQ2NmJmZWJmMGJkMjA2OTQ0OTBmYzAzNTZhZThlNDI4ZTA4MjRhOTE1YTYiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjIxLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjIyLjMuYmIK
c2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXJwZHMtcHlfMC4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjIyLjMuYmIKaW5kZXggODFhOGNiNzlhNC4u
MGI1ZWU3Nzk5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXJwZHMtcHlfMC4yMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1ycGRzLXB5XzAuMjIuMy5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9Nzc2N2ZhNTM3YzQ1OTZjNTQxNDFmMzI4ODJjNGE5ODQi
CiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJlZDYzNzhjOWQ2NmQwZGU5MDM3NjNlNzcwNjM4M2Q2MGMzMzgyOTU4MWYwYWRmZjQ3YjY1MzVm
MTgwMmZhNmRiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzMmZlZThhYjQ1ZDNjMmRiNmRhMTlh
NTMyM2JjMzM2MjIzN2M4YjY1M2M3MDE5NDQxNGI4OTJmZDA2YTA4MGQiCiAKIHJlcXVpcmUgJHtC
UE59LWNyYXRlcy5pbmMKIAotLSAKMi40NC4xCgo=

--===============7757453996539253180==--

