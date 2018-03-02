Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC7571993
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:57:18 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g21so11953089ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z3qFERwvnWAT5hy7koB+oUobwDQeBVakir85v2eBKAM=;
	b=VNFZcpYjVlTCa+nlLPirhIR34GUMmznH1ZlIkiODEhJetjdoWevq3ZFKmL6SqbNvKG
	kvnnmF1Wv/lmHQgV4bUu8GNJlsYpNDGKRFVxNqjiwX4T4MxolQmSbTkgj1BvEIme76IW
	b3X2MSkahsjtLOrYxL1DRwqlA+knju4Q0bla6UqtQyxlqM9Q0d03kjp4SUbPM/GAGH4L
	GZr7LuXvijihz/0fTlp5LutYYabDOQMI8BbHYIf40A8HJLH+HCSqGXy/8ZS1wgxgAfch
	mniQUr1YYWubZMCadXyShjHeQVrGV8PHNkugtp7o2+aJvcRjSE7gKT9CqbfPJ+cWJqFa
	kOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z3qFERwvnWAT5hy7koB+oUobwDQeBVakir85v2eBKAM=;
	b=piuxP4iEMolYZdyah0EH2L7D8Vdymzi5W0DGWdeJD2G2z96TB+R82bnVUGtuwOoyLM
	qISIwnHl7bSFeVrE0GCNjF1JiRHU0P/69k3XU+i/T5SvKFVcU2ZYBMsL1qK6rtUZpsG5
	TMsietia1sG43O7Uxs3sF7Sy8dt1aN9sdWrZjKb7kYfLz/IdlEEvx8UvtwxjzdIF5TQD
	QQx/EDXiCBqv2ZH/ogEztUdUA0RvEJxQvsdLD//tQC3KPpQYY0tYOfogbeOr5CcG73Br
	mChPRTQ80C3eH/cAvl319pKpUyOJC8kdxAQqWQxZBF+K9h9dZC4avtTGA53Sl6U4jiKu
	V81Q==
X-Gm-Message-State: AElRT7HyGd47ixI5Mp+FsfjwA45/8lOlm22HRiJnvvq4YHN4mGJ8Mqwj
	n6Khacz1LgiR/gP0Db/znHGcInev9aIHFXILCAz9Bg==
X-Google-Smtp-Source: AG47ELuTCQbhflAH8n0ZYeETBzGoc6+GP4u6H027adMJwz28gfD5sQRRnm4ruiZpRv/7N5TNubIWRaKSQMjyKSJrKDQ=
X-Received: by 10.107.161.200 with SMTP id k191mr7766306ioe.270.1520024239719; 
	Fri, 02 Mar 2018 12:57:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 2 Mar 2018 12:56:59 -0800 (PST)
In-Reply-To: <20180302181449.GR2786@denix.org>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
	<20180301140052.1388-14-alexander.kanavin@linux.intel.com>
	<CAJTo0LbB5ZAHTmcbv5Moof0kjYejw4XOskNawqH3sCopyxPSFg@mail.gmail.com>
	<20180302181449.GR2786@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Mar 2018 20:56:59 +0000
Message-ID: <CAJTo0LZMj6fmtJ8BN00DLoTwAX146_kcg_1CZS8Lu2NMZ-EO5Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/15] expect: upgrade 5.45.3 -> 5.45.4
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
X-List-Received-Date: Fri, 02 Mar 2018 20:57:18 -0000
Content-Type: multipart/alternative; boundary="001a113e9198dbf1d10566743875"

--001a113e9198dbf1d10566743875
Content-Type: text/plain; charset="UTF-8"

That would be it, thanks Denys.

Ross

On 2 March 2018 at 18:14, Denys Dmytriyenko <denis@denix.org> wrote:

> FYI, sourceforge is currently experiencing issues (another DDoS attack?)
> and
> instead of tarballs, serves HTML file with this text:
>
> We're sorry -- the Sourceforge site is currently in Disaster Recovery mode,
> and currently requires the use of javascript to function.  Please check
> back
> later.
>
> --
> Denys
>
>
> On Fri, Mar 02, 2018 at 02:12:22PM +0000, Burton, Ross wrote:
> > ERROR: expect-5.45.4-r0 do_fetch: Fetcher failure for URL: '
> > http://downloads.sourceforge.net/expect/Expect/5.45.4/
> expect5.45.4.tar.gz'.
> > Checksum mismatch!
> > File: '/srv/autobuilder/
> > autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz' has
> md5
> > checksum cb530d737c8f2d1023797cf0587b4e05 when
> > 00fce8de158422f5ccd2666512329bd2 was expected
> > File: '/srv/autobuilder/
> > autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz' has
> > sha256 checksum
> > 7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf when
> > 49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34 was
> > expected
> > If this change is expected (e.g. you have upgraded to a new version
> without
> > updating the checksums) then you can use these lines within the recipe:
> > SRC_URI[md5sum] = "cb530d737c8f2d1023797cf0587b4e05"
> > SRC_URI[sha256sum] =
> > "7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf"
> >
> > Yes, they changed the tarball between you submitting this (and me testing
> > it here), and the autobuilder run last night.
> >
> > Actually worth checking they haven't been hacked, although god knows who
> > would want to compromise expect of all things.
> >
> > Ross
> >
> > On 1 March 2018 at 14:00, Alexander Kanavin <
> > alexander.kanavin@linux.intel.com> wrote:
> >
> > > Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > > ---
> > >  meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb}
> | 4
> > > ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/expect/{expect_5.45.3.bb =>
> expect_5.45.4.bb}
> > > (95%)
> > >
> > > diff --git a/meta/recipes-devtools/expect/expect_5.45.3.bb
> > > b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > > similarity index 95%
> > > rename from meta/recipes-devtools/expect/expect_5.45.3.bb
> > > rename to meta/recipes-devtools/expect/expect_5.45.4.bb
> > > index 445eca5742d..96eacd92934 100644
> > > --- a/meta/recipes-devtools/expect/expect_5.45.3.bb
> > > +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > > @@ -26,8 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/
> > > Expect/${PV}/${BPN}${PV}.tar.gz \
> > >             file://0001-Resolve-string-formatting-issues.patch \
> > >             file://0001-expect-Fix-segfaults-if-Tcl-is-built-
> with-stubs-and-.patch
> > > \
> > >            "
> > > -SRC_URI[md5sum] = "a8855cd41c1ef004b9794db9e2a57a9d"
> > > -SRC_URI[sha256sum] = "c520717b7195944a69ce1492ec82ca
> > > 0ac3f3baf060804e6c5ee6d505ea512be9"
> > > +SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
> > > +SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c
> > > 7767bb9a323e40c4781f89caf760b92c34"
> > >
> > >  UPSTREAM_CHECK_URI = "http://sourceforge.net/
> > > projects/expect/files/Expect/"
> > >  UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
> > > --
> > > 2.15.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
>
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113e9198dbf1d10566743875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That would be it, thanks Denys.<div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2 Mar=
ch 2018 at 18:14, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto=
:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">FYI, sourceforge is currently experiencing=
 issues (another DDoS attack?) and<br>
instead of tarballs, serves HTML file with this text:<br>
<br>
We&#39;re sorry -- the Sourceforge site is currently in Disaster Recovery m=
ode,<br>
and currently requires the use of javascript to function.=C2=A0 Please chec=
k back<br>
later.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Fri, Mar 02, 2018 at 02:12:22PM +0000, Burton, Ross wrote:<br>
&gt; ERROR: expect-5.45.4-r0 do_fetch: Fetcher failure for URL: &#39;<br>
&gt; <a href=3D"http://downloads.sourceforge.net/expect/Expect/5.45.4/expec=
t5.45.4.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downloads.sourc=
eforge.<wbr>net/expect/Expect/5.45.4/<wbr>expect5.45.4.tar.gz</a>&#39;.<br>
&gt; Checksum mismatch!<br>
&gt; File: &#39;/srv/autobuilder/<br>
&gt; <a href=3D"http://autobuilder.yoctoproject.org/current_sources/expect5=
.45.4.tar.gz" rel=3D"noreferrer" target=3D"_blank">autobuilder.yoctoproject=
.org/<wbr>current_sources/expect5.45.4.<wbr>tar.gz</a>&#39; has md5<br>
&gt; checksum cb530d737c8f2d1023797cf0587b4e<wbr>05 when<br>
&gt; 00fce8de158422f5ccd2666512329b<wbr>d2 was expected<br>
&gt; File: &#39;/srv/autobuilder/<br>
&gt; <a href=3D"http://autobuilder.yoctoproject.org/current_sources/expect5=
.45.4.tar.gz" rel=3D"noreferrer" target=3D"_blank">autobuilder.yoctoproject=
.org/<wbr>current_sources/expect5.45.4.<wbr>tar.gz</a>&#39; has<br>
&gt; sha256 checksum<br>
&gt; 7a07d3f7cca5c0b38ca811984ef8da<wbr>536da32932d68c1a6cce33ec2462b9<wbr>=
30bf when<br>
&gt; 49a7da83b0bdd9f46d04a04deec19c<wbr>7767bb9a323e40c4781f89caf760b9<wbr>=
2c34 was<br>
&gt; expected<br>
&gt; If this change is expected (e.g. you have upgraded to a new version wi=
thout<br>
&gt; updating the checksums) then you can use these lines within the recipe=
:<br>
&gt; SRC_URI[md5sum] =3D &quot;<wbr>cb530d737c8f2d1023797cf0587b4e<wbr>05&q=
uot;<br>
&gt; SRC_URI[sha256sum] =3D<br>
&gt; &quot;<wbr>7a07d3f7cca5c0b38ca811984ef8da<wbr>536da32932d68c1a6cce33ec=
2462b9<wbr>30bf&quot;<br>
&gt;<br>
&gt; Yes, they changed the tarball between you submitting this (and me test=
ing<br>
&gt; it here), and the autobuilder run last night.<br>
&gt;<br>
&gt; Actually worth checking they haven&#39;t been hacked, although god kno=
ws who<br>
&gt; would want to compromise expect of all things.<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On 1 March 2018 at 14:00, Alexander Kanavin &lt;<br>
&gt; <a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin=
@linux.intel.<wbr>com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.=
kanavin@linux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/expect/{<a href=3D"http://expect_5.45=
.3.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>expect_5.45.3.bb</a> =3D&g=
t; <a href=3D"http://expect_5.45.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>expect_5.45.4.bb</a>} | 4<br>
&gt; &gt; ++--<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/expect/{<a href=3D"http://expe=
ct_5.45.3.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>expect_5.45.3.bb</a=
> =3D&gt; <a href=3D"http://expect_5.45.4.bb" rel=3D"noreferrer" target=3D"=
_blank">expect_5.45.4.bb</a>}<br>
&gt; &gt; (95%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/<wbr>expect/<a href=3D"http://=
expect_5.45.3.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.3.bb</a>=
<br>
&gt; &gt; b/meta/recipes-devtools/<wbr>expect/<a href=3D"http://expect_5.45=
.4.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; &gt; similarity index 95%<br>
&gt; &gt; rename from meta/recipes-devtools/expect/<a href=3D"http://expect=
_5.45.3.bb" rel=3D"noreferrer" target=3D"_blank">e<wbr>xpect_5.45.3.bb</a><=
br>
&gt; &gt; rename to meta/recipes-devtools/expect/<a href=3D"http://expect_5=
.45.4.bb" rel=3D"noreferrer" target=3D"_blank">e<wbr>xpect_5.45.4.bb</a><br=
>
&gt; &gt; index 445eca5742d..96eacd92934 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/<wbr>expect/<a href=3D"http://expect_=
5.45.3.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.3.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/<wbr>expect/<a href=3D"http://expect_=
5.45.4.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; &gt; @@ -26,8 +26,8 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/expect/=
<br>
&gt; &gt; Expect/${PV}/${BPN}${PV}.tar.<wbr>gz \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Resolv=
e-string-<wbr>formatting-issues.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-expect=
-Fix-<wbr>segfaults-if-Tcl-is-built-<wbr>with-stubs-and-.patch<br>
&gt; &gt; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;<wbr>a8855cd41c1ef004b9794db9e2a57a<wb=
r>9d&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;<wbr>c520717b7195944a69ce1492ec82ca=
<br>
&gt; &gt; 0ac3f3baf060804e6c5ee6d505ea51<wbr>2be9&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;<wbr>00fce8de158422f5ccd2666512329b<wb=
r>d2&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;<wbr>49a7da83b0bdd9f46d04a04deec19c=
<br>
&gt; &gt; 7767bb9a323e40c4781f89caf760b9<wbr>2c34&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://sourceforge.=
net/" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.net/</a><br>
&gt; &gt; projects/expect/files/Expect/&quot;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;/Expect/(?P&lt;pver&gt;(\d+[=
\.\-_]*<wbr>)+)/&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.15.1<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.<wbr>openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt; &gt;<br>
<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
</div></div></blockquote></div><br></div>

--001a113e9198dbf1d10566743875--
