Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36112.1795583576147279887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SsZ5YrE2;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12288; q=dns/txt;
  s=iport01; t=1795583576; x=1796793176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YpxP/89EBuNXuRvo4RFemJLot0ff+c0moupqUCx75lI=;
  b=SsZ5YrE2Tq14fm06U3r6mbaqkLliQURY9q0IReYzVIPaKJRVgiXFXucT
   kdnsWJBkHDLlyWm/99Y0W5U0kDMDAIwArawnmllcwAnXOM3NypvXml4ah
   6fwCs99tTXXW+qRU+P7NODBoblx2ENZk1GMD+EmSFE2Mb0t8EV3CQ8vYR
   QxGcXuaKk5uDXN6wZPh93Fr6n2QD+nRXnviAvuXD7fSll0XmB+U/6SjzJ
   uSg74pP1PEQLgVKKhQstuLa646CP0tFY8NJJuMzUzULW9U5zTFNlcpK9x
   uG8PBoSY+hi/aTmiBvMXIxHqC5RPsK96sTS0Sq1HIUIhqgjG2P5+q2bbY
   g==;
X-CSE-ConnectionGUID: UcmQdhPcQ9678gj31U9CKA==
X-CSE-MsgGUID: znlC7lWOQ1WCihsst4x54g==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/8tK/pBaHgEBCxIMggULgld1YUJJlCqCI?=
 =?us-ascii?q?QOBE50WgX4PAQEBD0QNBAEBghKCcwKOIgImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBAJgwIBg?=
 =?us-ascii?q?nQCAREGuX2BeTOBAYMpAYFU2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVgnR2g?=
 =?us-ascii?q?QWBXAKBJyGGXgSCIoEMgVQeMTOMEQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8G?=
 =?us-ascii?q?wqBDCcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTgxuBDgEqAReBNQtVBhyTT?=
 =?us-ascii?q?49jgiGBNZ9cCiiDeYwklToaM4QEpm4LmH2CWYsxlho3hGqBaDyBWXAVO4JnC?=
 =?us-ascii?q?UoZD1eNVgELC4NghlDICyM1AgEBAQYyAQEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:zKgVwaMsWNejsKrvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUpw1jcOz
 TAcXTuOa//fYzGkfoxyYYi/8xgEsJWEz9BrTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68hlCXg6PbUTw7cpXjFB9
 6dBFWEmTTnW0opawJrjIgVtrs0uNozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I0BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FIpi+OzboeLEjCMbddTmm3Ho
 l3hxj3GKRAaL8eDlSrYrn3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVkOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:YYWxzqsbef+QynXotZOOQ/FX7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:TMSaBG5IY6KnS5DfMNssyUURI8wlSnbknSmPc0C6Uj9UGZa2YArF
X-Talos-MUID: 9a23:lt6ScQWvtUoDKd3q/C3qgBo9MPhP2v2RI0ENio4a59nZaSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60336656"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:12:54 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id BB3A91800017C
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:53 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6F546CC2EF1; Tue, 24 Nov 2026 21:12:52 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/6] git: fix CVE-2026-113408
Date: Tue, 24 Nov 2026 21:12:42 -0800
Message-Id: <20261125051246.3108822-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051246.3108822-1-asparmar@cisco.com>
References: <20261125051246.3108822-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251132
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Git 2.53.1 backport for
CVE-2026-113408. The upstream fix merge is referenced in [1],
and the security release notes are referenced in [2]. Individual
fix links are recorded in the embedded patch headers.

[1] https://github.com/git/git/commit/dbd758da93f9762f1aab93891e44a3be8f860cd2
[2] https://github.com/git/git/blob/v2.53.1/Documentation/RelNotes/2.50.2.adoc

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../git/git/CVE-2026-113408_p1.patch          | 95 +++++++++++++++++++
 .../git/git/CVE-2026-113408_p2.patch          | 79 +++++++++++++++
 .../git/git/CVE-2026-113408_p3.patch          | 76 +++++++++++++++
 meta/recipes-devtools/git/git_2.53.0.bb       |  3 +
 4 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-113408_p1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-113408_p2.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-113408_p3.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2026-113408_p1.patch b/meta/recipes-devtools/git/git/CVE-2026-113408_p1.patch
new file mode 100644
index 0000000000..d38b42d545
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-113408_p1.patch
@@ -0,0 +1,95 @@
+From de9c8200cf327f45abfcd88774fb40e82b3fe58e Mon Sep 17 00:00:00 2001
+From: Toon Claes <toon@iotcl.com>
+Date: Thu, 9 Apr 2026 18:04:14 +0200
+Subject: [PATCH] connect: validate unborn HEAD symref-target in protocol v2
+
+A server using protocol v2 can advertise an unborn HEAD with
+symref-target. This symref can include various unallowed characters. The
+client copies this value verbatim into .git/HEAD. When subsequent
+actions want to update HEAD, resolving the ref can lead to unwanted
+behavior.
+
+Add check_refname_format() validation in process_ref_v2() before
+accepting the unborn HEAD symref-target. And as an added measure, also
+add similar validation in clone.c.
+
+Only protocol v2 needs to be hardened against this, v1 already checks
+refnames since a45b5f0552 (connect: annotate refs with their symref
+information in get_remote_head(), 2013-09-17).
+
+CVE: CVE-2026-113408
+Upstream-Status: Backport [https://github.com/git/git/commit/b371db812524aa7831d3c3a9aed782defd1dcfb2]
+
+Reported-by: Luke Martin <lmartin@paramenoeng.com>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ builtin/clone.c        |  1 +
+ connect.c              |  5 ++++-
+ t/t5702-protocol-v2.sh | 25 +++++++++++++++++++++++++
+ 3 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/builtin/clone.c b/builtin/clone.c
+index b40cee59..3b8c0efa 100644
+--- a/builtin/clone.c
++++ b/builtin/clone.c
+@@ -1561,6 +1561,7 @@ int cmd_clone(int argc,
+ 		}
+ 
+ 		if (transport_ls_refs_options.unborn_head_target &&
++		    !check_refname_format(transport_ls_refs_options.unborn_head_target, 0) &&
+ 		    skip_prefix(transport_ls_refs_options.unborn_head_target,
+ 				"refs/heads/", &branch)) {
+ 			unborn_head  = xstrdup(transport_ls_refs_options.unborn_head_target);
+diff --git a/connect.c b/connect.c
+index c6f76e30..d4efa49a 100644
+--- a/connect.c
++++ b/connect.c
+@@ -426,7 +426,10 @@ static int process_ref_v2(struct packet_reader *reader, struct ref ***list,
+ 				const char *arg = line_sections.items[i].string;
+ 
+ 				if (skip_prefix(arg, "symref-target:", &arg)) {
+-					*unborn_head_target = xstrdup(arg);
++					if (!check_refname_format(arg, 0))
++						*unborn_head_target = xstrdup(arg);
++					else
++						warning(_("remote advertised invalid symref-target '%s', ignoring"), arg);
+ 					break;
+ 				}
+ 			}
+diff --git a/t/t5702-protocol-v2.sh b/t/t5702-protocol-v2.sh
+index f826ac46..85bf9b06 100755
+--- a/t/t5702-protocol-v2.sh
++++ b/t/t5702-protocol-v2.sh
+@@ -1077,6 +1077,31 @@ test_expect_success 'clone big repository with http:// using protocol v2' '
+ 	grep "Send header: Transfer-Encoding: chunked" log
+ '
+ 
++test_expect_success 'clone with http:// using protocol v2 rejects invalid unborn symref-target' '
++	P="$HTTPD_DOCUMENT_ROOT_PATH/http_unborn_invalid" &&
++
++	git init "$P" &&
++	test_commit -C "$P" --no-tag stuff &&
++	git -C "$P" config lsrefs.unborn advertise &&
++	git -C "$P" symbolic-ref HEAD refs/heads/mydefaultbranch &&
++
++	# Advertise an unborn symref-target HEAD to include invalid characters
++	write_script "$HTTPD_ROOT_PATH/one-time-script" <<-\EOF &&
++	sed "s/mydefaultbranch/this*is*invalid/" "$1"
++	EOF
++
++	GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME= \
++	git -c init.defaultBranch=main -c protocol.version=2 \
++		clone "$HTTPD_URL/one_time_script/http_unborn_invalid" \
++		http_unborn_child 2>stderr &&
++
++	# Client rejects the invalid HEAD and falls back to its default branch name
++	echo "refs/heads/main" >expect &&
++	git -C http_unborn_child symbolic-ref HEAD >actual &&
++	test_cmp expect actual &&
++	test_grep "remote advertised invalid symref-target" stderr
++'
++
+ test_expect_success 'fetch with http:// using protocol v2' '
+ 	test_when_finished "rm -f log" &&
+ 
diff --git a/meta/recipes-devtools/git/git/CVE-2026-113408_p2.patch b/meta/recipes-devtools/git/git/CVE-2026-113408_p2.patch
new file mode 100644
index 0000000000..dac82f40c3
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-113408_p2.patch
@@ -0,0 +1,79 @@
+From 327316a4077612f034e3f2d68e8772d4763cb39e Mon Sep 17 00:00:00 2001
+From: Toon Claes <toon@iotcl.com>
+Date: Thu, 9 Apr 2026 18:04:15 +0200
+Subject: [PATCH] connect: validate born ref symref-target in protocol v2
+
+A server using protocol v2 can advertise HEAD with a symref-target
+attribute. The value is stored in ref->symref without validation. It
+is used by guess_remote_head() to determine which local branch HEAD
+should point to.
+
+Add check_refname_format() validation for the born ref symref-target
+value, matching the protection already added for unborn HEAD in the
+previous commit. Invalid symref-targets are silently dropped, causing
+guess_remote_head() to find what HEAD most likely points to.
+
+CVE: CVE-2026-113408
+Upstream-Status: Backport [https://github.com/git/git/commit/8cb7e2e031978c59381adf086fd1c0ce1e3a7315]
+
+Reported-by: Luke Martin <lmartin@paramenoeng.com>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ connect.c              |  8 ++++++--
+ t/t5702-protocol-v2.sh | 23 +++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/connect.c b/connect.c
+index d4efa49a..4c5878b5 100644
+--- a/connect.c
++++ b/connect.c
+@@ -450,8 +450,12 @@ static int process_ref_v2(struct packet_reader *reader, struct ref ***list,
+ 
+ 	for (; i < line_sections.nr; i++) {
+ 		const char *arg = line_sections.items[i].string;
+-		if (skip_prefix(arg, "symref-target:", &arg))
+-			ref->symref = xstrdup(arg);
++		if (skip_prefix(arg, "symref-target:", &arg)) {
++			if (!check_refname_format(arg, 0))
++				ref->symref = xstrdup(arg);
++			else
++				warning(_("remote advertised invalid symref-target '%s', ignoring"), arg);
++		}
+ 
+ 		if (skip_prefix(arg, "peeled:", &arg)) {
+ 			struct object_id peeled_oid;
+diff --git a/t/t5702-protocol-v2.sh b/t/t5702-protocol-v2.sh
+index 85bf9b06..1dbcc92e 100755
+--- a/t/t5702-protocol-v2.sh
++++ b/t/t5702-protocol-v2.sh
+@@ -1102,6 +1102,29 @@ test_expect_success 'clone with http:// using protocol v2 rejects invalid unborn
+ 	test_grep "remote advertised invalid symref-target" stderr
+ '
+ 
++test_expect_success 'clone with http:// using protocol v2 rejects invalid symref-target' '
++	P="$HTTPD_DOCUMENT_ROOT_PATH/http_head_invalid" &&
++
++	git init "$P" &&
++	test_commit -C "$P" one &&
++
++	# Advertise a symref-target HEAD to include invalid characters
++	write_script "$HTTPD_ROOT_PATH/one-time-script" <<-\EOF &&
++	sed "s|symref-target:refs/heads/main|symref-target:refs/heads/ma*n|" "$1"
++	EOF
++
++	git -c protocol.version=2 \
++		clone "$HTTPD_URL/one_time_script/http_head_invalid" \
++		http_head_child 2>stderr &&
++
++	# Client rejects the invalid HEAD and guess_remote_head falls back
++	# to a ref matching the OID matching, being refs/heads/main
++	echo "refs/heads/main" >expect &&
++	git -C http_head_child symbolic-ref HEAD >actual &&
++	test_cmp expect actual &&
++	test_grep "remote advertised invalid symref-target" stderr
++'
++
+ test_expect_success 'fetch with http:// using protocol v2' '
+ 	test_when_finished "rm -f log" &&
+ 
diff --git a/meta/recipes-devtools/git/git/CVE-2026-113408_p3.patch b/meta/recipes-devtools/git/git/CVE-2026-113408_p3.patch
new file mode 100644
index 0000000000..53aeb07c3c
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-113408_p3.patch
@@ -0,0 +1,76 @@
+From eb0b64cf98b9cf2a34ee4a8928e5b20da4b1c9f6 Mon Sep 17 00:00:00 2001
+From: Toon Claes <toon@iotcl.com>
+Date: Thu, 9 Apr 2026 18:04:16 +0200
+Subject: [PATCH] connect: validate ref names in protocol v2 ls-refs response
+
+A server using protocol v2 can advertise many refs in the ls-refs
+response. At the client, these are passed directly into alloc_ref()
+without validation.
+
+Validate all incoming refs using check_refname_format() with
+REFNAME_ALLOW_ONELEVEL (to accept HEAD). Invalid ref names are skipped
+with a warning, allowing the clone/fetch to proceed with other valid
+refs.
+
+CVE: CVE-2026-113408
+Upstream-Status: Backport [https://github.com/git/git/commit/f357b9c2c77eae1a1d37dfa44c1dda53f532a82a]
+
+Reported-by: Luke Martin <lmartin@paramenoeng.com>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ connect.c              |  7 +++++++
+ t/t5702-protocol-v2.sh | 22 ++++++++++++++++++++++
+ 2 files changed, 29 insertions(+)
+
+diff --git a/connect.c b/connect.c
+index 4c5878b5..20106262 100644
+--- a/connect.c
++++ b/connect.c
+@@ -442,6 +442,13 @@ static int process_ref_v2(struct packet_reader *reader, struct ref ***list,
+ 		goto out;
+ 	}
+ 
++	if (check_refname_format(line_sections.items[i].string,
++			         REFNAME_ALLOW_ONELEVEL)) {
++		warning(_("remote advertised invalid ref name '%s', ignoring"),
++			line_sections.items[i].string);
++		goto out;
++	}
++
+ 	ref = alloc_ref(line_sections.items[i++].string);
+ 
+ 	memcpy(ref->old_oid.hash, old_oid.hash, reader->hash_algo->rawsz);
+diff --git a/t/t5702-protocol-v2.sh b/t/t5702-protocol-v2.sh
+index 1dbcc92e..a2ef4983 100755
+--- a/t/t5702-protocol-v2.sh
++++ b/t/t5702-protocol-v2.sh
+@@ -1125,6 +1125,28 @@ test_expect_success 'clone with http:// using protocol v2 rejects invalid symref
+ 	test_grep "remote advertised invalid symref-target" stderr
+ '
+ 
++test_expect_success 'clone via http:// using protocol v2 rejects invalid ref from ls-refs' '
++	P="$HTTPD_DOCUMENT_ROOT_PATH/http_lsref_invalid" &&
++
++	git init "$P" &&
++	test_commit -C "$P" one &&
++	git -C "$P" checkout -b branchwithstuff &&
++	test_commit -C "$P" two &&
++
++	# Inject a ref with invalid characters
++	write_script "$HTTPD_ROOT_PATH/one-time-script" <<-\EOF &&
++	sed "s| refs/heads/main| refs/heads/ma*n|" "$1"
++	EOF
++
++	git -c protocol.version=2 \
++		clone "$HTTPD_URL/one_time_script/http_lsref_invalid" \
++		http_lsref_child 2>stderr &&
++
++	# The invalid ref name should be rejected with a warning
++	git -C http_lsref_child rev-parse refs/remotes/origin/branchwithstuff &&
++	test_grep "remote advertised invalid ref name" stderr
++'
++
+ test_expect_success 'fetch with http:// using protocol v2' '
+ 	test_when_finished "rm -f log" &&
+ 
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index da8fe2fb00..d75e21e85b 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -12,6 +12,9 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            file://CVE-2026-105437_p1.patch \
            file://CVE-2026-105437_p2.patch \
+           file://CVE-2026-113408_p1.patch \
+           file://CVE-2026-113408_p2.patch \
+           file://CVE-2026-113408_p3.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

