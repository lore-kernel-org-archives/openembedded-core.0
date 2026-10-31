Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3736.1793405754865440322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=n/zo1fj9;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13416685e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405753; x=1794010553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mhLxndRUcANw2n2B/eOX54RVFhFonUtg2tKtZhpVoMs=;
        b=n/zo1fj9GKQA9sse43SJTlsM+yyarG7ha4r6nBMMsQPkWCflQnlvCSS32CnZ/TkY43
         iXLFgiriw44XlaKEXADgqb4sbdhbVQ3Y+rqFI0nc25tAhLgwze1RySfNLwTB2FbYitd2
         UVTzEWkLIfjyh++4j++AXsSBjh6XD6zC6rqi6tGD4XPFdFC18uFkMdOhpOn6MEiSZWO3
         bqENWK3+Lx9JLaPGODBaiAziM8nB+tAGGwdMCf3bizgFWYYNRK6d1+Bq6OYrdqXA0hZw
         ZCZUQvIsgPThNq85dHve+1vN8mpghr8y0HUdp5fqrGqH2eFkB00tXm7lKdr3DbwuPfyp
         4ZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405753; x=1794010553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mhLxndRUcANw2n2B/eOX54RVFhFonUtg2tKtZhpVoMs=;
        b=ztpQ/GiBYjXPmWtjzr5V3uRcHekQo5BAD9o55AP39SgGgSZLMAd7rzUz9SQtRbO+Kx
         TIsB3XOLexIIWwvxCdxZ6H/KYXpblNZDVmt0uXvHL1NAs+G0pOP5SHNWdIHkJ3xy+/EH
         hSc5idEjJ756Fk30WCNjpACz+4jMJ8t+SkQPJxYzxrmg4rnAAun4P4zmCs+eLtdc3Pvv
         FB0RKLBQ2bJvisgM2QAEwSsXbj6O/t/mEz9zWmM5RDxb+AQrpJlQqw9iXnQSHLkhW34J
         ASkxrv+Rcp89JrYCGq6ZHIGc2sAx4vbjJst8/mqdlnjuNJ982AP/1FnwUSxessX/T82b
         7Q4w==
X-Gm-Message-State: AFq9FYJWI+zyV9Q0wgcI1Yz78BK+YCM8PDNZG9lLUpbIZtNGEqtb+oup
	G9f2vJ2o468PMeMMnikw9uF7OmZrNyMy2LZ7+89eTTTwrjc567prfD7HGzr9XqiD73WLEr3W3Vb
	lDqtsqqE=
X-Gm-Gg: AYBFou2v6ryBGyofBUfMASPF6k8Ox53xJb4ymF6HSOgoZpQcv01WkBurSKaI//tCedO
	NIq7xoSNXQzIPhpq8CtmMLGyLCPVF4D3nuZGAsPSBe0/xl0A9jHVQP89snW+bXiLfqyBCn/xpLt
	QV28V28mtJNDqPGQzcAabdtJjCknTizuBmxA26m3pB44nYzXCKRTAIPEEPOfZ6nDq8L7SyyHDfn
	p95vOX0eMokKPfupNUJCVf4Gzn8jZN0R7O3PTrfiYhmwAmrKQvFozqcUkZybDAZIWeMqHlkwwJ+
	+CYW5dv/HTR0J2palT0Ud7+DsMo09U/XS5tYcc6FcwGljJODYSC9bkVbT+5cDv2W9jaC/PHNTnB
	yOZXpczDdt8dSvIsFcOrXfOSujq8qTVnaW1qkRoavwgm+biBsgkraw/g+R8qA62qHuBuDBeWLCT
	TjuavOpkyHNuPnyIthuRbbIruMhAPehmjlSCY3rb2+H52W+pr+OFoSHtGutO5XMK+w5j5fjsRsG
	FFvWOrQmRJ8Vceo3VYfzSlTH/EJ8O7eOZqDTIeVQ9Pj7xJGHXmvaTS56chPUBMh4hW9c40eB7f2
	uiisqFUw3D1kJOgJk41WWV/gcwzbKJ0MybfvLfeBD82UOJvrdVMfUAmIsCzTXPA44XBZx4/Xr3J
	YmW+Mx+YWsal0iJAKewRJpvdiPNr4zJqhEPflK9CRxd8evgiuHQ==
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4ac18c73d85mr81512945e9.26.1793405753054;
        Fri, 30 Oct 2026 17:15:53 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/55] go: fix CVE-2026-56862
Date: Sat, 31 Oct 2026 01:14:38 +0100
Message-ID: <55017ae457253c6f8ef3a1ae4e74be3c63c420e3.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249092
Content-Type: text/plain; charset="utf-8"

From: Benhur Tessele <benhur.tessele@est.tech>

A malicious TLS 1.3 peer could keep sending KeyUpdate messages after
the handshake completed, forcing the other side to perform key
derivation indefinitely, because handshake records were always treated
as state-advancing.

Backport the upstream fix [1]. The bogo_config.json hunk is dropped
since the BoGo test harness does not exist in Go 1.22, and the new test
is adapted to use testConfig.

[1] https://github.com/golang/go/commit/27420571845abc6a97e19e21542a3213a74f67f4

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-56862.patch                | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-56862.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index c8fb9ef450d..cec3bbbb4ee 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -63,6 +63,7 @@ SRC_URI += "\
     file://CVE-2026-32288.patch \
     file://CVE-2026-27145.patch \
     file://CVE-2026-39823.patch \
+    file://CVE-2026-56862.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-56862.patch b/meta/recipes-devtools/go/go/CVE-2026-56862.patch
new file mode 100644
index 00000000000..5fca5be4ce8
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-56862.patch
@@ -0,0 +1,98 @@
+From 616c582eae27699513109445d5c177b42c3bb9fc Mon Sep 17 00:00:00 2001
+From: "Nicholas S. Husin" <nsh@golang.org>
+Date: Wed, 22 Jul 2026 12:27:12 -0400
+Subject: [PATCH] crypto/tls: do not count handshake messages as
+ state-advancing post-handshake
+
+Previously, we always counted handshake messages, such as KeyUpdate, as
+state-advancing, regardless of whether a handshake has been completed or
+not. As a result, a malicious client can keep sending KeyUpdate messages
+to force the server to keep performing key derivation operations
+indefinitely.
+
+Fix the issue by making it so that handshake messages are regarded
+as state-advancing only prior to handshake completion.
+
+Thank you to Qi Deng of Aurascape.ai for reporting this issue.
+
+Fixes #79866
+Fixes #80528
+Fixes CVE-2026-56862
+
+Change-Id: I37d27fd5f16227a9dde5f29bb5ae6c436a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/804261
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Neal Patel <neal@golang.org>
+
+CVE: CVE-2026-56862
+Upstream-Status: Backport [https://github.com/golang/go/commit/27420571845abc6a97e19e21542a3213a74f67f4]
+
+Backport notes for go1.22.12:
+- Dropped the src/crypto/tls/bogo_config.json hunk; the BoGo test
+  harness and its config do not exist in Go 1.22.
+- Test uses testConfig instead of testConfigClient/testConfigServer,
+  which were introduced after Go 1.22.
+
+Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
+---
+ src/crypto/tls/conn.go      |  2 +-
+ src/crypto/tls/conn_test.go | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 1 deletion(-)
+
+diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
+index 770d456f18..376b2dcd1e 100644
+--- a/src/crypto/tls/conn.go
++++ b/src/crypto/tls/conn.go
+@@ -699,7 +699,7 @@ func (c *Conn) readRecordOrCCS(expectChangeCipherSpec bool) error {
+ 		return c.in.setErrorLocked(c.sendAlert(alertUnexpectedMessage))
+ 	}
+ 
+-	if typ != recordTypeAlert && typ != recordTypeChangeCipherSpec && len(data) > 0 {
++	if (typ == recordTypeApplicationData || (typ == recordTypeHandshake && !handshakeComplete)) && len(data) > 0 {
+ 		// This is a state-advancing message: reset the retry count.
+ 		c.retryCount = 0
+ 	}
+diff --git a/src/crypto/tls/conn_test.go b/src/crypto/tls/conn_test.go
+index 5e090a017d..303012ccc5 100644
+--- a/src/crypto/tls/conn_test.go
++++ b/src/crypto/tls/conn_test.go
+@@ -317,3 +317,37 @@ func TestRecordBadVersionTLS13(t *testing.T) {
+ 		t.Fatalf("unexpected error: got %q, want %q", err, expectedErr)
+ 	}
+ }
++
++// TestKeyUpdateSpamPostHandshakeTLS13 tests that TLS 1.3 KeyUpdate messages do
++// not count as a state-advancing message after a handshake has been completed.
++func TestKeyUpdateSpamPostHandshakeTLS13(t *testing.T) {
++	client, server := localPipe(t)
++	defer server.Close()
++	defer client.Close()
++
++	go func() {
++		c := Client(client, testConfig.Clone())
++		if err := c.Handshake(); err != nil {
++			t.Error(err)
++			return
++		}
++		ku, err := (&keyUpdateMsg{}).marshal()
++		if err != nil {
++			t.Error(err)
++			return
++		}
++		cs := cipherSuiteTLS13ByID(c.cipherSuite)
++		for i := 0; i <= maxUselessRecords; i++ {
++			c.writeRecordLocked(recordTypeHandshake, ku)
++			c.setWriteTrafficSecret(cs, QUICEncryptionLevelInitial, cs.nextTrafficSecret(c.out.trafficSecret))
++		}
++	}()
++	s := Server(server, testConfig.Clone())
++	if err := s.Handshake(); err != nil {
++		t.Fatal(err)
++	}
++	expectedErr := "tls: too many non-advancing records"
++	if _, err := s.Read(make([]byte, 1)); err == nil || err.Error() != expectedErr {
++		t.Fatalf("unexpected error: got %v, want %q", err, expectedErr)
++	}
++}
