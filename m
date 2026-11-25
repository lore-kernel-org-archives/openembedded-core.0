Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36074.1795583576509514036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iThzxJtI;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12910; q=dns/txt;
  s=iport01; t=1795583576; x=1796793176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Xg5fRwnrQkoeCSv3ijF7KORS7XxGU2p4cNnBNowFwfA=;
  b=iThzxJtIvhTFg7ro/6RKIKsaVAf1z1LtC+dLhyWjUxnNx95SoHwIkbnv
   wilHeIHWMPO/rD/OkIlVft/ot/OeQ65klhkHrW1yyX/77EN/RJe/uNeT1
   l/9zXqQnBiVuBRweDPHrITpP/ElbeU123KmLx1PEWc0t3opwoWV4kf5iT
   aHUEvTm6/UNg+rV7N5dpEEaIDcDgamKP1w/64iCjK0dNUbERnY7FBoXcr
   EF0e0tjU28x0gHmhOjtCsa9rtoORkLIv1eXC4ExfZdNi8RglYolT8auxE
   XCWEoufLZSjTV1b41VR7MwaxJW0SauY7qRoN+qqjLtbPg4pmu039SEGHT
   g==;
X-CSE-ConnectionGUID: AkH3RnLXRcuDAf5dXPPJcQ==
X-CSE-MsgGUID: Lf0BD89URAiPXxUIs2TLFQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgCpbAZr/81K/pBaglmCV3VhQkmUKoIhA4tmkkOBG?=
 =?us-ascii?q?wNgDwEBAQ9EDQQBAYISgm8CAgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvIAsjCBAJgwIBgjoDN?=
 =?us-ascii?q?wIBEQa5fYIsgQGDKQGBVNhMDYJaAQsUAYE4hUKDAIUlXRgBhH4nGxuBcoR/g?=
 =?us-ascii?q?QWBGkICiCYEgiKBDIFUHmSMEQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBD?=
 =?us-ascii?q?CcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTgmczAS0tGgcTARMYgREyDhw/E?=
 =?us-ascii?q?SkUkmqQHIIhoCBxCiiDeYwkjz6FfBozhASUGpJUC5h9jgqECpErgRyEaoFoP?=
 =?us-ascii?q?IFZcBU7gmcJShkPV41XCwuDYIZQyAsjNQIBAQEGMgEBBwIHDgMLgWiQAi2BT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:rYge663cMiigdRXFvfbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bp2MGy
 2sfCDqCOfbZMWqme9hxa4vn9RkA65Ddzd41SVBp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJUIWZrce3tZNCnxi3
 PJFJAA1VjKIvrfjqF67YrEEasULJcTxeYdasXZ6wHSBUbAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEmojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjuCzaYSKJYbiqcN9ukjAj
 E6WrlnDKxAiBMyi6CHfzlaCv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:F/aZyq4VlogJ0h0cawPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:L7PJ8mwfzYlHJIj7qa0jBgU9GeB+SHv5/E3bPmORBztleIWta1SprfY=
X-Talos-MUID: 9a23:RM2tTwQWRGuzqfPpRXTIimlIGJc53p6HCXg9gagnoJO4EQJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60616772"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:12:54 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id BDB59180001C2
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:53 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 72E25CBF221; Tue, 24 Nov 2026 21:12:52 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 3/6] git: fix CVE-2026-114466
Date: Tue, 24 Nov 2026 21:12:43 -0800
Message-Id: <20261125051246.3108822-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051246.3108822-1-asparmar@cisco.com>
References: <20261125051246.3108822-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251134
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Git 2.53.1 backport for
CVE-2026-114466. The upstream fix merge is referenced in [1],
and the security release notes are referenced in [2]. Individual
fix links are recorded in the embedded patch headers.

[1] https://github.com/git/git/commit/9adf7ae7cde5e8ecc231aed2320951acb5b1db91
[2] https://github.com/git/git/blob/v2.53.1/Documentation/RelNotes/2.50.2.adoc

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../git/git/CVE-2026-114466_p1.patch          | 125 +++++++++++++++
 .../git/git/CVE-2026-114466_p2.patch          | 146 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   2 +
 3 files changed, 273 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-114466_p1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-114466_p2.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2026-114466_p1.patch b/meta/recipes-devtools/git/git/CVE-2026-114466_p1.patch
new file mode 100644
index 0000000000..45553b3947
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-114466_p1.patch
@@ -0,0 +1,125 @@
+From 8ac799963bb9cb1af1518040a12f184e82625285 Mon Sep 17 00:00:00 2001
+From: Karthik Nayak <karthik.188@gmail.com>
+Date: Tue, 17 Mar 2026 23:05:55 +0100
+Subject: [PATCH] fast-import: add safeguard around rewrite-submodules features
+
+In 68061e3470 (fast-import: disallow "feature export-marks" by default,
+2019-08-29), we disallowed the `export-marks` feature by default. This
+was followed by a52ed76142 (fast-import: disallow "feature import-marks"
+by default, 2019-08-29) where we also disabled `import-marks` and
+`import-marks-if-exists`.
+
+This was because these features provided arbitrary read/write access to
+the filesystem. Since then, 1bdca81641 (fast-import: add options for
+rewriting submodules, 2020-02-22) added support for two new features:
+
+  - rewrite-submodules-to
+  - rewrite-submodules-from
+
+Both of which take in a <file> argument and can read arbitrary files.
+When provided with an unsupported file, they error out with `fatal:
+corrupt mark line: <file-content>`. This allows attackers to read from
+the filesystem.
+
+In accordance with the earlier patches, also safeguard the new features
+behind the '--allow-unsafe-features' option. This is a backward
+incompatible change. But as mentioned in 68061e3470 (fast-import:
+disallow "feature export-marks" by default, 2019-08-29), this option is
+provided to import/export based remote helpers so the impact should be
+minimal.
+
+CVE: CVE-2026-114466
+Upstream-Status: Backport [https://github.com/git/git/commit/2b50a97225c9fa937c4160f7da5132e880fa500f]
+
+Reported-by: pwn2addr <p2addr@gmail.com>
+Signed-off-by: Karthik Nayak <karthik.188@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Documentation/git-fast-import.adoc | 11 +++++++++--
+ builtin/fast-import.c              |  2 ++
+ t/t9300-fast-import.sh             | 29 +++++++++++++++++++++++++++++
+ 3 files changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/Documentation/git-fast-import.adoc b/Documentation/git-fast-import.adoc
+index 479c4081..bd65d1bd 100644
+--- a/Documentation/git-fast-import.adoc
++++ b/Documentation/git-fast-import.adoc
+@@ -58,8 +58,15 @@ OPTIONS
+ 	allowing fast-import to access the filesystem outside of the
+ 	repository). These options are disabled by default, but can be
+ 	allowed by providing this option on the command line.  This
+-	currently impacts only the `export-marks`, `import-marks`, and
+-	`import-marks-if-exists` feature commands.
++	currently impacts the following feature commands:
+++
++--
++* `export-marks`
++* `import-marks-if-exists`
++* `import-marks`
++* `rewrite-submodules-from`
++* `rewrite-submodules-to`
++--
+ +
+ Only enable this option if you trust the program generating the
+ fast-import stream! This option is enabled automatically for
+diff --git a/builtin/fast-import.c b/builtin/fast-import.c
+index b8a7757c..fa3f868b 100644
+--- a/builtin/fast-import.c
++++ b/builtin/fast-import.c
+@@ -3693,8 +3693,10 @@ static int parse_one_feature(const char *feature, int from_stream)
+ 	} else if (!strcmp(feature, "alias")) {
+ 		; /* Don't die - this feature is supported */
+ 	} else if (skip_prefix(feature, "rewrite-submodules-to=", &arg)) {
++		check_unsafe_feature("rewrite-submodules-to", from_stream);
+ 		option_rewrite_submodules(arg, &sub_marks_to);
+ 	} else if (skip_prefix(feature, "rewrite-submodules-from=", &arg)) {
++		check_unsafe_feature("rewrite-submodules-from", from_stream);
+ 		option_rewrite_submodules(arg, &sub_marks_from);
+ 	} else if (!strcmp(feature, "get-mark")) {
+ 		; /* Don't die - this feature is supported */
+diff --git a/t/t9300-fast-import.sh b/t/t9300-fast-import.sh
+index 5685cce6..6154b23d 100755
+--- a/t/t9300-fast-import.sh
++++ b/t/t9300-fast-import.sh
+@@ -3923,7 +3923,20 @@ test_expect_success 'Y: setup' '
+ 	EOF
+ '
+ 
++test_expect_success 'Y: rewrite-submodules-to feature forbidden by default' '
++	echo "feature rewrite-submodules-to=sub:sub2-marks" >input &&
++	test_must_fail git fast-import <input 2>err &&
++	test_grep "feature ${SQ}rewrite-submodules-to${SQ} forbidden in input without --allow-unsafe-features" err
++'
++
++test_expect_success 'Y: rewrite-submodules-from feature forbidden by default' '
++	echo "feature rewrite-submodules-from=sub:../Y-marks" >input &&
++	test_must_fail git fast-import <input 2>err &&
++	test_grep "feature ${SQ}rewrite-submodules-from${SQ} forbidden in input without --allow-unsafe-features" err
++'
++
+ test_expect_success 'Y: rewrite submodules' '
++	test_when_finished "rm -rf main1" &&
+ 	git init main1 &&
+ 	(
+ 		cd main1 &&
+@@ -3935,4 +3948,20 @@ test_expect_success 'Y: rewrite submodules' '
+ 	)
+ '
+ 
++test_expect_success 'Y: rewrite submodules via stdin' '
++	test_when_finished "rm -rf main1" &&
++	git init main1 &&
++	(
++		cd main1 &&
++		git init sub2 &&
++		git -C sub2 fast-import --export-marks=../sub2-marks <../Y-sub-input &&
++		{
++			echo "feature rewrite-submodules-to=sub:sub2-marks" &&
++			echo "feature rewrite-submodules-from=sub:../Y-marks" &&
++			cat ../Y-main-input
++		} | git fast-import --allow-unsafe-features &&
++		test "$(git rev-parse main)" = "$(test_oid Ymain)"
++	)
++'
++
+ test_done
diff --git a/meta/recipes-devtools/git/git/CVE-2026-114466_p2.patch b/meta/recipes-devtools/git/git/CVE-2026-114466_p2.patch
new file mode 100644
index 0000000000..b1d7956775
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-114466_p2.patch
@@ -0,0 +1,146 @@
+From 58cf54caf290303e4fd98a15506327aeb7be61a4 Mon Sep 17 00:00:00 2001
+From: Karthik Nayak <karthik.188@gmail.com>
+Date: Tue, 17 Mar 2026 23:05:56 +0100
+Subject: [PATCH] fast-import: add safeguard around 'export-pack-edges'
+
+Similar to the previous commit, also add a safeguard around the
+'export-pack-edges'. The 'export-pack-edges' option takes in a file as
+an argument. This can be exploited by an attacker to open a file in
+append mode and write pack-edge records to it.
+
+The file is created even if no pack-edge records are ultimately
+written (i.e., even without commits), since `xfopen()` creates the file
+on open. With a commit and `transfer.unpackLimit=0` (to prevent pack
+loosening), attacker-controlled data can also be written to the file.
+
+Add the necessary tests, this includes combining two of the previous
+tests which were split into {creation, validation} to ensure a clean
+setup for the new tests.
+
+CVE: CVE-2026-114466
+Upstream-Status: Backport [https://github.com/git/git/commit/19bcf62ed0597b7487c3f4ed2de3c9d97b921de8]
+
+Reported-by: pwn2addr <p2addr@gmail.com>
+Signed-off-by: Karthik Nayak <karthik.188@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Documentation/git-fast-import.adoc |  5 +++++
+ builtin/fast-import.c              | 14 +++++++++++---
+ t/t9300-fast-import.sh             | 31 +++++++++++++++++++++++++++---
+ 3 files changed, 44 insertions(+), 6 deletions(-)
+
+diff --git a/Documentation/git-fast-import.adoc b/Documentation/git-fast-import.adoc
+index bd65d1bd..8c525d12 100644
+--- a/Documentation/git-fast-import.adoc
++++ b/Documentation/git-fast-import.adoc
+@@ -67,6 +67,11 @@ OPTIONS
+ * `rewrite-submodules-from`
+ * `rewrite-submodules-to`
+ --
++And the following options:
+++
++--
++* `export-pack-edges`
++--
+ +
+ Only enable this option if you trust the program generating the
+ fast-import stream! This option is enabled automatically for
+diff --git a/builtin/fast-import.c b/builtin/fast-import.c
+index fa3f868b..0ec51eb6 100644
+--- a/builtin/fast-import.c
++++ b/builtin/fast-import.c
+@@ -3623,7 +3623,14 @@ static void option_rewrite_submodules(const char *arg, struct string_list *list)
+ 	free(s);
+ }
+ 
+-static int parse_one_option(const char *option)
++static void check_unsafe_option(const char *option, int from_stream)
++{
++	if (from_stream && !allow_unsafe_features)
++		die(_("option '%s' forbidden in input without --allow-unsafe-features"),
++		    option);
++}
++
++static int parse_one_option(const char *option, int from_stream)
+ {
+ 	if (skip_prefix(option, "max-pack-size=", &option)) {
+ 		unsigned long v;
+@@ -3647,6 +3654,7 @@ static int parse_one_option(const char *option)
+ 	} else if (skip_prefix(option, "active-branches=", &option)) {
+ 		option_active_branches(option);
+ 	} else if (skip_prefix(option, "export-pack-edges=", &option)) {
++		check_unsafe_option("export-pack-edges", from_stream);
+ 		option_export_pack_edges(option);
+ 	} else if (skip_prefix(option, "signed-commits=", &option)) {
+ 		if (parse_sign_mode(option, &signed_commit_mode))
+@@ -3735,7 +3743,7 @@ static void parse_option(const char *option)
+ 	if (seen_data_command)
+ 		die(_("got option command '%s' after data command"), option);
+ 
+-	if (parse_one_option(option))
++	if (parse_one_option(option, 1))
+ 		return;
+ 
+ 	die(_("this version of fast-import does not support option: %s"), option);
+@@ -3784,7 +3792,7 @@ static void parse_argv(void)
+ 		if (!skip_prefix(a, "--", &a))
+ 			die(_("unknown option %s"), a);
+ 
+-		if (parse_one_option(a))
++		if (parse_one_option(a, 0))
+ 			continue;
+ 
+ 		if (parse_one_feature(a, 0))
+diff --git a/t/t9300-fast-import.sh b/t/t9300-fast-import.sh
+index 6154b23d..fdeb23ba 100755
+--- a/t/t9300-fast-import.sh
++++ b/t/t9300-fast-import.sh
+@@ -912,7 +912,14 @@ test_expect_success 'H: verify file' '
+ ### series I
+ ###
+ 
++test_expect_success 'I: export-pack-edges option forbidden by default' '
++	echo "option git export-pack-edges=edges.list" >input &&
++	test_must_fail git fast-import <input 2>err &&
++	test_grep "option ${SQ}export-pack-edges${SQ} forbidden in input without --allow-unsafe-features" err
++'
++
+ test_expect_success 'I: export-pack-edges' '
++	test_when_finished "rm edges.list" &&
+ 	cat >input <<-INPUT_END &&
+ 	commit refs/heads/export-boundary
+ 	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
+@@ -923,12 +930,30 @@ test_expect_success 'I: export-pack-edges' '
+ 	from refs/heads/branch
+ 
+ 	INPUT_END
+-	git fast-import --export-pack-edges=edges.list <input
++	git fast-import --export-pack-edges=edges.list <input &&
++	cat >expect <<-EOF &&
++	.git/objects/pack/pack-.pack: $(git rev-parse --verify export-boundary)
++	EOF
++	sed -e s/pack-.*pack/pack-.pack/ edges.list >actual &&
++	test_cmp expect actual
+ '
+ 
+-test_expect_success 'I: verify edge list' '
++test_expect_success 'I: export-pack-edges via stdin' '
++	test_when_finished "rm edges.list" &&
++	cat >input <<-INPUT_END &&
++	option git export-pack-edges=edges.list
++	commit refs/heads/export-boundary-2
++	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
++	data <<COMMIT
++	one more similar commit
++	COMMIT
++
++	from refs/heads/branch
++
++	INPUT_END
++	git fast-import --allow-unsafe-features <input &&
+ 	cat >expect <<-EOF &&
+-	.git/objects/pack/pack-.pack: $(git rev-parse --verify export-boundary)
++	.git/objects/pack/pack-.pack: $(git rev-parse --verify export-boundary-2)
+ 	EOF
+ 	sed -e s/pack-.*pack/pack-.pack/ edges.list >actual &&
+ 	test_cmp expect actual
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index d75e21e85b..3940fe8769 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -15,6 +15,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2026-113408_p1.patch \
            file://CVE-2026-113408_p2.patch \
            file://CVE-2026-113408_p3.patch \
+           file://CVE-2026-114466_p1.patch \
+           file://CVE-2026-114466_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

