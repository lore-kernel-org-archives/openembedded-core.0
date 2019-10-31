Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id B2DC67F965
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:49:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id l25so4522206edt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 04:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/QMgOHjxA2FmmPvnpqDmlAQqIETwG1t+U+KeP7TzviE=;
	b=lsH6itieO9u4QdOGkvPG3u//Ng0fU1e4zH03y/HS03ZkJI49Btjv+W/N5++MyxqCdF
	lQIZzVZysb1l8nh+zZrTcI2q/BPaANzW3HuQRrBjLQb0Q4F5cAXNabZWUP6gGmllCIIk
	Xrs39vdPqwXrbkD4jSCCZOMdtLt1pzo6lmUm69Cx/LOnfcfE/yNNC69VNNatWXG+D4E7
	iRHAICUWaZHEGy9dDSi92YPCrSwqchZ+JHx+qOO+Cqq5sZ/qWC+NUGSargL+WVcsDp9G
	CDrP91vBHqoHukB7km8cZvX+JqS8lvRfUDsNBrz4iDGv+OXGXP4WslJ+VXKQ/PIW4q6y
	KNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/QMgOHjxA2FmmPvnpqDmlAQqIETwG1t+U+KeP7TzviE=;
	b=MXANw3/fkU9ngUpcEhrw14I7DRDkXLeT6YoxR3av5GMgo/WYOi1Qem5XYYmGnKyZcy
	Om6Q8dL/sZ6b+QDYSsjzR2Kd4tLRIH0182v3hR//GytbS+0wQO6vx7/gJ+dEa5xVl5hj
	6F6IFI/N8Q+y9CiYmdIZIlxyBTtat0ABwPvQnFm+IZqqnhSrdGkGfTaL3VT2Iz2WC3Le
	Vzx/f4So6QysdVXenN3RyG2J2oyU60pchDqc5ACf7yu6hXrCjJJo3VT6O2GiBP2JZIle
	EzxwAGILG+CD76K5M0zYLn8LYn2F0hJBEp1WT48sZLvKL2A9kHTq4KX0nAPfc0/kWuYu
	dOcQ==
X-Gm-Message-State: APjAAAUVqLU+IxzuHWox7X89UJp4bQ53doUDPHp4ynYTiHQEFSjBR23T
	D4POXKngUmKpKWECtnd54JkNBT1ypF0a3qzIYQRQ0cxq
X-Google-Smtp-Source: APXvYqw8JssbCM9tHCyKXNHdg+HIWJ9Ug5KP1WJKqiXC9zQB6lwIzJ9L6Lwt1K1MMiB/01zDnIR5xW38B12SIT8kyKE=
X-Received: by 2002:a17:906:3ca:: with SMTP id
	c10mr3441878eja.140.1572522572199; 
	Thu, 31 Oct 2019 04:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1572072421.git.akuster808@gmail.com>
	<e02e8fa2e82cceaaa6a433466f52f97b0984762a.1572072422.git.akuster808@gmail.com>
In-Reply-To: <e02e8fa2e82cceaaa6a433466f52f97b0984762a.1572072422.git.akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 Oct 2019 12:49:21 +0100
Message-ID: <CA+chaQd4dRDmRTaS5_38eO+=rc9xC=Yq4wONwyXncVQ7Ys8Tog@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [zeus 25/28] go: fix CVE-2019-16276
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
X-List-Received-Date: Thu, 31 Oct 2019 11:49:32 -0000
Content-Type: multipart/alternative; boundary="000000000000513cbb0596337118"

--000000000000513cbb0596337118
Content-Type: text/plain; charset="UTF-8"

This seems to cause:

ERROR: go-native-1.12.1-r0 do_patch: Fuzz detected:

Applying patch
0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
patching file src/net/http/serve_test.go
patching file src/net/http/transport_test.go
Hunk #1 succeeded at 5059 with fuzz 2 (offset -74 lines).
patching file src/net/textproto/reader.go
patching file src/net/textproto/reader_test.go

The context lines in the patches can be updated with devtool:

    devtool modify go-native
    devtool finish --force-patch-refresh go-native <layer_path>

Don't forget to review changes done by devtool!

ERROR: go-native-1.12.1-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

and the same for go-cross and go-runtime.

The version currently in master is the same, so I guess both are showing
this QA issue.

Regards,

On Sat, Oct 26, 2019 at 8:54 AM Armin Kuster <akuster808@gmail.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-devtools/go/go-1.12.inc               |   1 +
>  ...nch.go1.12-security-net-textproto-don-t-n.patch | 163
> +++++++++++++++++++++
>  2 files changed, 164 insertions(+)
>  create mode 100644
> meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.12.inc
> b/meta/recipes-devtools/go/go-1.12.inc
> index 39157ff..ed14b17 100644
> --- a/meta/recipes-devtools/go/go-1.12.inc
> +++ b/meta/recipes-devtools/go/go-1.12.inc
> @@ -16,6 +16,7 @@ SRC_URI += "\
>      file://0006-cmd-dist-separate-host-and-target-builds.patch \
>      file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> +
> file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
>  "
>  SRC_URI_append_libc-musl = "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>
> diff --git
> a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> new file mode 100644
> index 0000000..7b39dbd
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> @@ -0,0 +1,163 @@
> +From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001
> +From: Filippo Valsorda <filippo@golang.org>
> +Date: Thu, 12 Sep 2019 12:37:36 -0400
> +Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don't
> + normalize headers with spaces before the colon
> +
> +RFC 7230 is clear about headers with a space before the colon, like
> +
> +X-Answer : 42
> +
> +being invalid, but we've been accepting and normalizing them for
> compatibility
> +purposes since CL 5690059 in 2012.
> +
> +On the client side, this is harmless and indeed most browsers behave the
> same
> +to this day. On the server side, this becomes a security issue when the
> +behavior doesn't match that of a reverse proxy sitting in front of the
> server.
> +
> +For example, if a WAF accepts them without normalizing them, it might be
> +possible to bypass its filters, because the Go server would interpret the
> +header differently. Worse, if the reverse proxy coalesces requests onto a
> +single HTTP/1.1 connection to a Go server, the understanding of the
> request
> +boundaries can get out of sync between them, allowing an attacker to tack
> an
> +arbitrary method and path onto a request by other clients, including
> +authentication headers unknown to the attacker.
> +
> +This was recently presented at multiple security conferences:
> +https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn
> +
> +net/http servers already reject header keys with invalid characters.
> +Simply stop normalizing extra spaces in net/textproto, let it return them
> +unchanged like it does for other invalid headers, and let net/http enforce
> +RFC 7230, which is HTTP specific. This loses us normalization on the
> client
> +side, but there's no right answer on the client side anyway, and hiding
> the
> +issue sounds worse than letting the application decide.
> +
> +Fixes CVE-2019-16276
> +
> +Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/549719
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/549719+Reviewed-by>:
> Brad Fitzpatrick <bradfitz@google.com>
> +(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/558776
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/558776+Reviewed-by>:
> Dmitri Shuralyov <dmitshur@google.com>
> +
> +CVE: CVE-2019-16276
> +
> +Upstream-Status: Backport [
> https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8
> ]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/net/http/serve_test.go       |  4 ++++
> + src/net/http/transport_test.go   | 27 +++++++++++++++++++++++++++
> + src/net/textproto/reader.go      | 10 ++--------
> + src/net/textproto/reader_test.go | 13 ++++++-------
> + 4 files changed, 39 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
> +index 6eb0088a96..89bfdfbb82 100644
> +--- a/src/net/http/serve_test.go
> ++++ b/src/net/http/serve_test.go
> +@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {
> +               {"foo\xffbar: foo\r\n", 400},                         //
> binary in header
> +               {"foo\x00bar: foo\r\n", 400},                         //
> binary in header
> +               {"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, //
> header too large
> ++              // Spaces between the header key and colon are not allowed.
> ++              // See RFC 7230, Section 3.2.4.
> ++              {"Foo : bar\r\n", 400},
> ++              {"Foo\t: bar\r\n", 400},
> +
> +               {"foo: foo foo\r\n", 200},    // LWS space is okay
> +               {"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
> +diff --git a/src/net/http/transport_test.go
> b/src/net/http/transport_test.go
> +index 5c329543e2..5e5438a708 100644
> +--- a/src/net/http/transport_test.go
> ++++ b/src/net/http/transport_test.go
> +@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
> +       }
> +       t.Fatalf("timeout after %v waiting for Transport connections to
> die off", time.Since(t0))
> + }
> ++
> ++func TestInvalidHeaderResponse(t *testing.T) {
> ++      setParallel(t)
> ++      defer afterTest(t)
> ++      cst := newClientServerTest(t, h1Mode, HandlerFunc(func(w
> ResponseWriter, r *Request) {
> ++              conn, buf, _ := w.(Hijacker).Hijack()
> ++              buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
> ++                      "Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
> ++                      "Content-Type: text/html; charset=utf-8\r\n" +
> ++                      "Content-Length: 0\r\n" +
> ++                      "Foo : bar\r\n\r\n"))
> ++              buf.Flush()
> ++              conn.Close()
> ++      }))
> ++      defer cst.close()
> ++      res, err := cst.c.Get(cst.ts.URL)
> ++      if err != nil {
> ++              t.Fatal(err)
> ++      }
> ++      defer res.Body.Close()
> ++      if v := res.Header.Get("Foo"); v != "" {
> ++              t.Errorf(`unexpected "Foo" header: %q`, v)
> ++      }
> ++      if v := res.Header.Get("Foo "); v != "bar" {
> ++              t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")
> ++      }
> ++}
> +diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
> +index 2c4f25d5ae..1a5e364cf7 100644
> +--- a/src/net/textproto/reader.go
> ++++ b/src/net/textproto/reader.go
> +@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader,
> error) {
> +                       return m, err
> +               }
> +
> +-              // Key ends at first colon; should not have trailing spaces
> +-              // but they appear in the wild, violating specs, so we
> remove
> +-              // them if present.
> ++              // Key ends at first colon.
> +               i := bytes.IndexByte(kv, ':')
> +               if i < 0 {
> +                       return m, ProtocolError("malformed MIME header
> line: " + string(kv))
> +               }
> +-              endKey := i
> +-              for endKey > 0 && kv[endKey-1] == ' ' {
> +-                      endKey--
> +-              }
> +-              key := canonicalMIMEHeaderKey(kv[:endKey])
> ++              key := canonicalMIMEHeaderKey(kv[:i])
> +
> +               // As per RFC 7230 field-name is a token, tokens consist
> of one or more chars.
> +               // We could return a ProtocolError here, but better to be
> liberal in what we
> +diff --git a/src/net/textproto/reader_test.go
> b/src/net/textproto/reader_test.go
> +index f85fbdc36d..b92fdcd3c7 100644
> +--- a/src/net/textproto/reader_test.go
> ++++ b/src/net/textproto/reader_test.go
> +@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
> +       }
> + }
> +
> +-// Test that we read slightly-bogus MIME headers seen in the wild,
> +-// with spaces before colons, and spaces in keys.
> ++// TestReadMIMEHeaderNonCompliant checks that we don't normalize headers
> ++// with spaces before colons, and accept spaces in keys.
> + func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> +-      // Invalid HTTP response header as sent by an Axis security
> +-      // camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
> ++      // These invalid headers will be rejected by net/http according to
> RFC 7230.
> +       r := reader("Foo: bar\r\n" +
> +               "Content-Language: en\r\n" +
> +               "SID : 0\r\n" +
> +@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> +       want := MIMEHeader{
> +               "Foo":              {"bar"},
> +               "Content-Language": {"en"},
> +-              "Sid":              {"0"},
> +-              "Audio Mode":       {"None"},
> +-              "Privilege":        {"127"},
> ++              "SID ":             {"0"},
> ++              "Audio Mode ":      {"None"},
> ++              "Privilege ":       {"127"},
> +       }
> +       if !reflect.DeepEqual(m, want) || err != nil {
> +               t.Fatalf("ReadMIMEHeader =\n%v, %v; want:\n%v", m, err,
> want)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000513cbb0596337118
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to cause:<div><br></div><div>ERROR: go-native-1=
.12.1-r0 do_patch: Fuzz detected:<br><br>Applying patch 0001-release-branch=
.go1.12-security-net-textproto-don-t-n.patch<br>patching file src/net/http/=
serve_test.go<br>patching file src/net/http/transport_test.go<br>Hunk #1 su=
cceeded at 5059 with fuzz 2 (offset -74 lines).<br>patching file src/net/te=
xtproto/reader.go<br>patching file src/net/textproto/reader_test.go<br><br>=
The context lines in the patches can be updated with devtool:<br><br>=C2=A0=
 =C2=A0 devtool modify go-native<br>=C2=A0 =C2=A0 devtool finish --force-pa=
tch-refresh go-native &lt;layer_path&gt;<br><br>Don&#39;t forget to review =
changes done by devtool!<br><br>ERROR: go-native-1.12.1-r0 do_patch: QA Iss=
ue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]<br>=
</div><div><br></div><div>and the same for go-cross and go-runtime.</div><d=
iv><br></div><div>The version currently in master is the same, so I guess b=
oth are showing this QA issue.</div><div><br></div><div>Regards,</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sa=
t, Oct 26, 2019 at 8:54 AM Armin Kuster &lt;<a href=3D"mailto:akuster808@gm=
ail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@wi=
ndriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.12.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...nch.go1.12-security-net-textproto-don-t-n.patch | 163 ++++++++++++=
+++++++++<br>
=C2=A02 files changed, 164 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-bran=
ch.go1.12-security-net-textproto-don-t-n.patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/g=
o/go-1.12.inc<br>
index 39157ff..ed14b17 100644<br>
--- a/meta/recipes-devtools/go/go-1.12.inc<br>
+++ b/meta/recipes-devtools/go/go-1.12.inc<br>
@@ -16,6 +16,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0006-cmd-dist-separate-host-and-target-builds.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0file://0007-cmd-go-make-GOROOT-precious-by-default.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0file://0008-use-GOBUILDMODE-to-set-buildmode.patch \<br=
>
+=C2=A0 =C2=A0 file://0001-release-branch.go1.12-security-net-textproto-don=
-t-n.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc-dyna=
mic-linker-with-musl.patch&quot;<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-se=
curity-net-textproto-don-t-n.patch b/meta/recipes-devtools/go/go-1.12/0001-=
release-branch.go1.12-security-net-textproto-don-t-n.patch<br>
new file mode 100644<br>
index 0000000..7b39dbd<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-=
net-textproto-don-t-n.patch<br>
@@ -0,0 +1,163 @@<br>
+From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001<br>
+From: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" target=3D=
"_blank">filippo@golang.org</a>&gt;<br>
+Date: Thu, 12 Sep 2019 12:37:36 -0400<br>
+Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don&#39;t=
<br>
+ normalize headers with spaces before the colon<br>
+<br>
+RFC 7230 is clear about headers with a space before the colon, like<br>
+<br>
+X-Answer : 42<br>
+<br>
+being invalid, but we&#39;ve been accepting and normalizing them for compa=
tibility<br>
+purposes since CL 5690059 in 2012.<br>
+<br>
+On the client side, this is harmless and indeed most browsers behave the s=
ame<br>
+to this day. On the server side, this becomes a security issue when the<br=
>
+behavior doesn&#39;t match that of a reverse proxy sitting in front of the=
 server.<br>
+<br>
+For example, if a WAF accepts them without normalizing them, it might be<b=
r>
+possible to bypass its filters, because the Go server would interpret the<=
br>
+header differently. Worse, if the reverse proxy coalesces requests onto a<=
br>
+single HTTP/1.1 connection to a Go server, the understanding of the reques=
t<br>
+boundaries can get out of sync between them, allowing an attacker to tack =
an<br>
+arbitrary method and path onto a request by other clients, including<br>
+authentication headers unknown to the attacker.<br>
+<br>
+This was recently presented at multiple security conferences:<br>
+<a href=3D"https://portswigger.net/blog/http-desync-attacks-request-smuggl=
ing-reborn" rel=3D"noreferrer" target=3D"_blank">https://portswigger.net/bl=
og/http-desync-attacks-request-smuggling-reborn</a><br>
+<br>
+net/http servers already reject header keys with invalid characters.<br>
+Simply stop normalizing extra spaces in net/textproto, let it return them<=
br>
+unchanged like it does for other invalid headers, and let net/http enforce=
<br>
+RFC 7230, which is HTTP specific. This loses us normalization on the clien=
t<br>
+side, but there&#39;s no right answer on the client side anyway, and hidin=
g the<br>
+issue sounds worse than letting the application decide.<br>
+<br>
+Fixes CVE-2019-16276<br>
+<br>
+Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/549719+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https:=
//team-review.git.corp.google.com/c/golang/go-private/+/549719<br>
+Reviewed-by</a>: Brad Fitzpatrick &lt;<a href=3D"mailto:bradfitz@google.co=
m" target=3D"_blank">bradfitz@google.com</a>&gt;<br>
+(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/558776+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https:=
//team-review.git.corp.google.com/c/golang/go-private/+/558776<br>
+Reviewed-by</a>: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.co=
m" target=3D"_blank">dmitshur@google.com</a>&gt;<br>
+<br>
+CVE: CVE-2019-16276<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de=
03ad8</a>]<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ src/net/http/serve_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
+ src/net/http/transport_test.go=C2=A0 =C2=A0| 27 +++++++++++++++++++++++++=
++<br>
+ src/net/textproto/reader.go=C2=A0 =C2=A0 =C2=A0 | 10 ++--------<br>
+ src/net/textproto/reader_test.go | 13 ++++++-------<br>
+ 4 files changed, 39 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go<br>
+index 6eb0088a96..89bfdfbb82 100644<br>
+--- a/src/net/http/serve_test.go<br>
++++ b/src/net/http/serve_test.go<br>
+@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\xffbar: =
foo\r\n&quot;, 400},=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// binary in header<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\x00bar: =
foo\r\n&quot;, 400},=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// binary in header<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Foo: &quot; =
+ strings.Repeat(&quot;x&quot;, 1&lt;&lt;21) + &quot;\r\n&quot;, 431}, // h=
eader too large<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Spaces between the he=
ader key and colon are not allowed.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // See RFC 7230, Section=
 3.2.4.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Foo : bar\r\n&quo=
t;, 400},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Foo\t: bar\r\n&qu=
ot;, 400},<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo: foo foo=
\r\n&quot;, 200},=C2=A0 =C2=A0 // LWS space is okay<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo: foo\tfo=
o\r\n&quot;, 200},=C2=A0 =C2=A0// LWS tab is okay<br>
+diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.=
go<br>
+index 5c329543e2..5e5438a708 100644<br>
+--- a/src/net/http/transport_test.go<br>
++++ b/src/net/http/transport_test.go<br>
+@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatalf(&quot;timeout after %v waiting for Tra=
nsport connections to die off&quot;, time.Since(t0))<br>
+ }<br>
++<br>
++func TestInvalidHeaderResponse(t *testing.T) {<br>
++=C2=A0 =C2=A0 =C2=A0 setParallel(t)<br>
++=C2=A0 =C2=A0 =C2=A0 defer afterTest(t)<br>
++=C2=A0 =C2=A0 =C2=A0 cst :=3D newClientServerTest(t, h1Mode, HandlerFunc(=
func(w ResponseWriter, r *Request) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn, buf, _ :=3D w.(Hij=
acker).Hijack()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf.Write([]byte(&quot;H=
TTP/1.1 200 OK\r\n&quot; +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n&quot; +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Content-Type: text/html; charset=3Dutf-8\r\n&quot; +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Content-Length: 0\r\n&quot; +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Foo : bar\r\n\r\n&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf.Flush()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 }))<br>
++=C2=A0 =C2=A0 =C2=A0 defer cst.close()<br>
++=C2=A0 =C2=A0 =C2=A0 res, err :=3D cst.c.Get(cst.ts.URL)<br>
++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(err)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 defer res.Body.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 if v :=3D res.Header.Get(&quot;Foo&quot;); v !=3D &q=
uot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(`unexpected &qu=
ot;Foo&quot; header: %q`, v)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if v :=3D res.Header.Get(&quot;Foo &quot;); v !=3D &=
quot;bar&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(`bad &quot;Foo =
&quot; header value: %q, want %q`, v, &quot;bar&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go<br>
+index 2c4f25d5ae..1a5e364cf7 100644<br>
+--- a/src/net/textproto/reader.go<br>
++++ b/src/net/textproto/reader.go<br>
+@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return m, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Key ends at first col=
on; should not have trailing spaces<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // but they appear in th=
e wild, violating specs, so we remove<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // them if present.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Key ends at first col=
on.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i :=3D bytes.IndexB=
yte(kv, &#39;:&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i &lt; 0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return m, ProtocolError(&quot;malformed MIME header line: &quot; =
+ string(kv))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endKey :=3D i<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for endKey &gt; 0 &amp;&=
amp; kv[endKey-1] =3D=3D &#39; &#39; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 endKey--<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key :=3D canonicalMIMEHe=
aderKey(kv[:endKey])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key :=3D canonicalMIMEHe=
aderKey(kv[:i])<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// As per RFC 7230 =
field-name is a token, tokens consist of one or more chars.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// We could return =
a ProtocolError here, but better to be liberal in what we<br>
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_t=
est.go<br>
+index f85fbdc36d..b92fdcd3c7 100644<br>
+--- a/src/net/textproto/reader_test.go<br>
++++ b/src/net/textproto/reader_test.go<br>
+@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-// Test that we read slightly-bogus MIME headers seen in the wild,<br>
+-// with spaces before colons, and spaces in keys.<br>
++// TestReadMIMEHeaderNonCompliant checks that we don&#39;t normalize head=
ers<br>
++// with spaces before colons, and accept spaces in keys.<br>
+ func TestReadMIMEHeaderNonCompliant(t *testing.T) {<br>
+-=C2=A0 =C2=A0 =C2=A0 // Invalid HTTP response header as sent by an Axis s=
ecurity<br>
+-=C2=A0 =C2=A0 =C2=A0 // camera: (this is handled by IE, Firefox, Chrome, =
curl, etc.)<br>
++=C2=A0 =C2=A0 =C2=A0 // These invalid headers will be rejected by net/htt=
p according to RFC 7230.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r :=3D reader(&quot;Foo: bar\r\n&quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Content-Langu=
age: en\r\n&quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;SID : 0\r\n&q=
uot; +<br>
+@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0want :=3D MIMEHeader{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Foo&quot;:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;bar&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Content-Langu=
age&quot;: {&quot;en&quot;},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Sid&quot;:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;0&quot;},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Audio Mode&quot;:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;None&quot;},<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Privilege&quot;:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;127&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SID &quot;:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;0&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Audio Mode &quot;:=
=C2=A0 =C2=A0 =C2=A0 {&quot;None&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Privilege &quot;:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;127&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if !reflect.DeepEqual(m, want) || err !=3D nil =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatalf(&quot;Read=
MIMEHeader =3D\n%v, %v; want:\n%v&quot;, m, err, want)<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000513cbb0596337118--
