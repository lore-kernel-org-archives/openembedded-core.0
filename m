Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 11C2C7FC06
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v3so5716795wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Iu8vXSM1eEN6iOlLVvYQxHxHxkuAL0m51LOoJl/6yoM=;
	b=tKCclN65RN9ycnZjK4w3oE1x+XWuja/zkv6Nyx78CecFwEWWWzRPZmzCBDFLgmd3wv
	0zerNun7b3PFhiRVb70ucb5KLwyf9Pt9XNJeLjqiA+Bw65BCPGPO3ZEBVIvtJAuMXctD
	nDEZA5fFPmqt2Haq2YZcZ2P0dYZtNzwkMKBMRQK1+QE7FMUe1NTec5no501cIexgm9go
	HHuAF09os7afAi5KrTIi835QqK4RwQlZLkMMWa7Uz0a8CBluIX1wadcCOZ3MqT1TY3UZ
	7GjZc+UU0h/PaeDzU17NPmyPTX3tR3UBJisBee6D5WDAU9skAptoQ4uO4OiA8LILKqB0
	eodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Iu8vXSM1eEN6iOlLVvYQxHxHxkuAL0m51LOoJl/6yoM=;
	b=kb9iZEGaFRgXSIK05bN6y9YpNzqtYhrbxkpgIaDPEwd5MPMSYWAiPa5UPfEjHkd/ua
	RzKfXB9HsP6nZS9F4MTmNJ16LoDTmKjD4D1Z8NWpN/cCPBaQnbsCvA7vhLQmfQHXz7Yb
	XjHfgDhabW3dC1y101m7yGtCVZJoOWONhOEbT6mn0QvhaMSaYU7rjTDkBDvZqVKiH5mY
	7M6pQXK9YgN1GMS5RXlXK8ItTc9rJ9lKc8ZlEFDvjU9A9+22Z8xh9ISFzWyVAmE5+tGJ
	0daSTbQaU948fabfN8a2MQBd2iSe9UDrH2L3yJvDuQK5YN5eNJGBUu9L1JbHKNFNkGu2
	o1Nw==
X-Gm-Message-State: APjAAAV4nyOUSg6MHWZR52UQt4Jxdz+BYM0R48qwNfeOXrgeIqHDF4Mg
	tlvrYLI7zzPdAXXUwMmDlXuoQdnnxVE=
X-Google-Smtp-Source: APXvYqyVKu++Mp7CxFJ0QLBqmQLbBFZf9JQjyfPUEGgbYw07cTYgsECtu3PyS9Gffqm8sSiJhw/N5A==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr6451684wmc.68.1572072625134; 
	Fri, 25 Oct 2019 23:50:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:57 -0700
Message-Id: <e02e8fa2e82cceaaa6a433466f52f97b0984762a.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 25/28] go: fix CVE-2019-16276
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Oct 2019 06:50:25 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/go/go-1.12.inc               |   1 +
 ...nch.go1.12-security-net-textproto-don-t-n.patch | 163 +++++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 39157ff..ed14b17 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
new file mode 100644
index 0000000..7b39dbd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
@@ -0,0 +1,163 @@
+From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Thu, 12 Sep 2019 12:37:36 -0400
+Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don't
+ normalize headers with spaces before the colon
+
+RFC 7230 is clear about headers with a space before the colon, like
+
+X-Answer : 42
+
+being invalid, but we've been accepting and normalizing them for compatibility
+purposes since CL 5690059 in 2012.
+
+On the client side, this is harmless and indeed most browsers behave the same
+to this day. On the server side, this becomes a security issue when the
+behavior doesn't match that of a reverse proxy sitting in front of the server.
+
+For example, if a WAF accepts them without normalizing them, it might be
+possible to bypass its filters, because the Go server would interpret the
+header differently. Worse, if the reverse proxy coalesces requests onto a
+single HTTP/1.1 connection to a Go server, the understanding of the request
+boundaries can get out of sync between them, allowing an attacker to tack an
+arbitrary method and path onto a request by other clients, including
+authentication headers unknown to the attacker.
+
+This was recently presented at multiple security conferences:
+https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn
+
+net/http servers already reject header keys with invalid characters.
+Simply stop normalizing extra spaces in net/textproto, let it return them
+unchanged like it does for other invalid headers, and let net/http enforce
+RFC 7230, which is HTTP specific. This loses us normalization on the client
+side, but there's no right answer on the client side anyway, and hiding the
+issue sounds worse than letting the application decide.
+
+Fixes CVE-2019-16276
+
+Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/549719
+Reviewed-by: Brad Fitzpatrick <bradfitz@google.com>
+(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/558776
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2019-16276
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/net/http/serve_test.go       |  4 ++++
+ src/net/http/transport_test.go   | 27 +++++++++++++++++++++++++++
+ src/net/textproto/reader.go      | 10 ++--------
+ src/net/textproto/reader_test.go | 13 ++++++-------
+ 4 files changed, 39 insertions(+), 15 deletions(-)
+
+diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
+index 6eb0088a96..89bfdfbb82 100644
+--- a/src/net/http/serve_test.go
++++ b/src/net/http/serve_test.go
+@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {
+ 		{"foo\xffbar: foo\r\n", 400},                         // binary in header
+ 		{"foo\x00bar: foo\r\n", 400},                         // binary in header
+ 		{"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, // header too large
++		// Spaces between the header key and colon are not allowed.
++		// See RFC 7230, Section 3.2.4.
++		{"Foo : bar\r\n", 400},
++		{"Foo\t: bar\r\n", 400},
+ 
+ 		{"foo: foo foo\r\n", 200},    // LWS space is okay
+ 		{"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
+diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.go
+index 5c329543e2..5e5438a708 100644
+--- a/src/net/http/transport_test.go
++++ b/src/net/http/transport_test.go
+@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
+ 	}
+ 	t.Fatalf("timeout after %v waiting for Transport connections to die off", time.Since(t0))
+ }
++
++func TestInvalidHeaderResponse(t *testing.T) {
++	setParallel(t)
++	defer afterTest(t)
++	cst := newClientServerTest(t, h1Mode, HandlerFunc(func(w ResponseWriter, r *Request) {
++		conn, buf, _ := w.(Hijacker).Hijack()
++		buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
++			"Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
++			"Content-Type: text/html; charset=utf-8\r\n" +
++			"Content-Length: 0\r\n" +
++			"Foo : bar\r\n\r\n"))
++		buf.Flush()
++		conn.Close()
++	}))
++	defer cst.close()
++	res, err := cst.c.Get(cst.ts.URL)
++	if err != nil {
++		t.Fatal(err)
++	}
++	defer res.Body.Close()
++	if v := res.Header.Get("Foo"); v != "" {
++		t.Errorf(`unexpected "Foo" header: %q`, v)
++	}
++	if v := res.Header.Get("Foo "); v != "bar" {
++		t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")
++	}
++}
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 2c4f25d5ae..1a5e364cf7 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+ 			return m, err
+ 		}
+ 
+-		// Key ends at first colon; should not have trailing spaces
+-		// but they appear in the wild, violating specs, so we remove
+-		// them if present.
++		// Key ends at first colon.
+ 		i := bytes.IndexByte(kv, ':')
+ 		if i < 0 {
+ 			return m, ProtocolError("malformed MIME header line: " + string(kv))
+ 		}
+-		endKey := i
+-		for endKey > 0 && kv[endKey-1] == ' ' {
+-			endKey--
+-		}
+-		key := canonicalMIMEHeaderKey(kv[:endKey])
++		key := canonicalMIMEHeaderKey(kv[:i])
+ 
+ 		// As per RFC 7230 field-name is a token, tokens consist of one or more chars.
+ 		// We could return a ProtocolError here, but better to be liberal in what we
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
+index f85fbdc36d..b92fdcd3c7 100644
+--- a/src/net/textproto/reader_test.go
++++ b/src/net/textproto/reader_test.go
+@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
+ 	}
+ }
+ 
+-// Test that we read slightly-bogus MIME headers seen in the wild,
+-// with spaces before colons, and spaces in keys.
++// TestReadMIMEHeaderNonCompliant checks that we don't normalize headers
++// with spaces before colons, and accept spaces in keys.
+ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
+-	// Invalid HTTP response header as sent by an Axis security
+-	// camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
++	// These invalid headers will be rejected by net/http according to RFC 7230.
+ 	r := reader("Foo: bar\r\n" +
+ 		"Content-Language: en\r\n" +
+ 		"SID : 0\r\n" +
+@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
+ 	want := MIMEHeader{
+ 		"Foo":              {"bar"},
+ 		"Content-Language": {"en"},
+-		"Sid":              {"0"},
+-		"Audio Mode":       {"None"},
+-		"Privilege":        {"127"},
++		"SID ":             {"0"},
++		"Audio Mode ":      {"None"},
++		"Privilege ":       {"127"},
+ 	}
+ 	if !reflect.DeepEqual(m, want) || err != nil {
+ 		t.Fatalf("ReadMIMEHeader =\n%v, %v; want:\n%v", m, err, want)
-- 
2.7.4


