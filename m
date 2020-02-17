Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADF9A611C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 11:43:53 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id l6so5997185uap.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 03:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2sssHR2tiuTNwxnnnVMILKgQRrBtvSTf843RmGnyhZg=;
	b=OeLInUUQaR23E0/rOZvbVD4AL62UqIP9C32gNDnvxP6hNXZQhIOn91V/LnjheJu/oI
	fX5RkzraRULavD5jJRHjsGMuGyoG6BJUQVYGfrUS2gOJdOgLnXylHwKH9zg/DfIg4XWX
	9SI2Wwfm/WzgZSK2kJaoY6IukBNTWo6HqTGvFhrtzS+U0P1I0Z6I0vtdxp8xOSDHzc3z
	4nzEnno/CfcxZK+v0krKsw+Si4hnl51FMIBXtqQhezWKQ+WakeVaetSSR2gKgOyhrZrV
	0O7w0uXkhEGDK/Knsx4ZNL7+8OBXk5MS/QT+5RjBZy4m9FejZ3z6nYr7/UdP5gqM7ygC
	2P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2sssHR2tiuTNwxnnnVMILKgQRrBtvSTf843RmGnyhZg=;
	b=AWcgt037vmBhGK9Yw+OO397WXmU8Wfj75bRF5xWhrxy+4ZnyblvXbdcL8BO6BSQCMh
	MVPNDbDMhljvHhEejk5NjMYSSFhFxUtmOpK/NgHwB50Cax2VcN/qYoPY921A4A2cWEmP
	Ailw9ZBQLfoqqcdikTHc9dIrFBMMykxQoEAFnY5lGUiPVjRHi972BW3QkS59C7rvfSQ+
	wUXqW2BPTNhqcqMw0B7toznwIeN+2475+Ou0V1smXjO+pXKQH8qENY5h+qBswVcqynZ7
	8fquVuD0+Drflz9nhPuL6ikRbdi4BVqW/ycsyHNABCyqBq2X/XCRKah6jNAjqZ0z6lBK
	y2og==
X-Gm-Message-State: APjAAAX63EF/zankfw6HKVY/ujIaGgVCMUqTvFY/eT6heIcNfLzijEn/
	3uzbZR8qv6FtEfo3zdGcaV0Nt9r2W+XKI7AphTE=
X-Google-Smtp-Source: APXvYqwfZprE5UGNlI9K0BdR9ASMfaCghGWn0f6/QN2kss7pu7o41wOUmPrrWSW2DsQF3yEXVwygtucNb5jqVx7CHIs=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr7087732uap.93.1581939834464;
	Mon, 17 Feb 2020 03:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20200217105930.902-1-wallinux@gmail.com>
	<ac6d6a63-124f-099f-d1ff-e3092b506341@gmail.com>
In-Reply-To: <ac6d6a63-124f-099f-d1ff-e3092b506341@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 12:43:43 +0100
Message-ID: <CANNYZj-nk-txm1rUGd8ABY10ZQ=DkMEA0CexQsMDinuQxaTmkA@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 11:43:53 -0000
Content-Type: multipart/alternative; boundary="000000000000e3abe3059ec411df"

--000000000000e3abe3059ec411df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, there=E2=80=99s now a babeltrace 2, so we should update to that rathe=
r ?

Alex

On Mon 17. Feb 2020 at 12.03, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 2/17/20 11:59 AM, Anders Wallin wrote:
> > updated HOMEPAGE to http://babeltrace.org/
> > updated LICENSE to include LGPLv2.1
> >
> > Signed-off-by: Anders Wallin <wallinux@gmail.com>
> > ---
> >   meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 20 ++++++++++++++++++=
+
> >   1 file changed, 20 insertions(+)
> >   create mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> >
> > diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> > new file mode 100644
> > index 0000000000..b6b7653037
> > --- /dev/null
> > +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "Babeltrace - Trace Format Babel Tower"
> > +DESCRIPTION =3D "Babeltrace provides trace read and write libraries in
> host side, as well as a trace converter, which used to convert LTTng 2.0
> traces into human-readable log."
> > +HOMEPAGE =3D "http://babeltrace.org/"
> > +BUGTRACKER =3D "https://bugs.lttng.org/projects/babeltrace"
> > +LICENSE =3D "MIT & GPLv2 & LGPLv2.1"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76ba15dd76a248e1dd526bca0e2=
125fa"
> > +
> > +DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
> > +
> > +SRC_URI =3D "git://
> git.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-1.5"
> > +SRCREV =3D "054a54ae10b01a271afc4f19496c041b10fb414c"
> > +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)$"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +EXTRA_OECONF =3D "--disable-debug-info"
> > +
> > +ASNEEDED =3D ""
> >
>
> Looks like this patch adds a new recipe for 1.5.8, and keeps the 1.5.7
> recipe. Was that intentional ?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e3abe3059ec411df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Also, there=E2=80=99s now a babeltrace 2, so we shou=
ld update to that rather ?</div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon 17. Feb 2020 at 12.03, Jacob Kroon &lt;<a href=3D=
"mailto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 2/17/20 11:59 AM, Anders Wallin wrote:<=
br>
&gt; updated HOMEPAGE to <a href=3D"http://babeltrace.org/" rel=3D"noreferr=
er" target=3D"_blank">http://babeltrace.org/</a><br>
&gt; updated LICENSE to include LGPLv2.1<br>
&gt; <br>
&gt; Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com"=
 target=3D"_blank">wallinux@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5=
.8.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace_1.5.8.bb</a> | 20 ++=
+++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 20 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-kernel/lttng/<a href=3D"ht=
tp://babeltrace_1.5.8.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace_1=
.5.8.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.=
5.8.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace_1.5.8.bb</a> b/meta=
/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.8.bb" rel=3D"norefer=
rer" target=3D"_blank">babeltrace_1.5.8.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b6b7653037<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">babeltrace_1.5.8.bb</a><br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +SUMMARY =3D &quot;Babeltrace - Trace Format Babel Tower&quot;<br>
&gt; +DESCRIPTION =3D &quot;Babeltrace provides trace read and write librar=
ies in host side, as well as a trace converter, which used to convert LTTng=
 2.0 traces into human-readable log.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://babeltrace.org/" rel=3D"noreferr=
er" target=3D"_blank">http://babeltrace.org/</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://bugs.lttng.org/projects/babel=
trace" rel=3D"noreferrer" target=3D"_blank">https://bugs.lttng.org/projects=
/babeltrace</a>&quot;<br>
&gt; +LICENSE =3D &quot;MIT &amp; GPLv2 &amp; LGPLv2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D76ba15dd76a248e1dd526=
bca0e2125fa&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native flex-native&q=
uot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/dia=
mon/babeltrace.git;branch=3Dstable-1.5" rel=3D"noreferrer" target=3D"_blank=
">git.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-1.5</a>&quo=
t;<br>
&gt; +SRCREV =3D &quot;054a54ae10b01a271afc4f19496c041b10fb414c&quot;<br>
&gt; +UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)$&qu=
ot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig<br>
&gt; +<br>
&gt; +EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
&gt; +<br>
&gt; +ASNEEDED =3D &quot;&quot;<br>
&gt; <br>
<br>
Looks like this patch adds a new recipe for 1.5.8, and keeps the 1.5.7 <br>
recipe. Was that intentional ?<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000e3abe3059ec411df--
