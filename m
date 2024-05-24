Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16694C25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:28:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12684.1716546517200782500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 03:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874198975=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O5bu35024382
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:36 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgppp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:36 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 03:28:34 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 03:28:34 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] quilt: 0.67 -> 0.68
Date: Fri, 24 May 2024 03:28:28 -0700
Message-ID: <580a0052e2d2ace4cd80d6bf8f90ee1d45d50d7b.1716543967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1716543967.git.liezhi.yang@windriver.com>
References: <cover.1716543967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Ra71C0UZIZvGS3Cr96jdHk9vpErG3a2r
X-Proofpoint-ORIG-GUID: Ra71C0UZIZvGS3Cr96jdHk9vpErG3a2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44O5bu35024382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199839

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patches:
  fix-grep-3.8.patch.
  faildiff-order.patch
  0001-test-Fix-a-race-condition-in-merge.test.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...lt-native_0.67.bb =3D> quilt-native_0.68.bb} |   0
 meta/recipes-devtools/quilt/quilt.inc         |   5 +-
 ...t-Fix-a-race-condition-in-merge.test.patch |  48 ------
 .../quilt/quilt/faildiff-order.patch          |  41 -----
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ------------------
 .../quilt/{quilt_0.67.bb =3D> quilt_0.68.bb}    |   0
 6 files changed, 1 insertion(+), 237 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.67.bb =3D> quilt-nati=
ve_0.68.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-rac=
e-condition-in-merge.test.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patc=
h
 delete mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 rename meta/recipes-devtools/quilt/{quilt_0.67.bb =3D> quilt_0.68.bb} (1=
00%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.67.bb b/meta/reci=
pes-devtools/quilt/quilt-native_0.68.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.67.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.68.bb
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index 1d90d3d84d7..9faee82fbc6 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -11,14 +11,11 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}=
.tar.gz \
         file://run-ptest \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
-        file://fix-grep-3.8.patch \
-        file://faildiff-order.patch \
-        file://0001-test-Fix-a-race-condition-in-merge.test.patch \
 "
=20
 SRC_URI:append:class-target =3D " file://gnu_patch_test_fix_target.patch=
"
=20
-SRC_URI[sha256sum] =3D "3be3be0987e72a6c364678bb827e3e1fcc10322b56bc5f02=
b576698f55013cc2"
+SRC_URI[sha256sum] =3D "fe8c09de03c106e85b3737c8f03ade147c956b79ed7af485=
a1c8a3858db38426"
=20
 inherit autotools-brokensep ptest
=20
diff --git a/meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condi=
tion-in-merge.test.patch b/meta/recipes-devtools/quilt/quilt/0001-test-Fi=
x-a-race-condition-in-merge.test.patch
deleted file mode 100644
index 01d4c8befcb..00000000000
--- a/meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in=
-merge.test.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c1ce964f3e9312100a60f03c1e1fdd601e1911f2 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?=3DC4=3D90o=3DC3=3DA0n=3D20Tr=3DE1=3DBA=3DA7n=3D20C=3D=
C3=3DB4ng=3D20Danh?=3D
- <congdanhqx@gmail.com>
-Date: Tue, 28 Feb 2023 18:45:15 +0100
-Subject: [PATCH] test: Fix a race condition in merge.test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Just like commit 4dfe7f9, (test: Fix a race condition, 2023-01-20),
-this fix a test race when stdout and stderr in any order.
-
-Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/quilt.gi=
t/commit/?id=3Dc1ce964f3e9312100a60f03c1e1fdd601e1911f2]
-Signed-off-by: =C4=90o=C3=A0n Tr=E1=BA=A7n C=C3=B4ng Danh <congdanhqx@gm=
ail.com>
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
----
- test/merge.test | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/test/merge.test b/test/merge.test
-index c64b33d..2e67d4f 100644
---- a/test/merge.test
-+++ b/test/merge.test
-@@ -39,8 +39,9 @@ Test the patch merging functionality of `quilt diff'.
- 	> Applying patch %{P}c.diff
- 	> Now at patch %{P}c.diff
-=20
--	$ quilt diff -P b.diff | grep -v "^\\(---\\|+++\\)"
-+	$ quilt diff -P b.diff >/dev/null
- 	> Warning: more recent patches modify files in patch %{P}b.diff
-+	$ quilt diff -P b.diff 2>/dev/null | grep -v "^\\(---\\|+++\\)"
- 	>~ Index: [^/]+/abc\.txt
- 	> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- 	> @@ -1,3 +1,3 @@
-@@ -49,8 +50,9 @@ Test the patch merging functionality of `quilt diff'.
- 	> +b+
- 	>  c
-=20
--	$ quilt diff --combine a.diff -P b.diff | grep -v "^\\(---\\|+++\\)"
-+	$ quilt diff --combine a.diff -P b.diff >/dev/null
- 	> Warning: more recent patches modify files in patch %{P}b.diff
-+	$ quilt diff --combine a.diff -P b.diff 2>/dev/null | grep -v "^\\(---=
\\|+++\\)"
- 	>~ Index: [^/]+/abc\.txt
- 	> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- 	> @@ -1,3 +1,3 @@
---=20
-2.40.0
-
diff --git a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch b/met=
a/recipes-devtools/quilt/quilt/faildiff-order.patch
deleted file mode 100644
index f22065a2507..00000000000
--- a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 4dfe7f9e702c85243a71e4de267a13e434b6d6c2 Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Fri, 20 Jan 2023 12:56:08 +0100
-Subject: [PATCH] test: Fix a race condition
-
-The test suite does not differentiate between stdout and stderr. When
-messages are printed to both, the order in which they will reach us
-is apparently not guaranteed. Ideally this would be deterministic, but
-until then, explicitly test stdout and stderr separately in the test
-case itself. Otherwise the test suite fails randomly, which is a pain
-for distribution package maintainers.
-
-This fixes bug #63651 reported by Ross Burton:
-https://savannah.nongnu.org/bugs/index.php?63651
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
----
- test/faildiff.test | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/test/faildiff.test b/test/faildiff.test
-index 5afb8e3..0444c15 100644
---- a/test/faildiff.test
-+++ b/test/faildiff.test
-@@ -27,8 +27,9 @@ What happens on binary files?
- 	> File test.bin added to patch %{P}test.diff
-=20
- 	$ printf "\\003\\000\\001" > test.bin
--	$ quilt diff -pab --no-index
-+	$ quilt diff -pab --no-index 2>/dev/null
- 	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
-+	$ quilt diff -pab --no-index >/dev/null
- 	> Diff failed on file 'test.bin', aborting
- 	$ echo %{?}
- 	> 1
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch b/meta/=
recipes-devtools/quilt/quilt/fix-grep-3.8.patch
deleted file mode 100644
index 68a4b4c195c..00000000000
--- a/meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From f73f8d7f71de2878d3f92881a5fcb8eafd78cb5f Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Fri, 9 Sep 2022 10:10:37 +0200
-Subject: Avoid warnings with grep 3.8
-
-GNU grep version 3.8 became more strict about needless quoting in
-patterns. We have one occurrence of that in quilt, where "/"
-characters are being quoted by default. There are cases where they
-indeed need to be quoted (typically when used in a sed s/// command)
-but most of the time they do not, and this results in the following
-warning:
-
-grep: warning: stray \ before /
-
-So rename quote_bre() to quote_sed_re(), and introduce
-quote_grep_re() which does not quote "/".
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/quilt.gi=
t/commit/?id=3Df73f8d7f71de2878d3f92881a5fcb8eafd78cb5f]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- quilt/diff.in             |  2 +-
- quilt/patches.in          |  2 +-
- quilt/scripts/patchfns.in | 20 +++++++++++++-------
- quilt/upgrade.in          |  4 ++--
- 4 files changed, 17 insertions(+), 11 deletions(-)
-
-diff --git a/quilt/diff.in b/quilt/diff.in
-index e90dc33..07788ff 100644
---- a/quilt/diff.in
-+++ b/quilt/diff.in
-@@ -255,7 +255,7 @@ then
- 	# Add all files in the snapshot into the file list (they may all
- 	# have changed).
- 	files=3D( $(find $QUILT_PC/$snap_subdir -type f \
--		  | sed -e "s/^$(quote_bre $QUILT_PC/$snap_subdir/)//" \
-+		  | sed -e "s/^$(quote_sed_re $QUILT_PC/$snap_subdir/)//" \
- 		  | sort) )
- 	printf "%s\n" "${files[@]}" >&4
- 	unset files
-diff --git a/quilt/patches.in b/quilt/patches.in
-index bb17a46..eac45a9 100644
---- a/quilt/patches.in
-+++ b/quilt/patches.in
-@@ -60,7 +60,7 @@ scan_unapplied()
- 	# Quote each file name only once
- 	for file in "${opt_files[@]}"
- 	do
--		files_bre[${#files_bre[@]}]=3D$(quote_bre "$file")
-+		files_bre[${#files_bre[@]}]=3D$(quote_grep_re "$file")
- 	done
-=20
- 	# "Or" all files in a single pattern
-diff --git a/quilt/scripts/patchfns.in b/quilt/scripts/patchfns.in
-index c2d5f9d..1bd7233 100644
---- a/quilt/scripts/patchfns.in
-+++ b/quilt/scripts/patchfns.in
-@@ -78,8 +78,14 @@ array_join()
- 	done
- }
-=20
--# Quote a string for use in a basic regular expression.
--quote_bre()
-+# Quote a string for use in a regular expression for a grep pattern.
-+quote_grep_re()
-+{
-+	echo "$1" | sed -e 's:\([][^$.*\\]\):\\\1:g'
-+}
-+
-+# Quote a string for use in a regular expression for a sed s/// command.
-+quote_sed_re()
- {
- 	echo "$1" | sed -e 's:\([][^$/.*\\]\):\\\1:g'
- }
-@@ -215,7 +221,7 @@ patch_in_series()
-=20
- 	if [ -e "$SERIES" ]
- 	then
--		grep -q "^$(quote_bre $patch)\([ \t]\|$\)" "$SERIES"
-+		grep -q "^$(quote_grep_re $patch)\([ \t]\|$\)" "$SERIES"
- 	else
- 		return 1
- 	fi
-@@ -365,7 +371,7 @@ is_applied()
- {
- 	local patch=3D$1
- 	[ -e $DB ] || return 1
--	grep -q "^$(quote_bre $patch)\$" $DB
-+	grep -q "^$(quote_grep_re $patch)\$" $DB
- }
-=20
- applied_patches()
-@@ -465,7 +471,7 @@ remove_from_db()
- 	local tmpfile
- 	if tmpfile=3D$(gen_tempfile)
- 	then
--		grep -v "^$(quote_bre $patch)\$" $DB > $tmpfile
-+		grep -v "^$(quote_grep_re $patch)\$" $DB > $tmpfile
- 		cat $tmpfile > $DB
- 		rm -f $tmpfile
- 		[ -s $DB ] || rm -f $DB
-@@ -520,7 +526,7 @@ find_patch()
- 		fi
-=20
- 		local patch=3D${1#$SUBDIR_DOWN$QUILT_PATCHES/}
--		local bre=3D$(quote_bre "$patch")
-+		local bre=3D$(quote_sed_re "$patch")
- 		set -- $(sed -e "/^$bre\(\|\.patch\|\.diff\?\)\(\|\.gz\|\.bz2\|\.xz\|=
\.lzma\|\.lz\)\([ "$'\t'"]\|$\)/!d" \
- 			       -e 's/[ '$'\t''].*//' "$SERIES")
- 		if [ $# -eq 1 ]
-@@ -631,7 +637,7 @@ files_in_patch()
- 	then
- 		find "$path" -type f \
- 			       -a ! -path "$(quote_glob "$path")/.timestamp" |
--		sed -e "s/$(quote_bre "$path")\///"
-+		sed -e "s/$(quote_sed_re "$path")\///"
- 	fi
- }
-=20
-diff --git a/quilt/upgrade.in b/quilt/upgrade.in
-index dbf7d05..866aa33 100644
---- a/quilt/upgrade.in
-+++ b/quilt/upgrade.in
-@@ -74,7 +74,7 @@ printf $"Converting meta-data to version %s\n" "$DB_VE=
RSION"
-=20
- for patch in $(applied_patches)
- do
--	proper_name=3D"$(grep "^$(quote_bre $patch)"'\(\|\.patch\|\.diff?\)\(\=
|\.gz\|\.bz2\)\([ \t]\|$\)' $SERIES)"
-+	proper_name=3D"$(grep "^$(quote_grep_re $patch)"'\(\|\.patch\|\.diff?\=
)\(\|\.gz\|\.bz2\)\([ \t]\|$\)' $SERIES)"
- 	proper_name=3D${proper_name#$QUILT_PATCHES/}
- 	proper_name=3D${proper_name%% *}
- 	if [ -z "$proper_name" ]
-@@ -84,7 +84,7 @@ do
- 	fi
-=20
- 	if [ "$patch" !=3D "$proper_name" -a -d $QUILT_PC/$patch ] \
--	   && grep -q "^$(quote_bre $patch)\$" \
-+	   && grep -q "^$(quote_grep_re $patch)\$" \
- 		   $QUILT_PC/applied-patches
- 	then
- 		mv $QUILT_PC/$patch $QUILT_PC/$proper_name \
---=20
-cgit v1.1
-
diff --git a/meta/recipes-devtools/quilt/quilt_0.67.bb b/meta/recipes-dev=
tools/quilt/quilt_0.68.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt_0.67.bb
rename to meta/recipes-devtools/quilt/quilt_0.68.bb
--=20
2.45.1


