Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64BC66D52B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 12:45:31 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w79so14293910oif.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mN80HKcL6qhao+UzK/Cc/f+N9mDu5SQrrCPh9QmoZWY=;
	b=iufEROwo02CTtwDalckhNuF4f0N0Acju+ba7e7vg8CM8FlgG76TGwewHrE/mGPqaqC
	p13s/zVWk95Jxu1uAh3AAt2lf79YhlVr7XYc64gjFN6Z+uYi4yyYU24rUWnD35hUcTve
	yLwoZWmV5O6XFZ0IN2yeAeaWeUFsSiiiT1U3mtpkcWImEqTNWH6Xp/DJkNgWhO5FVyu6
	YuvpkgGuqJPilUXpPNc3cvDilG2zSdjYPugEKI7hLJt8+ZzjPfwmC7jn3TOhzUUuu5Sp
	5KDDO56+qxivE/bxUxCHo0qd7f5oZEM9qXrnBruXO9NL7dq9sfzG7L0ORXalgqsR4/9M
	GURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mN80HKcL6qhao+UzK/Cc/f+N9mDu5SQrrCPh9QmoZWY=;
	b=RngFKGw/v9X8sVudCJ0A2wW0sdwVECFvNQQrnVw2u14JOBzUPCC6hlwK+DZDUYY/MO
	h8fH1bVLpqJGxJZYOzPj7NIb909TN7/g4WShaXwjyD7Fn7g/1JVmPhkqr+oVdtVfRIDQ
	5kZJzU95aJV7De19Sp+DCYlyTHmq0jlaJCVcE/F2YI7PlK+rkRwFphah872eNu2srsDf
	4gxXV+ghoqS5jNHEDBnT8Uf4oSeAiqKXj+rDrvngTxTm2Kdbj1N/RqRNU7+WeKIeDW0I
	VCskLswrVjLzGMfsDcwcPT0yL/BM/Y/XtIxb1t6zRtwN2ZqTo+GVZ3WNlWFJ5po2rTbR
	AA8g==
X-Gm-Message-State: APjAAAUDSytv9MUKkNgfLfoOmI8z5K+JxV/Phd6yYKt0TraxVq39jwfP
	zfBn99QriVXTOHxh6UJFlUcNfbJU/xIVHzFkRt0=
X-Google-Smtp-Source: APXvYqxxJOkYio/+IKfEe+7NcCmQo7kxzrCsaazSJDTpEE5JU0S3XSRIDdAYpe0njSUeBMKddnQ6xrZYlA6FcKf4zKk=
X-Received: by 2002:aca:4d8:: with SMTP id 207mr2878183oie.88.1560429932219;
	Thu, 13 Jun 2019 05:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <1559434935-11842-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJTo0LYF08Tad=-RwO_7Bj5a58yeEgmR-XFCsSw2RbsDT=DAkQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYF08Tad=-RwO_7Bj5a58yeEgmR-XFCsSw2RbsDT=DAkQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Jun 2019 14:45:20 +0200
Message-ID: <CANNYZj_t-EOfWCmuQjYzgJW6gzQdHvDqRHb6-ohOpoH1nuB=sQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 13 Jun 2019 12:45:31 -0000
Content-Type: multipart/alternative; boundary="000000000000ce9118058b33e751"

--000000000000ce9118058b33e751
Content-Type: text/plain; charset="UTF-8"

Also if the patch is already submitted, the status should not be Pending.

Alex

On Thu, 13 Jun 2019 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:

> On Thu, 13 Jun 2019 at 09:48, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
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
> meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> >
> > diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> > new file mode 100644
> > index 0000000..65ca02c
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> > @@ -0,0 +1,41 @@
> > +From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 2001
> > +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> > +Date: Thu, 13 Jun 2019 12:17:30 +0900
> > +Subject: [PATCH] Fix build error for aarch64 big endian.
> > +
> > +Modified rev to rev64, because rev only takes integer registers.
> > +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90827
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
> > +@@ -731,7 +731,7 @@ $code.=<<___;
> > +       blo     .Lprocess_block_ce
> > +       ldr     d31,[$inp],#8           // *inp++
> > + #ifdef        __AARCH64EB__
> > +-      rev     v31.16b,v31.16b
> > ++      rev64   v31.16b,v31.16b
> > + #endif
> > +       eor     $A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
> > +       beq     .Lprocess_block_ce
> > +@@ -740,7 +740,7 @@ ___
> > + $code.=<<___;
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
> > @@ -16,6 +16,7 @@ SRC_URI = "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >             file://0001-skip-test_symbol_presence.patch \
> >
>  file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> >             file://afalg.patch \
> > +           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
> >             "
> >
> >  SRC_URI_append_class-nativesdk = " \
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

--000000000000ce9118058b33e751
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Also if the patch is already submitted, the status sh=
ould not be Pending.</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 13 Jun =
2019 at 11:23, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Thu, 13 Jun 2019 at 09:48, Lei Maohui &lt;<a href=3D"=
mailto:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com=
</a>&gt; wrote:<br>
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
l/pull/9151" rel=3D"noreferrer" target=3D"_blank">https://github.com/openss=
l/openssl/pull/9151</a>]<br>
<br>
This line ^^^<br>
<br>
&gt; Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.c=
om" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...01-Fix-build-error-for-aarch64-big-endian.patch | 41 ++++++++=
++++++++++++++<br>
&gt;=C2=A0 .../recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1=
c.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1c.bb</a> |=C2=A0 1 =
+<br>
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
&gt; +<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D90827" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D90827</a><br>
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
&gt; + crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" rel=3D"norefer=
rer" target=3D"_blank">keccak1600-armv8.pl</a> | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" re=
l=3D"noreferrer" target=3D"_blank">keccak1600-armv8.pl</a> b/crypto/sha/asm=
/<a href=3D"http://keccak1600-armv8.pl" rel=3D"noreferrer" target=3D"_blank=
">keccak1600-armv8.pl</a><br>
&gt; +index dc72f18..6620690 100755<br>
&gt; +--- a/crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" rel=3D"no=
referrer" target=3D"_blank">keccak1600-armv8.pl</a><br>
&gt; ++++ b/crypto/sha/asm/<a href=3D"http://keccak1600-armv8.pl" rel=3D"no=
referrer" target=3D"_blank">keccak1600-armv8.pl</a><br>
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
sl_1.1.1c.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1c.bb</a> b/=
meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1c.bb" rel=
=3D"noreferrer" target=3D"_blank">openssl_1.1.1c.bb</a><br>
&gt; index 669b1a1..ec85ccd 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1c.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1c.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.=
1c.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1c.bb</a><br>
&gt; @@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/=
source/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//www.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
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
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ce9118058b33e751--
