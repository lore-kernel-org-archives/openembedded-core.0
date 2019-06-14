Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id BFEF97E918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 09:25:32 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e8so1044416otl.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 02:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jbbIIPWy0Ns+xP7Nmy3lMRaZQhVBJwMcZaYdPZnLcWU=;
	b=KXeD+yyOxFRP/xzgsNQlsw4Tpv3xRiDayrwQ0I+cOtyoWKgHhRmyCwbX487QARtMFN
	ntBVpcfe8X/DfkDVh24BJIE2crtyPGHILnqP3MuX1E/t90cmsCHZi9uM9KduCQGhsiD7
	XdnEkRe8KIxiTfgKY9y5KRcdpDsp1kw6//wB85yDw1zyV117LdAiOPbmZtTjFWhQAthe
	9HLDS5AZrOyu9rqmcrZ75AHouFrh9sh6G5cy7+1ybPB02wJePTi8mI/GagxRxfr67ZXg
	+MMJBEDMHjit2s72K3flr1C1jx31w6aRHbocTvc/FEOLgOZn+2d3P1u3lzLvSm1MxE6D
	mNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jbbIIPWy0Ns+xP7Nmy3lMRaZQhVBJwMcZaYdPZnLcWU=;
	b=TX9mQ7zRUG2bvQhVqEibgsnZnHShMbhWOzCEYqmGkj/sY7+BAvQ/mF/gcq5JUnF4hz
	efIB9ucNEPWa29sr8X9x+S6313JsoRuJET1pMsi/SGX6Zs1IbYYalVO7zP+pGEhAsnXU
	m8awa7qNmL8+nFzlGRwLj1oDnuVhDeVulQwFD/kZYQPhhQdhRWqj3/yyUS6N2Sdd8ne9
	W6UDYVKDV2dOXK9Heb4exXVVNMjCD1NMyDzF+6m+ZgFaVDjQR2cj3Y0ZBreadrpOpXwT
	BVag7pieN8ryS60+YV9lc5OlGj8m8V9vByURjoDm+Dm/8C5BuP5dxnW3S4q1oTpG7giT
	6qwg==
X-Gm-Message-State: APjAAAXZ82qJVh0Khskc6AtMZ+FgggySWUMYeWjNWzdltOa1s8mtubyr
	iyjLsFT7eSzC00WahjP/UIq4v4yBAhNQc2Qn5zg=
X-Google-Smtp-Source: APXvYqzDfZsNFYCPAzCr+/Jkihl5Y5Rc40ItZ8BEuqsQ0DNjfhjVW2PHhTKc/DojbOtlYe0Vm8W+h7e+roGcs7vLC08=
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr43445663otf.61.1560504333764; 
	Fri, 14 Jun 2019 02:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <1559434935-11842-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJTo0LYF08Tad=-RwO_7Bj5a58yeEgmR-XFCsSw2RbsDT=DAkQ@mail.gmail.com>
	<CANNYZj_t-EOfWCmuQjYzgJW6gzQdHvDqRHb6-ohOpoH1nuB=sQ@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FD01BF12DE61@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF12DE61@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2019 11:25:21 +0200
Message-ID: <CANNYZj-a8FiRLKdX3Erd4qmzE5VgTNNTtU=iyCUxti-J3yyTww@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Fri, 14 Jun 2019 09:25:33 -0000
Content-Type: multipart/alternative; boundary="0000000000007c0ab0058b453aa9"

--0000000000007c0ab0058b453aa9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status

Alex

On Fri, 14 Jun 2019 at 03:00, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:

> Hi, Alex
>
>
>
> I refered to the previous patches. Should the Upstream-Status be
> =E2=80=9CSubmitted=E2=80=9D ?
>
>
>
>
>
> Best regards
>
> Lei
>
>
>
>
>
> *From:* Alexander Kanavin [mailto:alex.kanavin@gmail.com]
> *Sent:* Thursday, June 13, 2019 8:45 PM
> *To:* Burton, Ross
> *Cc:* Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7; Hong Liu; OE-core
> *Subject:* Re: [OE-core] [PATCH] openssl: Fix a build bug on aarch64BE.
>
>
>
> Also if the patch is already submitted, the status should not be Pending.
>
>
>
> Alex
>
>
>
> On Thu, 13 Jun 2019 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 13 Jun 2019 at 09:48, Lei Maohui <leimaohui@cn.fujitsu.com> wrote=
:
> >
> > From: Hong Liu <hongl.fnst@cn.fujitsu.com>
> >
> > Fix bug as following on aarch64BE:
> >
> > Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
> >
> > Upstream-Status: Pending [https://github.com/openssl/openssl/pull/9151]
>
> This line ^^^
>
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  ...01-Fix-build-error-for-aarch64-big-endian.patch | 41
> ++++++++++++++++++++++
> >  .../recipes-connectivity/openssl/openssl_1.1.1c.bb |  1 +
> >  2 files changed, 42 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch6=
4-big-endian.patch
> >
> > diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarc=
h64-big-endian.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarc=
h64-big-endian.patch
> > new file mode 100644
> > index 0000000..65ca02c
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarc=
h64-big-endian.patch
> > @@ -0,0 +1,41 @@
> > +From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 2001
> > +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> > +Date: Thu, 13 Jun 2019 12:17:30 +0900
> > +Subject: [PATCH] Fix build error for aarch64 big endian.
> > +
> > +Modified rev to rev64, because rev only takes integer registers.
> > +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D90827
> > +Otherwise, the following error will occur.
> > +
> > +Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
> > +
>
> ^^ goes here.
>
> The upstream status is a property of the patch you're adding, not the
> commit message.
>
> > +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > +---
> > + crypto/sha/asm/keccak1600-armv8.pl | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/crypto/sha/asm/keccak1600-armv8.pl b/crypto/sha/asm/
> keccak1600-armv8.pl
> > +index dc72f18..6620690 100755
> > +--- a/crypto/sha/asm/keccak1600-armv8.pl
> > ++++ b/crypto/sha/asm/keccak1600-armv8.pl
> > +@@ -731,7 +731,7 @@ $code.=3D<<___;
> > +       blo     .Lprocess_block_ce
> > +       ldr     d31,[$inp],#8           // *inp++
> > + #ifdef        __AARCH64EB__
> > +-      rev     v31.16b,v31.16b
> > ++      rev64   v31.16b,v31.16b
> > + #endif
> > +       eor     $A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
> > +       beq     .Lprocess_block_ce
> > +@@ -740,7 +740,7 @@ ___
> > + $code.=3D<<___;
> > +       ldr     d31,[$inp],#8           // *inp++
> > + #ifdef        __AARCH64EB__
> > +-      rev     v31.16b,v31.16b
> > ++      rev64   v31.16b,v31.16b
> > + #endif
> > +       eor     $A[4][4],$A[4][4],v31.16b
> > +
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> > index 669b1a1..ec85ccd 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> > @@ -16,6 +16,7 @@ SRC_URI =3D "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >             file://0001-skip-test_symbol_presence.patch \
> >
>  file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> >             file://afalg.patch \
> > +           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
> >             "
> >
> >  SRC_URI_append_class-nativesdk =3D " \
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--0000000000007c0ab0058b453aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes: <br></div><div><a href=3D"https://www.openembedd=
ed.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_U=
pstream-Status">https://www.openembedded.org/wiki/Commit_Patch_Message_Guid=
elines#Patch_Header_Recommendations:_Upstream-Status</a></div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 14 Jun 2019 at 03:00, Lei, Maohui &lt;<a href=
=3D"mailto:leimaohui@cn.fujitsu.com">leimaohui@cn.fujitsu.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-6290982164185658674WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;MS M=
incho&quot;">Hi, Alex<u></u><u></u></span></p>
<p class=3D"gmail-m_-6290982164185658674MsoPlainText"><u></u>=C2=A0<u></u><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;MS M=
incho&quot;">I refered to the previous patches. Should the Upstream-Status =
be =E2=80=9CSubmitted=E2=80=9D ?</span><span style=3D"font-size:11pt;font-f=
amily:&quot;Arial&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u=
><u></u></span></p>
<p class=3D"gmail-m_-6290982164185658674MsoPlainText"><u></u>=C2=A0<u></u><=
/p>
<p class=3D"gmail-m_-6290982164185658674MsoPlainText"><u></u>=C2=A0<u></u><=
/p>
<p class=3D"gmail-m_-6290982164185658674MsoPlainText">Best regards <u></u><=
u></u></p>
<p class=3D"gmail-m_-6290982164185658674MsoPlainText">Lei<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Aria=
l&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Aria=
l&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></=
span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(181,196,223) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:&quot;T=
ahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-siz=
e:10pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Alexander Ka=
navin [mailto:<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>]
<br>
<b>Sent:</b> Thursday, June 13, 2019 8:45 PM<br>
<b>To:</b> Burton, Ross<br>
<b>Cc:</b> Lei, Maohui/</span><span style=3D"font-size:10pt;font-family:=E5=
=AE=8B=E4=BD=93" lang=3D"ZH-CN">=E9=9B=B7</span><span style=3D"font-size:10=
pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;" lang=3D"ZH-CN">
</span><span style=3D"font-size:10pt;font-family:=E5=AE=8B=E4=BD=93" lang=
=3D"ZH-CN">=E8=8C=82=E6=85=A7</span><span style=3D"font-size:10pt;font-fami=
ly:&quot;Tahoma&quot;,&quot;sans-serif&quot;">; Hong Liu; OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] openssl: Fix a build bug on aarch64BE=
.<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Also if the patch is already submitted, the status s=
hould not be Pending.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, 13 Jun 2019 at 11:23, Burton, Ross &lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">On Thu, 13 Jun 2019 at 09:48, Lei Maohui &lt;<a href=
=3D"mailto:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Hong Liu &lt;<a href=3D"mailto:hongl.fnst@cn.fujitsu.com" target=
=3D"_blank">hongl.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;<br>
&gt; Fix bug as following on aarch64BE:<br>
&gt;<br>
&gt; Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b&#=
39;<br>
&gt;<br>
&gt; Upstream-Status: Pending [<a href=3D"https://github.com/openssl/openss=
l/pull/9151" target=3D"_blank">https://github.com/openssl/openssl/pull/9151=
</a>]<br>
<br>
This line ^^^<br>
<br>
&gt; Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.c=
om" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...01-Fix-build-error-for-aarch64-big-endian.patch | 41 ++++++++=
++++++++++++++<br>
&gt;=C2=A0 .../recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1=
c.bb" target=3D"_blank">openssl_1.1.1c.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 42 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/openssl/000=
1-Fix-build-error-for-aarch64-big-endian.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-=
error-for-aarch64-big-endian.patch b/meta/recipes-connectivity/openssl/open=
ssl/0001-Fix-build-error-for-aarch64-big-endian.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..65ca02c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-f=
or-aarch64-big-endian.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com" targ=
et=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
&gt; +Date: Thu, 13 Jun 2019 12:17:30 +0900<br>
&gt; +Subject: [PATCH] Fix build error for aarch64 big endian.<br>
&gt; +<br>
&gt; +Modified rev to rev64, because rev only takes integer registers.<br>
&gt; +<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D90827" targ=
et=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D90827</a><br>
&gt; +Otherwise, the following error will occur.<br>
&gt; +<br>
&gt; +Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b&=
#39;<br>
&gt; +<br>
<br>
^^ goes here.<br>
<br>
The upstream status is a property of the patch you&#39;re adding, not the<b=
r>
commit message.<br>
<br>
&gt; +Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.=
com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" target=3D"_bla=
nk">keccak1600-armv8.pl</a> | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" ta=
rget=3D"_blank">keccak1600-armv8.pl</a> b/crypto/sha/asm/<a href=3D"http://=
keccak1600-armv8.pl" target=3D"_blank">keccak1600-armv8.pl</a><br>
&gt; +index dc72f18..6620690 100755<br>
&gt; +--- a/crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" target=3D=
"_blank">keccak1600-armv8.pl</a><br>
&gt; ++++ b/crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" target=3D=
"_blank">keccak1600-armv8.pl</a><br>
&gt; +@@ -731,7 +731,7 @@ $code.=3D&lt;&lt;___;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0blo=C2=A0 =C2=A0 =C2=A0.Lprocess_block_ce<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0 =C2=A0d31,[$inp],#8=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// *inp++<br>
&gt; + #ifdef=C2=A0 =C2=A0 =C2=A0 =C2=A0 __AARCH64EB__<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rev=C2=A0 =C2=A0 =C2=A0v31.16b,v31.16b<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rev64=C2=A0 =C2=A0v31.16b,v31.16b<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0eor=C2=A0 =C2=A0 =C2=A0$A[$j/5][$j%5],$A[$=
j/5][$j%5],v31.16b<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0beq=C2=A0 =C2=A0 =C2=A0.Lprocess_block_ce<=
br>
&gt; +@@ -740,7 +740,7 @@ ___<br>
&gt; + $code.=3D&lt;&lt;___;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0 =C2=A0d31,[$inp],#8=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// *inp++<br>
&gt; + #ifdef=C2=A0 =C2=A0 =C2=A0 =C2=A0 __AARCH64EB__<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rev=C2=A0 =C2=A0 =C2=A0v31.16b,v31.16b<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rev64=C2=A0 =C2=A0v31.16b,v31.16b<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0eor=C2=A0 =C2=A0 =C2=A0$A[4][4],$A[4][4],v=
31.16b<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://opens=
sl_1.1.1c.bb" target=3D"_blank">openssl_1.1.1c.bb</a> b/meta/recipes-connec=
tivity/openssl/<a href=3D"http://openssl_1.1.1c.bb" target=3D"_blank">opens=
sl_1.1.1c.bb</a><br>
&gt; index 669b1a1..ec85ccd 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1c.bb" target=3D"_blank">openssl_1.1.1c.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1c.bb" target=3D"_blank">openssl_1.1.1c.bb</a><br>
&gt; @@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/=
source/openssl-$%7BPV%7D.tar.gz" target=3D"_blank">http://www.openssl.org/s=
ource/openssl-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-skip-test_s=
ymbol_presence.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-buildinfo-s=
trip-sysroot-and-debug-prefix-map-from-co.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://afalg.patch \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-error-=
for-aarch64-big-endian.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-nativesdk =3D &quot; \<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">
http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000007c0ab0058b453aa9--
