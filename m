Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0C26B7E649
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 15:11:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m3so8391856wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LYYs6D2YaW5eQ55CR7FJPz87kdyLMA4FH6AbzMmCWLw=;
	b=NV4W3xtoK9R0ZE8Ef38mHTANzfFJm8w/jcOsb/3qAKUcktRJYoHzcSI/lFG/3jci/c
	N5RLs29LScPdVdCyOWrT5QQnHS14IVm32/2ym1x5BQXcl+y+LXYJhs4lby4YHj54er62
	fhs2VLJNgwXofNc0Uu9NDursZwwjPEZXk7y+Ji+91WT8gVX9RFWfl7O3RH1LL291ezHE
	mPStTFJF81D9SsREjstuACmG54XcN0phSAt8FF4nLG+cX792kXWo8qUVVPDFTurmTlmT
	CrNEb2mZO/NynCfU34mEtssqfhUZYynHqgPjHDC8viYlgR+evQ3APM+JscRdzXUAlQnK
	avvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LYYs6D2YaW5eQ55CR7FJPz87kdyLMA4FH6AbzMmCWLw=;
	b=fNE3dDG9IF8BHutQDzZJZbStNy6a0ds5jyhGF13qSkfPdIwLU1Ac3FQItH+vWsvyLI
	ZphvYNaqyik/y5c59eFOFbEQo29ND/CWApA8y1NvZn6oRgf8SrGA6Z+KHMb6W5cmeQqM
	0LwuBmtyOzBo0i2T4VNrggF1+NvcDB6K+queInb6ZHs/jWRxe5FwQ01E8JtAYm6LNUXT
	0S4eKdBJhcFw4X4zx6wuN3jwyr+p/7PEOZCYKz55QDh2rnQ4Fcvk/ombgGafuYm9IFdJ
	8ITPBQl/8B4SKloceG9H2EK/NQbIuxH1KhG8xHohq2Z2F2oVYEL5S9kEVWZjYZ12COuz
	w2rg==
X-Gm-Message-State: APjAAAUtfZglDwNo/BKcKTPk2v1T2vSraql15innpa6m7GkGq/jDx52P
	uynZbhAXhsfH5Zq0FvBb4GxahcUGdBRVCX5gbsY=
X-Google-Smtp-Source: APXvYqyvWhFxnR1W1xcHZRaZbGWgQ7X+N5qo1w39vEI8xwPDnm5i2TprIP50AfT3kYe1ZCrnFP+DKMUzjt/hKF59S/s=
X-Received: by 2002:a5d:5452:: with SMTP id w18mr10167350wrv.327.1559401903606;
	Sat, 01 Jun 2019 08:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190531165734.14435-1-JPEWhacker@gmail.com>
	<5ec644af8672d726bae30da958c0b69120ca19b8.camel@linuxfoundation.org>
In-Reply-To: <5ec644af8672d726bae30da958c0b69120ca19b8.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 1 Jun 2019 10:11:31 -0500
Message-ID: <CAJdd5GaS81ksj078_baeH7xONbFY9WVBTSD-EHiEcbG-FQg00A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Replace uninative loader path in ptest
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
X-List-Received-Date: Sat, 01 Jun 2019 15:11:43 -0000
Content-Type: multipart/alternative; boundary="00000000000086cede058a448cb2"

--00000000000086cede058a448cb2
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 1, 2019, 1:47 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-05-31 at 11:57 -0500, Joshua Watt wrote:
> > The Makefile used for bash-ptest can pick up the path to the uninative
> > loader through BUILD_LDFLAGS. This includes the full path to the
> > uninative loader, which is not reproducible. Replace it with the target
> > loader in the event that these programs need to be compiled for bash
> > tests.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-extended/bash/bash.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> > index 4b3692c6139..55f2b7704e6 100644
> > --- a/meta/recipes-extended/bash/bash.inc
> > +++ b/meta/recipes-extended/bash/bash.inc
> > @@ -4,7 +4,7 @@ SECTION = "base/shell"
> >
> >  DEPENDS = "ncurses bison-native virtual/libiconv"
> >
> > -inherit autotools gettext texinfo update-alternatives ptest
> > +inherit autotools gettext texinfo update-alternatives ptest linuxloader
> >
> >  EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
> >  EXTRA_OECONF = "--enable-job-control --without-bash-malloc
> bash_cv_wexitstatus_offset=8"
> > @@ -70,6 +70,7 @@ do_install_ptest () {
> >           -e 's|${DEBUG_PREFIX_MAP}||g' \
> >           -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
> >           -e 's:${HOSTTOOLS_DIR}/::g' \
> > +         -e 's:${UNINATIVE_LOADER}:${@get_linuxloader(d)}:g' \
> >            ${D}${PTEST_PATH}/Makefile
> >  }
>
> This change causes:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/490
>
> which you can reproduce with:
>
> oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash
>
> which with some digging you can come to:
>
> $ bitbake-diffsigs
> tmp-sstatesamehash*/stamps/*-poky-linux/bash/*.do_install_ptest_base.sigdata.*
> NOTE: Starting bitbake server...
> basehash changed from
> d92c4da62ccda424103c7615dffc5f747da83bf64a46be63acc11633480a6bf6 to
> a26822f4999a6bdbe8e8e60db91c1400e2b4011b66d98a9ec57a53d6fc70dc88
> Variable UNINATIVE_LOADER value changed:
> @@ -1,4 +1,4 @@
>  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH',
> 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH',
> 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH',
> 'aarch64', 'ld-linux-aarch64.so.1', '', d)}
>  BUILD_ARCH{aarch64} = Unset
> -BUILD_ARCH{i686} = Set
> -BUILD_ARCH{x86_64} = Unset
> +BUILD_ARCH{i686} = Unset
> +BUILD_ARCH{x86_64} = Set
>
> which makes the problem fairly obvious when you see it put that way...
>

Ah that makes sense. I was trying to be too cute :) I'll stick with my
original plan of using /bin/false


> Cheers,
>
> Richard
>
>
>
>

--00000000000086cede058a448cb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Jun 1, 2019, 1:47 AM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2019=
-05-31 at 11:57 -0500, Joshua Watt wrote:<br>
&gt; The Makefile used for bash-ptest can pick up the path to the uninative=
<br>
&gt; loader through BUILD_LDFLAGS. This includes the full path to the<br>
&gt; uninative loader, which is not reproducible. Replace it with the targe=
t<br>
&gt; loader in the event that these programs need to be compiled for bash<b=
r>
&gt; tests.<br>
&gt; <br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/bash/bash.inc | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extend=
ed/bash/bash.inc<br>
&gt; index 4b3692c6139..55f2b7704e6 100644<br>
&gt; --- a/meta/recipes-extended/bash/bash.inc<br>
&gt; +++ b/meta/recipes-extended/bash/bash.inc<br>
&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;base/shell&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D &quot;ncurses bison-native virtual/libiconv&quot;<br=
>
&gt;=C2=A0 <br>
&gt; -inherit autotools gettext texinfo update-alternatives ptest<br>
&gt; +inherit autotools gettext texinfo update-alternatives ptest linuxload=
er<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_AUTORECONF +=3D &quot;--exclude=3Dautoheader --exclude=3Da=
clocal&quot;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--enable-job-control --without-bash-mallo=
c bash_cv_wexitstatus_offset=3D8&quot;<br>
&gt; @@ -70,6 +70,7 @@ do_install_ptest () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MAP}|=
|g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s,${S},,g&quot; -e &q=
uot;s,${B},,g&quot; -e &quot;s,${STAGING_DIR_NATIVE},,g&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${HOSTTOOLS_DIR}/::g=
&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${UNINATIVE_LOADER}:${@ge=
t_linuxloader(d)}:g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${PTEST_PATH}/Makefile<br=
>
&gt;=C2=A0 }<br>
<br>
This change causes:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/490" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/56/builds/490</a><br>
<br>
which you can reproduce with:<br>
<br>
oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash<br>
<br>
which with some digging you can come to:<br>
<br>
$ bitbake-diffsigs tmp-sstatesamehash*/stamps/*-poky-linux/bash/*.do_instal=
l_ptest_base.sigdata.*<br>
NOTE: Starting bitbake server...<br>
basehash changed from d92c4da62ccda424103c7615dffc5f747da83bf64a46be63acc11=
633480a6bf6 to a26822f4999a6bdbe8e8e60db91c1400e2b4011b66d98a9ec57a53d6fc70=
dc88<br>
Variable UNINATIVE_LOADER value changed:<br>
@@ -1,4 +1,4 @@<br>
=C2=A0${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.util=
s.contains(&#39;BUILD_ARCH&#39;, &#39;x86_64&#39;, &#39;ld-linux-x86-64.so.=
2&#39;, &#39;&#39;, d)}${@bb.utils.contains(&#39;BUILD_ARCH&#39;, &#39;i686=
&#39;, &#39;ld-linux.so.2&#39;, &#39;&#39;, d)}${@bb.utils.contains(&#39;BU=
ILD_ARCH&#39;, &#39;aarch64&#39;, &#39;ld-linux-aarch64.so.1&#39;, &#39;&#3=
9;, d)}<br>
=C2=A0BUILD_ARCH{aarch64} =3D Unset<br>
-BUILD_ARCH{i686} =3D Set<br>
-BUILD_ARCH{x86_64} =3D Unset<br>
+BUILD_ARCH{i686} =3D Unset<br>
+BUILD_ARCH{x86_64} =3D Set<br>
<br>
which makes the problem fairly obvious when you see it put that way...<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah th=
at makes sense. I was trying to be too cute :) I&#39;ll stick with my origi=
nal plan of using /bin/false</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000086cede058a448cb2--
