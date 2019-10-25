Return-Path: <>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD777FAA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:59:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n7so2259856wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VPBKhjic1WTrSfkCdn0/Jq2Bs4g5oO4i0j/j+O1n8Kc=;
	b=f+PkT9N+mNoTLUiXeUazNIYKZYsFcWq5759Co9y3blqwJ366lRa4EB5p0r/TbvdwiQ
	fP/vdCHFhic8X4ihrOMqxzx6wEF4MgUDhE+tWVzJRSgD3CCEUK9iVp4Sincqgda2cVJq
	kKh8KV1O2ofBAE3rlKAt7B8TAp1+ZBg0ldt9y+m2Hbqde5RULqjC4rpQiR4OmkhyTYAK
	STzm2SoEmxMSCR4ZL7nHGfCKwZhZHE9F4Vj6ikxErIVgP3KFjD5yxJOG9GJg92fRZSKT
	aBsJBqOrMkDZXB0/D9ZqEKURh0nXUusjzANPdHPu7KlboqApVfoozVufpq1hY/TFIB7k
	k31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VPBKhjic1WTrSfkCdn0/Jq2Bs4g5oO4i0j/j+O1n8Kc=;
	b=sfOUSrWB4HFPVMWuvXcWeIkkfNhUFieh3ZFotMSFGjqdpF73f+9Z++SCwJIox4pkC8
	NJx14gIM2IBgKzmZF2wj76aVnWJBMHxIqgfWK6KZUUbexQCKdJDor7wShzpvrgNuDQBY
	2ekEScP4yc8swN2JsssRqndhD0FU+Vx8op1pgT8qFrBH/lsqNclXB1pTNQRV3jmDJNJg
	pzXPASqgIE+7CDlwrnXJYeOMFq43RQGWm1nCceM0yaKzp8XhJu73qNkqFFfFi7NzU/YU
	5OBVKLIMikZlPHPtuddw1jj9x7G9F6mQLOWMBwNrt6Rt6ro3UtcGuTkPeqQ0QE90KUnO
	XC6A==
X-Gm-Message-State: APjAAAXPk+ePmdQEzXY3WPZl6oNRlSd+nFLJ2LdUjhZ2+zkLDHj5/uEv
	zBvoQrVVcoq7Si37ONBTsKueQGUi
X-Google-Smtp-Source: APXvYqzc/UzfzhW28ybph5kUvAaH/s2ogamn8sEPMxPnfVgt3q0GFMH7TTfqeNpGFGLWtykQNxJncQ==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr3904225wma.130.1572011942407;
	Fri, 25 Oct 2019 06:59:02 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	w22sm2380726wmc.16.2019.10.25.06.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 06:59:01 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 18:28:47 +0430
Message-Id: <20191025135847.77492-4-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025135847.77492-1-alexander.j.kube@gmail.com>
References: <20191025135847.77492-1-alexander.j.kube@gmail.com>
Subject: [PATCH v4 4/4] Remove go-1.12
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
X-List-Received-Date: Fri, 25 Oct 2019 13:59:05 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |  24 --
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  31 --
 ...o1.12-security-net-textproto-don-t-n.patch | 163 ----------
 ...ent-based-hash-generation-less-pedan.patch | 218 --------------
 ...-to-be-overridden-in-the-environment.patch |  48 ---
 ...4-ld-add-soname-to-shareable-objects.patch |  45 ---
 ...de-CC-when-building-dist-and-go_boot.patch |  37 ---
 ...dist-separate-host-and-target-builds.patch | 282 ------------------
 ...d-go-make-GOROOT-precious-by-default.patch | 106 -------
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  37 ---
 ...place-glibc-dynamic-linker-with-musl.patch | 112 -------
 .../go/go-cross-canadian_1.12.bb              |   2 -
 meta/recipes-devtools/go/go-cross_1.12.bb     |   2 -
 meta/recipes-devtools/go/go-crosssdk_1.12.bb  |   2 -
 meta/recipes-devtools/go/go-native_1.12.bb    |   2 -
 meta/recipes-devtools/go/go-runtime_1.12.bb   |   2 -
 meta/recipes-devtools/go/go_1.12.bb           |  14 -
 17 files changed, 1127 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.12.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
 delete mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.12.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.12.bb
 delete mode 100644 meta/recipes-devtools/go/go-crosssdk_1.12.bb
 delete mode 100644 meta/recipes-devtools/go/go-native_1.12.bb
 delete mode 100644 meta/recipes-devtools/go/go-runtime_1.12.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.12.bb

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
deleted file mode 100644
index ed14b175e6..0000000000
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-require go-common.inc
-
-GO_BASEVERSION = "1.12"
-GO_MINOR = ".9"
-PV .= "${GO_MINOR}"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-SRC_URI += "\
-    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
-    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
-    file://0004-ld-add-soname-to-shareable-objects.patch \
-    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0006-cmd-dist-separate-host-and-target-builds.patch \
-    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
-"
-SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-
-SRC_URI[main.md5sum] = "6132109d4050da349eadc9f7b0304ef4"
-SRC_URI[main.sha256sum] = "ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"
diff --git a/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
deleted file mode 100644
index 4442858c83..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Mon, 19 Feb 2018 08:49:33 -0800
-Subject: [PATCH] allow CC and CXX to have multiple words
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/cmd/go/internal/envcmd/env.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index afadbad..cedbfbf 100644
---- a/src/cmd/go/internal/envcmd/env.go
-+++ b/src/cmd/go/internal/envcmd/env.go
-@@ -85,11 +85,11 @@ func MkEnv() []cfg.EnvVar {
- 
- 	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
- 	if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
--		cc = env[0]
-+		cc = strings.Join(env, " ")
- 	}
- 	cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
- 	if env := strings.Fields(os.Getenv("CXX")); len(env) > 0 {
--		cxx = env[0]
-+		cxx = strings.Join(env, " ")
- 	}
- 	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
- 	env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
diff --git a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
deleted file mode 100644
index 7b39dbd734..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001
-From: Filippo Valsorda <filippo@golang.org>
-Date: Thu, 12 Sep 2019 12:37:36 -0400
-Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don't
- normalize headers with spaces before the colon
-
-RFC 7230 is clear about headers with a space before the colon, like
-
-X-Answer : 42
-
-being invalid, but we've been accepting and normalizing them for compatibility
-purposes since CL 5690059 in 2012.
-
-On the client side, this is harmless and indeed most browsers behave the same
-to this day. On the server side, this becomes a security issue when the
-behavior doesn't match that of a reverse proxy sitting in front of the server.
-
-For example, if a WAF accepts them without normalizing them, it might be
-possible to bypass its filters, because the Go server would interpret the
-header differently. Worse, if the reverse proxy coalesces requests onto a
-single HTTP/1.1 connection to a Go server, the understanding of the request
-boundaries can get out of sync between them, allowing an attacker to tack an
-arbitrary method and path onto a request by other clients, including
-authentication headers unknown to the attacker.
-
-This was recently presented at multiple security conferences:
-https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn
-
-net/http servers already reject header keys with invalid characters.
-Simply stop normalizing extra spaces in net/textproto, let it return them
-unchanged like it does for other invalid headers, and let net/http enforce
-RFC 7230, which is HTTP specific. This loses us normalization on the client
-side, but there's no right answer on the client side anyway, and hiding the
-issue sounds worse than letting the application decide.
-
-Fixes CVE-2019-16276
-
-Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
-Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/549719
-Reviewed-by: Brad Fitzpatrick <bradfitz@google.com>
-(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
-Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/558776
-Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
-
-CVE: CVE-2019-16276
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/net/http/serve_test.go       |  4 ++++
- src/net/http/transport_test.go   | 27 +++++++++++++++++++++++++++
- src/net/textproto/reader.go      | 10 ++--------
- src/net/textproto/reader_test.go | 13 ++++++-------
- 4 files changed, 39 insertions(+), 15 deletions(-)
-
-diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
-index 6eb0088a96..89bfdfbb82 100644
---- a/src/net/http/serve_test.go
-+++ b/src/net/http/serve_test.go
-@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {
- 		{"foo\xffbar: foo\r\n", 400},                         // binary in header
- 		{"foo\x00bar: foo\r\n", 400},                         // binary in header
- 		{"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, // header too large
-+		// Spaces between the header key and colon are not allowed.
-+		// See RFC 7230, Section 3.2.4.
-+		{"Foo : bar\r\n", 400},
-+		{"Foo\t: bar\r\n", 400},
- 
- 		{"foo: foo foo\r\n", 200},    // LWS space is okay
- 		{"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
-diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.go
-index 5c329543e2..5e5438a708 100644
---- a/src/net/http/transport_test.go
-+++ b/src/net/http/transport_test.go
-@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
- 	}
- 	t.Fatalf("timeout after %v waiting for Transport connections to die off", time.Since(t0))
- }
-+
-+func TestInvalidHeaderResponse(t *testing.T) {
-+	setParallel(t)
-+	defer afterTest(t)
-+	cst := newClientServerTest(t, h1Mode, HandlerFunc(func(w ResponseWriter, r *Request) {
-+		conn, buf, _ := w.(Hijacker).Hijack()
-+		buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
-+			"Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
-+			"Content-Type: text/html; charset=utf-8\r\n" +
-+			"Content-Length: 0\r\n" +
-+			"Foo : bar\r\n\r\n"))
-+		buf.Flush()
-+		conn.Close()
-+	}))
-+	defer cst.close()
-+	res, err := cst.c.Get(cst.ts.URL)
-+	if err != nil {
-+		t.Fatal(err)
-+	}
-+	defer res.Body.Close()
-+	if v := res.Header.Get("Foo"); v != "" {
-+		t.Errorf(`unexpected "Foo" header: %q`, v)
-+	}
-+	if v := res.Header.Get("Foo "); v != "bar" {
-+		t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")
-+	}
-+}
-diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
-index 2c4f25d5ae..1a5e364cf7 100644
---- a/src/net/textproto/reader.go
-+++ b/src/net/textproto/reader.go
-@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
- 			return m, err
- 		}
- 
--		// Key ends at first colon; should not have trailing spaces
--		// but they appear in the wild, violating specs, so we remove
--		// them if present.
-+		// Key ends at first colon.
- 		i := bytes.IndexByte(kv, ':')
- 		if i < 0 {
- 			return m, ProtocolError("malformed MIME header line: " + string(kv))
- 		}
--		endKey := i
--		for endKey > 0 && kv[endKey-1] == ' ' {
--			endKey--
--		}
--		key := canonicalMIMEHeaderKey(kv[:endKey])
-+		key := canonicalMIMEHeaderKey(kv[:i])
- 
- 		// As per RFC 7230 field-name is a token, tokens consist of one or more chars.
- 		// We could return a ProtocolError here, but better to be liberal in what we
-diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
-index f85fbdc36d..b92fdcd3c7 100644
---- a/src/net/textproto/reader_test.go
-+++ b/src/net/textproto/reader_test.go
-@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
- 	}
- }
- 
--// Test that we read slightly-bogus MIME headers seen in the wild,
--// with spaces before colons, and spaces in keys.
-+// TestReadMIMEHeaderNonCompliant checks that we don't normalize headers
-+// with spaces before colons, and accept spaces in keys.
- func TestReadMIMEHeaderNonCompliant(t *testing.T) {
--	// Invalid HTTP response header as sent by an Axis security
--	// camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
-+	// These invalid headers will be rejected by net/http according to RFC 7230.
- 	r := reader("Foo: bar\r\n" +
- 		"Content-Language: en\r\n" +
- 		"SID : 0\r\n" +
-@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
- 	want := MIMEHeader{
- 		"Foo":              {"bar"},
- 		"Content-Language": {"en"},
--		"Sid":              {"0"},
--		"Audio Mode":       {"None"},
--		"Privilege":        {"127"},
-+		"SID ":             {"0"},
-+		"Audio Mode ":      {"None"},
-+		"Privilege ":       {"127"},
- 	}
- 	if !reflect.DeepEqual(m, want) || err != nil {
- 		t.Fatalf("ReadMIMEHeader =\n%v, %v; want:\n%v", m, err, want)
diff --git a/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
deleted file mode 100644
index 66b8561874..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Mon, 19 Feb 2018 08:50:59 -0800
-Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
-
-Go 1.10's build tool now uses content-based hashes to
-determine when something should be built or re-built.
-This same mechanism is used to maintain a built-artifact
-cache for speeding up builds.
-
-However, the hashes it generates include information that
-doesn't work well with OE, nor with using a shared runtime
-library.
-
-First, it embeds path names to source files, unless
-building within GOROOT.  This prevents the building
-of a package in GOPATH for later staging into GOROOT.
-
-This patch adds support for the environment variable
-GOPATH_OMIT_IN_ACTIONID.  If present, path name
-embedding is disabled.
-
-Second, if cgo is enabled, the build ID for cgo-related
-packages will include the current value of the environment
-variables for invoking the compiler (CC, CXX, FC) and
-any CGO_xxFLAGS variables.  Only if the settings used
-during a compilation exactly match, character for character,
-the values used for compiling runtime/cgo or any other
-cgo-enabled package being imported, will the tool
-decide that the imported package is up-to-date.
-
-This is done to help ensure correctness, but is overly
-simplistic and effectively prevents the reuse of built
-artifacts that use cgo (or shared runtime, which includes
-runtime/cgo).
-
-This patch filters out all compiler flags except those
-beginning with '-m'.  The default behavior can be restored
-by setting the CGO_PEDANTIC environment variable.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/cmd/go/internal/envcmd/env.go |  2 +-
- src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++---------
- 2 files changed, 46 insertions(+), 19 deletions(-)
-
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index cedbfbf..5763a0d 100644
---- a/src/cmd/go/internal/envcmd/env.go
-+++ b/src/cmd/go/internal/envcmd/env.go
-@@ -128,7 +128,7 @@ func ExtraEnvVars() []cfg.EnvVar {
- func ExtraEnvVarsCostly() []cfg.EnvVar {
- 	var b work.Builder
- 	b.Init()
--	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
-+	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
- 	if err != nil {
- 		// Should not happen - b.CFlags was given an empty package.
- 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 12e1527..e41bfac 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -174,6 +174,8 @@ func (b *Builder) Do(root *Action) {
- 	wg.Wait()
- }
- 
-+var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
-+
- // buildActionID computes the action ID for a build action.
- func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	p := a.Package
-@@ -190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	// but it does not hide the exact value of $GOPATH.
- 	// Include the full dir in that case.
- 	// Assume b.WorkDir is being trimmed properly.
--	if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
-+	if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir, b.WorkDir) {
- 		fmt.Fprintf(h, "dir %s\n", p.Dir)
- 	}
- 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
-@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	}
- 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
- 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
--		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
--		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
-+		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
-+		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
- 		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
--			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
-+			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
- 		}
- 		if len(p.FFiles) > 0 {
--			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
-+			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
- 		}
- 		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
- 	}
-@@ -2096,33 +2098,33 @@ var (
- // gccCmd returns a gcc command line prefix
- // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
- func (b *Builder) GccCmd(incdir, workdir string) []string {
--	return b.compilerCmd(b.ccExe(), incdir, workdir)
-+	return b.compilerCmd(b.ccExe(false), incdir, workdir)
- }
- 
- // gxxCmd returns a g++ command line prefix
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
- func (b *Builder) GxxCmd(incdir, workdir string) []string {
--	return b.compilerCmd(b.cxxExe(), incdir, workdir)
-+	return b.compilerCmd(b.cxxExe(false), incdir, workdir)
- }
- 
- // gfortranCmd returns a gfortran command line prefix.
- func (b *Builder) gfortranCmd(incdir, workdir string) []string {
--	return b.compilerCmd(b.fcExe(), incdir, workdir)
-+	return b.compilerCmd(b.fcExe(false), incdir, workdir)
- }
- 
- // ccExe returns the CC compiler setting without all the extra flags we add implicitly.
--func (b *Builder) ccExe() []string {
--	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
-+func (b *Builder) ccExe(filtered bool) []string {
-+	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch), filtered)
- }
- 
- // cxxExe returns the CXX compiler setting without all the extra flags we add implicitly.
--func (b *Builder) cxxExe() []string {
--	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
-+func (b *Builder) cxxExe(filtered bool) []string {
-+	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch), filtered)
- }
- 
- // fcExe returns the FC compiler setting without all the extra flags we add implicitly.
--func (b *Builder) fcExe() []string {
--	return b.compilerExe(os.Getenv("FC"), "gfortran")
-+func (b *Builder) fcExe(filtered bool) []string {
-+	return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
- }
- 
- // compilerExe returns the compiler to use given an
-@@ -2131,11 +2133,14 @@ func (b *Builder) fcExe() []string {
- // of the compiler but can have additional arguments if they
- // were present in the environment value.
- // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
--func (b *Builder) compilerExe(envValue string, def string) []string {
-+func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
- 	compiler := strings.Fields(envValue)
- 	if len(compiler) == 0 {
- 		compiler = []string{def}
- 	}
-+	if filtered {
-+		return append(compiler[0:1], filterCompilerFlags(compiler[1:])...)
-+	}
- 	return compiler
- }
- 
-@@ -2285,8 +2290,23 @@ func envList(key, def string) []string {
- 	return strings.Fields(v)
- }
- 
-+var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
-+
-+func filterCompilerFlags(flags []string) []string {
-+	var newflags []string
-+	if !filterFlags {
-+		return flags
-+	}
-+	for _, flag := range flags {
-+		if strings.HasPrefix(flag, "-m") {
-+			newflags = append(newflags, flag)
-+		}
-+	}
-+	return newflags
-+}
-+
- // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
--func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
-+func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
- 	defaults := "-g -O2"
- 
- 	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
- 	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
- 		return
- 	}
-+	if filtered {
-+		cppflags = filterCompilerFlags(cppflags)
-+		cflags = filterCompilerFlags(cflags)
-+		cxxflags = filterCompilerFlags(cxxflags)
-+		fflags = filterCompilerFlags(fflags)
-+		ldflags = filterCompilerFlags(ldflags)
-+	}
- 
- 	return
- }
-@@ -2319,7 +2346,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
- 
- func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
- 	p := a.Package
--	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
-+	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
- 	if err != nil {
- 		return nil, nil, err
- 	}
-@@ -2679,7 +2706,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
- 
- // Run SWIG on one SWIG input file.
- func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
--	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
-+	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
- 	if err != nil {
- 		return "", "", err
- 	}
diff --git a/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
deleted file mode 100644
index b6ca40edee..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Sat, 17 Feb 2018 05:24:20 -0800
-Subject: [PATCH] allow GOTOOLDIR to be overridden in the environment
-
-to allow for split host/target build roots
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/cmd/dist/build.go          | 4 +++-
- src/cmd/go/internal/cfg/cfg.go | 7 +++++--
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: go/src/cmd/dist/build.go
-===================================================================
---- go.orig/src/cmd/dist/build.go
-+++ go/src/cmd/dist/build.go
-@@ -228,7 +228,9 @@ func xinit() {
- 	workdir = xworkdir()
- 	xatexit(rmworkdir)
- 
--	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
-+	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
-+		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
-+	}
- }
- 
- // compilerEnv returns a map from "goos/goarch" to the
-Index: go/src/cmd/go/internal/cfg/cfg.go
-===================================================================
---- go.orig/src/cmd/go/internal/cfg/cfg.go
-+++ go/src/cmd/go/internal/cfg/cfg.go
-@@ -116,7 +116,11 @@ func init() {
- 		// variables. This matches the initialization of ToolDir in
- 		// go/build, except for using GOROOT rather than
- 		// runtime.GOROOT.
--		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+		if s := os.Getenv("GOTOOLDIR"); s != "" {
-+			build.ToolDir = filepath.Clean(s)
-+		} else {
-+			build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+		}
- 	}
- }
- 
diff --git a/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
deleted file mode 100644
index 004a33a023..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Sat, 17 Feb 2018 06:26:10 -0800
-Subject: [PATCH] ld: add soname to shareable objects
-
-so that OE's shared library dependency handling
-can find them.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/cmd/link/internal/ld/lib.go | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 220aab3..703925f 100644
---- a/src/cmd/link/internal/ld/lib.go
-+++ b/src/cmd/link/internal/ld/lib.go
-@@ -1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {
- 				argv = append(argv, "-Wl,-z,relro")
- 			}
- 			argv = append(argv, "-shared")
-+			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
- 			if ctxt.HeadType != objabi.Hwindows {
- 				// Pass -z nodelete to mark the shared library as
- 				// non-closeable: a dlclose will do nothing.
-@@ -1146,6 +1147,8 @@ func (ctxt *Link) hostlink() {
- 			argv = append(argv, "-Wl,-z,relro")
- 		}
- 		argv = append(argv, "-shared")
-+		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
-+
- 	case BuildModePlugin:
- 		if ctxt.HeadType == objabi.Hdarwin {
- 			argv = append(argv, "-dynamiclib")
-@@ -1154,6 +1157,7 @@ func (ctxt *Link) hostlink() {
- 				argv = append(argv, "-Wl,-z,relro")
- 			}
- 			argv = append(argv, "-shared")
-+			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
- 		}
- 	}
- 
diff --git a/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
deleted file mode 100644
index ace8de9eae..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Sat, 17 Feb 2018 06:32:45 -0800
-Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
-
-for handling OE cross-canadian builds.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/make.bash | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/make.bash b/src/make.bash
-index 78882d9..25943d0 100755
---- a/src/make.bash
-+++ b/src/make.bash
-@@ -163,7 +163,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
- 	exit 1
- fi
- rm -f cmd/dist/dist
--GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
-+CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
- 
- # -e doesn't propagate out of eval, so check success by hand.
- eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -194,7 +194,7 @@ fi
- # Run dist bootstrap to complete make.bash.
- # Bootstrap installs a proper cmd/dist, built with the new toolchain.
- # Throw ours, built with Go 1.4, away after bootstrap.
--./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
-+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
- rm -f ./cmd/dist/dist
- 
- # DO NOT ADD ANY NEW CODE HERE.
diff --git a/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
deleted file mode 100644
index 0c0d5da80a..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
+++ /dev/null
@@ -1,282 +0,0 @@
-From fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Sat, 17 Feb 2018 10:03:48 -0800
-Subject: [PATCH] cmd/dist: separate host and target builds
-
-Change the dist tool to allow for OE-style cross-
-and cross-canadian builds:
-
- - command flags --host-only and --target only are added;
-   if one is present, the other changes mentioned below
-   take effect, and arguments may also be specified on
-   the command line to enumerate the package(s) to be
-   built.
-
- - for OE cross builds, go_bootstrap is always built for
-   the current build host, and is moved, along with the supporting
-   toolchain (asm, compile, etc.) to a separate 'native_native'
-   directory under GOROOT/pkg/tool.
-
- - go_bootstrap is not automatically removed after the build,
-   so it can be reused later (e.g., building both static and
-   shared runtime).
-
-Note that for --host-only builds, it would be nice to specify
-just the "cmd" package to build only the go commands/tools,
-the staleness checks in the dist tool will fail if the "std"
-library has not also been built.  So host-only builds have to
-build everything anyway.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
-more dist cleanup
-
----
- src/cmd/dist/build.go | 153 ++++++++++++++++++++++++++++++------------
- 1 file changed, 111 insertions(+), 42 deletions(-)
-
-Index: go/src/cmd/dist/build.go
-===================================================================
---- go.orig/src/cmd/dist/build.go
-+++ go/src/cmd/dist/build.go
-@@ -39,6 +39,7 @@ var (
- 	goldflags        string
- 	workdir          string
- 	tooldir          string
-+	build_tooldir	 string
- 	oldgoos          string
- 	oldgoarch        string
- 	exe              string
-@@ -50,6 +51,7 @@ var (
- 
- 	rebuildall   bool
- 	defaultclang bool
-+	crossBuild   bool
- 
- 	vflag int // verbosity
- )
-@@ -231,6 +233,8 @@ func xinit() {
- 	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
- 		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
- 	}
-+	build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
-+
- }
- 
- // compilerEnv returns a map from "goos/goarch" to the
-@@ -260,7 +264,6 @@ func compilerEnv(envName, def string) ma
- 		if gohostos != goos || gohostarch != goarch {
- 			m[gohostos+"/"+gohostarch] = m[""]
- 		}
--		m[""] = env
- 	}
- 
- 	for _, goos := range okgoos {
-@@ -487,8 +490,10 @@ func setup() {
- 	// We keep it in pkg/, just like the object directory above.
- 	if rebuildall {
- 		xremoveall(tooldir)
-+		xremoveall(build_tooldir)
- 	}
- 	xmkdirall(tooldir)
-+	xmkdirall(build_tooldir)
- 
- 	// Remove tool binaries from before the tool/gohostos_gohostarch
- 	xremoveall(pathf("%s/bin/tool", goroot))
-@@ -1155,11 +1160,29 @@ func cmdbootstrap() {
- 
- 	var noBanner bool
- 	var debug bool
-+	var hostOnly bool
-+	var targetOnly bool
-+	var toBuild = []string { "std", "cmd" }
-+
- 	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
- 	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
- 	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
-+	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
-+	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
- 
--	xflagparse(0)
-+	xflagparse(-1)
-+
-+	if (hostOnly && targetOnly) {
-+		fatalf("specify only one of --host-only or --target-only\n")
-+	}
-+	crossBuild = hostOnly || targetOnly
-+	if flag.NArg() > 0 {
-+		if crossBuild {
-+			toBuild = flag.Args()
-+		} else {
-+			fatalf("package names not permitted without --host-only or --target-only\n")
-+		}
-+	}
- 
- 	if debug {
- 		// cmd/buildid is used in debug mode.
-@@ -1207,8 +1230,13 @@ func cmdbootstrap() {
- 		xprintf("\n")
- 	}
- 
--	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
--	goldflags = os.Getenv("GO_LDFLAGS")
-+	// For split host/target cross/cross-canadian builds, we don't
-+	// want to be setting these flags until after we have compiled
-+	// the toolchain that runs on the build host.
-+	if ! crossBuild {
-+		gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
-+		goldflags = os.Getenv("GO_LDFLAGS")
-+	}
- 	goBootstrap := pathf("%s/go_bootstrap", tooldir)
- 	cmdGo := pathf("%s/go", gobin)
- 	if debug {
-@@ -1237,7 +1265,11 @@ func cmdbootstrap() {
- 		xprintf("\n")
- 	}
- 	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
--	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
-+	if crossBuild {
-+		os.Setenv("CC", defaultcc[""])
-+	} else {
-+		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
-+	}
- 	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
- 	if debug {
- 		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1274,50 +1306,84 @@ func cmdbootstrap() {
- 	}
- 	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
- 
--	if goos == oldgoos && goarch == oldgoarch {
--		// Common case - not setting up for cross-compilation.
--		timelog("build", "toolchain")
--		if vflag > 0 {
--			xprintf("\n")
-+	if crossBuild {
-+		gogcflags = os.Getenv("GO_GCFLAGS")
-+		goldflags = os.Getenv("GO_LDFLAGS")
-+		tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
-+		for _, f := range tool_files {
-+			copyfile(pathf("%s/%s", build_tooldir, filepath.Base(f)), f, writeExec)
-+			xremove(f)
-+		}
-+		os.Setenv("GOTOOLDIR", build_tooldir)
-+		goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
-+		if hostOnly {
-+			timelog("build", "host toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			xprintf("Building %s for host, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
-+			goInstall(goBootstrap, toBuild...)
-+			checkNotStale(goBootstrap, toBuild...)
-+			// Skip cmdGo staleness checks here, since we can't necessarily run the cmdGo binary
-+
-+			timelog("build", "target toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+		} else if targetOnly {
-+			goos = oldgoos
-+			goarch = oldgoarch
-+			os.Setenv("GOOS", goos)
-+			os.Setenv("GOARCH", goarch)
-+			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
-+			xprintf("Building %s for target, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
-+			goInstall(goBootstrap, toBuild...)
-+			checkNotStale(goBootstrap, toBuild...)
-+			// Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
- 		}
--		xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
- 	} else {
--		// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
--		// Finish GOHOSTOS/GOHOSTARCH installation and then
--		// run GOOS/GOARCH installation.
--		timelog("build", "host toolchain")
--		if vflag > 0 {
--			xprintf("\n")
-+
-+		if goos == oldgoos && goarch == oldgoarch {
-+			// Common case - not setting up for cross-compilation.
-+			timelog("build", "toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
-+		} else {
-+			// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
-+			// Finish GOHOSTOS/GOHOSTARCH installation and then
-+			// run GOOS/GOARCH installation.
-+			timelog("build", "host toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
-+			goInstall(goBootstrap, "std", "cmd")
-+			checkNotStale(goBootstrap, "std", "cmd")
-+			checkNotStale(cmdGo, "std", "cmd")
-+
-+			timelog("build", "target toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			goos = oldgoos
-+			goarch = oldgoarch
-+			os.Setenv("GOOS", goos)
-+			os.Setenv("GOARCH", goarch)
-+			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
-+			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
- 		}
--		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
- 		goInstall(goBootstrap, "std", "cmd")
- 		checkNotStale(goBootstrap, "std", "cmd")
- 		checkNotStale(cmdGo, "std", "cmd")
- 
--		timelog("build", "target toolchain")
--		if vflag > 0 {
--			xprintf("\n")
--		}
--		goos = oldgoos
--		goarch = oldgoarch
--		os.Setenv("GOOS", goos)
--		os.Setenv("GOARCH", goarch)
--		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
--		xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
--	}
--	targets := []string{"std", "cmd"}
--	if goos == "js" && goarch == "wasm" {
--		// Skip the cmd tools for js/wasm. They're not usable.
--		targets = targets[:1]
--	}
--	goInstall(goBootstrap, targets...)
--	checkNotStale(goBootstrap, targets...)
--	checkNotStale(cmdGo, targets...)
--	if debug {
--		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
--		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
--		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
--		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
-+		if debug {
-+			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-+			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
-+			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
-+			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
-+		}
- 	}
- 
- 	// Check that there are no new files in $GOROOT/bin other than
-@@ -1335,7 +1401,11 @@ func cmdbootstrap() {
- 	}
- 
- 	// Remove go_bootstrap now that we're done.
--	xremove(pathf("%s/go_bootstrap", tooldir))
-+	// Except that for split host/target cross-builds, we need to
-+	// keep it.
-+	if ! crossBuild {
-+		xremove(pathf("%s/go_bootstrap", tooldir))
-+	}
- 
- 	// Print trailing banner unless instructed otherwise.
- 	if !noBanner {
diff --git a/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
deleted file mode 100644
index 29ef947abd..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Fri, 2 Mar 2018 06:00:20 -0800
-Subject: [PATCH] cmd/go: make GOROOT precious by default
-
-The go build tool normally rebuilds whatever it detects is
-stale.  This can be a problem when GOROOT is intended to
-be read-only and the go runtime has been built as a shared
-library, since we don't want every application to be rebuilding
-the shared runtime - particularly in cross-build/packaging
-setups, since that would lead to 'abi mismatch' runtime errors.
-
-This patch prevents the install and linkshared actions from
-installing to GOROOT unless overridden with the GOROOT_OVERRIDE
-environment variable.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/cmd/go/internal/work/action.go |  3 +++
- src/cmd/go/internal/work/build.go  |  5 +++++
- src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
- 3 files changed, 33 insertions(+)
-
-Index: go/src/cmd/go/internal/work/action.go
-===================================================================
---- go.orig/src/cmd/go/internal/work/action.go
-+++ go/src/cmd/go/internal/work/action.go
-@@ -600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(
- 			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
- 				continue
- 			}
-+			if goRootPrecious && (p1.Standard || p1.Goroot) {
-+				continue
-+			}
- 			haveShlib[filepath.Base(p1.Shlib)] = true
- 			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
- 			// we'll end up building an overall library or executable that depends at runtime
-Index: go/src/cmd/go/internal/work/build.go
-===================================================================
---- go.orig/src/cmd/go/internal/work/build.go
-+++ go/src/cmd/go/internal/work/build.go
-@@ -147,6 +147,7 @@ See also: go install, go get, go clean.
- }
- 
- const concurrentGCBackendCompilationEnabledByDefault = true
-+var goRootPrecious bool = true
- 
- func init() {
- 	// break init cycle
-@@ -160,6 +161,10 @@ func init() {
- 
- 	AddBuildFlags(CmdBuild)
- 	AddBuildFlags(CmdInstall)
-+
-+	if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
-+		goRootPrecious = false
-+	}
- }
- 
- // Note that flags consulted by other parts of the code
-Index: go/src/cmd/go/internal/work/exec.go
-===================================================================
---- go.orig/src/cmd/go/internal/work/exec.go
-+++ go/src/cmd/go/internal/work/exec.go
-@@ -436,6 +436,23 @@ func (b *Builder) build(a *Action) (err
- 		return fmt.Errorf("missing or invalid binary-only package; expected file %q", a.Package.Target)
- 	}
- 
-+	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
-+		_, err := os.Stat(a.Package.Target)
-+		if err == nil {
-+			a.built = a.Package.Target
-+			a.Target = a.Package.Target
-+			a.buildID = b.fileHash(a.Package.Target)
-+			a.Package.Stale = false
-+			a.Package.StaleReason = "GOROOT-resident package"
-+			return nil
-+		}
-+		a.Package.Stale = true
-+		a.Package.StaleReason = "missing or invalid GOROOT-resident package"
-+		if b.IsCmdList {
-+			return nil
-+		}
-+	}
-+
- 	if err := b.Mkdir(a.Objdir); err != nil {
- 		return err
- 	}
-@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a *Act
- 		return nil
- 	}
- 
-+	if goRootPrecious && a.Package != nil {
-+		p := a.Package
-+		if p.Standard || p.Goroot {
-+			err := fmt.Errorf("attempting to install package %s into read-only GOROOT", p.ImportPath)
-+			return err
-+		}
-+	}
-+
- 	if err := b.Mkdir(a.Objdir); err != nil {
- 		return err
- 	}
diff --git a/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
deleted file mode 100644
index 225cf439c5..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 26 Oct 2018 15:02:32 +0800
-Subject: [PATCH] use GOBUILDMODE to set buildmode
-
-While building go itself, the go build system does not support
-to set `-buildmode=pie' from environment.
-
-Add GOBUILDMODE to support it which make PIE executables the default
-build mode, as PIE executables are required as of Yocto
-
-Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
-Upstream-Status: Denied [upstream choose antoher solution: `17a256b
-cmd/go: -buildmode=pie for android/arm']
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/cmd/go/internal/work/build.go | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-Index: go/src/cmd/go/internal/work/build.go
-===================================================================
---- go.orig/src/cmd/go/internal/work/build.go
-+++ go/src/cmd/go/internal/work/build.go
-@@ -223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {
- 
- 	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
- 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
--	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
-+	if bm := os.Getenv("GOBUILDMODE"); bm != "" {
-+		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
-+	} else {
-+		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
-+	}
- 	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
- 	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
- 	cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
diff --git a/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
deleted file mode 100644
index 840cf4bbd7..0000000000
--- a/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Sun, 18 Feb 2018 08:24:05 -0800
-Subject: [PATCH] ld: replace glibc dynamic linker with musl
-
-Rework of patch by Khem Raj <raj.khem@gmail.com>
-for go 1.10.  Should be applied conditionally on
-musl being the system C library.
-
-Upstream-Status: Inappropriate [Real fix should be portable across libcs]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-
----
- src/cmd/link/internal/amd64/obj.go  | 2 +-
- src/cmd/link/internal/arm/obj.go    | 2 +-
- src/cmd/link/internal/arm64/obj.go  | 2 +-
- src/cmd/link/internal/mips/obj.go   | 2 +-
- src/cmd/link/internal/mips64/obj.go | 2 +-
- src/cmd/link/internal/ppc64/obj.go  | 2 +-
- src/cmd/link/internal/s390x/obj.go  | 2 +-
- src/cmd/link/internal/x86/obj.go    | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
-
---- a/src/cmd/link/internal/amd64/obj.go
-+++ b/src/cmd/link/internal/amd64/obj.go
-@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		PEreloc1:         pereloc1,
- 		TLSIEtoLE:        tlsIEtoLE,
- 
--		Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
-+		Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
- 		Freebsddynld:   "/libexec/ld-elf.so.1",
- 		Openbsddynld:   "/usr/libexec/ld.so",
- 		Netbsddynld:    "/libexec/ld.elf_so",
---- a/src/cmd/link/internal/arm/obj.go
-+++ b/src/cmd/link/internal/arm/obj.go
-@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Machoreloc1:      machoreloc1,
- 		PEreloc1:         pereloc1,
- 
--		Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for EABI
-+		Linuxdynld:     "/lib/ld-musl-armhf.so.1",
- 		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
- 		Openbsddynld:   "/usr/libexec/ld.so",
- 		Netbsddynld:    "/libexec/ld.elf_so",
---- a/src/cmd/link/internal/arm64/obj.go
-+++ b/src/cmd/link/internal/arm64/obj.go
-@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
- 		Machoreloc1:      machoreloc1,
- 
--		Linuxdynld: "/lib/ld-linux-aarch64.so.1",
-+		Linuxdynld: "/lib/ld-musl-aarch64.so.1",
- 
- 		Freebsddynld:   "XXX",
- 		Openbsddynld:   "XXX",
---- a/src/cmd/link/internal/mips/obj.go
-+++ b/src/cmd/link/internal/mips/obj.go
-@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
- 		Machoreloc1:      machoreloc1,
- 
--		Linuxdynld: "/lib/ld.so.1",
-+		Linuxdynld: "/lib/ld-musl-mipsle.so.1",
- 
- 		Freebsddynld:   "XXX",
- 		Openbsddynld:   "XXX",
---- a/src/cmd/link/internal/mips64/obj.go
-+++ b/src/cmd/link/internal/mips64/obj.go
-@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
- 		Machoreloc1:      machoreloc1,
- 
--		Linuxdynld:     "/lib64/ld64.so.1",
-+		Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
- 		Freebsddynld:   "XXX",
- 		Openbsddynld:   "XXX",
- 		Netbsddynld:    "XXX",
---- a/src/cmd/link/internal/ppc64/obj.go
-+++ b/src/cmd/link/internal/ppc64/obj.go
-@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Machoreloc1:      machoreloc1,
- 
- 		// TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
--		Linuxdynld: "/lib64/ld64.so.1",
-+		Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
- 
- 		Freebsddynld:   "XXX",
- 		Openbsddynld:   "XXX",
---- a/src/cmd/link/internal/s390x/obj.go
-+++ b/src/cmd/link/internal/s390x/obj.go
-@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
- 		Machoreloc1:      machoreloc1,
- 
--		Linuxdynld: "/lib64/ld64.so.1",
-+		Linuxdynld: "/lib64/ld-musl-s390x.so.1",
- 
- 		// not relevant for s390x
- 		Freebsddynld:   "XXX",
---- a/src/cmd/link/internal/x86/obj.go
-+++ b/src/cmd/link/internal/x86/obj.go
-@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Machoreloc1:      machoreloc1,
- 		PEreloc1:         pereloc1,
- 
--		Linuxdynld:   "/lib/ld-linux.so.2",
-+		Linuxdynld:   "/lib/ld-musl-i386.so.1",
- 		Freebsddynld: "/usr/libexec/ld-elf.so.1",
- 		Openbsddynld: "/usr/libexec/ld.so",
- 		Netbsddynld:  "/usr/libexec/ld.elf_so",
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.12.bb b/meta/recipes-devtools/go/go-cross-canadian_1.12.bb
deleted file mode 100644
index 7ac9449e47..0000000000
--- a/meta/recipes-devtools/go/go-cross-canadian_1.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-cross-canadian.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-cross_1.12.bb b/meta/recipes-devtools/go/go-cross_1.12.bb
deleted file mode 100644
index 80b5a03f6c..0000000000
--- a/meta/recipes-devtools/go/go-cross_1.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-cross.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.12.bb b/meta/recipes-devtools/go/go-crosssdk_1.12.bb
deleted file mode 100644
index 1857c8a577..0000000000
--- a/meta/recipes-devtools/go/go-crosssdk_1.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-crosssdk.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-native_1.12.bb b/meta/recipes-devtools/go/go-native_1.12.bb
deleted file mode 100644
index bbf3c0dd73..0000000000
--- a/meta/recipes-devtools/go/go-native_1.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require ${PN}.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-runtime_1.12.bb b/meta/recipes-devtools/go/go-runtime_1.12.bb
deleted file mode 100644
index 43b68b4e46..0000000000
--- a/meta/recipes-devtools/go/go-runtime_1.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-${PV}.inc
-require go-runtime.inc
diff --git a/meta/recipes-devtools/go/go_1.12.bb b/meta/recipes-devtools/go/go_1.12.bb
deleted file mode 100644
index 42cdb0430a..0000000000
--- a/meta/recipes-devtools/go/go_1.12.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require go-${PV}.inc
-require go-target.inc
-
-export GOBUILDMODE=""
-
-# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
-# variants.
-python() {
-    if 'mips' in d.getVar('TARGET_ARCH'):
-        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
-    else:
-        d.setVar('GOBUILDMODE', 'pie')
-}
-- 
2.17.1 (Apple Git-112)


