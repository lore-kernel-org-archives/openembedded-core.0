Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 79D1374F99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:14:18 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q22-v6so7536962pff.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 12:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SAET7Wh6dhWTDYWpye3gUQc2jFa6M5QsGPjXFBLBF7s=;
	b=cjTc8RtOU0kRnZ73mzatdH+h070PJBoi0PPi9wMcf+7hgyOwamAOWEcwtWHTp0UBWg
	VjN8GTNhH7oao2zsH7pZhjcU02/zgZSEGL0w4Fwv6uN2OYaJRo8yCz4RpifJ6WrC3GcN
	N7EkQQaI+fIQ7Mh0G2FVnWoQcUe92dWi1Id6WdKCv26jxUINQxwknomj2WKOxLW3c4l4
	GqeYuU2inKwZ3L2BkKczrMXYlY9+f6s6Af7hXDAaCEj1Oku9mfCyU5zuBzuUu1psDVcF
	JR1O/BKs3HOZertWVX9E/ab5azRkqu0xiCyxqSX2fROI7BDr1WTObwkqOPPBHbuTkzMS
	DG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SAET7Wh6dhWTDYWpye3gUQc2jFa6M5QsGPjXFBLBF7s=;
	b=VHlslVsQ/Hp0AYrHCOXmMJNZmoBuOUVJA46Rd0aEGFp36ijwe9xfQgddQzMS6hSqUS
	x9va4aGZSXtLcM+j4IEuWdX7dFXO2P58yr3Dff6Or4sMLuOw2Y0f3mGFPW9ufgpv2vRn
	DRAqTXmdu6bn3ZUPEzfn7IWQrMk34gY+IB/UHsx2DStpEJG9uXG0AH4jYidbqHodhCbK
	7WOCnGoU8PIEEjdXfB1KseldvOgoOB+2AehwZa96hEGXR2fdcHSMTiTR/LN2ReFWJN/v
	IlxFed4H3p4IOnhmlsdlpTQIKJqjpdt1i3ytybYIbOmovgBZ2Ks9IHQSoiydaqBc9mzi
	0Rbg==
X-Gm-Message-State: ALKqPwfUivnLYeEtqakCyfy7wcNVygGSeOMQoU968v+lN7UUPnpTO2P3
	e66jO+uPtRXKjxfR4G9I04uCAvqIOzcQeYzbuCY=
X-Google-Smtp-Source: AB8JxZq9uDaeZf5p4/35KjQDefuI1CpoRg3/DCkmgfL7VUhh4k0xP/zZcrYTtEkvAwSWcZRCk/zN+ky3nDuBEWvIJQ8=
X-Received: by 2002:a62:7f91:: with SMTP id
	a139-v6mr21110588pfd.25.1526930059181; 
	Mon, 21 May 2018 12:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180521133742.15994-1-raj.khem@gmail.com>
	<CAJTo0LZh_zqn4wb=BsRsYR3PC43fHLtkOR5PdpDm8w7HgW2PBg@mail.gmail.com>
In-Reply-To: <CAJTo0LZh_zqn4wb=BsRsYR3PC43fHLtkOR5PdpDm8w7HgW2PBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 12:14:07 -0700
Message-ID: <CAMKF1sqKc1yQnymZ7axh_ncE=CiJ3hpWw+=KAVv1m1W00iGfSQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Mon, 21 May 2018 19:14:18 -0000
Content-Type: multipart/alternative; boundary="000000000000c6429a056cbc1bc0"

--000000000000c6429a056cbc1bc0
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out once I am near a computer

On Mon, May 21, 2018 at 7:55 AM Burton, Ross <ross.burton@intel.com> wrote:

> My patch metrics[1] will love you if you can replace that patch with a
> backport...
>
> Ross
> [1] http://www.burtonini.com/temp/status/
>
> On 21 May 2018 at 14:37, Khem Raj <raj.khem@gmail.com> wrote:
> > Patch it to build with clang
> >
> > clang 6.0+ driver can correclty detect corss gold linker now
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > V2:
> > - Remove code to disabel gold with clang instead of commenting, and
> descrive the removal
> >
> >  .../0012-soup-Forward-declare-URL-class.patch | 31 +++++++++++++++++++
> >  ...ebkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} |  6 ++--
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
> >  rename meta/recipes-sato/webkit/{webkitgtk_2.20.1.bb =>
> webkitgtk_2.20.2.bb} (96%)
> >
> > diff --git
> a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
> b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
> > new file mode 100644
> > index 0000000000..c689117650
> > --- /dev/null
> > +++
> b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
> > @@ -0,0 +1,31 @@
> > +From 59f6903ad96f3213f248b672d5fd526cc0d666ce Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sun, 20 May 2018 14:28:27 -0700
> > +Subject: [PATCH] soup: Forward declare URL class
> > +
> > +This helps getting away with compiler errors seen with clang
> > +
> >
> +/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
> > +error: unknown type name 'URL'
> > +    static std::optional<ResourceError> checkTLSErrors(const URL&,
> > +GTlsCertificate*, GTlsCertificateFlags);
> > +                                                             ^
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Source/WebCore/platform/network/soup/SoupNetworkSession.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> > +index 03bd72ba..7ca8792d 100644
> > +--- a/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> > ++++ b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> > +@@ -43,6 +43,7 @@ namespace WebCore {
> > +
> > + class CertificateInfo;
> > + class ResourceError;
> > ++class URL;
> > + struct SoupNetworkProxySettings;
> > +
> > + class SoupNetworkSession {
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> > similarity index 96%
> > rename from meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
> > rename to meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> > index 360ab8e69b..a68a69f43c 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> > @@ -21,10 +21,11 @@ SRC_URI = "
> http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >
>  file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
> >             file://0001-Fix-build-with-musl.patch \
> >             file://detect-gstreamer-gl.patch \
> > +           file://0012-soup-Forward-declare-URL-class.patch \
> >             "
> >
> > -SRC_URI[md5sum] = "0cd9b9ae1f48c04de5314f77806eceb4"
> > -SRC_URI[sha256sum] =
> "43e43285fa4e393080cc4fbd5ad8644749a75b1e0b811b230b63ae56806c8959"
> > +SRC_URI[md5sum] = "3fdda40dc10eb2a00d5fba4219b83967"
> > +SRC_URI[sha256sum] =
> "dffe93a241f03f1c73b369f4e323e4d8f12e39d33d5515948cbf454ca4b526e2"
> >
> >  inherit cmake pkgconfig gobject-introspection perlnative
> distro_features_check upstream-version-is-even gtk-doc
> >
> > @@ -85,7 +86,6 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
> >  EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
> >  EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
> >  EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
> > -EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
> >
> >  EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
> >
> > --
> > 2.17.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c6429a056cbc1bc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks, I&#39;ll check it out once I am near a compu=
ter=C2=A0</div></div><div><br><div class=3D"gmail_quote"><div>On Mon, May 2=
1, 2018 at 7:55 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">My patch metrics[1] will love you if you can replace that patch with a<=
br>
backport...<br>
<br>
Ross<br>
[1] <a href=3D"http://www.burtonini.com/temp/status/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.burtonini.com/temp/status/</a><br>
<br>
On 21 May 2018 at 14:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; Patch it to build with clang<br>
&gt;<br>
&gt; clang 6.0+ driver can correclty detect corss gold linker now<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; V2:<br>
&gt; - Remove code to disabel gold with clang instead of commenting, and de=
scrive the removal<br>
&gt;<br>
&gt;=C2=A0 .../0012-soup-Forward-declare-URL-class.patch | 31 +++++++++++++=
++++++<br>
&gt;=C2=A0 ...<a href=3D"http://ebkitgtk_2.20.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ebkitgtk_2.20.1.bb</a> =3D&gt; <a href=3D"http://webkitgtk_2.=
20.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.2.bb</a>} |=C2=
=A0 6 ++--<br>
&gt;=C2=A0 2 files changed, 34 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0012-soup-=
Forward-declare-URL-class.patch<br>
&gt;=C2=A0 rename meta/recipes-sato/webkit/{<a href=3D"http://webkitgtk_2.2=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.1.bb</a> =3D&gt=
; <a href=3D"http://webkitgtk_2.20.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">webkitgtk_2.20.2.bb</a>} (96%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-decl=
are-URL-class.patch b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-=
declare-URL-class.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c689117650<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL=
-class.patch<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +From 59f6903ad96f3213f248b672d5fd526cc0d666ce Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 20 May 2018 14:28:27 -0700<br>
&gt; +Subject: [PATCH] soup: Forward declare URL class<br>
&gt; +<br>
&gt; +This helps getting away with compiler errors seen with clang<br>
&gt; +<br>
&gt; +/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network=
/soup/SoupNetworkSession.h:68:62:<br>
&gt; +error: unknown type name &#39;URL&#39;<br>
&gt; +=C2=A0 =C2=A0 static std::optional&lt;ResourceError&gt; checkTLSError=
s(const URL&amp;,<br>
&gt; +GTlsCertificate*, GTlsCertificateFlags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<=
br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + Source/WebCore/platform/network/soup/SoupNetworkSession.h | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/Source/WebCore/platform/network/soup/SoupNetworkSession.=
h b/Source/WebCore/platform/network/soup/SoupNetworkSession.h<br>
&gt; +index 03bd72ba..7ca8792d 100644<br>
&gt; +--- a/Source/WebCore/platform/network/soup/SoupNetworkSession.h<br>
&gt; ++++ b/Source/WebCore/platform/network/soup/SoupNetworkSession.h<br>
&gt; +@@ -43,6 +43,7 @@ namespace WebCore {<br>
&gt; +<br>
&gt; + class CertificateInfo;<br>
&gt; + class ResourceError;<br>
&gt; ++class URL;<br>
&gt; + struct SoupNetworkProxySettings;<br>
&gt; +<br>
&gt; + class SoupNetworkSession {<br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.20=
.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.1.bb</a> b/meta/=
recipes-sato/webkit/<a href=3D"http://webkitgtk_2.20.2.bb" rel=3D"noreferre=
r" target=3D"_blank">webkitgtk_2.20.2.bb</a><br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.20.=
1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.1.bb</a><br>
&gt; rename to meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.20.2.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.2.bb</a><br>
&gt; index 360ab8e69b..a68a69f43c 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.20.1.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.1.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.20.2.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.20.2.bb</a><br>
&gt; @@ -21,10 +21,11 @@ SRC_URI =3D &quot;<a href=3D"http://www.webkitgtk.=
org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-WebKitMacro=
s-Append-to-I-and-not-to-isystem.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-w=
ith-musl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://detect-gstreamer=
-gl.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-soup-Forward-dec=
lare-URL-class.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;0cd9b9ae1f48c04de5314f77806eceb4&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;43e43285fa4e393080cc4fbd5ad8644749a75b1e=
0b811b230b63ae56806c8959&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;3fdda40dc10eb2a00d5fba4219b83967&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;dffe93a241f03f1c73b369f4e323e4d8f12e39d3=
3d5515948cbf454ca4b526e2&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake pkgconfig gobject-introspection perlnative distro_=
features_check upstream-version-is-even gtk-doc<br>
&gt;<br>
&gt; @@ -85,7 +86,6 @@ EXTRA_OECMAKE_append_armv4 =3D &quot; -DENABLE_JIT=
=3DOFF &quot;<br>
&gt;=C2=A0 EXTRA_OECMAKE_append_aarch64 =3D &quot; -DUSE_LD_GOLD=3DOFF &quo=
t;<br>
&gt;=C2=A0 EXTRA_OECMAKE_append_mipsarch =3D &quot; -DUSE_LD_GOLD=3DOFF &qu=
ot;<br>
&gt;=C2=A0 EXTRA_OECMAKE_append_powerpc =3D &quot; -DUSE_LD_GOLD=3DOFF &quo=
t;<br>
&gt; -EXTRA_OECMAKE_append_toolchain-clang =3D &quot; -DUSE_LD_GOLD=3DOFF &=
quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECMAKE_append_aarch64 =3D &quot; -DWTF_CPU_ARM64_CORTEXA5=
3=3DON&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.0<br>
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

--000000000000c6429a056cbc1bc0--
