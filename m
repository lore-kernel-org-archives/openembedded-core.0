Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail.openembedded.org (Postfix) with ESMTP id 769B261046
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:56:40 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id g15so13049980vsf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F1h+aAlfTzoTxaoTMQLI9eWknr2KTnQc7fzVZ7KQmMc=;
	b=rSshsznTqgBxZX0kppXdeILo0F0PhvIm+9zmQNGOlypPhnymQieC9y/fOhzvexrgEw
	+5up5TJVrpGlLW2XiLzrKyk1TfvVkjwKZeAMEK6ZYNc1kbRyBCgWPkbtMJlpHGb5+mEB
	Xg29woPvyvRDWamXy4amKBFTIF32SuBa2/cLGCycqkiJaCeFRD+hZRtlZZEmFiJuSgjO
	8SUY2OfbQ5IISOjGG9nTOd1Opc27YcrZvkk9yLD6j75fEqcib236s4GxTNuKqcw1kVsc
	xtg2PGYgjMBrQ/ErxD5ck1VflK/4s+YOYagviBtKPi9PwNuvrx8YfY8/2WY5uEG/GIv3
	c28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F1h+aAlfTzoTxaoTMQLI9eWknr2KTnQc7fzVZ7KQmMc=;
	b=DRUi+LDjZUiH6g5EcHBvKm++NBjdqDtatOt0VmNm+eGzSmhhTKYtbztSaEP9xRdHgW
	whirJlJqD+eJ6JR7kv7V+VxvQCyhj5LualRYBoj21jj+1dGXp1B1PRFcgF/wP0rCvibu
	KMyCZKQmM9SeuugcKC6DaDiCwo91VOlYBlq3Xz4rMSEtPM1UdJMftcuBe9Fo14+379B1
	F3CaifYyzWpblwCixqV3qWFfJU49aBxEmAQIOWKQxx91dJLjfasMwEdm1QT7u0A3k6Hr
	guMc0bO7BeaeLtSK2YD884Df0KevfB+JwuglUh0bXZ7CbkYv5ff+U0X43T4UTelUMwPb
	TCXA==
X-Gm-Message-State: APjAAAV1vd+UvoN1qpguKxcfFVaMcaE9xaGd/Ney+raDZiNLviNeAMJu
	0V3bG697Racoq+ZjZsa+omlVpZDPtoJYG7a7H1o=
X-Google-Smtp-Source: APXvYqx9bau/lkbyEDNy/scHS2gcaZcQJPptC5k+Fr0MLzDq8dG/HrXcyIcXb7rd2klbqMMbcrlf/M1RxzRMwTFDFmc=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr11068176vsq.23.1582034201707; 
	Tue, 18 Feb 2020 05:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20200218132054.20341-1-wallinux@gmail.com>
In-Reply-To: <20200218132054.20341-1-wallinux@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2020 14:57:06 +0100
Message-ID: <CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
To: Anders Wallin <wallinux@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Tue, 18 Feb 2020 13:56:42 -0000
Content-Type: multipart/alternative; boundary="0000000000009d87de059eda0a94"

--0000000000009d87de059eda0a94
Content-Type: text/plain; charset="UTF-8"

Thanks. May I request that this recipe is named babletrace, while
babeltrace 1.x recipe is at the same time renamed to babeltrace1? I'd like
to avoid adding version numbers to the 'latest' version. Lttng should at
the same time be adjusted to use babeltrace1, as advised by upstream.

Alex

On Tue, 18 Feb 2020 at 14:21, Anders Wallin <wallinux@gmail.com> wrote:

> Babeltrace 1 vs. Babeltrace 2
>
> The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was
> released.
> Babeltrace 2 is a complete rewrite of the library, Python bindings, and
> CLI. It
> is plugin based and offers much more features and potential than
> Babeltrace 1.
>
> Because Babeltrace 2 is still a young released project, some distributions
> still
> provide packages for the Babeltrace 1 project. Both projects can coexist
> on the
> same system as there are no common installed files.
>
> Signed-off-by: Anders Wallin <wallinux@gmail.com>
> ---
>  .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> new file mode 100644
> index 0000000000..d49a96faff
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
> +DESCRIPTION = "Babeltrace provides trace read and write libraries in host
> side, as well as a trace converter, which used to convert LTTng 2.0 traces
> into human-readable log."
> +HOMEPAGE = "http://babeltrace.org/"
> +BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
> +LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
> +
> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
> +
> +SRC_URI = "git://
> git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0"
> +SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--disable-debug-info"
> +
> +PACKAGECONFIG ??= "manpages"
> +PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native
> xmlto-native"
> +
> +FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
> +FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
> +
> +ASNEEDED = ""
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009d87de059eda0a94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. May I request that=C2=A0this=C2=A0recipe is named =
babletrace, while babeltrace 1.x recipe is at the same time renamed to babe=
ltrace1? I&#39;d like to avoid adding version numbers to the &#39;latest&#3=
9; version. Lttng should at the same time be adjusted to use babeltrace1, a=
s advised by upstream.<div><br></div><div>Alex</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 Feb 2020 at =
14:21, Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com">wallinux@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex">Babeltrace 1 vs. Babeltrace=
 2<br>
<br>
The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was release=
d.<br>
Babeltrace 2 is a complete rewrite of the library, Python bindings, and CLI=
. It<br>
is plugin based and offers much more features and potential than Babeltrace=
 1.<br>
<br>
Because Babeltrace 2 is still a young released project, some distributions =
still<br>
provide packages for the Babeltrace 1 project. Both projects can coexist on=
 the<br>
same system as there are no common installed files.<br>
<br>
Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com" targ=
et=3D"_blank">wallinux@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> | 26 +++++++++++=
++++++++<br>
=C2=A01 file changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/<a href=3D"http://babelt=
race2_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</=
a><br>
<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> b/meta/re=
cipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
new file mode 100644<br>
index 0000000000..d49a96faff<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
@@ -0,0 +1,26 @@<br>
+SUMMARY =3D &quot;Babeltrace2 - Trace Format Babel Tower&quot;<br>
+DESCRIPTION =3D &quot;Babeltrace provides trace read and write libraries i=
n host side, as well as a trace converter, which used to convert LTTng 2.0 =
traces into human-readable log.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://babeltrace.org/" rel=3D"noreferrer" t=
arget=3D"_blank">http://babeltrace.org/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://bugs.lttng.org/projects/babeltrace=
" rel=3D"noreferrer" target=3D"_blank">https://bugs.lttng.org/projects/babe=
ltrace</a>&quot;<br>
+LICENSE =3D &quot;MIT &amp; GPLv2 &amp; LGPLv2.1 &amp; BSD-2-Clause&quot;<=
br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6a458c13f18385b7bc5069a6d=
7b176e&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native flex-native&quot;<=
br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/diamon/b=
abeltrace.git;branch=3Dstable-2.0" rel=3D"noreferrer" target=3D"_blank">git=
.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-2.0</a>&quot;<br=
>
+SRCREV =3D &quot;06df58f89ee51b1a2c6a2c187ec3f15691633910&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)$&quot;<b=
r>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;manpages&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;, --disable-man-pages, asciidoc-native x=
mlto-native&quot;<br>
+<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/babeltrace2/plugins/*.a&quot;<b=
r>
+FILES_${PN} +=3D &quot;${libdir}/babeltrace2/plugins/*.so&quot;<br>
+<br>
+ASNEEDED =3D &quot;&quot;<br>
-- <br>
2.25.0<br>
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

--0000000000009d87de059eda0a94--
