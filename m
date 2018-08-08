Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4629978AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:01:39 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id n6-v6so2765892qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zz4XQRY+u5/cRjOCoJKUCFeJb9x7C1pstKQtISQYnT0=;
	b=vK9snEc7NFOJuhGeeP+zg1acv1nlzStw/Wz7sUHk0XIRAulbemvHBajWFGySJOOOG4
	upTLlTa5ILcscxHt4VcupcwDw9nDHbD7rRGSMzPD48kOVdLjAxSNrtNR7k0DWeLB65JW
	+LgM6ohUTi+6ay1eAyigVlX+w7IKh+wlt35iU/QmLXGVHAoTGKqsNEAQiYD9qruOk4au
	QmU0YB9n5mxp7T44kHIIDyGB3GJ7XXw6FfhGEf2hEZ1lkHLp3YqyE1jBgnYF/vV8VSPx
	N6IYEvMvKnCRrMdb0cG8aNobKYOExdYLD9++k0wnm1dhfcajlG4suUoWYolTzBZtr9Ji
	kPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zz4XQRY+u5/cRjOCoJKUCFeJb9x7C1pstKQtISQYnT0=;
	b=VtIWoPBMfB6mFq/SIKf8lb0MsuaiXff0v8TwtLGu98yxqy6SxmwPBOaycbCGuSAeMy
	uRrq929CzpVBmkZyzSe1ARSun9MUpgHldMDWPlxHaX9LoVFmx3/eCxWlLrFz9AditrP+
	SJJWeXZjplN1Hmh8KXB3ihnTF8zamx7HmT5yLxqp3K/32o0VgW998w3+R/MbeTMw//Wo
	05zO/dNO/YwszwhQ3CMvL/ahtukPWu8coy4Mjbt0ST/4SkQl7KE8ba83Dr2g/cHGyUy7
	siiZRi0hOgxds4yLepT0Jnu/0tsikU0MLeErkyejXxI0QZX3fqH6OmmC+hUyJ7hoo49C
	21sw==
X-Gm-Message-State: AOUpUlH66z9aVWAlPJ/fhNrtntNzpTq9NfMfsMpAlxmK0d48GoahdHJS
	236ikGDzEs2hfq2A35kDBvPbmYnbLA4FZPoUGxE=
X-Google-Smtp-Source: AA+uWPyPvbLcoOo3m1qXuYcU/knspz/Tkx189/CyO9+fEHgKBl6gF+Zkmg1G5bEjudC3y58pqcHicGvuzjlyFwOM+b8=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr3031915qta.117.1533740499709; 
	Wed, 08 Aug 2018 08:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1533595822.git.raj.khem@gmail.com>
	<06c361481025023e6ad962759e5968bd9c19c0b7.1533595822.git.raj.khem@gmail.com>
	<CAJTo0LZcy+LcFu0stiT5ve4mOy3KCYDH_JRONAxxYAZxY343Pg@mail.gmail.com>
In-Reply-To: <CAJTo0LZcy+LcFu0stiT5ve4mOy3KCYDH_JRONAxxYAZxY343Pg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2018 08:01:28 -0700
Message-ID: <CAMKF1sq4kwGH4Zs4gDDruwWL4QmCUmf1RkcdMTXryxyUi0K-ew@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/18] ppp: Use openssl for the DES instead of the libcrypt / glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 15:01:39 -0000
Content-Type: multipart/alternative; boundary="000000000000a9b2b60572edc99a"

--000000000000a9b2b60572edc99a
Content-Type: text/plain; charset="UTF-8"

Does it provide DES implementation I am not sure but if it does then it
might be another option

On Wed, Aug 8, 2018 at 3:40 AM Burton, Ross <ross.burton@intel.com> wrote:

> Why not use libxcrypt?
>
> Ross
>
> On 6 August 2018 at 23:57, Khem Raj <raj.khem@gmail.com> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       | 84 +++++++++++++++++++
> >  meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  5 +-
> >  2 files changed, 87 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> >
> > diff --git
> a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> > new file mode 100644
> > index 0000000000..e53f240543
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> > @@ -0,0 +1,84 @@
> > +Used openssl for the DES instead of the libcrypt / glibc
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Index: ppp-2.4.7/pppd/Makefile.linux
> > +===================================================================
> > +--- ppp-2.4.7.orig/pppd/Makefile.linux
> > ++++ ppp-2.4.7/pppd/Makefile.linux
> > +@@ -38,7 +38,7 @@ LIBS =
> > + # Uncomment the next 2 lines to include support for Microsoft's
> > + # MS-CHAP authentication protocol.  Also, edit
> plugins/radius/Makefile.linux.
> > + CHAPMS=y
> > +-USE_CRYPT=y
> > ++#USE_CRYPT=y
> > + # Don't use MSLANMAN unless you really know what you're doing.
> > + #MSLANMAN=y
> > + # Uncomment the next line to include support for MPPE.  CHAPMS (above)
> must
> > +@@ -132,7 +132,7 @@ endif
> > +
> > + ifdef NEEDDES
> > + ifndef USE_CRYPT
> > +-LIBS     += -ldes $(LIBS)
> > ++LIBS     += -lcrypto
> > + else
> > + CFLAGS   += -DUSE_CRYPT=1
> > + endif
> > +Index: ppp-2.4.7/pppd/pppcrypt.c
> > +===================================================================
> > +--- ppp-2.4.7.orig/pppd/pppcrypt.c
> > ++++ ppp-2.4.7/pppd/pppcrypt.c
> > +@@ -64,7 +64,7 @@ u_char *des_key;     /* OUT 64 bit DES key w
> > +       des_key[7] = Get7Bits(key, 49);
> > +
> > + #ifndef USE_CRYPT
> > +-      des_set_odd_parity((des_cblock *)des_key);
> > ++      DES_set_odd_parity((DES_cblock *)des_key);
> > + #endif
> > + }
> > +
> > +@@ -158,25 +158,25 @@ u_char *clear;   /* OUT 8 octets */
> > + }
> > +
> > + #else /* USE_CRYPT */
> > +-static des_key_schedule       key_schedule;
> > ++static DES_key_schedule       key_schedule;
> > +
> > + bool
> > + DesSetkey(key)
> > + u_char *key;
> > + {
> > +-      des_cblock des_key;
> > ++      DES_cblock des_key;
> > +       MakeKey(key, des_key);
> > +-      des_set_key(&des_key, key_schedule);
> > ++      DES_set_key(&des_key, &key_schedule);
> > +       return (1);
> > + }
> > +
> > + bool
> > +-DesEncrypt(clear, key, cipher)
> > ++DesEncrypt(clear, cipher)
> > + u_char *clear;        /* IN  8 octets */
> > + u_char *cipher;       /* OUT 8 octets */
> > + {
> > +-      des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
> > +-          key_schedule, 1);
> > ++      DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
> > ++          &key_schedule, 1);
> > +       return (1);
> > + }
> > +
> > +@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
> > + u_char *cipher;       /* IN  8 octets */
> > + u_char *clear;        /* OUT 8 octets */
> > + {
> > +-      des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
> > +-          key_schedule, 0);
> > ++      DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
> > ++          &key_schedule, 0);
> > +       return (1);
> > + }
> > +
> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> > index a1bb7d71c1..f4646bd693 100644
> > --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> > +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> > @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris
> systems."
> >  SECTION = "console/network"
> >  HOMEPAGE = "http://samba.org/ppp/"
> >  BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
> > -DEPENDS = "libpcap"
> > +DEPENDS = "libpcap openssl"
> >  LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
> >  LIC_FILES_CHKSUM =
> "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea
> \
> >
> file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8
> \
> > @@ -32,6 +32,7 @@ SRC_URI = "
> https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
> >             file://fix-CVE-2015-3310.patch \
> >
>  file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
> >             file://0001-ppp-Remove-unneeded-include.patch \
> > +           file://ppp-2.4.7-DES-openssl.patch \
> >  "
> >
> >  SRC_URI_append_libc-musl = "\
> > @@ -49,7 +50,7 @@ EXTRA_OECONF = "--disable-strip"
> >  # Package Makefile computes CFLAGS, referencing COPTS.
> >  # Typically hard-coded to '-O2 -g' in the Makefile's.
> >  #
> > -EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${S}/include"'
> > +EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl
> -I${S}/include"'
> >
> >  do_configure () {
> >         oe_runconf
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a9b2b60572edc99a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Does it provide DES implementation I am not sure but=
 if it does then it might be another option=C2=A0</div></div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 8, 2018 at 3:40 AM Burto=
n, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Why not use libxcryp=
t?<br>
<br>
Ross<br>
<br>
On 6 August 2018 at 23:57, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ppp/ppp/ppp-2.4.7-DES-openssl.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 84 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" re=
l=3D"noreferrer" target=3D"_blank">ppp_2.4.7.bb</a>=C2=A0 =C2=A0 |=C2=A0 5 =
+-<br>
&gt;=C2=A0 2 files changed, 87 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-D=
ES-openssl.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.p=
atch b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e53f240543<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch<br=
>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +Used openssl for the DES instead of the libcrypt / glibc<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +Index: ppp-2.4.7/pppd/Makefile.linux<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- ppp-2.4.7.orig/pppd/Makefile.linux<br>
&gt; ++++ ppp-2.4.7/pppd/Makefile.linux<br>
&gt; +@@ -38,7 +38,7 @@ LIBS =3D<br>
&gt; + # Uncomment the next 2 lines to include support for Microsoft&#39;s<=
br>
&gt; + # MS-CHAP authentication protocol.=C2=A0 Also, edit plugins/radius/M=
akefile.linux.<br>
&gt; + CHAPMS=3Dy<br>
&gt; +-USE_CRYPT=3Dy<br>
&gt; ++#USE_CRYPT=3Dy<br>
&gt; + # Don&#39;t use MSLANMAN unless you really know what you&#39;re doin=
g.<br>
&gt; + #MSLANMAN=3Dy<br>
&gt; + # Uncomment the next line to include support for MPPE.=C2=A0 CHAPMS =
(above) must<br>
&gt; +@@ -132,7 +132,7 @@ endif<br>
&gt; +<br>
&gt; + ifdef NEEDDES<br>
&gt; + ifndef USE_CRYPT<br>
&gt; +-LIBS=C2=A0 =C2=A0 =C2=A0+=3D -ldes $(LIBS)<br>
&gt; ++LIBS=C2=A0 =C2=A0 =C2=A0+=3D -lcrypto<br>
&gt; + else<br>
&gt; + CFLAGS=C2=A0 =C2=A0+=3D -DUSE_CRYPT=3D1<br>
&gt; + endif<br>
&gt; +Index: ppp-2.4.7/pppd/pppcrypt.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- ppp-2.4.7.orig/pppd/pppcrypt.c<br>
&gt; ++++ ppp-2.4.7/pppd/pppcrypt.c<br>
&gt; +@@ -64,7 +64,7 @@ u_char *des_key;=C2=A0 =C2=A0 =C2=A0/* OUT 64 bit D=
ES key w<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0des_key[7] =3D Get7Bits(key, 49);<br>
&gt; +<br>
&gt; + #ifndef USE_CRYPT<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 des_set_odd_parity((des_cblock *)des_key);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 DES_set_odd_parity((DES_cblock *)des_key);<br>
&gt; + #endif<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -158,25 +158,25 @@ u_char *clear;=C2=A0 =C2=A0/* OUT 8 octets */<b=
r>
&gt; + }<br>
&gt; +<br>
&gt; + #else /* USE_CRYPT */<br>
&gt; +-static des_key_schedule=C2=A0 =C2=A0 =C2=A0 =C2=A0key_schedule;<br>
&gt; ++static DES_key_schedule=C2=A0 =C2=A0 =C2=A0 =C2=A0key_schedule;<br>
&gt; +<br>
&gt; + bool<br>
&gt; + DesSetkey(key)<br>
&gt; + u_char *key;<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 des_cblock des_key;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 DES_cblock des_key;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MakeKey(key, des_key);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 des_set_key(&amp;des_key, key_schedule);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 DES_set_key(&amp;des_key, &amp;key_schedule);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt; + }<br>
&gt; +<br>
&gt; + bool<br>
&gt; +-DesEncrypt(clear, key, cipher)<br>
&gt; ++DesEncrypt(clear, cipher)<br>
&gt; + u_char *clear;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IN=C2=A0 8 octets */<br=
>
&gt; + u_char *cipher;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* OUT 8 octets */<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 des_ecb_encrypt((des_cblock *)clear, (des_cbloc=
k *)cipher,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key_schedule, 1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 DES_ecb_encrypt((DES_cblock *)clear, (DES_cbloc=
k *)cipher,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;key_schedule, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)<br>
&gt; + u_char *cipher;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* IN=C2=A0 8 octets */<br=
>
&gt; + u_char *clear;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* OUT 8 octets */<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 des_ecb_encrypt((des_cblock *)cipher, (des_cblo=
ck *)clear,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key_schedule, 0);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblo=
ck *)clear,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;key_schedule, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (1);<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7=
.bb" rel=3D"noreferrer" target=3D"_blank">ppp_2.4.7.bb</a> b/meta/recipes-c=
onnectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" rel=3D"noreferrer" target=
=3D"_blank">ppp_2.4.7.bb</a><br>
&gt; index a1bb7d71c1..f4646bd693 100644<br>
&gt; --- a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" re=
l=3D"noreferrer" target=3D"_blank">ppp_2.4.7.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" re=
l=3D"noreferrer" target=3D"_blank">ppp_2.4.7.bb</a><br>
&gt; @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris=
 systems.&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;console/network&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://samba.org/ppp/" rel=3D"nore=
ferrer" target=3D"_blank">http://samba.org/ppp/</a>&quot;<br>
&gt;=C2=A0 BUGTRACKER =3D &quot;<a href=3D"http://ppp.samba.org/cgi-bin/ppp=
-bugs" rel=3D"noreferrer" target=3D"_blank">http://ppp.samba.org/cgi-bin/pp=
p-bugs</a>&quot;<br>
&gt; -DEPENDS =3D &quot;libpcap&quot;<br>
&gt; +DEPENDS =3D &quot;libpcap openssl&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;BSD &amp; GPLv2+ &amp; LGPLv2+ &amp; PD&quot;<=
br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://pppd/ccp.c;beginline=3D1;endli=
ne=3D29;md5=3De2c43fe6e81ff77d87dc9c290a424dea \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://pppd/plugins/passprompt.c;beginline=3D1;endline=3D10;md5=3D3b=
cbcdbf0e369c9a3e0b8c8275b065d8 \<br>
&gt; @@ -32,6 +32,7 @@ SRC_URI =3D &quot;<a href=3D"https://download.samba.=
org/pub/$%7BBPN%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://download.samba.org/pub/${BPN}/${BP}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2015-331=
0.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pppoe-inclu=
de-netinet-in.h-before-linux-in.h.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ppp-Remove-=
unneeded-include.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ppp-2.4.7-DES-openssl=
.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot;\<br>
&gt; @@ -49,7 +50,7 @@ EXTRA_OECONF =3D &quot;--disable-strip&quot;<br>
&gt;=C2=A0 # Package Makefile computes CFLAGS, referencing COPTS.<br>
&gt;=C2=A0 # Typically hard-coded to &#39;-O2 -g&#39; in the Makefile&#39;s=
.<br>
&gt;=C2=A0 #<br>
&gt; -EXTRA_OEMAKE +=3D &#39; COPTS=3D&quot;${CFLAGS} -I${S}/include&quot;&=
#39;<br>
&gt; +EXTRA_OEMAKE +=3D &#39; COPTS=3D&quot;${CFLAGS} -I${STAGING_INCDIR}/o=
penssl -I${S}/include&quot;&#39;<br>
&gt;<br>
&gt;=C2=A0 do_configure () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf<br>
&gt; --<br>
&gt; 2.18.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000a9b2b60572edc99a--
