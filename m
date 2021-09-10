Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.9570.1631282915641184588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JUb3Pv0D;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.50, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f50.google.com with SMTP id e206-20020a4a55d7000000b00291379cb2baso630294oob.9
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Yw25sA0kEGignzHUDshaJOAIl/Arq21Kbw32RYKK03E=;
        b=JUb3Pv0DTRuaQsVVfhsYV4Y5Mp05rZ5Sr7yoe0kUxBtwlK26qN2i0SV5ig5FIjuKf7
         I+JUbFmcTp7u3Sj0Zdn/r/VO594zS43GL9okO0tKE79eSCW0skP/sGdRrPJUFyQgoKXY
         Y90lC3BGY5kSzH5WoPyStZz8n9M+3YhJu2K11ohIeDBtjXwDFfJhq9OMkrvox85GEN/7
         9nwpXk10jNTR2noQDjRsS8tHTeM4INri0sDrQUXvTBOwpxk8FrDw4ENfWeMS3zaNhQZY
         izfdbLdZQMH9rGg9L45HGGleqUEjefCNkrfIg/94EHT2fTiSw24u+YwVcKIGbynwXSKc
         4CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw25sA0kEGignzHUDshaJOAIl/Arq21Kbw32RYKK03E=;
        b=Xa7J5rVOB/jruhnGw9oQ1+ee00qw2ZhhRS3j/sY7wl6ybPIsOCwwJyA1oymziF6966
         /AFWYkma7lxSSUKHkP+b/dsc/tXMOTMsKJCdH659XPdivz8x0uAGd18OJn0DWEw4xWH6
         SRmFCI17TONlDsAKg3M7vDC6z6DkbW6oSsiIucXJ1E6EikQ/gfN7fAM593UgBT7U8hXZ
         tYNEMcpKgIzS3ZmCx7LDwMWH15Cmw0DTwPXeVSwHMhZNaoar/yoTs+Qn5dWtZeHjJzvF
         vFkHmHAycJInfIWZ3Ml+J1v7KdLEynP/SM5eAvJsHBnovrP6vdcxEy30T4eOpJYKIpEC
         DVww==
X-Gm-Message-State: AOAM531/1chkZTgTkaGcg7+AM4B0h4WfKFR0TLS7zboLcUtBZyutEABl
	Dy0QaOa6tQ6KuOcINe8W89cPIw05FpHxdkE2
X-Google-Smtp-Source: ABdhPJwOtB5o+i5xdL70V7TzWVYGKNHs3uYygxrfcT1H1dOR3e3dJK7LYl4gs2STMGf9CWuOjXia9w==
X-Received: by 2002:a4a:7648:: with SMTP id w8mr4659118ooe.0.1631282914059;
        Fri, 10 Sep 2021 07:08:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.08.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] go: Several Security fixes
Date: Fri, 10 Sep 2021 04:07:20 -1000
Message-Id: <110586ba45ae8a9a783c344b0a52479cfdcca17f.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: golang.org
MR: 111958, 112390, 112393
Type: Security Fix
Disposition: Backport from https://github.com/golang/go.git
ChangeID: 662d021814f025b3d768a04864498486f94819a7
Description:

Affects < 1.16.5

Fixes:
CVE-2021-33196
CVE-2021-33197
CVE-2021-34558

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   3 +
 .../go/go-1.14/CVE-2021-33196.patch           | 124 ++++++++++++++
 .../go/go-1.14/CVE-2021-33197.patch           | 152 ++++++++++++++++++
 .../go/go-1.14/CVE-2021-34558.patch           |  51 ++++++
 4 files changed, 330 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33196.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33197.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-34558.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 50136ca841..abc6f42184 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -16,6 +16,9 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://CVE-2021-34558.patch \
+    file://CVE-2021-33196.patch \
+    file://CVE-2021-33197.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-33196.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-33196.patch
new file mode 100644
index 0000000000..2e2dc62c49
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-33196.patch
@@ -0,0 +1,124 @@
+From 74242baa4136c7a9132a8ccd9881354442788c8c Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Tue, 11 May 2021 11:31:31 -0700
+Subject: [PATCH] archive/zip: only preallocate File slice if reasonably sized
+
+Since the number of files in the EOCD record isn't validated, it isn't
+safe to preallocate Reader.Files using that field. A malformed archive
+can indicate it contains up to 1 << 128 - 1 files. We can still safely
+preallocate the slice by checking if the specified number of files in
+the archive is reasonable, given the size of the archive.
+
+Thanks to the OSS-Fuzz project for discovering this issue and to
+Emmanuel Odeke for reporting it.
+
+Fixes #46242
+Fixes CVE-2021-33196
+
+Change-Id: I3c76d8eec178468b380d87fdb4a3f2cb06f0ee76
+Reviewed-on: https://go-review.googlesource.com/c/go/+/318909
+Trust: Roland Shoemaker <roland@golang.org>
+Trust: Katie Hockman <katie@golang.org>
+Trust: Joe Tsai <thebrokentoaster@gmail.com>
+Run-TryBot: Roland Shoemaker <roland@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+Reviewed-by: Joe Tsai <thebrokentoaster@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-33196
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/archive/zip/reader.go      | 10 +++++-
+ src/archive/zip/reader_test.go | 59 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+), 1 deletion(-)
+
+Index: go/src/archive/zip/reader.go
+===================================================================
+--- go.orig/src/archive/zip/reader.go
++++ go/src/archive/zip/reader.go
+@@ -84,7 +84,15 @@ func (z *Reader) init(r io.ReaderAt, siz
+ 		return err
+ 	}
+ 	z.r = r
+-	z.File = make([]*File, 0, end.directoryRecords)
++	// Since the number of directory records is not validated, it is not
++	// safe to preallocate z.File without first checking that the specified
++	// number of files is reasonable, since a malformed archive may
++	// indicate it contains up to 1 << 128 - 1 files. Since each file has a
++	// header which will be _at least_ 30 bytes we can safely preallocate
++	// if (data size / 30) >= end.directoryRecords.
++	if (uint64(size)-end.directorySize)/30 >= end.directoryRecords {
++		z.File = make([]*File, 0, end.directoryRecords)
++	}
+ 	z.Comment = end.comment
+ 	rs := io.NewSectionReader(r, 0, size)
+ 	if _, err = rs.Seek(int64(end.directoryOffset), io.SeekStart); err != nil {
+Index: go/src/archive/zip/reader_test.go
+===================================================================
+--- go.orig/src/archive/zip/reader_test.go
++++ go/src/archive/zip/reader_test.go
+@@ -1070,3 +1070,62 @@ func TestIssue12449(t *testing.T) {
+ 		t.Errorf("Error reading the archive: %v", err)
+ 	}
+ }
++
++func TestCVE202133196(t *testing.T) {
++	// Archive that indicates it has 1 << 128 -1 files,
++	// this would previously cause a panic due to attempting
++	// to allocate a slice with 1 << 128 -1 elements.
++	data := []byte{
++		0x50, 0x4b, 0x03, 0x04, 0x14, 0x00, 0x08, 0x08,
++		0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x02,
++		0x03, 0x62, 0x61, 0x65, 0x03, 0x04, 0x00, 0x00,
++		0xff, 0xff, 0x50, 0x4b, 0x07, 0x08, 0xbe, 0x20,
++		0x5c, 0x6c, 0x09, 0x00, 0x00, 0x00, 0x03, 0x00,
++		0x00, 0x00, 0x50, 0x4b, 0x01, 0x02, 0x14, 0x00,
++		0x14, 0x00, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0xbe, 0x20, 0x5c, 0x6c, 0x09, 0x00,
++		0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00,
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++		0x01, 0x02, 0x03, 0x50, 0x4b, 0x06, 0x06, 0x2c,
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2d,
++		0x00, 0x2d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
++		0xff, 0xff, 0xff, 0x31, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0x3a, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0x50, 0x4b, 0x06, 0x07, 0x00,
++		0x00, 0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00,
++		0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x50,
++		0x4b, 0x05, 0x06, 0x00, 0x00, 0x00, 0x00, 0xff,
++		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
++		0xff, 0xff, 0xff, 0x00, 0x00,
++	}
++	_, err := NewReader(bytes.NewReader(data), int64(len(data)))
++	if err != ErrFormat {
++		t.Fatalf("unexpected error, got: %v, want: %v", err, ErrFormat)
++	}
++
++	// Also check that an archive containing a handful of empty
++	// files doesn't cause an issue
++	b := bytes.NewBuffer(nil)
++	w := NewWriter(b)
++	for i := 0; i < 5; i++ {
++		_, err := w.Create("")
++		if err != nil {
++			t.Fatalf("Writer.Create failed: %s", err)
++		}
++	}
++	if err := w.Close(); err != nil {
++		t.Fatalf("Writer.Close failed: %s", err)
++	}
++	r, err := NewReader(bytes.NewReader(b.Bytes()), int64(b.Len()))
++	if err != nil {
++		t.Fatalf("NewReader failed: %s", err)
++	}
++	if len(r.File) != 5 {
++		t.Errorf("Archive has unexpected number of files, got %d, want 5", len(r.File))
++	}
++}
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-33197.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-33197.patch
new file mode 100644
index 0000000000..2052b1d3db
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-33197.patch
@@ -0,0 +1,152 @@
+From cbd1ca84453fecf3825a6bb9f985823e8bc32b76 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Fri, 21 May 2021 14:02:30 -0400
+Subject: [PATCH] [release-branch.go1.15] net/http/httputil: always remove
+ hop-by-hop headers
+
+Previously, we'd fail to remove the Connection header from a request
+like this:
+
+    Connection:
+    Connection: x-header
+
+Updates #46313
+Fixes #46314
+Fixes CVE-2021-33197
+
+Change-Id: Ie3009e926ceecfa86dfa6bcc6fe14ff01086be7d
+Reviewed-on: https://go-review.googlesource.com/c/go/+/321929
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+Trust: Katie Hockman <katie@golang.org>
+Trust: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/323091
+Run-TryBot: Katie Hockman <katie@golang.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-33197
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/net/http/httputil/reverseproxy.go      | 22 ++++----
+ src/net/http/httputil/reverseproxy_test.go | 63 +++++++++++++++++++++-
+ 2 files changed, 70 insertions(+), 15 deletions(-)
+
+Index: go/src/net/http/httputil/reverseproxy.go
+===================================================================
+--- go.orig/src/net/http/httputil/reverseproxy.go
++++ go/src/net/http/httputil/reverseproxy.go
+@@ -221,22 +221,18 @@ func (p *ReverseProxy) ServeHTTP(rw http
+ 	// important is "Connection" because we want a persistent
+ 	// connection, regardless of what the client sent to us.
+ 	for _, h := range hopHeaders {
+-		hv := outreq.Header.Get(h)
+-		if hv == "" {
+-			continue
+-		}
+-		if h == "Te" && hv == "trailers" {
+-			// Issue 21096: tell backend applications that
+-			// care about trailer support that we support
+-			// trailers. (We do, but we don't go out of
+-			// our way to advertise that unless the
+-			// incoming client request thought it was
+-			// worth mentioning)
+-			continue
+-		}
+ 		outreq.Header.Del(h)
+ 	}
+ 
++	// Issue 21096: tell backend applications that care about trailer support
++	// that we support trailers. (We do, but we don't go out of our way to
++	// advertise that unless the incoming client request thought it was worth
++	// mentioning.) Note that we look at req.Header, not outreq.Header, since
++	// the latter has passed through removeConnectionHeaders.
++	if httpguts.HeaderValuesContainsToken(req.Header["Te"], "trailers") {
++		outreq.Header.Set("Te", "trailers")
++	}
++
+ 	// After stripping all the hop-by-hop connection headers above, add back any
+ 	// necessary for protocol upgrades, such as for websockets.
+ 	if reqUpType != "" {
+Index: go/src/net/http/httputil/reverseproxy_test.go
+===================================================================
+--- go.orig/src/net/http/httputil/reverseproxy_test.go
++++ go/src/net/http/httputil/reverseproxy_test.go
+@@ -91,8 +91,9 @@ func TestReverseProxy(t *testing.T) {
+ 
+ 	getReq, _ := http.NewRequest("GET", frontend.URL, nil)
+ 	getReq.Host = "some-name"
+-	getReq.Header.Set("Connection", "close")
+-	getReq.Header.Set("Te", "trailers")
++	getReq.Header.Set("Connection", "close, TE")
++	getReq.Header.Add("Te", "foo")
++	getReq.Header.Add("Te", "bar, trailers")
+ 	getReq.Header.Set("Proxy-Connection", "should be deleted")
+ 	getReq.Header.Set("Upgrade", "foo")
+ 	getReq.Close = true
+@@ -236,6 +237,64 @@ func TestReverseProxyStripHeadersPresent
+ 	}
+ }
+ 
++func TestReverseProxyStripEmptyConnection(t *testing.T) {
++	// See Issue 46313.
++	const backendResponse = "I am the backend"
++
++	// someConnHeader is some arbitrary header to be declared as a hop-by-hop header
++	// in the Request's Connection header.
++	const someConnHeader = "X-Some-Conn-Header"
++
++	backend := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
++		if c := r.Header.Values("Connection"); len(c) != 0 {
++			t.Errorf("handler got header %q = %v; want empty", "Connection", c)
++		}
++		if c := r.Header.Get(someConnHeader); c != "" {
++			t.Errorf("handler got header %q = %q; want empty", someConnHeader, c)
++		}
++		w.Header().Add("Connection", "")
++		w.Header().Add("Connection", someConnHeader)
++		w.Header().Set(someConnHeader, "should be deleted")
++		io.WriteString(w, backendResponse)
++	}))
++	defer backend.Close()
++	backendURL, err := url.Parse(backend.URL)
++	if err != nil {
++		t.Fatal(err)
++	}
++	proxyHandler := NewSingleHostReverseProxy(backendURL)
++	frontend := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
++		proxyHandler.ServeHTTP(w, r)
++		if c := r.Header.Get(someConnHeader); c != "should be deleted" {
++			t.Errorf("handler modified header %q = %q; want %q", someConnHeader, c, "should be deleted")
++		}
++	}))
++	defer frontend.Close()
++
++	getReq, _ := http.NewRequest("GET", frontend.URL, nil)
++	getReq.Header.Add("Connection", "")
++	getReq.Header.Add("Connection", someConnHeader)
++	getReq.Header.Set(someConnHeader, "should be deleted")
++	res, err := frontend.Client().Do(getReq)
++	if err != nil {
++		t.Fatalf("Get: %v", err)
++	}
++	defer res.Body.Close()
++	bodyBytes, err := ioutil.ReadAll(res.Body)
++	if err != nil {
++		t.Fatalf("reading body: %v", err)
++	}
++	if got, want := string(bodyBytes), backendResponse; got != want {
++		t.Errorf("got body %q; want %q", got, want)
++	}
++	if c := res.Header.Get("Connection"); c != "" {
++		t.Errorf("handler got header %q = %q; want empty", "Connection", c)
++	}
++	if c := res.Header.Get(someConnHeader); c != "" {
++		t.Errorf("handler got header %q = %q; want empty", someConnHeader, c)
++	}
++}
++
+ func TestXForwardedFor(t *testing.T) {
+ 	const prevForwardedFor = "client ip"
+ 	const backendResponse = "I am the backend"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-34558.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-34558.patch
new file mode 100644
index 0000000000..8fb346d622
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-34558.patch
@@ -0,0 +1,51 @@
+From a98589711da5e9d935e8d690cfca92892e86d557 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Wed, 9 Jun 2021 11:31:27 -0700
+Subject: [PATCH] crypto/tls: test key type when casting
+
+When casting the certificate public key in generateClientKeyExchange,
+check the type is appropriate. This prevents a panic when a server
+agrees to a RSA based key exchange, but then sends an ECDSA (or
+other) certificate.
+
+Fixes #47143
+Fixes CVE-2021-34558
+
+Thanks to Imre Rad for reporting this issue.
+
+Change-Id: Iabccacca6052769a605cccefa1216a9f7b7f6aea
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1116723
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+Reviewed-by: Katie Hockman <katiehockman@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/334031
+Trust: Filippo Valsorda <filippo@golang.org>
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+
+Upstream-Status: Backport 
+https://github.com/golang/go/commit/a98589711da5e9d935e8d690cfca92892e86d557
+CVE: CVE-2021-34558
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/crypto/tls/key_agreement.go | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+Index: go/src/crypto/tls/key_agreement.go
+===================================================================
+--- go.orig/src/crypto/tls/key_agreement.go
++++ go/src/crypto/tls/key_agreement.go
+@@ -67,7 +67,11 @@ func (ka rsaKeyAgreement) generateClient
+ 		return nil, nil, err
+ 	}
+ 
+-	encrypted, err := rsa.EncryptPKCS1v15(config.rand(), cert.PublicKey.(*rsa.PublicKey), preMasterSecret)
++	rsaKey, ok := cert.PublicKey.(*rsa.PublicKey)
++	if !ok {
++		return nil, nil, errors.New("tls: server certificate contains incorrect key type for selected ciphersuite")
++	}
++	encrypted, err := rsa.EncryptPKCS1v15(config.rand(), rsaKey, preMasterSecret)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
-- 
2.25.1

