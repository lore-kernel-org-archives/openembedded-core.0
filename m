Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3722.1794377110515197256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ib1gIX7U;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jJV9xEB0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1c935d0aa-32cdddf7-897d-4771-921e-afb493def9fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377109;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=yBGZB+OVSViemZ3sdrrTVJ8IYXp4sk7NlpLlMdengMg=;
	b=Ib1gIX7UEHHuzIF3Nj503U9RFOFgTPugksnnrU4acs9sSNXWS1+f/RawcbQj2g4+
	L+2sJTbNo7adirC+1STjUTlBcnYX7RWzdFEiAZdj2FqNVqO8MS2EmRpddd+TB08OiX7
	ufbwUFC4ymkjdD6eWA+VP2Z6NiT0rQ1OBxFC9zgQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377109;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=yBGZB+OVSViemZ3sdrrTVJ8IYXp4sk7NlpLlMdengMg=;
	b=jJV9xEB0sWAslu5Uy2whJfKkNjzNc+HGs0Nz1H63BpVrmu1YtT1NWyUDpKULGueU
	yRcaLQV/0yBTcaJD1RmlLOHtIWSZ3+uBjzZSnO6gO0ZuSLEdeY+fwc9sZCmktJjw9Y8
	ITIx6QxCnoLSy76IhrBMsHmTfkS2F1+sM7PYtyhI=
Content-Type: multipart/mixed; boundary="===============1783705868598856713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libcomps: upgrading to 0.1.25 SUCCEEDED
Message-ID: <010101a1c935d0aa-32cdddf7-897d-4771-921e-afb493def9fa-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249956

--===============1783705868598856713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcomps* to *0.1.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcomps-upgrade-0.1.24-0.1.25.patch
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
From 99420d2d776283e693b7977e3bce56ab5fb55f97 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:25:15 +0000
Subject: [PATCH] libcomps: upgrade 0.1.24 -> 0.1.25

Release 0.1.25
Fix explicit basearchonly=false serialization
Fix comparison of COMPS_ObjMRTree values
Fix double free after comps_objmrtree_copy_shallow()
Count values set on inner nodes of COMPS_ObjRTree
Do not write empty arch/package attributes for blacklist and whiteout
Fix values of multi-value radix trees after a node split
Keep the item count when copying COMPS_ObjRTree
Fix COMPS_HSList tail pointer in comps_hslist_prepend()
Run all Python tests from run_tests.sh
Use the real element name for <optionlist> in parser messages
Decrement the item count in comps_objrtree_unset()
Fix memory leak in radix tree values_walk functions
Make radix tree set functions reentrant
Fix crash when copying a COMPS_ObjMDict
Fix COMPS_OBJECT_DESTROY() called on a wrong address
Clear node data in rtree/brtree unset without a data destructor
Remove debug output from comps_mrtree_unset() and comps_brtree_unset()
Run the Python binding tests in the pytest target
Fix crash on empty display_order, uservisible and biarchonly elements
Fix NULL pointer dereference in comps_parse_validate_dtd()
Fix undefined behaviour of isspace() on non-ASCII text
Fix inverted cleanup in comps_parse_parsed_init()
Initialize COMPS_Elem.ancestor
Fix reference leak on a repeated <display_order> element
Check the result of XML_ParserCreate()
Fix NULL pointer dereference on nested <comps> element
Fix Python bindings build with Python < 3.11
Mirror the changes made to createrepo_c
Configure packit to use caret notation for postrelease snapshots
fix: correct typos in README and test files
fix: avoid `%u` when dealing with signed variables in `printf`
fix: use `%u` when dealing with unsigned variabnles in `printf`
---
 ...ot-set-PYTHON_INSTALL_DIR-by-running-python.patch | 12 ++++++------
 .../{libcomps_0.1.24.bb => libcomps_0.1.25.bb}       |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.24.bb => libcomps_0.1.25.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6fc0a4177f..9e5e99be26 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 159ad0e19f4c5d7fe357378c00db19c1106e62c4 Mon Sep 17 00:00:00 2001
+From 04c89e1af497514b6b7023620962cfb97e752cc9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
@@ -10,15 +10,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index d22b84e..ad67309 100644
+index 6d3d4c0..396c725 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -85,7 +85,7 @@ IF (SKBUILD)
-     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/src/libcomps)
-     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/libcomps)
+@@ -78,7 +78,7 @@ IF (SKBUILD)
+     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps)
+     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps)
  ELSE ()
 -    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
-     #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
+     INSTALL (TARGETS pycomps LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.24.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
index c26fc71b3b..47bcd078a1 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;t
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "8d439dd015d4c6f637e64e1160201345883138e9"
+SRCREV = "08340d1783f3b1f064fa08264b5d25706e3bb7ea"
 
 inherit cmake setuptools3-base
 
-- 
2.47.1


--===============1783705868598856713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libcomps/libcomps: FILELIST: added "/usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/RECORD /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/METADATA /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/INSTALLER"
Changes to packages/x86-64-v3-poky-linux/libcomps (sysroot):
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info was added
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/RECORD was added

--===============1783705868598856713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libcomps: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps: SRC_URI changed from "git://github.com/rpm-software-management/libcomps.git;branch=master;tag=0.1.24;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch" to "git://github.com/rpm-software-management/libcomps.git;branch=master;tag=0.1.25;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch"
packages/x86-64-v3-poky-linux/libcomps/libcomps-dbg: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps-dbg: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps-dbg: PKGSIZE changed from 786728 to 786744 (+0%)
packages/x86-64-v3-poky-linux/libcomps/libcomps-dev: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps-dev: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps-doc: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps-doc: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps-locale: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps-locale: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps-src: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps-src: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps-src: FILELIST: directory renamed /usr/src/debug/libcomps/0.1.24/libcomps/src -> /usr/src/debug/libcomps/0.1.25/libcomps/src, directory renamed /usr/src/debug/libcomps/0.1.24/libcomps/src/libcomps -> /usr/src/debug/libcomps/0.1.25/libcomps/src/libcomps, directory renamed /usr/src/debug/libcomps/0.1.24/libcomps/src/python/src -> /usr/src/debug/libcomps/0.1.25/libcomps/src/python/src
packages/x86-64-v3-poky-linux/libcomps/libcomps-src: PKGSIZE changed from 817931 to 819765 (+0%)
packages/x86-64-v3-poky-linux/libcomps/libcomps-staticdev: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps-staticdev: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps: PV changed from "0.1.24" to "0.1.25"
packages/x86-64-v3-poky-linux/libcomps/libcomps: PKGV changed from 0.1.24 [default] to 0.1.25 [default]
packages/x86-64-v3-poky-linux/libcomps/libcomps: FILELIST: added "/usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/RECORD /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/METADATA /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/INSTALLER"
packages/x86-64-v3-poky-linux/libcomps/libcomps: PKGSIZE changed from 335588 to 335647 (+0%)
Changes to packages/x86-64-v3-poky-linux/libcomps (sysroot):
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info was added
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/libcomps-0.1.25.dist-info/RECORD was added

--===============1783705868598856713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcomps-upgrade-0.1.24-0.1.25.patch"

RnJvbSA5OTQyMGQyZDc3NjI4M2U2OTNiNzk3N2UzYmNlNTZhYjVmYjU1Zjk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6MjU6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb21wczogdXBncmFkZSAwLjEuMjQgLT4gMC4xLjI1CgpSZWxlYXNlIDAuMS4yNQpGaXggZXhw
bGljaXQgYmFzZWFyY2hvbmx5PWZhbHNlIHNlcmlhbGl6YXRpb24KRml4IGNvbXBhcmlzb24gb2Yg
Q09NUFNfT2JqTVJUcmVlIHZhbHVlcwpGaXggZG91YmxlIGZyZWUgYWZ0ZXIgY29tcHNfb2JqbXJ0
cmVlX2NvcHlfc2hhbGxvdygpCkNvdW50IHZhbHVlcyBzZXQgb24gaW5uZXIgbm9kZXMgb2YgQ09N
UFNfT2JqUlRyZWUKRG8gbm90IHdyaXRlIGVtcHR5IGFyY2gvcGFja2FnZSBhdHRyaWJ1dGVzIGZv
ciBibGFja2xpc3QgYW5kIHdoaXRlb3V0CkZpeCB2YWx1ZXMgb2YgbXVsdGktdmFsdWUgcmFkaXgg
dHJlZXMgYWZ0ZXIgYSBub2RlIHNwbGl0CktlZXAgdGhlIGl0ZW0gY291bnQgd2hlbiBjb3B5aW5n
IENPTVBTX09ialJUcmVlCkZpeCBDT01QU19IU0xpc3QgdGFpbCBwb2ludGVyIGluIGNvbXBzX2hz
bGlzdF9wcmVwZW5kKCkKUnVuIGFsbCBQeXRob24gdGVzdHMgZnJvbSBydW5fdGVzdHMuc2gKVXNl
IHRoZSByZWFsIGVsZW1lbnQgbmFtZSBmb3IgPG9wdGlvbmxpc3Q+IGluIHBhcnNlciBtZXNzYWdl
cwpEZWNyZW1lbnQgdGhlIGl0ZW0gY291bnQgaW4gY29tcHNfb2JqcnRyZWVfdW5zZXQoKQpGaXgg
bWVtb3J5IGxlYWsgaW4gcmFkaXggdHJlZSB2YWx1ZXNfd2FsayBmdW5jdGlvbnMKTWFrZSByYWRp
eCB0cmVlIHNldCBmdW5jdGlvbnMgcmVlbnRyYW50CkZpeCBjcmFzaCB3aGVuIGNvcHlpbmcgYSBD
T01QU19PYmpNRGljdApGaXggQ09NUFNfT0JKRUNUX0RFU1RST1koKSBjYWxsZWQgb24gYSB3cm9u
ZyBhZGRyZXNzCkNsZWFyIG5vZGUgZGF0YSBpbiBydHJlZS9icnRyZWUgdW5zZXQgd2l0aG91dCBh
IGRhdGEgZGVzdHJ1Y3RvcgpSZW1vdmUgZGVidWcgb3V0cHV0IGZyb20gY29tcHNfbXJ0cmVlX3Vu
c2V0KCkgYW5kIGNvbXBzX2JydHJlZV91bnNldCgpClJ1biB0aGUgUHl0aG9uIGJpbmRpbmcgdGVz
dHMgaW4gdGhlIHB5dGVzdCB0YXJnZXQKRml4IGNyYXNoIG9uIGVtcHR5IGRpc3BsYXlfb3JkZXIs
IHVzZXJ2aXNpYmxlIGFuZCBiaWFyY2hvbmx5IGVsZW1lbnRzCkZpeCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgaW4gY29tcHNfcGFyc2VfdmFsaWRhdGVfZHRkKCkKRml4IHVuZGVmaW5lZCBiZWhh
dmlvdXIgb2YgaXNzcGFjZSgpIG9uIG5vbi1BU0NJSSB0ZXh0CkZpeCBpbnZlcnRlZCBjbGVhbnVw
IGluIGNvbXBzX3BhcnNlX3BhcnNlZF9pbml0KCkKSW5pdGlhbGl6ZSBDT01QU19FbGVtLmFuY2Vz
dG9yCkZpeCByZWZlcmVuY2UgbGVhayBvbiBhIHJlcGVhdGVkIDxkaXNwbGF5X29yZGVyPiBlbGVt
ZW50CkNoZWNrIHRoZSByZXN1bHQgb2YgWE1MX1BhcnNlckNyZWF0ZSgpCkZpeCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2Ugb24gbmVzdGVkIDxjb21wcz4gZWxlbWVudApGaXggUHl0aG9uIGJpbmRp
bmdzIGJ1aWxkIHdpdGggUHl0aG9uIDwgMy4xMQpNaXJyb3IgdGhlIGNoYW5nZXMgbWFkZSB0byBj
cmVhdGVyZXBvX2MKQ29uZmlndXJlIHBhY2tpdCB0byB1c2UgY2FyZXQgbm90YXRpb24gZm9yIHBv
c3RyZWxlYXNlIHNuYXBzaG90cwpmaXg6IGNvcnJlY3QgdHlwb3MgaW4gUkVBRE1FIGFuZCB0ZXN0
IGZpbGVzCmZpeDogYXZvaWQgYCV1YCB3aGVuIGRlYWxpbmcgd2l0aCBzaWduZWQgdmFyaWFibGVz
IGluIGBwcmludGZgCmZpeDogdXNlIGAldWAgd2hlbiBkZWFsaW5nIHdpdGggdW5zaWduZWQgdmFy
aWFibmxlcyBpbiBgcHJpbnRmYAotLS0KIC4uLm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnkt
cnVubmluZy1weXRob24ucGF0Y2ggfCAxMiArKysrKystLS0tLS0KIC4uLi97bGliY29tcHNfMC4x
LjI0LmJiID0+IGxpYmNvbXBzXzAuMS4yNS5iYn0gICAgICAgfCAgMiArLQogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYmNvbXBzL3tsaWJjb21wc18wLjEuMjQuYmIgPT4gbGliY29tcHNfMC4xLjI1
LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJjb21wcy9s
aWJjb21wcy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0
aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzLzAwMDEt
RG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKaW5k
ZXggNmZjMGE0MTc3Zi4uOWU1ZTk5YmUyNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmNvbXBzL2xpYmNvbXBzLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVIt
YnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNv
bXBzL2xpYmNvbXBzLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmlu
Zy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE1OWFkMGUxOWY0YzVkN2ZlMzU3
Mzc4YzAwZGIxOWMxMTA2ZTYyYzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA0Yzg5
ZTFhZjQ5NzUxNGI2YjcwMjM2MjA5NjJjZmI5N2U3NTJjYzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERh
dGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MjI6MDkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8g
bm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRob24uCkBAIC0xMCwxNSAr
MTAsMTUgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9saWJjb21wcy9zcmMvcHl0aG9uL3NyYy9DTWFrZUxpc3RzLnR4dCBi
L2xpYmNvbXBzL3NyYy9weXRob24vc3JjL0NNYWtlTGlzdHMudHh0Ci1pbmRleCBkMjJiODRlLi5h
ZDY3MzA5IDEwMDY0NAoraW5kZXggNmQzZDRjMC4uMzk2YzcyNSAxMDA2NDQKIC0tLSBhL2xpYmNv
bXBzL3NyYy9weXRob24vc3JjL0NNYWtlTGlzdHMudHh0CiArKysgYi9saWJjb21wcy9zcmMvcHl0
aG9uL3NyYy9DTWFrZUxpc3RzLnR4dAotQEAgLTg1LDcgKzg1LDcgQEAgSUYgKFNLQlVJTEQpCi0g
ICAgIElOU1RBTEwoRklMRVMgbGliY29tcHMvX19pbml0X18ucHkgREVTVElOQVRJT04gbGliY29t
cHMvc3JjL3B5dGhvbi9zcmMvbGliY29tcHMpCi0gICAgIElOU1RBTEwoVEFSR0VUUyBweWNvbXBz
IExJQlJBUlkgREVTVElOQVRJT04gbGliY29tcHMvc3JjL3B5dGhvbi9zcmMvbGliY29tcHMpCitA
QCAtNzgsNyArNzgsNyBAQCBJRiAoU0tCVUlMRCkKKyAgICAgSU5TVEFMTChGSUxFUyBsaWJjb21w
cy9fX2luaXRfXy5weSBERVNUSU5BVElPTiBsaWJjb21wcykKKyAgICAgSU5TVEFMTChUQVJHRVRT
IHB5Y29tcHMgTElCUkFSWSBERVNUSU5BVElPTiBsaWJjb21wcykKICBFTFNFICgpCiAtICAgIEVY
RUNVVEVfUFJPQ0VTUyhDT01NQU5EICR7UFlUSE9OX0VYRUNVVEFCTEV9IC1jICJmcm9tIHN5cyBp
bXBvcnQgc3Rkb3V0OyBmcm9tIHN5c2NvbmZpZyBpbXBvcnQgZ2V0X3BhdGg7IHN0ZG91dC53cml0
ZShnZXRfcGF0aCgncGxhdGxpYicpKSIgT1VUUFVUX1ZBUklBQkxFIFBZVEhPTl9JTlNUQUxMX0RJ
UikKICsgICAgI0VYRUNVVEVfUFJPQ0VTUyhDT01NQU5EICR7UFlUSE9OX0VYRUNVVEFCTEV9IC1j
ICJmcm9tIHN5cyBpbXBvcnQgc3Rkb3V0OyBmcm9tIHN5c2NvbmZpZyBpbXBvcnQgZ2V0X3BhdGg7
IHN0ZG91dC53cml0ZShnZXRfcGF0aCgncGxhdGxpYicpKSIgT1VUUFVUX1ZBUklBQkxFIFBZVEhP
Tl9JTlNUQUxMX0RJUikKICAKICAgICAgSU5TVEFMTChGSUxFUyAke3B5Y29tcHNfU1JDRElSfS9s
aWJjb21wcy9fX2luaXRfXy5weSBERVNUSU5BVElPTiAke1BZVEhPTl9JTlNUQUxMX0RJUn0vbGli
Y29tcHMpCi0gICAgICNJTlNUQUxMKEZJTEVTICR7cHljb21wc19TUkNESVJ9L3Rlc3RzL19fdGVz
dC5weSBERVNUSU5BVElPTgorICAgICBJTlNUQUxMIChUQVJHRVRTIHB5Y29tcHMgTElCUkFSWSBE
RVNUSU5BVElPTiAke1BZVEhPTl9JTlNUQUxMX0RJUn0vbGliY29tcHMpCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjI0LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzXzAuMS4yNS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29t
cHNfMC4xLjI0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGli
Y29tcHNfMC4xLjI1LmJiCmluZGV4IGMyNmZjNzFiM2IuLjQ3YmNkMDc4YTEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJjb21wcy9saWJjb21wc18wLjEuMjQuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzXzAuMS4yNS5iYgpAQCAtOCw3
ICs4LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2Vt
ZW50L2xpYmNvbXBzLmdpdDticmFuY2g9bWFzdGVyO3QKICAgICAgICAgICAgZmlsZTovLzAwMDEt
RG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggXAog
ICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI4ZDQzOWRkMDE1ZDRjNmY2MzdlNjRlMTE2MDIwMTM0
NTg4MzEzOGU5IgorU1JDUkVWID0gIjA4MzQwZDE3ODNmM2IxZjA2NGZhMDgyNjRiNWQyNTcwNmUz
YmI3ZWEiCiAKIGluaGVyaXQgY21ha2Ugc2V0dXB0b29sczMtYmFzZQogCi0tIAoyLjQ3LjEKCg==

--===============1783705868598856713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libcomps-changelog.txt"

Release 0.1.25
Fix explicit basearchonly=false serialization
Fix comparison of COMPS_ObjMRTree values
Fix double free after comps_objmrtree_copy_shallow()
Count values set on inner nodes of COMPS_ObjRTree
Do not write empty arch/package attributes for blacklist and whiteout
Fix values of multi-value radix trees after a node split
Keep the item count when copying COMPS_ObjRTree
Fix COMPS_HSList tail pointer in comps_hslist_prepend()
Run all Python tests from run_tests.sh
Use the real element name for <optionlist> in parser messages
Decrement the item count in comps_objrtree_unset()
Fix memory leak in radix tree values_walk functions
Make radix tree set functions reentrant
Fix crash when copying a COMPS_ObjMDict
Fix COMPS_OBJECT_DESTROY() called on a wrong address
Clear node data in rtree/brtree unset without a data destructor
Remove debug output from comps_mrtree_unset() and comps_brtree_unset()
Run the Python binding tests in the pytest target
Fix crash on empty display_order, uservisible and biarchonly elements
Fix NULL pointer dereference in comps_parse_validate_dtd()
Fix undefined behaviour of isspace() on non-ASCII text
Fix inverted cleanup in comps_parse_parsed_init()
Initialize COMPS_Elem.ancestor
Fix reference leak on a repeated <display_order> element
Check the result of XML_ParserCreate()
Fix NULL pointer dereference on nested <comps> element
Fix Python bindings build with Python < 3.11
Mirror the changes made to createrepo_c
Configure packit to use caret notation for postrelease snapshots
fix: correct typos in README and test files
fix: avoid `%u` when dealing with signed variables in `printf`
fix: use `%u` when dealing with unsigned variabnles in `printf`

--===============1783705868598856713==--
