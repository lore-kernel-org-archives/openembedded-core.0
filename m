Return-Path: <alexander.j.kube@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D14C6D4C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:30:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so2625439wro.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=1R2QoshPcdSSQEMnAZ3XSJ/mbH+ECdOvf7FoI+v7Mdo=;
	b=R9c21qt/YFRnh/B4awNO/yC58aImUDaxwPg0l1xZXvDFvBgs2OeEOmN76MJo+lPX4T
	LGs9i2iKm+NEOuSvneexaQO0kifcKc/zmQsgGlYgB6sK+FYsWoeLhvOG1AmR7SALu66t
	AhSSVbCwG0OpyR3fpE3dUuPCSqDIW7DwHVIPBDjVYxJMW+pddRyNFRkgMwTQa7d7hQsv
	Tn5X1GoUgfg9+F2mgFOrX3QZ0bZA7kWlL4xY1eS5v02CL4hYzQUxRFQhXvHfTS3uuw+N
	zrhqDvzCVzDbNKGKRxPdneTWf1VM5aEQmGWG0f5Z1qOxsVXHaMjZfaTZzcofZxyrGnTQ
	sGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1R2QoshPcdSSQEMnAZ3XSJ/mbH+ECdOvf7FoI+v7Mdo=;
	b=HLYR8Q+uSujNfi55Uk2NNisUyY7JEVCQ8IdrCvCqgqaOiD6jeeBBPhEOhmOerdpb3a
	6YbUMzSJmTEKTSZYIHoplE7JQQaCdct0/SM19aEiTa41w7SC3TR3RU271VMEc/FZWGKQ
	cuWBDQG2LTamAYCsfJk+wS3NNkEM00PMrzY8wmPXtLvCll04R1xodJTSOk5kKcSgPdMZ
	HmES9fclCOz4CysvmXHGCDdxt9DggGxdrhpYfoVEac5MKG8bMIAZkmYwwJZJG255z/Nx
	1WrDabuHFYNZenQjedYUR7vOagMkFY61+dGXA3OHdH2t/ai0EtD0ec3FNr/SPeSu4sG1
	IZxA==
X-Gm-Message-State: APjAAAUeqo/sAsnYGgvFvBOmJCYp+FnB27Fv7DQ6+7GXdxszijeNyzC2
	u9469yGZ2mTscS7rsy620WXegmBnGReg+FGRZLoIPg==
X-Google-Smtp-Source: APXvYqxj+uHDxtBzEZ0BLjLn8S/95UQA7QWcTZovYTHU35r9nq9YBll8BoydLxO8uPIAeyBEkYotDPashiW6hT1Gfz4=
X-Received: by 2002:adf:e488:: with SMTP id i8mr3321980wrm.302.1572013854941; 
	Fri, 25 Oct 2019 07:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191025135847.77492-1-alexander.j.kube@gmail.com>
	<20191025135847.77492-4-alexander.j.kube@gmail.com>
In-Reply-To: <20191025135847.77492-4-alexander.j.kube@gmail.com>
From: Alexander Kube <alexander.j.kube@gmail.com>
Date: Fri, 25 Oct 2019 19:00:18 +0430
Message-ID: <CAO7qD-sJrH25wXWgzZwuaUusnFYfX2U0tjeT0nscf28_-POWgg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 4/4] Remove go-1.12
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
X-List-Received-Date: Fri, 25 Oct 2019 14:30:55 -0000
Content-Type: multipart/alternative; boundary="00000000000067e4e70595bcfff6"

--00000000000067e4e70595bcfff6
Content-Type: text/plain; charset="UTF-8"

This patch worked fine until a `bitbake -c cleanall`. I'm investigating the
root cause right now; please do not merge.

On Fri, Oct 25, 2019 at 6:29 PM Alexander Kube <alexander.j.kube@gmail.com>
wrote:

> From: Alex Kube <alexander.j.kube@gmail.com>
>
> Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
> ---
>  meta/recipes-devtools/go/go-1.12.inc          |  24 --
>  ...ow-CC-and-CXX-to-have-multiple-words.patch |  31 --
>  ...o1.12-security-net-textproto-don-t-n.patch | 163 ----------
>  ...ent-based-hash-generation-less-pedan.patch | 218 --------------
>  ...-to-be-overridden-in-the-environment.patch |  48 ---
>  ...4-ld-add-soname-to-shareable-objects.patch |  45 ---
>  ...de-CC-when-building-dist-and-go_boot.patch |  37 ---
>  ...dist-separate-host-and-target-builds.patch | 282 ------------------
>  ...d-go-make-GOROOT-precious-by-default.patch | 106 -------
>  ...008-use-GOBUILDMODE-to-set-buildmode.patch |  37 ---
>  ...place-glibc-dynamic-linker-with-musl.patch | 112 -------
>  .../go/go-cross-canadian_1.12.bb              |   2 -
>  meta/recipes-devtools/go/go-cross_1.12.bb     |   2 -
>  meta/recipes-devtools/go/go-crosssdk_1.12.bb  |   2 -
>  meta/recipes-devtools/go/go-native_1.12.bb    |   2 -
>  meta/recipes-devtools/go/go-runtime_1.12.bb   |   2 -
>  meta/recipes-devtools/go/go_1.12.bb           |  14 -
>  17 files changed, 1127 deletions(-)
>  delete mode 100644 meta/recipes-devtools/go/go-1.12.inc
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
>  delete mode 100644
> meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
>  delete mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.12.bb
>  delete mode 100644 meta/recipes-devtools/go/go-cross_1.12.bb
>  delete mode 100644 meta/recipes-devtools/go/go-crosssdk_1.12.bb
>  delete mode 100644 meta/recipes-devtools/go/go-native_1.12.bb
>  delete mode 100644 meta/recipes-devtools/go/go-runtime_1.12.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.12.bb
>
> diff --git a/meta/recipes-devtools/go/go-1.12.inc
> b/meta/recipes-devtools/go/go-1.12.inc
> deleted file mode 100644
> index ed14b175e6..0000000000
> --- a/meta/recipes-devtools/go/go-1.12.inc
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require go-common.inc
> -
> -GO_BASEVERSION = "1.12"
> -GO_MINOR = ".9"
> -PV .= "${GO_MINOR}"
> -FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> -
> -SRC_URI += "\
> -    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
> -
> file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
> -    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> \
> -    file://0004-ld-add-soname-to-shareable-objects.patch \
> -
> file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
> -    file://0006-cmd-dist-separate-host-and-target-builds.patch \
> -    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> -    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> -
> file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
> -"
> -SRC_URI_append_libc-musl = "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> -
> -SRC_URI[main.md5sum] = "6132109d4050da349eadc9f7b0304ef4"
> -SRC_URI[main.sha256sum] =
> "ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> b/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> deleted file mode 100644
> index 4442858c83..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Mon, 19 Feb 2018 08:49:33 -0800
> -Subject: [PATCH] allow CC and CXX to have multiple words
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/cmd/go/internal/envcmd/env.go | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> -index afadbad..cedbfbf 100644
> ---- a/src/cmd/go/internal/envcmd/env.go
> -+++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -85,11 +85,11 @@ func MkEnv() []cfg.EnvVar {
> -
> -       cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> -       if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
> --              cc = env[0]
> -+              cc = strings.Join(env, " ")
> -       }
> -       cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> -       if env := strings.Fields(os.Getenv("CXX")); len(env) > 0 {
> --              cxx = env[0]
> -+              cxx = strings.Join(env, " ")
> -       }
> -       env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> -       env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> deleted file mode 100644
> index 7b39dbd734..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> +++ /dev/null
> @@ -1,163 +0,0 @@
> -From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001
> -From: Filippo Valsorda <filippo@golang.org>
> -Date: Thu, 12 Sep 2019 12:37:36 -0400
> -Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don't
> - normalize headers with spaces before the colon
> -
> -RFC 7230 is clear about headers with a space before the colon, like
> -
> -X-Answer : 42
> -
> -being invalid, but we've been accepting and normalizing them for
> compatibility
> -purposes since CL 5690059 in 2012.
> -
> -On the client side, this is harmless and indeed most browsers behave the
> same
> -to this day. On the server side, this becomes a security issue when the
> -behavior doesn't match that of a reverse proxy sitting in front of the
> server.
> -
> -For example, if a WAF accepts them without normalizing them, it might be
> -possible to bypass its filters, because the Go server would interpret the
> -header differently. Worse, if the reverse proxy coalesces requests onto a
> -single HTTP/1.1 connection to a Go server, the understanding of the
> request
> -boundaries can get out of sync between them, allowing an attacker to tack
> an
> -arbitrary method and path onto a request by other clients, including
> -authentication headers unknown to the attacker.
> -
> -This was recently presented at multiple security conferences:
> -https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn
> -
> -net/http servers already reject header keys with invalid characters.
> -Simply stop normalizing extra spaces in net/textproto, let it return them
> -unchanged like it does for other invalid headers, and let net/http enforce
> -RFC 7230, which is HTTP specific. This loses us normalization on the
> client
> -side, but there's no right answer on the client side anyway, and hiding
> the
> -issue sounds worse than letting the application decide.
> -
> -Fixes CVE-2019-16276
> -
> -Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
> -Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/549719
> -Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/549719-Reviewed-by>:
> Brad Fitzpatrick <bradfitz@google.com>
> -(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
> -Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/558776
> -Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/558776-Reviewed-by>:
> Dmitri Shuralyov <dmitshur@google.com>
> -
> -CVE: CVE-2019-16276
> -
> -Upstream-Status: Backport [
> https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8
> ]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/net/http/serve_test.go       |  4 ++++
> - src/net/http/transport_test.go   | 27 +++++++++++++++++++++++++++
> - src/net/textproto/reader.go      | 10 ++--------
> - src/net/textproto/reader_test.go | 13 ++++++-------
> - 4 files changed, 39 insertions(+), 15 deletions(-)
> -
> -diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
> -index 6eb0088a96..89bfdfbb82 100644
> ---- a/src/net/http/serve_test.go
> -+++ b/src/net/http/serve_test.go
> -@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {
> -               {"foo\xffbar: foo\r\n", 400},                         //
> binary in header
> -               {"foo\x00bar: foo\r\n", 400},                         //
> binary in header
> -               {"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, //
> header too large
> -+              // Spaces between the header key and colon are not allowed.
> -+              // See RFC 7230, Section 3.2.4.
> -+              {"Foo : bar\r\n", 400},
> -+              {"Foo\t: bar\r\n", 400},
> -
> -               {"foo: foo foo\r\n", 200},    // LWS space is okay
> -               {"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
> -diff --git a/src/net/http/transport_test.go
> b/src/net/http/transport_test.go
> -index 5c329543e2..5e5438a708 100644
> ---- a/src/net/http/transport_test.go
> -+++ b/src/net/http/transport_test.go
> -@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
> -       }
> -       t.Fatalf("timeout after %v waiting for Transport connections to
> die off", time.Since(t0))
> - }
> -+
> -+func TestInvalidHeaderResponse(t *testing.T) {
> -+      setParallel(t)
> -+      defer afterTest(t)
> -+      cst := newClientServerTest(t, h1Mode, HandlerFunc(func(w
> ResponseWriter, r *Request) {
> -+              conn, buf, _ := w.(Hijacker).Hijack()
> -+              buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
> -+                      "Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
> -+                      "Content-Type: text/html; charset=utf-8\r\n" +
> -+                      "Content-Length: 0\r\n" +
> -+                      "Foo : bar\r\n\r\n"))
> -+              buf.Flush()
> -+              conn.Close()
> -+      }))
> -+      defer cst.close()
> -+      res, err := cst.c.Get(cst.ts.URL)
> -+      if err != nil {
> -+              t.Fatal(err)
> -+      }
> -+      defer res.Body.Close()
> -+      if v := res.Header.Get("Foo"); v != "" {
> -+              t.Errorf(`unexpected "Foo" header: %q`, v)
> -+      }
> -+      if v := res.Header.Get("Foo "); v != "bar" {
> -+              t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")
> -+      }
> -+}
> -diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
> -index 2c4f25d5ae..1a5e364cf7 100644
> ---- a/src/net/textproto/reader.go
> -+++ b/src/net/textproto/reader.go
> -@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader,
> error) {
> -                       return m, err
> -               }
> -
> --              // Key ends at first colon; should not have trailing spaces
> --              // but they appear in the wild, violating specs, so we
> remove
> --              // them if present.
> -+              // Key ends at first colon.
> -               i := bytes.IndexByte(kv, ':')
> -               if i < 0 {
> -                       return m, ProtocolError("malformed MIME header
> line: " + string(kv))
> -               }
> --              endKey := i
> --              for endKey > 0 && kv[endKey-1] == ' ' {
> --                      endKey--
> --              }
> --              key := canonicalMIMEHeaderKey(kv[:endKey])
> -+              key := canonicalMIMEHeaderKey(kv[:i])
> -
> -               // As per RFC 7230 field-name is a token, tokens consist
> of one or more chars.
> -               // We could return a ProtocolError here, but better to be
> liberal in what we
> -diff --git a/src/net/textproto/reader_test.go
> b/src/net/textproto/reader_test.go
> -index f85fbdc36d..b92fdcd3c7 100644
> ---- a/src/net/textproto/reader_test.go
> -+++ b/src/net/textproto/reader_test.go
> -@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
> -       }
> - }
> -
> --// Test that we read slightly-bogus MIME headers seen in the wild,
> --// with spaces before colons, and spaces in keys.
> -+// TestReadMIMEHeaderNonCompliant checks that we don't normalize headers
> -+// with spaces before colons, and accept spaces in keys.
> - func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> --      // Invalid HTTP response header as sent by an Axis security
> --      // camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
> -+      // These invalid headers will be rejected by net/http according to
> RFC 7230.
> -       r := reader("Foo: bar\r\n" +
> -               "Content-Language: en\r\n" +
> -               "SID : 0\r\n" +
> -@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> -       want := MIMEHeader{
> -               "Foo":              {"bar"},
> -               "Content-Language": {"en"},
> --              "Sid":              {"0"},
> --              "Audio Mode":       {"None"},
> --              "Privilege":        {"127"},
> -+              "SID ":             {"0"},
> -+              "Audio Mode ":      {"None"},
> -+              "Privilege ":       {"127"},
> -       }
> -       if !reflect.DeepEqual(m, want) || err != nil {
> -               t.Fatalf("ReadMIMEHeader =\n%v, %v; want:\n%v", m, err,
> want)
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> b/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> deleted file mode 100644
> index 66b8561874..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++ /dev/null
> @@ -1,218 +0,0 @@
> -From 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Mon, 19 Feb 2018 08:50:59 -0800
> -Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
> -
> -Go 1.10's build tool now uses content-based hashes to
> -determine when something should be built or re-built.
> -This same mechanism is used to maintain a built-artifact
> -cache for speeding up builds.
> -
> -However, the hashes it generates include information that
> -doesn't work well with OE, nor with using a shared runtime
> -library.
> -
> -First, it embeds path names to source files, unless
> -building within GOROOT.  This prevents the building
> -of a package in GOPATH for later staging into GOROOT.
> -
> -This patch adds support for the environment variable
> -GOPATH_OMIT_IN_ACTIONID.  If present, path name
> -embedding is disabled.
> -
> -Second, if cgo is enabled, the build ID for cgo-related
> -packages will include the current value of the environment
> -variables for invoking the compiler (CC, CXX, FC) and
> -any CGO_xxFLAGS variables.  Only if the settings used
> -during a compilation exactly match, character for character,
> -the values used for compiling runtime/cgo or any other
> -cgo-enabled package being imported, will the tool
> -decide that the imported package is up-to-date.
> -
> -This is done to help ensure correctness, but is overly
> -simplistic and effectively prevents the reuse of built
> -artifacts that use cgo (or shared runtime, which includes
> -runtime/cgo).
> -
> -This patch filters out all compiler flags except those
> -beginning with '-m'.  The default behavior can be restored
> -by setting the CGO_PEDANTIC environment variable.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/cmd/go/internal/envcmd/env.go |  2 +-
> - src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++---------
> - 2 files changed, 46 insertions(+), 19 deletions(-)
> -
> -diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> -index cedbfbf..5763a0d 100644
> ---- a/src/cmd/go/internal/envcmd/env.go
> -+++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -128,7 +128,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> - func ExtraEnvVarsCostly() []cfg.EnvVar {
> -       var b work.Builder
> -       b.Init()
> --      cppflags, cflags, cxxflags, fflags, ldflags, err :=
> b.CFlags(&load.Package{})
> -+      cppflags, cflags, cxxflags, fflags, ldflags, err :=
> b.CFlags(&load.Package{}, false)
> -       if err != nil {
> -               // Should not happen - b.CFlags was given an empty package.
> -               fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> -diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> -index 12e1527..e41bfac 100644
> ---- a/src/cmd/go/internal/work/exec.go
> -+++ b/src/cmd/go/internal/work/exec.go
> -@@ -174,6 +174,8 @@ func (b *Builder) Do(root *Action) {
> -       wg.Wait()
> - }
> -
> -+var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
> -+
> - // buildActionID computes the action ID for a build action.
> - func (b *Builder) buildActionID(a *Action) cache.ActionID {
> -       p := a.Package
> -@@ -190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> -       // but it does not hide the exact value of $GOPATH.
> -       // Include the full dir in that case.
> -       // Assume b.WorkDir is being trimmed properly.
> --      if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
> -+      if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir,
> b.WorkDir) {
> -               fmt.Fprintf(h, "dir %s\n", p.Dir)
> -       }
> -       fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> -@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> -       }
> -       if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> -               fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> --              cppflags, cflags, cxxflags, fflags, ldflags, _ :=
> b.CFlags(p)
> --              fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags,
> cflags, ldflags)
> -+              cppflags, cflags, cxxflags, fflags, ldflags, _ :=
> b.CFlags(p, true)
> -+              fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true),
> cppflags, cflags, ldflags)
> -               if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> --                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> -+                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true),
> cxxflags)
> -               }
> -               if len(p.FFiles) > 0 {
> --                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> -+                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> -               }
> -               // TODO(rsc): Should we include the SWIG version or
> Fortran/GCC/G++/Objective-C compiler versions?
> -       }
> -@@ -2096,33 +2098,33 @@ var (
> - // gccCmd returns a gcc command line prefix
> - // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> - func (b *Builder) GccCmd(incdir, workdir string) []string {
> --      return b.compilerCmd(b.ccExe(), incdir, workdir)
> -+      return b.compilerCmd(b.ccExe(false), incdir, workdir)
> - }
> -
> - // gxxCmd returns a g++ command line prefix
> - // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> - func (b *Builder) GxxCmd(incdir, workdir string) []string {
> --      return b.compilerCmd(b.cxxExe(), incdir, workdir)
> -+      return b.compilerCmd(b.cxxExe(false), incdir, workdir)
> - }
> -
> - // gfortranCmd returns a gfortran command line prefix.
> - func (b *Builder) gfortranCmd(incdir, workdir string) []string {
> --      return b.compilerCmd(b.fcExe(), incdir, workdir)
> -+      return b.compilerCmd(b.fcExe(false), incdir, workdir)
> - }
> -
> - // ccExe returns the CC compiler setting without all the extra flags we
> add implicitly.
> --func (b *Builder) ccExe() []string {
> --      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
> -+func (b *Builder) ccExe(filtered bool) []string {
> -+      return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch),
> filtered)
> - }
> -
> - // cxxExe returns the CXX compiler setting without all the extra flags
> we add implicitly.
> --func (b *Builder) cxxExe() []string {
> --      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
> -+func (b *Builder) cxxExe(filtered bool) []string {
> -+      return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos,
> cfg.Goarch), filtered)
> - }
> -
> - // fcExe returns the FC compiler setting without all the extra flags we
> add implicitly.
> --func (b *Builder) fcExe() []string {
> --      return b.compilerExe(os.Getenv("FC"), "gfortran")
> -+func (b *Builder) fcExe(filtered bool) []string {
> -+      return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
> - }
> -
> - // compilerExe returns the compiler to use given an
> -@@ -2131,11 +2133,14 @@ func (b *Builder) fcExe() []string {
> - // of the compiler but can have additional arguments if they
> - // were present in the environment value.
> - // For example if CC="gcc -DGOPHER" then the result is ["gcc",
> "-DGOPHER"].
> --func (b *Builder) compilerExe(envValue string, def string) []string {
> -+func (b *Builder) compilerExe(envValue string, def string, filtered
> bool) []string {
> -       compiler := strings.Fields(envValue)
> -       if len(compiler) == 0 {
> -               compiler = []string{def}
> -       }
> -+      if filtered {
> -+              return append(compiler[0:1],
> filterCompilerFlags(compiler[1:])...)
> -+      }
> -       return compiler
> - }
> -
> -@@ -2285,8 +2290,23 @@ func envList(key, def string) []string {
> -       return strings.Fields(v)
> - }
> -
> -+var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
> -+
> -+func filterCompilerFlags(flags []string) []string {
> -+      var newflags []string
> -+      if !filterFlags {
> -+              return flags
> -+      }
> -+      for _, flag := range flags {
> -+              if strings.HasPrefix(flag, "-m") {
> -+                      newflags = append(newflags, flag)
> -+              }
> -+      }
> -+      return newflags
> -+}
> -+
> - // CFlags returns the flags to use when invoking the C, C++ or Fortran
> compilers, or cgo.
> --func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags,
> fflags, ldflags []string, err error) {
> -+func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags,
> cflags, cxxflags, fflags, ldflags []string, err error) {
> -       defaults := "-g -O2"
> -
> -       if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err != nil {
> -@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> -       if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS,
> checkLinkerFlags); err != nil {
> -               return
> -       }
> -+      if filtered {
> -+              cppflags = filterCompilerFlags(cppflags)
> -+              cflags = filterCompilerFlags(cflags)
> -+              cxxflags = filterCompilerFlags(cxxflags)
> -+              fflags = filterCompilerFlags(fflags)
> -+              ldflags = filterCompilerFlags(ldflags)
> -+      }
> -
> -       return
> - }
> -@@ -2319,7 +2346,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
> -
> - func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> -       p := a.Package
> --      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
> b.CFlags(p)
> -+      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=
> b.CFlags(p, false)
> -       if err != nil {
> -               return nil, nil, err
> -       }
> -@@ -2679,7 +2706,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> -
> - // Run SWIG on one SWIG input file.
> - func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,
> err error) {
> --      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
> -+      cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p,
> false)
> -       if err != nil {
> -               return "", "", err
> -       }
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> b/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> deleted file mode 100644
> index b6ca40edee..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Sat, 17 Feb 2018 05:24:20 -0800
> -Subject: [PATCH] allow GOTOOLDIR to be overridden in the environment
> -
> -to allow for split host/target build roots
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/cmd/dist/build.go          | 4 +++-
> - src/cmd/go/internal/cfg/cfg.go | 7 +++++--
> - 2 files changed, 8 insertions(+), 3 deletions(-)
> -
> -Index: go/src/cmd/dist/build.go
> -===================================================================
> ---- go.orig/src/cmd/dist/build.go
> -+++ go/src/cmd/dist/build.go
> -@@ -228,7 +228,9 @@ func xinit() {
> -       workdir = xworkdir()
> -       xatexit(rmworkdir)
> -
> --      tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> -+      if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> -+              tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> -+      }
> - }
> -
> - // compilerEnv returns a map from "goos/goarch" to the
> -Index: go/src/cmd/go/internal/cfg/cfg.go
> -===================================================================
> ---- go.orig/src/cmd/go/internal/cfg/cfg.go
> -+++ go/src/cmd/go/internal/cfg/cfg.go
> -@@ -116,7 +116,11 @@ func init() {
> -               // variables. This matches the initialization of ToolDir in
> -               // go/build, except for using GOROOT rather than
> -               // runtime.GOROOT.
> --              build.ToolDir = filepath.Join(GOROOT,
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> -+              if s := os.Getenv("GOTOOLDIR"); s != "" {
> -+                      build.ToolDir = filepath.Clean(s)
> -+              } else {
> -+                      build.ToolDir = filepath.Join(GOROOT,
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> -+              }
> -       }
> - }
> -
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
> deleted file mode 100644
> index 004a33a023..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Sat, 17 Feb 2018 06:26:10 -0800
> -Subject: [PATCH] ld: add soname to shareable objects
> -
> -so that OE's shared library dependency handling
> -can find them.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/cmd/link/internal/ld/lib.go | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/cmd/link/internal/ld/lib.go
> b/src/cmd/link/internal/ld/lib.go
> -index 220aab3..703925f 100644
> ---- a/src/cmd/link/internal/ld/lib.go
> -+++ b/src/cmd/link/internal/ld/lib.go
> -@@ -1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {
> -                               argv = append(argv, "-Wl,-z,relro")
> -                       }
> -                       argv = append(argv, "-shared")
> -+                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> -                       if ctxt.HeadType != objabi.Hwindows {
> -                               // Pass -z nodelete to mark the shared
> library as
> -                               // non-closeable: a dlclose will do
> nothing.
> -@@ -1146,6 +1147,8 @@ func (ctxt *Link) hostlink() {
> -                       argv = append(argv, "-Wl,-z,relro")
> -               }
> -               argv = append(argv, "-shared")
> -+              argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> -+
> -       case BuildModePlugin:
> -               if ctxt.HeadType == objabi.Hdarwin {
> -                       argv = append(argv, "-dynamiclib")
> -@@ -1154,6 +1157,7 @@ func (ctxt *Link) hostlink() {
> -                               argv = append(argv, "-Wl,-z,relro")
> -                       }
> -                       argv = append(argv, "-shared")
> -+                      argv = append(argv, fmt.Sprintf("-Wl,-soname,%s",
> filepath.Base(*flagOutfile)))
> -               }
> -       }
> -
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> b/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> deleted file mode 100644
> index ace8de9eae..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Sat, 17 Feb 2018 06:32:45 -0800
> -Subject: [PATCH] make.bash: override CC when building dist and
> go_bootstrap
> -
> -for handling OE cross-canadian builds.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/make.bash | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/make.bash b/src/make.bash
> -index 78882d9..25943d0 100755
> ---- a/src/make.bash
> -+++ b/src/make.bash
> -@@ -163,7 +163,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> -       exit 1
> - fi
> - rm -f cmd/dist/dist
> --GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go"
> build -o cmd/dist/dist ./cmd/dist
> -+CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> -
> - # -e doesn't propagate out of eval, so check success by hand.
> - eval $(./cmd/dist/dist env -p || echo FAIL=true)
> -@@ -194,7 +194,7 @@ fi
> - # Run dist bootstrap to complete make.bash.
> - # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> - # Throw ours, built with Go 1.4, away after bootstrap.
> --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> -+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag
> $GO_DISTFLAGS "$@"
> - rm -f ./cmd/dist/dist
> -
> - # DO NOT ADD ANY NEW CODE HERE.
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
> b/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
> deleted file mode 100644
> index 0c0d5da80a..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
> +++ /dev/null
> @@ -1,282 +0,0 @@
> -From fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Sat, 17 Feb 2018 10:03:48 -0800
> -Subject: [PATCH] cmd/dist: separate host and target builds
> -
> -Change the dist tool to allow for OE-style cross-
> -and cross-canadian builds:
> -
> - - command flags --host-only and --target only are added;
> -   if one is present, the other changes mentioned below
> -   take effect, and arguments may also be specified on
> -   the command line to enumerate the package(s) to be
> -   built.
> -
> - - for OE cross builds, go_bootstrap is always built for
> -   the current build host, and is moved, along with the supporting
> -   toolchain (asm, compile, etc.) to a separate 'native_native'
> -   directory under GOROOT/pkg/tool.
> -
> - - go_bootstrap is not automatically removed after the build,
> -   so it can be reused later (e.g., building both static and
> -   shared runtime).
> -
> -Note that for --host-only builds, it would be nice to specify
> -just the "cmd" package to build only the go commands/tools,
> -the staleness checks in the dist tool will fail if the "std"
> -library has not also been built.  So host-only builds have to
> -build everything anyway.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> -more dist cleanup
> -
> ----
> - src/cmd/dist/build.go | 153 ++++++++++++++++++++++++++++++------------
> - 1 file changed, 111 insertions(+), 42 deletions(-)
> -
> -Index: go/src/cmd/dist/build.go
> -===================================================================
> ---- go.orig/src/cmd/dist/build.go
> -+++ go/src/cmd/dist/build.go
> -@@ -39,6 +39,7 @@ var (
> -       goldflags        string
> -       workdir          string
> -       tooldir          string
> -+      build_tooldir    string
> -       oldgoos          string
> -       oldgoarch        string
> -       exe              string
> -@@ -50,6 +51,7 @@ var (
> -
> -       rebuildall   bool
> -       defaultclang bool
> -+      crossBuild   bool
> -
> -       vflag int // verbosity
> - )
> -@@ -231,6 +233,8 @@ func xinit() {
> -       if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> -               tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> -       }
> -+      build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
> -+
> - }
> -
> - // compilerEnv returns a map from "goos/goarch" to the
> -@@ -260,7 +264,6 @@ func compilerEnv(envName, def string) ma
> -               if gohostos != goos || gohostarch != goarch {
> -                       m[gohostos+"/"+gohostarch] = m[""]
> -               }
> --              m[""] = env
> -       }
> -
> -       for _, goos := range okgoos {
> -@@ -487,8 +490,10 @@ func setup() {
> -       // We keep it in pkg/, just like the object directory above.
> -       if rebuildall {
> -               xremoveall(tooldir)
> -+              xremoveall(build_tooldir)
> -       }
> -       xmkdirall(tooldir)
> -+      xmkdirall(build_tooldir)
> -
> -       // Remove tool binaries from before the tool/gohostos_gohostarch
> -       xremoveall(pathf("%s/bin/tool", goroot))
> -@@ -1155,11 +1160,29 @@ func cmdbootstrap() {
> -
> -       var noBanner bool
> -       var debug bool
> -+      var hostOnly bool
> -+      var targetOnly bool
> -+      var toBuild = []string { "std", "cmd" }
> -+
> -       flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> -       flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
> -       flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print
> banner")
> -+      flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
> -+      flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only
> target binaries, not host")
> -
> --      xflagparse(0)
> -+      xflagparse(-1)
> -+
> -+      if (hostOnly && targetOnly) {
> -+              fatalf("specify only one of --host-only or
> --target-only\n")
> -+      }
> -+      crossBuild = hostOnly || targetOnly
> -+      if flag.NArg() > 0 {
> -+              if crossBuild {
> -+                      toBuild = flag.Args()
> -+              } else {
> -+                      fatalf("package names not permitted without
> --host-only or --target-only\n")
> -+              }
> -+      }
> -
> -       if debug {
> -               // cmd/buildid is used in debug mode.
> -@@ -1207,8 +1230,13 @@ func cmdbootstrap() {
> -               xprintf("\n")
> -       }
> -
> --      gogcflags = os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> --      goldflags = os.Getenv("GO_LDFLAGS")
> -+      // For split host/target cross/cross-canadian builds, we don't
> -+      // want to be setting these flags until after we have compiled
> -+      // the toolchain that runs on the build host.
> -+      if ! crossBuild {
> -+              gogcflags = os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> -+              goldflags = os.Getenv("GO_LDFLAGS")
> -+      }
> -       goBootstrap := pathf("%s/go_bootstrap", tooldir)
> -       cmdGo := pathf("%s/go", gobin)
> -       if debug {
> -@@ -1237,7 +1265,11 @@ func cmdbootstrap() {
> -               xprintf("\n")
> -       }
> -       xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> --      os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> -+      if crossBuild {
> -+              os.Setenv("CC", defaultcc[""])
> -+      } else {
> -+              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> -+      }
> -       goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> -       if debug {
> -               run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> -@@ -1274,50 +1306,84 @@ func cmdbootstrap() {
> -       }
> -       checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> -
> --      if goos == oldgoos && goarch == oldgoarch {
> --              // Common case - not setting up for cross-compilation.
> --              timelog("build", "toolchain")
> --              if vflag > 0 {
> --                      xprintf("\n")
> -+      if crossBuild {
> -+              gogcflags = os.Getenv("GO_GCFLAGS")
> -+              goldflags = os.Getenv("GO_LDFLAGS")
> -+              tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
> -+              for _, f := range tool_files {
> -+                      copyfile(pathf("%s/%s", build_tooldir,
> filepath.Base(f)), f, writeExec)
> -+                      xremove(f)
> -+              }
> -+              os.Setenv("GOTOOLDIR", build_tooldir)
> -+              goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
> -+              if hostOnly {
> -+                      timelog("build", "host toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      xprintf("Building %s for host, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> -+                      goInstall(goBootstrap, toBuild...)
> -+                      checkNotStale(goBootstrap, toBuild...)
> -+                      // Skip cmdGo staleness checks here, since we
> can't necessarily run the cmdGo binary
> -+
> -+                      timelog("build", "target toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+              } else if targetOnly {
> -+                      goos = oldgoos
> -+                      goarch = oldgoarch
> -+                      os.Setenv("GOOS", goos)
> -+                      os.Setenv("GOARCH", goarch)
> -+                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
> -+                      xprintf("Building %s for target, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> -+                      goInstall(goBootstrap, toBuild...)
> -+                      checkNotStale(goBootstrap, toBuild...)
> -+                      // Skip cmdGo staleness checks here, since we
> can't run the target's cmdGo binary
> -               }
> --              xprintf("Building packages and commands for %s/%s.\n",
> goos, goarch)
> -       } else {
> --              // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> --              // Finish GOHOSTOS/GOHOSTARCH installation and then
> --              // run GOOS/GOARCH installation.
> --              timelog("build", "host toolchain")
> --              if vflag > 0 {
> --                      xprintf("\n")
> -+
> -+              if goos == oldgoos && goarch == oldgoarch {
> -+                      // Common case - not setting up for
> cross-compilation.
> -+                      timelog("build", "toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      xprintf("Building packages and commands for
> %s/%s.\n", goos, goarch)
> -+              } else {
> -+                      // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> -+                      // Finish GOHOSTOS/GOHOSTARCH installation and then
> -+                      // run GOOS/GOARCH installation.
> -+                      timelog("build", "host toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> -+                      goInstall(goBootstrap, "std", "cmd")
> -+                      checkNotStale(goBootstrap, "std", "cmd")
> -+                      checkNotStale(cmdGo, "std", "cmd")
> -+
> -+                      timelog("build", "target toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      goos = oldgoos
> -+                      goarch = oldgoarch
> -+                      os.Setenv("GOOS", goos)
> -+                      os.Setenv("GOARCH", goarch)
> -+                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
> -+                      xprintf("Building packages and commands for
> target, %s/%s.\n", goos, goarch)
> -               }
> --              xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> -               goInstall(goBootstrap, "std", "cmd")
> -               checkNotStale(goBootstrap, "std", "cmd")
> -               checkNotStale(cmdGo, "std", "cmd")
> -
> --              timelog("build", "target toolchain")
> --              if vflag > 0 {
> --                      xprintf("\n")
> --              }
> --              goos = oldgoos
> --              goarch = oldgoarch
> --              os.Setenv("GOOS", goos)
> --              os.Setenv("GOARCH", goarch)
> --              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> --              xprintf("Building packages and commands for target,
> %s/%s.\n", goos, goarch)
> --      }
> --      targets := []string{"std", "cmd"}
> --      if goos == "js" && goarch == "wasm" {
> --              // Skip the cmd tools for js/wasm. They're not usable.
> --              targets = targets[:1]
> --      }
> --      goInstall(goBootstrap, targets...)
> --      checkNotStale(goBootstrap, targets...)
> --      checkNotStale(cmdGo, targets...)
> --      if debug {
> --              run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> --              run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> --              checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> --              copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> -+              if debug {
> -+                      run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> -+                      run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> -+                      checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> -+                      copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> -+              }
> -       }
> -
> -       // Check that there are no new files in $GOROOT/bin other than
> -@@ -1335,7 +1401,11 @@ func cmdbootstrap() {
> -       }
> -
> -       // Remove go_bootstrap now that we're done.
> --      xremove(pathf("%s/go_bootstrap", tooldir))
> -+      // Except that for split host/target cross-builds, we need to
> -+      // keep it.
> -+      if ! crossBuild {
> -+              xremove(pathf("%s/go_bootstrap", tooldir))
> -+      }
> -
> -       // Print trailing banner unless instructed otherwise.
> -       if !noBanner {
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
> deleted file mode 100644
> index 29ef947abd..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From 7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Fri, 2 Mar 2018 06:00:20 -0800
> -Subject: [PATCH] cmd/go: make GOROOT precious by default
> -
> -The go build tool normally rebuilds whatever it detects is
> -stale.  This can be a problem when GOROOT is intended to
> -be read-only and the go runtime has been built as a shared
> -library, since we don't want every application to be rebuilding
> -the shared runtime - particularly in cross-build/packaging
> -setups, since that would lead to 'abi mismatch' runtime errors.
> -
> -This patch prevents the install and linkshared actions from
> -installing to GOROOT unless overridden with the GOROOT_OVERRIDE
> -environment variable.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/cmd/go/internal/work/action.go |  3 +++
> - src/cmd/go/internal/work/build.go  |  5 +++++
> - src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
> - 3 files changed, 33 insertions(+)
> -
> -Index: go/src/cmd/go/internal/work/action.go
> -===================================================================
> ---- go.orig/src/cmd/go/internal/work/action.go
> -+++ go/src/cmd/go/internal/work/action.go
> -@@ -600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(
> -                       if p1 == nil || p1.Shlib == "" ||
> haveShlib[filepath.Base(p1.Shlib)] {
> -                               continue
> -                       }
> -+                      if goRootPrecious && (p1.Standard || p1.Goroot) {
> -+                              continue
> -+                      }
> -                       haveShlib[filepath.Base(p1.Shlib)] = true
> -                       // TODO(rsc): The use of ModeInstall here is
> suspect, but if we only do ModeBuild,
> -                       // we'll end up building an overall library or
> executable that depends at runtime
> -Index: go/src/cmd/go/internal/work/build.go
> -===================================================================
> ---- go.orig/src/cmd/go/internal/work/build.go
> -+++ go/src/cmd/go/internal/work/build.go
> -@@ -147,6 +147,7 @@ See also: go install, go get, go clean.
> - }
> -
> - const concurrentGCBackendCompilationEnabledByDefault = true
> -+var goRootPrecious bool = true
> -
> - func init() {
> -       // break init cycle
> -@@ -160,6 +161,10 @@ func init() {
> -
> -       AddBuildFlags(CmdBuild)
> -       AddBuildFlags(CmdInstall)
> -+
> -+      if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
> -+              goRootPrecious = false
> -+      }
> - }
> -
> - // Note that flags consulted by other parts of the code
> -Index: go/src/cmd/go/internal/work/exec.go
> -===================================================================
> ---- go.orig/src/cmd/go/internal/work/exec.go
> -+++ go/src/cmd/go/internal/work/exec.go
> -@@ -436,6 +436,23 @@ func (b *Builder) build(a *Action) (err
> -               return fmt.Errorf("missing or invalid binary-only package;
> expected file %q", a.Package.Target)
> -       }
> -
> -+      if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> -+              _, err := os.Stat(a.Package.Target)
> -+              if err == nil {
> -+                      a.built = a.Package.Target
> -+                      a.Target = a.Package.Target
> -+                      a.buildID = b.fileHash(a.Package.Target)
> -+                      a.Package.Stale = false
> -+                      a.Package.StaleReason = "GOROOT-resident package"
> -+                      return nil
> -+              }
> -+              a.Package.Stale = true
> -+              a.Package.StaleReason = "missing or invalid
> GOROOT-resident package"
> -+              if b.IsCmdList {
> -+                      return nil
> -+              }
> -+      }
> -+
> -       if err := b.Mkdir(a.Objdir); err != nil {
> -               return err
> -       }
> -@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a *Act
> -               return nil
> -       }
> -
> -+      if goRootPrecious && a.Package != nil {
> -+              p := a.Package
> -+              if p.Standard || p.Goroot {
> -+                      err := fmt.Errorf("attempting to install package
> %s into read-only GOROOT", p.ImportPath)
> -+                      return err
> -+              }
> -+      }
> -+
> -       if err := b.Mkdir(a.Objdir); err != nil {
> -               return err
> -       }
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
> b/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
> deleted file mode 100644
> index 225cf439c5..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 26 Oct 2018 15:02:32 +0800
> -Subject: [PATCH] use GOBUILDMODE to set buildmode
> -
> -While building go itself, the go build system does not support
> -to set `-buildmode=pie' from environment.
> -
> -Add GOBUILDMODE to support it which make PIE executables the default
> -build mode, as PIE executables are required as of Yocto
> -
> -Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
> -Upstream-Status
> <https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI-Upstream-Status>:
> Denied [upstream choose antoher solution: `17a256b
> -cmd/go: -buildmode=pie for android/arm']
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - src/cmd/go/internal/work/build.go | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -Index: go/src/cmd/go/internal/work/build.go
> -===================================================================
> ---- go.orig/src/cmd/go/internal/work/build.go
> -+++ go/src/cmd/go/internal/work/build.go
> -@@ -223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {
> -
> -       cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> -       cmd.Flag.Var(buildCompiler{}, "compiler", "")
> --      cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
> -+      if bm := os.Getenv("GOBUILDMODE"); bm != "" {
> -+              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm,
> "")
> -+      } else {
> -+              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode",
> "default", "")
> -+      }
> -       cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
> -       cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
> -       cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> b/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> deleted file mode 100644
> index 840cf4bbd7..0000000000
> ---
> a/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From 35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 2001
> -From: Matt Madison <matt@madison.systems>
> -Date: Sun, 18 Feb 2018 08:24:05 -0800
> -Subject: [PATCH] ld: replace glibc dynamic linker with musl
> -
> -Rework of patch by Khem Raj <raj.khem@gmail.com>
> -for go 1.10.  Should be applied conditionally on
> -musl being the system C library.
> -
> -Upstream-Status: Inappropriate [Real fix should be portable across libcs]
> -
> -Signed-off-by: Matt Madison <matt@madison.systems>
> -
> ----
> - src/cmd/link/internal/amd64/obj.go  | 2 +-
> - src/cmd/link/internal/arm/obj.go    | 2 +-
> - src/cmd/link/internal/arm64/obj.go  | 2 +-
> - src/cmd/link/internal/mips/obj.go   | 2 +-
> - src/cmd/link/internal/mips64/obj.go | 2 +-
> - src/cmd/link/internal/ppc64/obj.go  | 2 +-
> - src/cmd/link/internal/s390x/obj.go  | 2 +-
> - src/cmd/link/internal/x86/obj.go    | 2 +-
> - 8 files changed, 8 insertions(+), 8 deletions(-)
> -
> ---- a/src/cmd/link/internal/amd64/obj.go
> -+++ b/src/cmd/link/internal/amd64/obj.go
> -@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               PEreloc1:         pereloc1,
> -               TLSIEtoLE:        tlsIEtoLE,
> -
> --              Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
> -+              Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
> -               Freebsddynld:   "/libexec/ld-elf.so.1",
> -               Openbsddynld:   "/usr/libexec/ld.so",
> -               Netbsddynld:    "/libexec/ld.elf_so",
> ---- a/src/cmd/link/internal/arm/obj.go
> -+++ b/src/cmd/link/internal/arm/obj.go
> -@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Machoreloc1:      machoreloc1,
> -               PEreloc1:         pereloc1,
> -
> --              Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for
> EABI
> -+              Linuxdynld:     "/lib/ld-musl-armhf.so.1",
> -               Freebsddynld:   "/usr/libexec/ld-elf.so.1",
> -               Openbsddynld:   "/usr/libexec/ld.so",
> -               Netbsddynld:    "/libexec/ld.elf_so",
> ---- a/src/cmd/link/internal/arm64/obj.go
> -+++ b/src/cmd/link/internal/arm64/obj.go
> -@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Gentext:          gentext,
> -               Machoreloc1:      machoreloc1,
> -
> --              Linuxdynld: "/lib/ld-linux-aarch64.so.1",
> -+              Linuxdynld: "/lib/ld-musl-aarch64.so.1",
> -
> -               Freebsddynld:   "XXX",
> -               Openbsddynld:   "XXX",
> ---- a/src/cmd/link/internal/mips/obj.go
> -+++ b/src/cmd/link/internal/mips/obj.go
> -@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Gentext:          gentext,
> -               Machoreloc1:      machoreloc1,
> -
> --              Linuxdynld: "/lib/ld.so.1",
> -+              Linuxdynld: "/lib/ld-musl-mipsle.so.1",
> -
> -               Freebsddynld:   "XXX",
> -               Openbsddynld:   "XXX",
> ---- a/src/cmd/link/internal/mips64/obj.go
> -+++ b/src/cmd/link/internal/mips64/obj.go
> -@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Gentext:          gentext,
> -               Machoreloc1:      machoreloc1,
> -
> --              Linuxdynld:     "/lib64/ld64.so.1",
> -+              Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
> -               Freebsddynld:   "XXX",
> -               Openbsddynld:   "XXX",
> -               Netbsddynld:    "XXX",
> ---- a/src/cmd/link/internal/ppc64/obj.go
> -+++ b/src/cmd/link/internal/ppc64/obj.go
> -@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Machoreloc1:      machoreloc1,
> -
> -               // TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
> --              Linuxdynld: "/lib64/ld64.so.1",
> -+              Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
> -
> -               Freebsddynld:   "XXX",
> -               Openbsddynld:   "XXX",
> ---- a/src/cmd/link/internal/s390x/obj.go
> -+++ b/src/cmd/link/internal/s390x/obj.go
> -@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Gentext:          gentext,
> -               Machoreloc1:      machoreloc1,
> -
> --              Linuxdynld: "/lib64/ld64.so.1",
> -+              Linuxdynld: "/lib64/ld-musl-s390x.so.1",
> -
> -               // not relevant for s390x
> -               Freebsddynld:   "XXX",
> ---- a/src/cmd/link/internal/x86/obj.go
> -+++ b/src/cmd/link/internal/x86/obj.go
> -@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> -               Machoreloc1:      machoreloc1,
> -               PEreloc1:         pereloc1,
> -
> --              Linuxdynld:   "/lib/ld-linux.so.2",
> -+              Linuxdynld:   "/lib/ld-musl-i386.so.1",
> -               Freebsddynld: "/usr/libexec/ld-elf.so.1",
> -               Openbsddynld: "/usr/libexec/ld.so",
> -               Netbsddynld:  "/usr/libexec/ld.elf_so",
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.12.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.12.bb
> deleted file mode 100644
> index 7ac9449e47..0000000000
> --- a/meta/recipes-devtools/go/go-cross-canadian_1.12.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require go-cross-canadian.inc
> -require go-${PV}.inc
> diff --git a/meta/recipes-devtools/go/go-cross_1.12.bb
> b/meta/recipes-devtools/go/go-cross_1.12.bb
> deleted file mode 100644
> index 80b5a03f6c..0000000000
> --- a/meta/recipes-devtools/go/go-cross_1.12.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require go-cross.inc
> -require go-${PV}.inc
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.12.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.12.bb
> deleted file mode 100644
> index 1857c8a577..0000000000
> --- a/meta/recipes-devtools/go/go-crosssdk_1.12.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require go-crosssdk.inc
> -require go-${PV}.inc
> diff --git a/meta/recipes-devtools/go/go-native_1.12.bb
> b/meta/recipes-devtools/go/go-native_1.12.bb
> deleted file mode 100644
> index bbf3c0dd73..0000000000
> --- a/meta/recipes-devtools/go/go-native_1.12.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require ${PN}.inc
> -require go-${PV}.inc
> diff --git a/meta/recipes-devtools/go/go-runtime_1.12.bb
> b/meta/recipes-devtools/go/go-runtime_1.12.bb
> deleted file mode 100644
> index 43b68b4e46..0000000000
> --- a/meta/recipes-devtools/go/go-runtime_1.12.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require go-${PV}.inc
> -require go-runtime.inc
> diff --git a/meta/recipes-devtools/go/go_1.12.bb
> b/meta/recipes-devtools/go/go_1.12.bb
> deleted file mode 100644
> index 42cdb0430a..0000000000
> --- a/meta/recipes-devtools/go/go_1.12.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require go-${PV}.inc
> -require go-target.inc
> -
> -export GOBUILDMODE=""
> -
> -# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
> -# doesn't support -buildmode=pie, so skip the QA checking for mips and its
> -# variants.
> -python() {
> -    if 'mips' in d.getVar('TARGET_ARCH'):
> -        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
> -    else:
> -        d.setVar('GOBUILDMODE', 'pie')
> -}
> --
> 2.17.1 (Apple Git-112)
>
>

--00000000000067e4e70595bcfff6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch worked fine until a `bitbake -c cleanall`. I&#3=
9;m investigating the root cause right now; please do not merge.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct=
 25, 2019 at 6:29 PM Alexander Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com">alexander.j.kube@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Alex Kube &lt;<a href=3D"mailto:=
alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a=
>&gt;<br>
<br>
Signed-off-by: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" =
target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.12.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 24 --<br>
=C2=A0...ow-CC-and-CXX-to-have-multiple-words.patch |=C2=A0 31 --<br>
=C2=A0...o1.12-security-net-textproto-don-t-n.patch | 163 ----------<br>
=C2=A0...ent-based-hash-generation-less-pedan.patch | 218 --------------<br=
>
=C2=A0...-to-be-overridden-in-the-environment.patch |=C2=A0 48 ---<br>
=C2=A0...4-ld-add-soname-to-shareable-objects.patch |=C2=A0 45 ---<br>
=C2=A0...de-CC-when-building-dist-and-go_boot.patch |=C2=A0 37 ---<br>
=C2=A0...dist-separate-host-and-target-builds.patch | 282 -----------------=
-<br>
=C2=A0...d-go-make-GOROOT-precious-by-default.patch | 106 -------<br>
=C2=A0...008-use-GOBUILDMODE-to-set-buildmode.patch |=C2=A0 37 ---<br>
=C2=A0...place-glibc-dynamic-linker-with-musl.patch | 112 -------<br>
=C2=A0.../go/<a href=3D"http://go-cross-canadian_1.12.bb" rel=3D"noreferrer=
" target=3D"_blank">go-cross-canadian_1.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-cross_1.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-cross_1.12.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">go-crosssdk_1.12.bb</a>=C2=A0 |=C2=A0 =C2=
=A02 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-native_1.12.bb" rel=3D"=
noreferrer" target=3D"_blank">go-native_1.12.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.12.bb" rel=3D=
"noreferrer" target=3D"_blank">go-runtime_1.12.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.12.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 14 -<br>
=C2=A017 files changed, 1127 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0001-allow-CC-and=
-CXX-to-have-multiple-words.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-bran=
ch.go1.12-security-net-textproto-don-t-n.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-=
content-based-hash-generation-less-pedan.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOL=
DIR-to-be-overridden-in-the-environment.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0004-ld-add-sonam=
e-to-shareable-objects.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0005-make.bash-ov=
erride-CC-when-building-dist-and-go_boot.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0006-cmd-dist-sep=
arate-host-and-target-builds.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-=
GOROOT-precious-by-default.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDM=
ODE-to-set-buildmode.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.12/0009-ld-replace-g=
libc-dynamic-linker-with-musl.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
s-canadian_1.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_=
1.12.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
s_1.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.12.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
ssdk_1.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.12.bb</a><=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-nati=
ve_1.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.12.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-runt=
ime_1.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.12.bb</a><br=
>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go_1.12=
.bb" rel=3D"noreferrer" target=3D"_blank">go_1.12.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/g=
o/go-1.12.inc<br>
deleted file mode 100644<br>
index ed14b175e6..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12.inc<br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-require go-common.inc<br>
-<br>
-GO_BASEVERSION =3D &quot;1.12&quot;<br>
-GO_MINOR =3D &quot;.9&quot;<br>
-PV .=3D &quot;${GO_MINOR}&quot;<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSION}:&q=
uot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0d=
d74707&quot;<br>
-<br>
-SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \<=
br>
-=C2=A0 =C2=A0 file://0002-cmd-go-make-content-based-hash-generation-less-p=
edan.patch \<br>
-=C2=A0 =C2=A0 file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environm=
ent.patch \<br>
-=C2=A0 =C2=A0 file://0004-ld-add-soname-to-shareable-objects.patch \<br>
-=C2=A0 =C2=A0 file://0005-make.bash-override-CC-when-building-dist-and-go_=
boot.patch \<br>
-=C2=A0 =C2=A0 file://0006-cmd-dist-separate-host-and-target-builds.patch \=
<br>
-=C2=A0 =C2=A0 file://0007-cmd-go-make-GOROOT-precious-by-default.patch \<b=
r>
-=C2=A0 =C2=A0 file://0008-use-GOBUILDMODE-to-set-buildmode.patch \<br>
-=C2=A0 =C2=A0 file://0001-release-branch.go1.12-security-net-textproto-don=
-t-n.patch \<br>
-&quot;<br>
-SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc-dynamic-l=
inker-with-musl.patch&quot;<br>
-<br>
-SRC_URI[main.md5sum] =3D &quot;6132109d4050da349eadc9f7b0304ef4&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;ab0e56ed9c4732a653ed22e232652709afbf573e=
710f56a07f7fdeca578d62fc&quot;<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have=
-multiple-words.patch b/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-=
CXX-to-have-multiple-words.patch<br>
deleted file mode 100644<br>
index 4442858c83..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0001-allow-CC-and-CXX-to-have-multip=
le-words.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From 7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Mon, 19 Feb 2018 08:49:33 -0800<br>
-Subject: [PATCH] allow CC and CXX to have multiple words<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/cmd/go/internal/envcmd/env.go | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcm=
d/env.go<br>
-index afadbad..cedbfbf 100644<br>
---- a/src/cmd/go/internal/envcmd/env.go<br>
-+++ b/src/cmd/go/internal/envcmd/env.go<br>
-@@ -85,11 +85,11 @@ func MkEnv() []cfg.EnvVar {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if env :=3D strings.Fields(os.Getenv(&quot;CC&q=
uot;)); len(env) &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc =3D env[0]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc =3D strings.Join(env,=
 &quot; &quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cxx :=3D cfg.DefaultCXX(cfg.Goos, cfg.Goarch)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if env :=3D strings.Fields(os.Getenv(&quot;CXX&=
quot;)); len(env) &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxx =3D env[0]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxx =3D strings.Join(env=
, &quot; &quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CC&q=
uot;, Value: cc})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CXX&=
quot;, Value: cxx})<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-se=
curity-net-textproto-don-t-n.patch b/meta/recipes-devtools/go/go-1.12/0001-=
release-branch.go1.12-security-net-textproto-don-t-n.patch<br>
deleted file mode 100644<br>
index 7b39dbd734..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-=
net-textproto-don-t-n.patch<br>
+++ /dev/null<br>
@@ -1,163 +0,0 @@<br>
-From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001<br>
-From: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" target=3D=
"_blank">filippo@golang.org</a>&gt;<br>
-Date: Thu, 12 Sep 2019 12:37:36 -0400<br>
-Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don&#39;t=
<br>
- normalize headers with spaces before the colon<br>
-<br>
-RFC 7230 is clear about headers with a space before the colon, like<br>
-<br>
-X-Answer : 42<br>
-<br>
-being invalid, but we&#39;ve been accepting and normalizing them for compa=
tibility<br>
-purposes since CL 5690059 in 2012.<br>
-<br>
-On the client side, this is harmless and indeed most browsers behave the s=
ame<br>
-to this day. On the server side, this becomes a security issue when the<br=
>
-behavior doesn&#39;t match that of a reverse proxy sitting in front of the=
 server.<br>
-<br>
-For example, if a WAF accepts them without normalizing them, it might be<b=
r>
-possible to bypass its filters, because the Go server would interpret the<=
br>
-header differently. Worse, if the reverse proxy coalesces requests onto a<=
br>
-single HTTP/1.1 connection to a Go server, the understanding of the reques=
t<br>
-boundaries can get out of sync between them, allowing an attacker to tack =
an<br>
-arbitrary method and path onto a request by other clients, including<br>
-authentication headers unknown to the attacker.<br>
-<br>
-This was recently presented at multiple security conferences:<br>
-<a href=3D"https://portswigger.net/blog/http-desync-attacks-request-smuggl=
ing-reborn" rel=3D"noreferrer" target=3D"_blank">https://portswigger.net/bl=
og/http-desync-attacks-request-smuggling-reborn</a><br>
-<br>
-net/http servers already reject header keys with invalid characters.<br>
-Simply stop normalizing extra spaces in net/textproto, let it return them<=
br>
-unchanged like it does for other invalid headers, and let net/http enforce=
<br>
-RFC 7230, which is HTTP specific. This loses us normalization on the clien=
t<br>
-side, but there&#39;s no right answer on the client side anyway, and hidin=
g the<br>
-issue sounds worse than letting the application decide.<br>
-<br>
-Fixes CVE-2019-16276<br>
-<br>
-Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1<br>
-Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/549719-Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https:=
//team-review.git.corp.google.com/c/golang/go-private/+/549719<br>
-Reviewed-by</a>: Brad Fitzpatrick &lt;<a href=3D"mailto:bradfitz@google.co=
m" target=3D"_blank">bradfitz@google.com</a>&gt;<br>
-(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)<br>
-Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/558776-Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https:=
//team-review.git.corp.google.com/c/golang/go-private/+/558776<br>
-Reviewed-by</a>: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.co=
m" target=3D"_blank">dmitshur@google.com</a>&gt;<br>
-<br>
-CVE: CVE-2019-16276<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de=
03ad8</a>]<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
----<br>
- src/net/http/serve_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
- src/net/http/transport_test.go=C2=A0 =C2=A0| 27 +++++++++++++++++++++++++=
++<br>
- src/net/textproto/reader.go=C2=A0 =C2=A0 =C2=A0 | 10 ++--------<br>
- src/net/textproto/reader_test.go | 13 ++++++-------<br>
- 4 files changed, 39 insertions(+), 15 deletions(-)<br>
-<br>
-diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go<br>
-index 6eb0088a96..89bfdfbb82 100644<br>
---- a/src/net/http/serve_test.go<br>
-+++ b/src/net/http/serve_test.go<br>
-@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\xffbar: =
foo\r\n&quot;, 400},=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// binary in header<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\x00bar: =
foo\r\n&quot;, 400},=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// binary in header<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Foo: &quot; =
+ strings.Repeat(&quot;x&quot;, 1&lt;&lt;21) + &quot;\r\n&quot;, 431}, // h=
eader too large<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Spaces between the he=
ader key and colon are not allowed.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // See RFC 7230, Section=
 3.2.4.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Foo : bar\r\n&quo=
t;, 400},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Foo\t: bar\r\n&qu=
ot;, 400},<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo: foo foo=
\r\n&quot;, 200},=C2=A0 =C2=A0 // LWS space is okay<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo: foo\tfo=
o\r\n&quot;, 200},=C2=A0 =C2=A0// LWS tab is okay<br>
-diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.=
go<br>
-index 5c329543e2..5e5438a708 100644<br>
---- a/src/net/http/transport_test.go<br>
-+++ b/src/net/http/transport_test.go<br>
-@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatalf(&quot;timeout after %v waiting for Tra=
nsport connections to die off&quot;, time.Since(t0))<br>
- }<br>
-+<br>
-+func TestInvalidHeaderResponse(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 setParallel(t)<br>
-+=C2=A0 =C2=A0 =C2=A0 defer afterTest(t)<br>
-+=C2=A0 =C2=A0 =C2=A0 cst :=3D newClientServerTest(t, h1Mode, HandlerFunc(=
func(w ResponseWriter, r *Request) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn, buf, _ :=3D w.(Hij=
acker).Hijack()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf.Write([]byte(&quot;H=
TTP/1.1 200 OK\r\n&quot; +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n&quot; +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Content-Type: text/html; charset=3Dutf-8\r\n&quot; +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Content-Length: 0\r\n&quot; +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Foo : bar\r\n\r\n&quot;))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf.Flush()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.Close()<br>
-+=C2=A0 =C2=A0 =C2=A0 }))<br>
-+=C2=A0 =C2=A0 =C2=A0 defer cst.close()<br>
-+=C2=A0 =C2=A0 =C2=A0 res, err :=3D cst.c.Get(cst.ts.URL)<br>
-+=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(err)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 defer res.Body.Close()<br>
-+=C2=A0 =C2=A0 =C2=A0 if v :=3D res.Header.Get(&quot;Foo&quot;); v !=3D &q=
uot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(`unexpected &qu=
ot;Foo&quot; header: %q`, v)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if v :=3D res.Header.Get(&quot;Foo &quot;); v !=3D &=
quot;bar&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(`bad &quot;Foo =
&quot; header value: %q, want %q`, v, &quot;bar&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go<br>
-index 2c4f25d5ae..1a5e364cf7 100644<br>
---- a/src/net/textproto/reader.go<br>
-+++ b/src/net/textproto/reader.go<br>
-@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return m, err<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Key ends at first col=
on; should not have trailing spaces<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // but they appear in th=
e wild, violating specs, so we remove<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // them if present.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Key ends at first col=
on.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i :=3D bytes.IndexB=
yte(kv, &#39;:&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i &lt; 0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return m, ProtocolError(&quot;malformed MIME header line: &quot; =
+ string(kv))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endKey :=3D i<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for endKey &gt; 0 &amp;&=
amp; kv[endKey-1] =3D=3D &#39; &#39; {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 endKey--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key :=3D canonicalMIMEHe=
aderKey(kv[:endKey])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key :=3D canonicalMIMEHe=
aderKey(kv[:i])<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// As per RFC 7230 =
field-name is a token, tokens consist of one or more chars.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// We could return =
a ProtocolError here, but better to be liberal in what we<br>
-diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_t=
est.go<br>
-index f85fbdc36d..b92fdcd3c7 100644<br>
---- a/src/net/textproto/reader_test.go<br>
-+++ b/src/net/textproto/reader_test.go<br>
-@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--// Test that we read slightly-bogus MIME headers seen in the wild,<br>
--// with spaces before colons, and spaces in keys.<br>
-+// TestReadMIMEHeaderNonCompliant checks that we don&#39;t normalize head=
ers<br>
-+// with spaces before colons, and accept spaces in keys.<br>
- func TestReadMIMEHeaderNonCompliant(t *testing.T) {<br>
--=C2=A0 =C2=A0 =C2=A0 // Invalid HTTP response header as sent by an Axis s=
ecurity<br>
--=C2=A0 =C2=A0 =C2=A0 // camera: (this is handled by IE, Firefox, Chrome, =
curl, etc.)<br>
-+=C2=A0 =C2=A0 =C2=A0 // These invalid headers will be rejected by net/htt=
p according to RFC 7230.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r :=3D reader(&quot;Foo: bar\r\n&quot; +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Content-Langu=
age: en\r\n&quot; +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;SID : 0\r\n&q=
uot; +<br>
-@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0want :=3D MIMEHeader{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Foo&quot;:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;bar&quot;},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Content-Langu=
age&quot;: {&quot;en&quot;},<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Sid&quot;:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;0&quot;},<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Audio Mode&quot;:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;None&quot;},<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Privilege&quot;:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;127&quot;},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SID &quot;:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;0&quot;},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Audio Mode &quot;:=
=C2=A0 =C2=A0 =C2=A0 {&quot;None&quot;},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Privilege &quot;:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;127&quot;},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if !reflect.DeepEqual(m, want) || err !=3D nil =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatalf(&quot;Read=
MIMEHeader =3D\n%v, %v; want:\n%v&quot;, m, err, want)<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-base=
d-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.12/0002-=
cmd-go-make-content-based-hash-generation-less-pedan.patch<br>
deleted file mode 100644<br>
index 66b8561874..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0002-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
+++ /dev/null<br>
@@ -1,218 +0,0 @@<br>
-From 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Mon, 19 Feb 2018 08:50:59 -0800<br>
-Subject: [PATCH] cmd/go: make content-based hash generation less pedantic<=
br>
-<br>
-Go 1.10&#39;s build tool now uses content-based hashes to<br>
-determine when something should be built or re-built.<br>
-This same mechanism is used to maintain a built-artifact<br>
-cache for speeding up builds.<br>
-<br>
-However, the hashes it generates include information that<br>
-doesn&#39;t work well with OE, nor with using a shared runtime<br>
-library.<br>
-<br>
-First, it embeds path names to source files, unless<br>
-building within GOROOT.=C2=A0 This prevents the building<br>
-of a package in GOPATH for later staging into GOROOT.<br>
-<br>
-This patch adds support for the environment variable<br>
-GOPATH_OMIT_IN_ACTIONID.=C2=A0 If present, path name<br>
-embedding is disabled.<br>
-<br>
-Second, if cgo is enabled, the build ID for cgo-related<br>
-packages will include the current value of the environment<br>
-variables for invoking the compiler (CC, CXX, FC) and<br>
-any CGO_xxFLAGS variables.=C2=A0 Only if the settings used<br>
-during a compilation exactly match, character for character,<br>
-the values used for compiling runtime/cgo or any other<br>
-cgo-enabled package being imported, will the tool<br>
-decide that the imported package is up-to-date.<br>
-<br>
-This is done to help ensure correctness, but is overly<br>
-simplistic and effectively prevents the reuse of built<br>
-artifacts that use cgo (or shared runtime, which includes<br>
-runtime/cgo).<br>
-<br>
-This patch filters out all compiler flags except those<br>
-beginning with &#39;-m&#39;.=C2=A0 The default behavior can be restored<br=
>
-by setting the CGO_PEDANTIC environment variable.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/cmd/go/internal/envcmd/env.go |=C2=A0 2 +-<br>
- src/cmd/go/internal/work/exec.go=C2=A0 | 63 ++++++++++++++++++++++-------=
--<br>
- 2 files changed, 46 insertions(+), 19 deletions(-)<br>
-<br>
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcm=
d/env.go<br>
-index cedbfbf..5763a0d 100644<br>
---- a/src/cmd/go/internal/envcmd/env.go<br>
-+++ b/src/cmd/go/internal/envcmd/env.go<br>
-@@ -128,7 +128,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
- func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var b work.Builder<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0b.Init()<br>
--=C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxflags, fflags, ldflags, err :=
=3D b.CFlags(&amp;load.Package{})<br>
-+=C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxflags, fflags, ldflags, err :=
=3D b.CFlags(&amp;load.Package{}, false)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Should not happe=
n - b.CFlags was given an empty package.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(os.Stde=
rr, &quot;go: invalid cflags: %v\n&quot;, err)<br>
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/e=
xec.go<br>
-index 12e1527..e41bfac 100644<br>
---- a/src/cmd/go/internal/work/exec.go<br>
-+++ b/src/cmd/go/internal/work/exec.go<br>
-@@ -174,6 +174,8 @@ func (b *Builder) Do(root *Action) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wg.Wait()<br>
- }<br>
- <br>
-+var omitGopath =3D os.Getenv(&quot;GOPATH_OMIT_IN_ACTIONID&quot;) !=3D &q=
uot;&quot;<br>
-+<br>
- // buildActionID computes the action ID for a build action.<br>
- func (b *Builder) buildActionID(a *Action) cache.ActionID {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
-@@ -190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action) cache.Actio=
nID {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// but it does not hide the exact value of $GOP=
ATH.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Include the full dir in that case.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Assume b.WorkDir is being trimmed properly.<=
br>
--=C2=A0 =C2=A0 =C2=A0 if !p.Goroot &amp;&amp; !strings.HasPrefix(p.Dir, b.=
WorkDir) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if !p.Goroot &amp;&amp; !omitGopath &amp;&amp; !stri=
ngs.HasPrefix(p.Dir, b.WorkDir) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;dir %s\n&quot;, p.Dir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;goos %s goarch %s\n&quot;,=
 cfg.Goos, cfg.Goarch)<br>
-@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a *Action) cache.Act=
ionID {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;cgo %q\n&quot;, b.toolID(&quot;cgo&quot;))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxfla=
gs, fflags, ldflags, _ :=3D b.CFlags(p)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q %q\n&quot;, b.ccExe(), cppflags, cflags, ldflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, cxxfla=
gs, fflags, ldflags, _ :=3D b.CFlags(p, true)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q %q\n&quot;, b.ccExe(true), cppflags, cflags, ldflags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFiles)+=
len(p.SwigFiles) &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(), cxxflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(true), cxxflags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.FFiles) &g=
t; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(), fflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(true), fflags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(rsc): Shoul=
d we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versi=
ons?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2096,33 +2098,33 @@ var (<br>
- // gccCmd returns a gcc command line prefix<br>
- // defaultCC is defined in zdefaultcc.go, written by cmd/dist.<br>
- func (b *Builder) GccCmd(incdir, workdir string) []string {<br>
--=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.ccExe(), incdir, workdir)<br>
-+=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.ccExe(false), incdir, workdir=
)<br>
- }<br>
- <br>
- // gxxCmd returns a g++ command line prefix<br>
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
- func (b *Builder) GxxCmd(incdir, workdir string) []string {<br>
--=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.cxxExe(), incdir, workdir)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.cxxExe(false), incdir, workdi=
r)<br>
- }<br>
- <br>
- // gfortranCmd returns a gfortran command line prefix.<br>
- func (b *Builder) gfortranCmd(incdir, workdir string) []string {<br>
--=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.fcExe(), incdir, workdir)<br>
-+=C2=A0 =C2=A0 =C2=A0 return b.compilerCmd(b.fcExe(false), incdir, workdir=
)<br>
- }<br>
- <br>
- // ccExe returns the CC compiler setting without all the extra flags we a=
dd implicitly.<br>
--func (b *Builder) ccExe() []string {<br>
--=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos,=
 cfg.Goarch))<br>
-+func (b *Builder) ccExe(filtered bool) []string {<br>
-+=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos,=
 cfg.Goarch), filtered)<br>
- }<br>
- <br>
- // cxxExe returns the CXX compiler setting without all the extra flags we=
 add implicitly.<br>
--func (b *Builder) cxxExe() []string {<br>
--=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goo=
s, cfg.Goarch))<br>
-+func (b *Builder) cxxExe(filtered bool) []string {<br>
-+=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goo=
s, cfg.Goarch), filtered)<br>
- }<br>
- <br>
- // fcExe returns the FC compiler setting without all the extra flags we a=
dd implicitly.<br>
--func (b *Builder) fcExe() []string {<br>
--=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(os.Getenv(&quot;FC&quot;), &quo=
t;gfortran&quot;)<br>
-+func (b *Builder) fcExe(filtered bool) []string {<br>
-+=C2=A0 =C2=A0 =C2=A0 return b.compilerExe(os.Getenv(&quot;FC&quot;), &quo=
t;gfortran&quot;, filtered)<br>
- }<br>
- <br>
- // compilerExe returns the compiler to use given an<br>
-@@ -2131,11 +2133,14 @@ func (b *Builder) fcExe() []string {<br>
- // of the compiler but can have additional arguments if they<br>
- // were present in the environment value.<br>
- // For example if CC=3D&quot;gcc -DGOPHER&quot; then the result is [&quot=
;gcc&quot;, &quot;-DGOPHER&quot;].<br>
--func (b *Builder) compilerExe(envValue string, def string) []string {<br>
-+func (b *Builder) compilerExe(envValue string, def string, filtered bool)=
 []string {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0compiler :=3D strings.Fields(envValue)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(compiler) =3D=3D 0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler =3D []stri=
ng{def}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 if filtered {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return append(compiler[0=
:1], filterCompilerFlags(compiler[1:])...)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return compiler<br>
- }<br>
- <br>
-@@ -2285,8 +2290,23 @@ func envList(key, def string) []string {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return strings.Fields(v)<br>
- }<br>
- <br>
-+var filterFlags =3D os.Getenv(&quot;CGO_PEDANTIC&quot;) =3D=3D &quot;&quo=
t;<br>
-+<br>
-+func filterCompilerFlags(flags []string) []string {<br>
-+=C2=A0 =C2=A0 =C2=A0 var newflags []string<br>
-+=C2=A0 =C2=A0 =C2=A0 if !filterFlags {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return flags<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 for _, flag :=3D range flags {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(fla=
g, &quot;-m&quot;) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 newflags =3D append(newflags, flag)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return newflags<br>
-+}<br>
-+<br>
- // CFlags returns the flags to use when invoking the C, C++ or Fortran co=
mpilers, or cgo.<br>
--func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, ff=
lags, ldflags []string, err error) {<br>
-+func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflag=
s, cxxflags, fflags, ldflags []string, err error) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults :=3D &quot;-g -O2&quot;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLAGS&=
quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<br>
-@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags=
, cflags, cxxflags, fflags, l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ldflags, err =3D buildFlags(&quot;LDFLAGS&qu=
ot;, defaults, p.CgoLDFLAGS, checkLinkerFlags); err !=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 if filtered {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags =3D filterCompi=
lerFlags(cppflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags =3D filterCompile=
rFlags(cflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxxflags =3D filterCompi=
lerFlags(cxxflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflags =3D filterCompile=
rFlags(fflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldflags =3D filterCompil=
erFlags(ldflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
- }<br>
-@@ -2319,7 +2346,7 @@ var cgoRe =3D regexp.MustCompile(`[/\\:]`)<br>
- <br>
- func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLA=
GS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj [=
]string, err error) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
--=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoL=
DFLAGS, err :=3D b.CFlags(p)<br>
-+=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoL=
DFLAGS, err :=3D b.CFlags(p, false)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, nil, er=
r<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2679,7 +2706,7 @@ func (b *Builder) swigIntSize(objdir string) (intsiz=
e string, err error) {<br>
- <br>
- // Run SWIG on one SWIG input file.<br>
- func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string=
, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err e=
rror) {<br>
--=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D =
b.CFlags(p)<br>
-+=C2=A0 =C2=A0 =C2=A0 cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D =
b.CFlags(p, false)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;=
, &quot;&quot;, err<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-ov=
erridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.12/0003-a=
llow-GOTOOLDIR-to-be-overridden-in-the-environment.patch<br>
deleted file mode 100644<br>
index b6ca40edee..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0003-allow-GOTOOLDIR-to-be-overridde=
n-in-the-environment.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Sat, 17 Feb 2018 05:24:20 -0800<br>
-Subject: [PATCH] allow GOTOOLDIR to be overridden in the environment<br>
-<br>
-to allow for split host/target build roots<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/cmd/dist/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
- src/cmd/go/internal/cfg/cfg.go | 7 +++++--<br>
- 2 files changed, 8 insertions(+), 3 deletions(-)<br>
-<br>
-Index: go/src/cmd/dist/build.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/dist/build.go<br>
-+++ go/src/cmd/dist/build.go<br>
-@@ -228,7 +228,9 @@ func xinit() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D xworkdir()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xatexit(rmworkdir)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, gor=
oot, gohostos, gohostarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); too=
ldir =3D=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;=
%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- }<br>
- <br>
- // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
-Index: go/src/cmd/go/internal/cfg/cfg.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/go/internal/cfg/cfg.go<br>
-+++ go/src/cmd/go/internal/cfg/cfg.go<br>
-@@ -116,7 +116,11 @@ func init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// variables. This =
matches the initialization of ToolDir in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// go/build, except=
 for using GOROOT rather than<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// runtime.GOROOT.<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.ToolDir =3D filepa=
th.Join(GOROOT, &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+runtime.GO=
ARCH)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if s :=3D os.Getenv(&quo=
t;GOTOOLDIR&quot;); s !=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 build.ToolDir =3D filepath.Clean(s)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 build.ToolDir =3D filepath.Join(GOROOT, &quot;pkg/tool/&quot;+runtime.G=
OOS+&quot;_&quot;+runtime.GOARCH)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
diff --git a/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareab=
le-objects.patch b/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-s=
hareable-objects.patch<br>
deleted file mode 100644<br>
index 004a33a023..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0004-ld-add-soname-to-shareable-obje=
cts.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From 55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Sat, 17 Feb 2018 06:26:10 -0800<br>
-Subject: [PATCH] ld: add soname to shareable objects<br>
-<br>
-so that OE&#39;s shared library dependency handling<br>
-can find them.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/cmd/link/internal/ld/lib.go | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/li=
b.go<br>
-index 220aab3..703925f 100644<br>
---- a/src/cmd/link/internal/ld/lib.go<br>
-+++ b/src/cmd/link/internal/ld/lib.go<br>
-@@ -1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ctxt.HeadType !=3D objabi.Hwindows {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Pass -z nodelete to mark the share=
d library as<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// non-closeable: a dlclose will do n=
othing.<br>
-@@ -1146,6 +1147,8 @@ func (ctxt *Link) hostlink() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(arg=
v, &quot;-shared&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(argv, fm=
t.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.Base(*flagOutfile)))<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case BuildModePlugin:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ctxt.HeadType =
=3D=3D objabi.Hdarwin {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
-@@ -1154,6 +1157,7 @@ func (ctxt *Link) hostlink() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,re=
lro&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv =3D append(argv, fmt.Sprintf(&quot;-Wl,-soname,%s&quot;, filepath.=
Base(*flagOutfile)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
diff --git a/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-wh=
en-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.12/0005-=
make.bash-override-CC-when-building-dist-and-go_boot.patch<br>
deleted file mode 100644<br>
index ace8de9eae..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0005-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Sat, 17 Feb 2018 06:32:45 -0800<br>
-Subject: [PATCH] make.bash: override CC when building dist and go_bootstra=
p<br>
-<br>
-for handling OE cross-canadian builds.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/make.bash | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/make.bash b/src/make.bash<br>
-index 78882d9..25943d0 100755<br>
---- a/src/make.bash<br>
-+++ b/src/make.bash<br>
-@@ -163,7 +163,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOROOT&q=
uot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
- fi<br>
- rm -f cmd/dist/dist<br>
--GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot=
;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dist/dist ./cmd/d=
ist<br>
-+CC=3D&quot;${BUILD_CC:-${CC}}&quot; GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot=
; GOOS=3D&quot;&quot; GOARCH=3D&quot;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&=
quot; build -o cmd/dist/dist ./cmd/dist<br>
- <br>
- # -e doesn&#39;t propagate out of eval, so check success by hand.<br>
- eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
-@@ -194,7 +194,7 @@ fi<br>
- # Run dist bootstrap to complete make.bash.<br>
- # Bootstrap installs a proper cmd/dist, built with the new toolchain.<br>
- # Throw ours, built with Go 1.4, away after bootstrap.<br>
--./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;<b=
r>
-+CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap $buildall $=
vflag $GO_DISTFLAGS &quot;$@&quot;<br>
- rm -f ./cmd/dist/dist<br>
- <br>
- # DO NOT ADD ANY NEW CODE HERE.<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-a=
nd-target-builds.patch b/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-sep=
arate-host-and-target-builds.patch<br>
deleted file mode 100644<br>
index 0c0d5da80a..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0006-cmd-dist-separate-host-and-targ=
et-builds.patch<br>
+++ /dev/null<br>
@@ -1,282 +0,0 @@<br>
-From fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Sat, 17 Feb 2018 10:03:48 -0800<br>
-Subject: [PATCH] cmd/dist: separate host and target builds<br>
-<br>
-Change the dist tool to allow for OE-style cross-<br>
-and cross-canadian builds:<br>
-<br>
- - command flags --host-only and --target only are added;<br>
-=C2=A0 =C2=A0if one is present, the other changes mentioned below<br>
-=C2=A0 =C2=A0take effect, and arguments may also be specified on<br>
-=C2=A0 =C2=A0the command line to enumerate the package(s) to be<br>
-=C2=A0 =C2=A0built.<br>
-<br>
- - for OE cross builds, go_bootstrap is always built for<br>
-=C2=A0 =C2=A0the current build host, and is moved, along with the supporti=
ng<br>
-=C2=A0 =C2=A0toolchain (asm, compile, etc.) to a separate &#39;native_nati=
ve&#39;<br>
-=C2=A0 =C2=A0directory under GOROOT/pkg/tool.<br>
-<br>
- - go_bootstrap is not automatically removed after the build,<br>
-=C2=A0 =C2=A0so it can be reused later (e.g., building both static and<br>
-=C2=A0 =C2=A0shared runtime).<br>
-<br>
-Note that for --host-only builds, it would be nice to specify<br>
-just the &quot;cmd&quot; package to build only the go commands/tools,<br>
-the staleness checks in the dist tool will fail if the &quot;std&quot;<br>
-library has not also been built.=C2=A0 So host-only builds have to<br>
-build everything anyway.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
-more dist cleanup<br>
-<br>
----<br>
- src/cmd/dist/build.go | 153 ++++++++++++++++++++++++++++++------------<br=
>
- 1 file changed, 111 insertions(+), 42 deletions(-)<br>
-<br>
-Index: go/src/cmd/dist/build.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/dist/build.go<br>
-+++ go/src/cmd/dist/build.go<br>
-@@ -39,6 +39,7 @@ var (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
-+=C2=A0 =C2=A0 =C2=A0 build_tooldir=C2=A0 =C2=A0 string<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 string<br>
-@@ -50,6 +51,7 @@ var (<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rebuildall=C2=A0 =C2=A0bool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0defaultclang bool<br>
-+=C2=A0 =C2=A0 =C2=A0 crossBuild=C2=A0 =C2=A0bool<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vflag int // verbosity<br>
- )<br>
-@@ -231,6 +233,8 @@ func xinit() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;)=
; tooldir =3D=3D &quot;&quot; {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir =3D pathf(&=
quot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 build_tooldir =3D pathf(&quot;%s/pkg/tool/native_nat=
ive&quot;, goroot)<br>
-+<br>
- }<br>
- <br>
- // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
-@@ -260,7 +264,6 @@ func compilerEnv(envName, def string) ma<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if gohostos !=3D go=
os || gohostarch !=3D goarch {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0m[gohostos+&quot;/&quot;+gohostarch] =3D m[&quot;&quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m[&quot;&quot;] =3D env<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, goos :=3D range okgoos {<br>
-@@ -487,8 +490,10 @@ func setup() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// We keep it in pkg/, just like the object dir=
ectory above.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if rebuildall {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xremoveall(tooldir)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremoveall(build_tooldir=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xmkdirall(tooldir)<br>
-+=C2=A0 =C2=A0 =C2=A0 xmkdirall(build_tooldir)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Remove tool binaries from before the tool/go=
hostos_gohostarch<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xremoveall(pathf(&quot;%s/bin/tool&quot;, goroo=
t))<br>
-@@ -1155,11 +1160,29 @@ func cmdbootstrap() {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var noBanner bool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var debug bool<br>
-+=C2=A0 =C2=A0 =C2=A0 var hostOnly bool<br>
-+=C2=A0 =C2=A0 =C2=A0 var targetOnly bool<br>
-+=C2=A0 =C2=A0 =C2=A0 var toBuild =3D []string { &quot;std&quot;, &quot;cm=
d&quot; }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;rebuildall, &quot;a&quot;, re=
buildall, &quot;rebuild all&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;debug, &quot;d&quot;, debug, =
&quot;enable debugging of bootstrap process&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;noBanner, &quot;no-banner&quo=
t;, noBanner, &quot;do not print banner&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;, h=
ostOnly, &quot;build only host binaries, not target&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;targetOnly, &quot;target-only&quot=
;, targetOnly, &quot;build only target binaries, not host&quot;)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 xflagparse(0)<br>
-+=C2=A0 =C2=A0 =C2=A0 xflagparse(-1)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (hostOnly &amp;&amp; targetOnly) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalf(&quot;specify onl=
y one of --host-only or --target-only\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 crossBuild =3D hostOnly || targetOnly<br>
-+=C2=A0 =C2=A0 =C2=A0 if flag.NArg() &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 toBuild =3D flag.Args()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fatalf(&quot;package names not permitted without --host-only or --targe=
t-only\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// cmd/buildid is u=
sed in debug mode.<br>
-@@ -1207,8 +1230,13 @@ func cmdbootstrap() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n&qu=
ot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(&quot;GO_GCFLAGS&quot;) // w=
e were using $BOOT_GO_GCFLAGS until now<br>
--=C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(&quot;GO_LDFLAGS&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 // For split host/target cross/cross-canadian builds=
, we don&#39;t<br>
-+=C2=A0 =C2=A0 =C2=A0 // want to be setting these flags until after we hav=
e compiled<br>
-+=C2=A0 =C2=A0 =C2=A0 // the toolchain that runs on the build host.<br>
-+=C2=A0 =C2=A0 =C2=A0 if ! crossBuild {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(=
&quot;GO_GCFLAGS&quot;) // we were using $BOOT_GO_GCFLAGS until now<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(=
&quot;GO_LDFLAGS&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goBootstrap :=3D pathf(&quot;%s/go_bootstrap&qu=
ot;, tooldir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdGo :=3D pathf(&quot;%s/go&quot;, gobin)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
-@@ -1237,7 +1265,11 @@ func cmdbootstrap() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n&qu=
ot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;Building Go toolchain2 using go_b=
ootstrap and Go toolchain1.\n&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultc=
c, goos, goarch))<br>
-+=C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, defaultcc[&quot;&quot;])<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, compilerEnvLookup(defaultcc, goos, goarch))<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstrap, append([]string{&quot;-i=
&quot;}, toolchain...)...)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run(&quot;&quot;, S=
howOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dful=
l&quot;)<br>
-@@ -1274,50 +1306,84 @@ func cmdbootstrap() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBootstrap, append(toolchain, &q=
uot;runtime/internal/sys&quot;)...)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldg=
oarch {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Common case - not set=
ting up for cross-compilation.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;toolchain&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 if crossBuild {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(=
&quot;GO_GCFLAGS&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(=
&quot;GO_LDFLAGS&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tool_files, _ :=3D filep=
ath.Glob(pathf(&quot;%s/*&quot;, tooldir))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, f :=3D range tool=
_files {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/%s&quot;, build_tooldir, filepath.Base(f)), f, =
writeExec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xremove(f)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOTOOLDI=
R&quot;, build_tooldir)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goBootstrap =3D pathf(&q=
uot;%s/go_bootstrap&quot;, build_tooldir)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hostOnly {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building %s for host, %s/%s.\n&quot;, strings.Join(toBuil=
d, &quot;,&quot;), goos, goarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Skip cmdGo staleness checks here, since we can&#39;t necessarily run=
 the cmdGo binary<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if targetOnly {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building %s for target, %s/%s.\n&quot;, strings.Join(toBu=
ild, &quot;,&quot;), goos, goarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Skip cmdGo staleness checks here, since we can&#39;t run the target&=
#39;s cmdGo binary<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for %s/%s.\n&quot;, goos, goarch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // GOOS/GOARCH does not =
match GOHOSTOS/GOHOSTARCH.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Finish GOHOSTOS/GOHOS=
TARCH installation and then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // run GOOS/GOARCH insta=
llation.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;host toolchain&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &=
amp;&amp; goarch =3D=3D oldgoarch {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Common case - not setting up for cross-compilation.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;toolchain&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for %s/%s.\n&quot;, goos, =
goarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Finish GOHOSTOS/GOHOSTARCH installation and then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // run GOOS/GOARCH installation.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for host, %s/%s.\n&quot;, =
goos, goarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot;)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for target, %s/%s.\n&quot;=
, goos, goarch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for host, %s/%s.\n&quot;, goos, goarch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstr=
ap, &quot;std&quot;, &quot;cmd&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBoo=
tstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(cmdGo=
, &quot;std&quot;, &quot;cmd&quot;)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot=
;, &quot;target toolchain&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goos =3D oldgoos<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goarch =3D oldgoarch<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOOS&quo=
t;, goos)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOARCH&q=
uot;, goarch)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;=
, compilerEnvLookup(defaultcc, goos, goarch))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for target, %s/%s.\n&quot;, goos, goarch)<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 targets :=3D []string{&quot;std&quot;, &quot;cmd&quo=
t;}<br>
--=C2=A0 =C2=A0 =C2=A0 if goos =3D=3D &quot;js&quot; &amp;&amp; goarch =3D=
=3D &quot;wasm&quot; {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Skip the cmd tools fo=
r js/wasm. They&#39;re not usable.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D targets[:1]<=
br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 goInstall(goBootstrap, targets...)<br>
--=C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstrap, targets...)<br>
--=C2=A0 =C2=A0 =C2=A0 checkNotStale(cmdGo, targets...)<br>
--=C2=A0 =C2=A0 =C2=A0 if debug {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOu=
tput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dfull&quo=
t;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOu=
tput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/=
%s_%s/runtime/internal/sys.a&quot;, goroot, goos, goarch))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstra=
p, append(toolchain, &quot;runtime/internal/sys&quot;)...)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copyfile(pathf(&quot;%s/=
compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, t=
ooldir), &quot;-V=3Dfull&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, t=
ooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goo=
s, goarch))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys=
&quot;)...)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compil=
e&quot;, tooldir), writeExec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Check that there are no new files in $GOROOT=
/bin other than<br>
-@@ -1335,7 +1401,11 @@ func cmdbootstrap() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Remove go_bootstrap now that we&#39;re done.=
<br>
--=C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/go_bootstrap&quot;, tooldir))=
<br>
-+=C2=A0 =C2=A0 =C2=A0 // Except that for split host/target cross-builds, w=
e need to<br>
-+=C2=A0 =C2=A0 =C2=A0 // keep it.<br>
-+=C2=A0 =C2=A0 =C2=A0 if ! crossBuild {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/g=
o_bootstrap&quot;, tooldir))<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Print trailing banner unless instructed othe=
rwise.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if !noBanner {<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-preci=
ous-by-default.patch b/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GO=
ROOT-precious-by-default.patch<br>
deleted file mode 100644<br>
index 29ef947abd..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0007-cmd-go-make-GOROOT-precious-by-=
default.patch<br>
+++ /dev/null<br>
@@ -1,106 +0,0 @@<br>
-From 7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Fri, 2 Mar 2018 06:00:20 -0800<br>
-Subject: [PATCH] cmd/go: make GOROOT precious by default<br>
-<br>
-The go build tool normally rebuilds whatever it detects is<br>
-stale.=C2=A0 This can be a problem when GOROOT is intended to<br>
-be read-only and the go runtime has been built as a shared<br>
-library, since we don&#39;t want every application to be rebuilding<br>
-the shared runtime - particularly in cross-build/packaging<br>
-setups, since that would lead to &#39;abi mismatch&#39; runtime errors.<br=
>
-<br>
-This patch prevents the install and linkshared actions from<br>
-installing to GOROOT unless overridden with the GOROOT_OVERRIDE<br>
-environment variable.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/cmd/go/internal/work/action.go |=C2=A0 3 +++<br>
- src/cmd/go/internal/work/build.go=C2=A0 |=C2=A0 5 +++++<br>
- src/cmd/go/internal/work/exec.go=C2=A0 =C2=A0| 25 +++++++++++++++++++++++=
++<br>
- 3 files changed, 33 insertions(+)<br>
-<br>
-Index: go/src/cmd/go/internal/work/action.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/go/internal/work/action.go<br>
-+++ go/src/cmd/go/internal/work/action.go<br>
-@@ -600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if p1 =3D=3D nil || p1.Shlib =3D=3D &quot;&quot; || haveShlib[fil=
epath.Base(p1.Shlib)] {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if goRootPrecious &amp;&amp; (p1.Standard || p1.Goroot) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0haveShlib[filepath.Base(p1.Shlib)] =3D true<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// TODO(rsc): The use of ModeInstall here is suspect, but if we o=
nly do ModeBuild,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// we&#39;ll end up building an overall library or executable tha=
t depends at runtime<br>
-Index: go/src/cmd/go/internal/work/build.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/go/internal/work/build.go<br>
-+++ go/src/cmd/go/internal/work/build.go<br>
-@@ -147,6 +147,7 @@ See also: go install, go get, go clean.<br>
- }<br>
- <br>
- const concurrentGCBackendCompilationEnabledByDefault =3D true<br>
-+var goRootPrecious bool =3D true<br>
- <br>
- func init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// break init cycle<br>
-@@ -160,6 +161,10 @@ func init() {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AddBuildFlags(CmdBuild)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AddBuildFlags(CmdInstall)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if x :=3D os.Getenv(&quot;GOROOT_OVERRIDE&quot;); x =
!=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goRootPrecious =3D false=
<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- }<br>
- <br>
- // Note that flags consulted by other parts of the code<br>
-Index: go/src/cmd/go/internal/work/exec.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/go/internal/work/exec.go<br>
-+++ go/src/cmd/go/internal/work/exec.go<br>
-@@ -436,6 +436,23 @@ func (b *Builder) build(a *Action) (err<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fmt.Errorf(&=
quot;missing or invalid binary-only package; expected file %q&quot;, a.Pack=
age.Target)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 if goRootPrecious &amp;&amp; (a.Package.Standard || =
a.Package.Goroot) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, err :=3D os.Stat(a.Pa=
ckage.Target)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.built =3D a.Package.Target<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Target =3D a.Package.Target<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.buildID =3D b.fileHash(a.Package.Target)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.Stale =3D false<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a.Package.StaleReason =3D &quot;GOROOT-resident package&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a.Package.Stale =3D true=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a.Package.StaleReason =
=3D &quot;missing or invalid GOROOT-resident package&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if b.IsCmdList {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a *Act<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 if goRootPrecious &amp;&amp; a.Package !=3D nil {<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p :=3D a.Package<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.Standard || p.Goroo=
t {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err :=3D fmt.Errorf(&quot;attempting to install package %s into read-on=
ly GOROOT&quot;, p.ImportPath)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return err<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-b=
uildmode.patch b/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-s=
et-buildmode.patch<br>
deleted file mode 100644<br>
index 225cf439c5..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001<br>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-Date: Fri, 26 Oct 2018 15:02:32 +0800<br>
-Subject: [PATCH] use GOBUILDMODE to set buildmode<br>
-<br>
-While building go itself, the go build system does not support<br>
-to set `-buildmode=3Dpie&#39; from environment.<br>
-<br>
-Add GOBUILDMODE to support it which make PIE executables the default<br>
-build mode, as PIE executables are required as of Yocto<br>
-<br>
-Refers: <a href=3D"https://groups.google.com/forum/#!topic/golang-dev/gRCe=
5URKewI-Upstream-Status" rel=3D"noreferrer" target=3D"_blank">https://group=
s.google.com/forum/#!topic/golang-dev/gRCe5URKewI<br>
-Upstream-Status</a>: Denied [upstream choose antoher solution: `17a256b<br=
>
-cmd/go: -buildmode=3Dpie for android/arm&#39;]<br>
-<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- src/cmd/go/internal/work/build.go | 6 +++++-<br>
- 1 file changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-Index: go/src/cmd/go/internal/work/build.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/go/internal/work/build.go<br>
-+++ go/src/cmd/go/internal/work/build.go<br>
-@@ -223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asm=
flags&quot;, &quot;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(buildCompiler{}, &quot;compiler&qu=
ot;, &quot;&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, &quot;bu=
ildmode&quot;, &quot;default&quot;, &quot;&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 if bm :=3D os.Getenv(&quot;GOBUILDMODE&quot;); bm !=
=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, bm, &quot;&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, &quot;default&quot;, &quot;&quot=
;)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcfl=
ags&quot;, &quot;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;g=
ccgoflags&quot;, &quot;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.StringVar(&amp;cfg.BuildMod, &quot;mod=
&quot;, &quot;&quot;, &quot;&quot;)<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic=
-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.12/0009-ld-replace-=
glibc-dynamic-linker-with-musl.patch<br>
deleted file mode 100644<br>
index 840cf4bbd7..0000000000<br>
--- a/meta/recipes-devtools/go/go-1.12/0009-ld-replace-glibc-dynamic-linker=
-with-musl.patch<br>
+++ /dev/null<br>
@@ -1,112 +0,0 @@<br>
-From 35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 2001<br>
-From: Matt Madison &lt;matt@madison.systems&gt;<br>
-Date: Sun, 18 Feb 2018 08:24:05 -0800<br>
-Subject: [PATCH] ld: replace glibc dynamic linker with musl<br>
-<br>
-Rework of patch by Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-for go 1.10.=C2=A0 Should be applied conditionally on<br>
-musl being the system C library.<br>
-<br>
-Upstream-Status: Inappropriate [Real fix should be portable across libcs]<=
br>
-<br>
-Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
-<br>
----<br>
- src/cmd/link/internal/amd64/obj.go=C2=A0 | 2 +-<br>
- src/cmd/link/internal/arm/obj.go=C2=A0 =C2=A0 | 2 +-<br>
- src/cmd/link/internal/arm64/obj.go=C2=A0 | 2 +-<br>
- src/cmd/link/internal/mips/obj.go=C2=A0 =C2=A0| 2 +-<br>
- src/cmd/link/internal/mips64/obj.go | 2 +-<br>
- src/cmd/link/internal/ppc64/obj.go=C2=A0 | 2 +-<br>
- src/cmd/link/internal/s390x/obj.go=C2=A0 | 2 +-<br>
- src/cmd/link/internal/x86/obj.go=C2=A0 =C2=A0 | 2 +-<br>
- 8 files changed, 8 insertions(+), 8 deletions(-)<br>
-<br>
---- a/src/cmd/link/internal/amd64/obj.go<br>
-+++ b/src/cmd/link/internal/amd64/obj.go<br>
-@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TLSIEtoLE:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tlsIEtoLE,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-linux-x86-64.so.2&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-musl-x86-64.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;/libexec/ld-elf.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;/libexec/ld.elf_so&quot;,<br>
---- a/src/cmd/link/internal/arm/obj.go<br>
-+++ b/src/cmd/link/internal/arm/obj.go<br>
-@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib/ld-linux.so.3&quot;, // 2 for OABI, 3 for EABI<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib/ld-musl-armhf.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld-elf.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;/usr/libexec/ld.so&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;/libexec/ld.elf_so&quot;,<br>
---- a/src/cmd/link/internal/arm64/obj.go<br>
-+++ b/src/cmd/link/internal/arm64/obj.go<br>
-@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-linux-aarch64.so.1&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-musl-aarch64.so.1&quot;,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
---- a/src/cmd/link/internal/mips/obj.go<br>
-+++ b/src/cmd/link/internal/mips/obj.go<br>
-@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d.so.1&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib/l=
d-musl-mipsle.so.1&quot;,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
---- a/src/cmd/link/internal/mips64/obj.go<br>
-+++ b/src/cmd/link/internal/mips64/obj.go<br>
-@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld64.so.1&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
 =C2=A0&quot;/lib64/ld-musl-mips64le.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
=C2=A0 &quot;XXX&quot;,<br>
---- a/src/cmd/link/internal/ppc64/obj.go<br>
-+++ b/src/cmd/link/internal/ppc64/obj.go<br>
-@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(austin): AB=
I v1 uses /usr/lib/ld.so.1,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld64.so.1&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld-musl-powerpc64le.so.1&quot;,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
---- a/src/cmd/link/internal/s390x/obj.go<br>
-+++ b/src/cmd/link/internal/s390x/obj.go<br>
-@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Gentext:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gentext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld64.so.1&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld: &quot;/lib64=
/ld-musl-s390x.so.1&quot;,<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// not relevant for=
 s390x<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld:=C2=A0=
 =C2=A0&quot;XXX&quot;,<br>
---- a/src/cmd/link/internal/x86/obj.go<br>
-+++ b/src/cmd/link/internal/x86/obj.go<br>
-@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machoreloc1:=C2=A0 =
=C2=A0 =C2=A0 machoreloc1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PEreloc1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pereloc1,<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
&quot;/lib/ld-linux.so.2&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linuxdynld:=C2=A0 =C2=A0=
&quot;/lib/ld-musl-i386.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Freebsddynld: &quot=
;/usr/libexec/ld-elf.so.1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openbsddynld: &quot=
;/usr/libexec/ld.so&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netbsddynld:=C2=A0 =
&quot;/usr/libexec/ld.elf_so&quot;,<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.12.bb</a> =
b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.12.bb</a><br>
deleted file mode 100644<br>
index 7ac9449e47..0000000000<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.12.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require go-cross-canadian.inc<br>
-require go-${PV}.inc<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.12.bb" r=
el=3D"noreferrer" target=3D"_blank">go-cross_1.12.bb</a> b/meta/recipes-dev=
tools/go/<a href=3D"http://go-cross_1.12.bb" rel=3D"noreferrer" target=3D"_=
blank">go-cross_1.12.bb</a><br>
deleted file mode 100644<br>
index 80b5a03f6c..0000000000<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-cross_1.12.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require go-cross.inc<br>
-require go-${PV}.inc<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.12.bb=
" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.12.bb</a> b/meta/recip=
es-devtools/go/<a href=3D"http://go-crosssdk_1.12.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-crosssdk_1.12.bb</a><br>
deleted file mode 100644<br>
index 1857c8a577..0000000000<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">go-crosssdk_1.12.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require go-crosssdk.inc<br>
-require go-${PV}.inc<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.12.bb" =
rel=3D"noreferrer" target=3D"_blank">go-native_1.12.bb</a> b/meta/recipes-d=
evtools/go/<a href=3D"http://go-native_1.12.bb" rel=3D"noreferrer" target=
=3D"_blank">go-native_1.12.bb</a><br>
deleted file mode 100644<br>
index bbf3c0dd73..0000000000<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.12.bb" rel=3D"=
noreferrer" target=3D"_blank">go-native_1.12.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require ${PN}.inc<br>
-require go-${PV}.inc<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-runtime_1.12.bb</a> b/meta/recipes=
-devtools/go/<a href=3D"http://go-runtime_1.12.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-runtime_1.12.bb</a><br>
deleted file mode 100644<br>
index 43b68b4e46..0000000000<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.12.bb" rel=3D=
"noreferrer" target=3D"_blank">go-runtime_1.12.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require go-${PV}.inc<br>
-require go-runtime.inc<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.12.bb" rel=3D"=
noreferrer" target=3D"_blank">go_1.12.bb</a> b/meta/recipes-devtools/go/<a =
href=3D"http://go_1.12.bb" rel=3D"noreferrer" target=3D"_blank">go_1.12.bb<=
/a><br>
deleted file mode 100644<br>
index 42cdb0430a..0000000000<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go_1.12.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.12.bb</a><br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-require go-${PV}.inc<br>
-require go-target.inc<br>
-<br>
-export GOBUILDMODE=3D&quot;&quot;<br>
-<br>
-# Add pie to GOBUILDMODE to satisfy &quot;textrel&quot; QA checking, but m=
ips<br>
-# doesn&#39;t support -buildmode=3Dpie, so skip the QA checking for mips a=
nd its<br>
-# variants.<br>
-python() {<br>
-=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;INSANE_SKIP_%s&#39; % d.getVa=
r(&#39;PN&#39;), &quot; textrel&quot;)<br>
-=C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;GOBUILDMODE&#39;, &#39;pie&#39;)=
<br>
-}<br>
-- <br>
2.17.1 (Apple Git-112)<br>
<br>
</blockquote></div>

--00000000000067e4e70595bcfff6--
