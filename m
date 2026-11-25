Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36075.1795583577828016614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=icrhDb20;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15646; q=dns/txt;
  s=iport01; t=1795583578; x=1796793178;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=D56cR06YGBoaV+57jsWheR40HSTopcpGRqz0fJLmrFw=;
  b=icrhDb20e9RWmuIQFN/2EJUrcGGUGHaL5YDsA9+sSFRB0ByZhTN1l4vo
   TW/yMYQd3t5HwrOFQ2lTVoDxrcwWIE9aCtcjHR+aak5sEvJlNxCBB6GTW
   K6xHXZvCqerE+o9q7k9K0fX/bFIT/C2QabMrOFiQd6Xkj/XG9bQ5Kg6ij
   r1wG+KUoLaZSnm3S1/qJPC4xFxABwsfiZ2O5/1Eg4tUM53oXhvVKZVqQz
   BkNXHgwNigNPa2XBFG5gP5m2d1GBI7K6NnLo5ANckG6tweQz/ZQSrGLjn
   nsZmt7lGYmEczpOwcefsw4XcuRvBkH96KZPxqkzxzKQMDY/PiQgKvyTDr
   Q==;
X-CSE-ConnectionGUID: 7FV+oMvcRdGKPk4GU7xInA==
X-CSE-MsgGUID: so/VO1jIQi+P1rf+BWErKQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgCpbAZr/9VK/pBaglmCV3VhQkmUKoIhA4tmkkOBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGCEoJzAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvIAsjCBmDAgGCOgM3AgERB?=
 =?us-ascii?q?rl9gXkzgQGDKQGBVNhMDYJaAQsUAYE4hUKDAIUlXRgBhH4nGxuBcoEVg2qBB?=
 =?us-ascii?q?YEaQgKIJgSCIoEMgVQehhyGWQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBD?=
 =?us-ascii?q?CcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTgjFqAXMHEwETGCJZgQkBJ0uSb?=
 =?us-ascii?q?JAdgiGgIHEKKIN5jCSPPoV8GjOEBIFXkkOLJIcwC5h9jgqECpFeHE2EaoFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ9XjVQDCwuDAl6GUMgLIzUCAQEBBjIBAQcCBw4DC4FokAItg?=
 =?us-ascii?q?U8BAQ?=
IronPort-Data: A9a23:SxEYu6j3OmILFmPRVvOCU3a4X161NBEKZh0ujC45NGQN5FlHY01je
 htvUDqBafneNjHyeY13Pt6xpx5UvMXWytdrT1FsrS8zFC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVH1Ng0BkRQ/
 sYUBxM1bUysur2m4bSSH7wEasQLdKEHPasWt2slyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYT/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKLII3XH54Pxi50o
 Erd+CPHJUgYFeWeigLc6HzvrNDihwDCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:R34ANam2OhotxRgDLF0x1Y1ci7/pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A3xRdMWrO1XbuKvkgHFd4ES7mUZ8LTD7a6WnbGUO?=
 =?us-ascii?q?XKl5qFJKoFk+x/ooxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AXWp43g/9gNaCjtcDOUGKAxyQf9xvpJqJUUIsqJR?=
 =?us-ascii?q?Fg5CeO29aBBqHrw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62952320"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:12:55 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 5010B18000232
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:55 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7C70ACBF224; Tue, 24 Nov 2026 21:12:52 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 6/6] git: fix CVE-2026-114469
Date: Tue, 24 Nov 2026 21:12:46 -0800
Message-Id: <20261125051246.3108822-6-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051246.3108822-1-asparmar@cisco.com>
References: <20261125051246.3108822-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251137
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Git 2.53.1 backport for
CVE-2026-114469. The upstream fix merge is referenced in [1],
and the security release notes are referenced in [2]. Individual
fix links are recorded in the embedded patch headers.

[1] https://github.com/git/git/commit/aaa715dbf8aef2feec550f232c22ceeaf4b0df47
[2] https://github.com/git/git/blob/v2.53.1/Documentation/RelNotes/2.50.2.adoc

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../git/git/CVE-2026-114469_p1.patch          | 282 ++++++++++++++++++
 .../git/git/CVE-2026-114469_p2.patch          | 118 ++++++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   2 +
 3 files changed, 402 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-114469_p1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-114469_p2.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2026-114469_p1.patch b/meta/recipes-devtools/git/git/CVE-2026-114469_p1.patch
new file mode 100644
index 0000000000..02c0439e79
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-114469_p1.patch
@@ -0,0 +1,282 @@
+From 85022ddd6ccce9675911c1f6c256fa7c5304de75 Mon Sep 17 00:00:00 2001
+From: Karthik Nayak <karthik.188@gmail.com>
+Date: Wed, 25 Mar 2026 10:30:32 +0100
+Subject: [PATCH] apply: reject binary patches greater than MAX_APPLY_SIZE
+
+In f1c0e3946e (apply: reject patches larger than ~1 GiB, 2022-10-25) we
+added a check to skip patches greater than ~1 GiB. This was because the
+apply code does not work well with large files. It uses 'int' and
+'unsigned long' interchangeably for storing the size of the patch. For
+large patches whose size is stored in an 'unsigned long' and then moved
+to an 'int', the value can wrap around and cause issues.
+
+Unfortunately the fix applied earlier does not work for binary files.
+As the size of a binary diff is different from the actual on disk size
+since binary diffs are compressed with zlib and encoded with base85.
+Binary diffs whose inflated size is very large will crash with an
+out-of-bounds read in `patch_delta()` when the truncated `delta_size`
+exceeds the real buffer length.
+
+Let's apply a similar fix by checking the final decoded length of a
+binary patch and fail if it is larger than MAX_APPLY_SIZE.
+
+Add a simple test with data consisting of zeros that when compressed and
+encoded is less than MAX_APPLY_SIZE.
+
+CVE: CVE-2026-114469
+Upstream-Status: Backport [https://github.com/git/git/commit/55c54fd375849d303ab71307fc8f79254877cc89]
+
+Backport Changes:
+- Fold the chunk encoder from [1] and the base85 test helper and
+  build registrations from [2] into this fix. Without these,
+  Git 2.53.0 test-tool fails with no tool named base85.
+- Retain the existing encode_85() interface and diff.c emission
+  path; their upstream refactor is not required by the tests.
+
+[1] https://github.com/git/git/commit/f0f7ab0b68e59a793aae837fddcefd138e932ad3
+[2] https://github.com/git/git/commit/15b2d49c4d7920efcbf4baa2fa85b3d0836062b9
+
+Reported-by: pwn2addr <p2addr@gmail.com>
+Signed-off-by: Karthik Nayak <karthik.188@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Makefile                   |  1 +
+ apply.c                    | 13 +++++++++--
+ base85.c                   | 31 +++++++++++++++++++++++++++
+ base85.h                   | 10 +++++++++
+ t/helper/meson.build       |  1 +
+ t/helper/test-base85.c     | 44 ++++++++++++++++++++++++++++++++++++++
+ t/helper/test-tool.c       |  1 +
+ t/helper/test-tool.h       |  1 +
+ t/t4141-apply-too-large.sh | 19 ++++++++++++++++
+ 9 files changed, 119 insertions(+), 2 deletions(-)
+ create mode 100644 t/helper/test-base85.c
+
+diff --git a/Makefile b/Makefile
+index cd111e2b..ada0fba8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -801,6 +801,7 @@ X =
+ PROGRAMS += $(patsubst %.o,git-%$X,$(PROGRAM_OBJS))
+ 
+ TEST_BUILTINS_OBJS += test-advise.o
++TEST_BUILTINS_OBJS += test-base85.o
+ TEST_BUILTINS_OBJS += test-bitmap.o
+ TEST_BUILTINS_OBJS += test-bloom.o
+ TEST_BUILTINS_OBJS += test-bundle-uri.o
+diff --git a/apply.c b/apply.c
+index 3de4aa4d..e04e81ba 100644
+--- a/apply.c
++++ b/apply.c
+@@ -1968,6 +1968,7 @@ static struct fragment *parse_binary_hunk(struct apply_state *state,
+ 	char *data = NULL;
+ 	int hunk_size = 0;
+ 	struct fragment *frag;
++	const char *error_msg = NULL;
+ 
+ 	llen = linelen(buffer, size);
+ 	used = llen;
+@@ -1985,6 +1986,11 @@ static struct fragment *parse_binary_hunk(struct apply_state *state,
+ 	else
+ 		return NULL;
+ 
++	if (origlen >= MAX_APPLY_SIZE) {
++		error_msg = _("patch too large");
++		goto corrupt;
++	}
++
+ 	state->linenr++;
+ 	buffer += llen;
+ 	size -= llen;
+@@ -2045,8 +2051,11 @@ static struct fragment *parse_binary_hunk(struct apply_state *state,
+  corrupt:
+ 	free(data);
+ 	*status_p = -1;
+-	error(_("corrupt binary patch at line %d: %.*s"),
+-	      state->linenr-1, llen-1, buffer);
++	if (error_msg)
++		error("%s", error_msg);
++	else
++		error(_("corrupt binary patch at line %d: %.*s"),
++		      state->linenr - 1, llen - 1, buffer);
+ 	return NULL;
+ }
+ 
+diff --git a/base85.c b/base85.c
+index 80e899a2..97fd0652 100644
+--- a/base85.c
++++ b/base85.c
+@@ -101,6 +101,37 @@ void encode_85(char *buf, const unsigned char *data, int bytes)
+ 	*buf = 0;
+ }
+ 
++/*
++ * Split the provided data into chunks of at most 52 bytes. Each chunk
++ * is base85-encoded into a line with the following format:
++ *  - Byte 0: encodes the chunk size (1-52) as a letter: 'A'-'Z' for
++ *    1-26 bytes, 'a'-'z' for 27-52 bytes.
++ *  - Bytes 1 onwards: base85-encoded data (up to 65 bytes).
++ *  - Followed by a newline and NUL terminator.
++ * The output callback is called once per line.
++ */
++void chunk_and_encode85(const unsigned char *data, unsigned long len,
++			each_encoded_line_fn output, void *output_data)
++{
++	while (len) {
++		int line_len;
++		int bytes = (BASE85_CHUNK_SIZE < len) ? BASE85_CHUNK_SIZE : len;
++		char line[71];
++		len -= bytes;
++		if (bytes <= 26)
++			line[0] = bytes + 'A' - 1;
++		else
++			line[0] = bytes - 26 + 'a' - 1;
++		encode_85(line + 1, data, bytes);
++		data = data + bytes;
++
++		line_len = strlen(line);
++		line[line_len++] = '\n';
++		line[line_len] = '\0';
++		output(line, line_len, output_data);
++	}
++}
++
+ #ifdef DEBUG_85
+ int main(int ac, char **av)
+ {
+diff --git a/base85.h b/base85.h
+index c835086e..d3952aed 100644
+--- a/base85.h
++++ b/base85.h
+@@ -1,7 +1,17 @@
+ #ifndef BASE85_H
+ #define BASE85_H
+ 
++/*
++ * We pick 52, a multiple of 4 so there are no partial groups and it
++ * fits in the A-Za-z length prefix encoding.
++ */
++#define BASE85_CHUNK_SIZE 52
++
++typedef void each_encoded_line_fn(char *line, int len, void *cb_data);
++
+ int decode_85(char *dst, const char *line, int linelen);
+ void encode_85(char *buf, const unsigned char *data, int bytes);
++void chunk_and_encode85(const unsigned char *data, unsigned long len,
++			each_encoded_line_fn output, void *output_data);
+ 
+ #endif /* BASE85_H */
+diff --git a/t/helper/meson.build b/t/helper/meson.build
+index 0e38ca3a..eb821ef0 100644
+--- a/t/helper/meson.build
++++ b/t/helper/meson.build
+@@ -1,6 +1,7 @@
+ test_tool_sources = [
+   '../unit-tests/test-lib.c',
+   'test-advise.c',
++  'test-base85.c',
+   'test-bitmap.c',
+   'test-bloom.c',
+   'test-bundle-uri.c',
+diff --git a/t/helper/test-base85.c b/t/helper/test-base85.c
+new file mode 100644
+index 00000000..98c591b4
+--- /dev/null
++++ b/t/helper/test-base85.c
+@@ -0,0 +1,44 @@
++#include "test-tool.h"
++#include "base85.h"
++
++#define MAX_INPUT_BUF BASE85_CHUNK_SIZE * 1024
++
++static const char *base85_usage = "test-tool base85 chunk-encode";
++
++static void print_binary_diff_line(char line[71], int len, void *output_data UNUSED)
++{
++	fwrite(line, 1, len, stdout);
++}
++
++static void base85_chunk(void)
++{
++	unsigned char *input = xmalloc(MAX_INPUT_BUF);
++
++	for (;;) {
++		ssize_t len = read_in_full(0, input, MAX_INPUT_BUF);
++		if (len < 0)
++			die_errno("read error");
++
++		chunk_and_encode85(input, len, print_binary_diff_line, NULL);
++		if (len < MAX_INPUT_BUF)
++			break;
++	}
++
++	putc('\n', stdout);
++	free(input);
++}
++
++int cmd__base85(int argc, const char **argv)
++{
++	if (argc != 2)
++		usage(base85_usage);
++
++	if (!strcmp(argv[1], "chunk-encode")) {
++		base85_chunk();
++	} else {
++		error("unknown subcommand: %s", argv[1]);
++		usage(base85_usage);
++	}
++
++	return 0;
++}
+diff --git a/t/helper/test-tool.c b/t/helper/test-tool.c
+index feb5b6f4..aadfd4b7 100644
+--- a/t/helper/test-tool.c
++++ b/t/helper/test-tool.c
+@@ -11,6 +11,7 @@ static const char * const test_tool_usage[] = {
+ 
+ static struct test_cmd cmds[] = {
+ 	{ "advise", cmd__advise_if_enabled },
++	{ "base85", cmd__base85 },
+ 	{ "bitmap", cmd__bitmap },
+ 	{ "bloom", cmd__bloom },
+ 	{ "bundle-uri", cmd__bundle_uri },
+diff --git a/t/helper/test-tool.h b/t/helper/test-tool.h
+index 669c7bef..996bfa64 100644
+--- a/t/helper/test-tool.h
++++ b/t/helper/test-tool.h
+@@ -4,6 +4,7 @@
+ #include "git-compat-util.h"
+ 
+ int cmd__advise_if_enabled(int argc, const char **argv);
++int cmd__base85(int argc, const char **argv);
+ int cmd__bitmap(int argc, const char **argv);
+ int cmd__bloom(int argc, const char **argv);
+ int cmd__bundle_uri(int argc, const char **argv);
+diff --git a/t/t4141-apply-too-large.sh b/t/t4141-apply-too-large.sh
+index eac6f7e1..7e311a5f 100755
+--- a/t/t4141-apply-too-large.sh
++++ b/t/t4141-apply-too-large.sh
+@@ -19,4 +19,23 @@ test_expect_success EXPENSIVE 'git apply rejects patches that are too large' '
+ 	grep "patch too large" err
+ '
+ 
++test_expect_success EXPENSIVE 'git apply rejects binary patches that are too large' '
++	sz=$((1024 * 1024 * 2048)) &&
++	test-tool genzeros $sz | test-tool zlib deflate | test-tool base85 chunk-encode >payload &&
++	{
++		# Although the patch requires the correct blob ID, blob ID validation
++		# happens after the inflated content size check, so use $EMPTY_BLOB as
++		# a filler.
++		cat <<-EOF &&
++		diff --git a/file b/file
++		new file mode 100644
++		index $ZERO_OID..$EMPTY_BLOB
++		GIT binary patch
++		literal $sz
++		EOF
++		cat payload
++	} | test_must_fail git apply 2>err &&
++	grep "patch too large" err
++'
++
+ test_done
diff --git a/meta/recipes-devtools/git/git/CVE-2026-114469_p2.patch b/meta/recipes-devtools/git/git/CVE-2026-114469_p2.patch
new file mode 100644
index 0000000000..d59eda7307
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-114469_p2.patch
@@ -0,0 +1,118 @@
+From 89a65caa611bb2ca3e517447183d96719d06982a Mon Sep 17 00:00:00 2001
+From: Karthik Nayak <karthik.188@gmail.com>
+Date: Wed, 25 Mar 2026 10:30:33 +0100
+Subject: [PATCH] apply: add tests mismatch in binary patch size
+
+The previous commit added a check to ensure that the mentioned literal
+length of a given binary patch does not exceed 'MAX_APPLY_SIZE'.
+However, this doesn't mean an attacker cannot modify the literal patch
+size mentioned in the patch headers.
+
+Fortunately, we're already safeguarded against such attacks. Applying a
+binary patch includes the following steps:
+
+  1. Checking that the file size doesn't exceed 'MAX_APPLY_SIZE'.
+  2. Base85 decoding the content (reduces the size of the patch by 4/5).
+  3. Zlib inflating the decoded content (possibly increases the size).
+
+As we already check the file size in step 1 and step 2 will only reduce
+the given size, there is no chance that the content would exceed
+'MAX_APPLY_SIZE' at step 2.
+
+That means the only chance is that step 3 could inflate the size beyond
+'MAX_APPLY_SIZE'. While this is indeed possible, inflation is done using
+the `inflate_it()` command, which takes in the expected size. The
+expected size is the literal size mentioned in the patch header. If the
+inflated content doesn't match this provided size, we error out. So
+we're safe here too.
+
+Let's add two tests to capture these behaviors. First one to add a large
+binary patch which fails due to large file size. Second a binary patch
+with mismatched size, which fails during inflation.
+
+The second test also exposes two memory leaks. One where the initialized
+`struct fragment *` is not freed in such a scenario. Fix it, by free'ing
+it before we exit the function. The second where a large binary file is
+read but because it is too large, we throw an error. Here, we free the
+buffer the file is read into.
+
+CVE: CVE-2026-114469
+Upstream-Status: Backport [https://github.com/git/git/commit/dee1bb2a9fc75c3a1f7f1c6aaf86ff2c038bd436]
+
+Reported-by: pwn2addr <p2addr@gmail.com>
+Signed-off-by: Karthik Nayak <karthik.188@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ apply.c                    | 10 +++++++---
+ t/t4141-apply-too-large.sh | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 38 insertions(+), 3 deletions(-)
+
+diff --git a/apply.c b/apply.c
+index e04e81ba..704b5a9e 100644
+--- a/apply.c
++++ b/apply.c
+@@ -2038,8 +2038,10 @@ static struct fragment *parse_binary_hunk(struct apply_state *state,
+ 	CALLOC_ARRAY(frag, 1);
+ 	frag->patch = inflate_it(data, hunk_size, origlen);
+ 	frag->free_patch = 1;
+-	if (!frag->patch)
++	if (!frag->patch) {
++		free(frag);
+ 		goto corrupt;
++	}
+ 	free(data);
+ 	frag->size = origlen;
+ 	*buf_p = buffer;
+@@ -4814,8 +4816,10 @@ static int apply_patch(struct apply_state *state,
+ 	int flush_attributes = 0;
+ 
+ 	state->patch_input_file = filename;
+-	if (read_patch_file(&buf, fd) < 0)
+-		return -128;
++	if (read_patch_file(&buf, fd) < 0) {
++		res = -128;
++		goto end;
++	}
+ 	offset = 0;
+ 	while (offset < buf.len) {
+ 		struct patch *patch;
+diff --git a/t/t4141-apply-too-large.sh b/t/t4141-apply-too-large.sh
+index 7e311a5f..1cd5792b 100755
+--- a/t/t4141-apply-too-large.sh
++++ b/t/t4141-apply-too-large.sh
+@@ -38,4 +38,35 @@ test_expect_success EXPENSIVE 'git apply rejects binary patches that are too lar
+ 	grep "patch too large" err
+ '
+ 
++test_expect_success EXPENSIVE 'git apply rejects large binary patches with incorrect size' '
++	sz=$((1024 * 1024 * 1023)) &&
++	test-tool genrandom foo $sz | test-tool zlib deflate | test-tool base85 chunk-encode >payload &&
++	{
++		cat <<-EOF &&
++		diff --git a/file b/file
++		new file mode 100644
++		index $ZERO_OID..$EMPTY_BLOB
++		GIT binary patch
++		literal 10
++		EOF
++		cat payload
++	} | test_must_fail git apply 2>err &&
++	grep "patch too large" err
++'
++
++test_expect_success 'git apply rejects binary patches with incorrect size' '
++	test-tool genrandom foo 100 | test-tool zlib deflate | test-tool base85 chunk-encode >payload &&
++	{
++		cat <<-EOF &&
++		diff --git a/file b/file
++		new file mode 100644
++		index $ZERO_OID..$EMPTY_BLOB
++		GIT binary patch
++		literal 10
++		EOF
++		cat payload
++	} | test_must_fail git apply 2>err &&
++	grep "corrupt binary patch" err
++'
++
+ test_done
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 59bac1497f..5ea0c1033b 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2026-111760_p3.patch \
            file://CVE-2026-111760_p4.patch \
            file://CVE-2026-114467.patch \
+           file://CVE-2026-114469_p1.patch \
+           file://CVE-2026-114469_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

