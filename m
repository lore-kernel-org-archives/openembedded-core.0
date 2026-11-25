Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36113.1795583576446541184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hu1fZYCs;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6658; q=dns/txt;
  s=iport01; t=1795583576; x=1796793176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rs+1k+LjANzxyJ8TLVsmcjsyLktJG194hEkUa2+Rjyc=;
  b=hu1fZYCsLIwuPcHQCD3bNYI3kz4W4yAT9rwFwZoVZ6cjOUM6fH3Ch3sK
   Mis99pD82gbvaWkEJHgwXF3jwY+o9ArYekcfIhYpdkJ1Zck+8Z3aQ0vqO
   BQbMFdAoaXE+f3NUTwug5iIYj2tugTHF3ZxkzR8CCdZCB57nWXO1t7bVV
   7D0XrVARzT3UFyXQxLE4kpj0IZAq8Gm2vP/yWvrp1hvtUBFfC78Rls1U9
   F1uuuTn8YIxAU0IHuUGWfIGAS8KHIW5SnqD2g0+MSWpl5leEQDx2xAY/p
   PkT8buRBtORQtLi1iuNU4yp1LEB7YEjIUfQPBdDJvqcm/tzR9d1TKeT4H
   w==;
X-CSE-ConnectionGUID: QMRCEhgrR4yIJyBiAQCRsA==
X-CSE-MsgGUID: o6pKO/+GTKeE97uAGaVWzw==
X-IPAS-Result: =?us-ascii?q?A0BJAgCpbAZr/8pK/pBaglmCV3VhQkmUKoIhA4tmkkMUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBghKCcwKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLyALIwgZgwIBgjoDNwIBE?=
 =?us-ascii?q?Qa5fYF5M4EBgykBgVTYTA2CWgELFAGBOIVCgwCFJV0YAYR+JxsbgXKBFYNqg?=
 =?us-ascii?q?QWBGkICgUeGXwSCIoEMgVQehhyGWQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8G?=
 =?us-ascii?q?wqBDCcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTgihzgQ4BGxAEdyWBDCIpk?=
 =?us-ascii?q?kYukBWCIaAgcQoog3mMJI8+hXwaM4QEpUiBJguYfYJZizGECpJHhGqBaDyBQ?=
 =?us-ascii?q?w8HcBWDIglKGQ9XjVYBCwuDYIZQyAsjNQIBAQEGMgEBBwIHDgMLgWiQAi2BT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:L2K8F64RYyOkHe+cgbCURwxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 mNOC22DPf/fYjCjc48gYYyxpE8FuJLTnIVlHAo+rngwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eBKgi0ct3Dnt0q
 e05CiEnbzm6rNit6efuIgVsrpxLwMjDNY4F/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0cn1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FboCEIoLXG5k9ckCwo
 Tze3EO+QT4mF9GymGWY212luNDdgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:M2bL2qjwfxA7ZRwDbwGdMRtYTnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:meSrzmPkwTS2q+5DYQxd32MUFdofLmz87mb6ImaBIlxyYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AHFhm5AyNjtKGSzUXVgtRJa4yY/qaqKPwEGMq1tY?=
 =?us-ascii?q?ph+qJGH0vJh6yhQqIUJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62906564"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:12:54 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id C4911794E6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:53 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7959FCBF223; Tue, 24 Nov 2026 21:12:52 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 5/6] git: fix CVE-2026-114467
Date: Tue, 24 Nov 2026 21:12:45 -0800
Message-Id: <20261125051246.3108822-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051246.3108822-1-asparmar@cisco.com>
References: <20261125051246.3108822-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251133
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Git 2.53.1 backport for
CVE-2026-114467. The upstream fix merge is referenced in [1],
and the security release notes are referenced in [2]. Individual
fix links are recorded in the embedded patch headers.

[1] https://github.com/git/git/commit/8e02c245c26d3cceccaa1b4e61daea197f1e82c8
[2] https://github.com/git/git/blob/v2.53.1/Documentation/RelNotes/2.50.2.adoc

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../git/git/CVE-2026-114467.patch             | 150 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-114467.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2026-114467.patch b/meta/recipes-devtools/git/git/CVE-2026-114467.patch
new file mode 100644
index 0000000000..2200907203
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-114467.patch
@@ -0,0 +1,150 @@
+From f8c2fab7b46210866fce7b3c4248bbf79fd138f5 Mon Sep 17 00:00:00 2001
+From: Karthik Nayak <karthik.188@gmail.com>
+Date: Mon, 16 Mar 2026 11:00:45 +0100
+Subject: [PATCH] commit: rewrite `remove_signature()` to work with multiple
+ signatures
+
+The `remove_signature()` allows stripping GPG signatures from a given
+commit message buffer. It does so by parsing the message and recognizing
+the start and end positions of signatures present in the message.
+However, it assumes that a message can only contain two signatures at
+most.
+
+Commits crafted with more than two signatures will trigger a stack
+memory corruption as the function writes past the end of a fixed-size
+stack array `sigs[2]`.
+
+To avoid this, rewrite the function to use an internal buffer which
+simply collects non-signature lines and then swaps it with the incoming
+buffer. This removes the need for using a fixed size array for tracking
+individual signatures and allows the function to work with more than two
+signatures.
+
+CVE: CVE-2026-114467
+Upstream-Status: Backport [https://github.com/git/git/commit/aff587222342473034a270a3a04cfb1eba0a1117]
+
+Reported-by: pwn2addr <p2addr@gmail.com>
+Signed-off-by: Karthik Nayak <karthik.188@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ commit.c         | 35 +++++++++++++----------------------
+ t/t7600-merge.sh | 37 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 22 deletions(-)
+
+diff --git a/commit.c b/commit.c
+index 28bb5ce0..a7d0996b 100644
+--- a/commit.c
++++ b/commit.c
+@@ -1224,51 +1224,42 @@ int parse_buffer_signed_by_header(const char *buffer,
+ 
+ int remove_signature(struct strbuf *buf)
+ {
+-	const char *line = buf->buf;
+ 	const char *tail = buf->buf + buf->len;
++	const char *line = buf->buf;
++	int signature_found = 0;
+ 	int in_signature = 0;
+-	struct sigbuf {
+-		const char *start;
+-		const char *end;
+-	} sigs[2], *sigp = &sigs[0];
+-	int i;
+-	const char *orig_buf = buf->buf;
++	struct strbuf final;
+ 
+-	memset(sigs, 0, sizeof(sigs));
++	strbuf_init(&final, buf->len);
+ 
+ 	while (line < tail) {
+ 		const char *next = memchr(line, '\n', tail - line);
+ 		next = next ? next + 1 : tail;
+ 
+-		if (in_signature && line[0] == ' ')
+-			sigp->end = next;
+-		else if (starts_with(line, "gpgsig")) {
++		if (in_signature && line[0] == ' ') {
++			/* Still inside a signature, ignore the content. */
++		} else if (starts_with(line, "gpgsig")) {
+ 			int i;
+ 			for (i = 1; i < GIT_HASH_NALGOS; i++) {
+ 				const char *p;
+ 				if (skip_prefix(line, gpg_sig_headers[i], &p) &&
+-				    *p == ' ') {
+-					sigp->start = line;
+-					sigp->end = next;
+-					in_signature = 1;
+-				}
++				    *p == ' ')
++					signature_found = in_signature = 1;
+ 			}
+ 		} else {
+ 			if (*line == '\n')
+ 				/* dump the whole remainder of the buffer */
+ 				next = tail;
+-			if (in_signature && sigp - sigs != ARRAY_SIZE(sigs))
+-				sigp++;
+ 			in_signature = 0;
++			strbuf_add(&final, line, next - line);
+ 		}
+ 		line = next;
+ 	}
+ 
+-	for (i = ARRAY_SIZE(sigs) - 1; i >= 0; i--)
+-		if (sigs[i].start)
+-			strbuf_remove(buf, sigs[i].start - orig_buf, sigs[i].end - sigs[i].start);
++	strbuf_swap(buf, &final);
++	strbuf_release(&final);
+ 
+-	return sigs[0].start != NULL;
++	return signature_found;
+ }
+ 
+ static void handle_signed_tag(const struct commit *parent, struct commit_extra_header ***tail)
+diff --git a/t/t7600-merge.sh b/t/t7600-merge.sh
+index 9838094b..9116b567 100755
+--- a/t/t7600-merge.sh
++++ b/t/t7600-merge.sh
+@@ -1054,6 +1054,43 @@ test_expect_success GPG 'merge --no-edit tag should skip editor' '
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success GPG 'merge tag with multiple signatures' '
++	git commit --allow-empty -m "A newer commit" &&
++	git tag -s -m "A newer commit" signed_base &&
++
++	OBJECT_ID=$(git rev-parse HEAD) &&
++	git cat-file -p signed_base >base &&
++	HEADERS=$(sed "/^$/q" base) &&
++	BODY=$(sed "1,/^$/d" base) &&
++
++	# Manually craft a tag with multiple signatures. But we
++	# utilize the signature of a valid tag, so that this new tag will
++	# also pass verification.
++	cat >tag-text <<-EOF &&
++	$HEADERS
++	gpgsig -----BEGIN PGP SIGNATURE-----
++	 VGhpcyBpcyBub3QgcmVhbGx5IGEgc2lnbmF0dXJlLg==
++	 -----END PGP SIGNATURE-----
++	gpgsig-sha256 -----BEGIN PGP SIGNATURE-----
++	 VGhpcyBpcyBub3QgcmVhbGx5IGEgc2lnbmF0dXJlLg==
++	 -----END PGP SIGNATURE-----
++	gpgsig-sha256 -----BEGIN PGP SIGNATURE-----
++	 VGhpcyBpcyBub3QgcmVhbGx5IGEgc2lnbmF0dXJlLg==
++	 -----END PGP SIGNATURE-----
++
++	$BODY
++	EOF
++
++	TAG_HASH=$(git hash-object -t tag -w tag-text) &&
++	git update-ref refs/tags/multiple-signs $TAG_HASH &&
++	git reset --hard @~1 &&
++	git merge --no-edit multiple-signs &&
++	git cat-file -p HEAD >actual &&
++	# During the merge of signed tags, validation is done against the
++	# payload after stripping any additional signature.
++	test_grep "Good signature" actual
++'
++
+ test_expect_success 'set up mod-256 conflict scenario' '
+ 	# 256 near-identical stanzas...
+ 	for i in $(test_seq 1 256); do
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index c5bf87e44f..59bac1497f 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2026-111760_p2.patch \
            file://CVE-2026-111760_p3.patch \
            file://CVE-2026-111760_p4.patch \
+           file://CVE-2026-114467.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

