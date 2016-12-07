Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4E70960806
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 12:26:24 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id p16so375288917qta.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bVw+UPO8tinkvrQdnp+T9dfflB2Iu8lod1f78XN+MDA=;
	b=0S9FNP5m3GpGFLFuVXkmSzeXkHOqmyNfs6yKmXIbF5SqYBbRwA/lbnp/jd8zUYuts5
	JvSKrV97mPIeLkrOI5yXpfovvUh1O6ZVxqk+QZfsHQCLdH6b7NZN4yyZ+mOI9whL2GnV
	Wy82J2tm1T87FlVTHmgZnxhtlTO61PC7x4NmYmF5/ZxzqHSZAlVCaulrSwYREcXCW+P4
	htnfCkJTTedtbAQoDIjoZpbGDrhMb7hhIpvzSbzFMr5dSLBNct91mcwsj50cHfe+kKue
	yIocwnWqjPpg30Na+JfG/N69l4Hl2rXcGe0qPy51mLXcpDeSzKGHbp7Pya4t4GIW7zHX
	S2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bVw+UPO8tinkvrQdnp+T9dfflB2Iu8lod1f78XN+MDA=;
	b=Jet9ZGI/iIldlTxXSXMWBbAYFTXRwlj+qyHnMZij3A5Utij9EBF8pHrfpWEdiC9+4V
	I+wjEZBahXSFvXZl8Ry5sg/jKmXcV+sg71SLnEDyLd6ViOBuvEVTzP+zBhMlH4qB3qx/
	cUxcZ9lbRsunZdbObtb7ML4ngfKf8/5MLMB0ALLTuYcFIB2d4lqKPfB8mYx/CikCHwGb
	p/+A+2S9m9WNQ3vQC+strbakSgNP68+Xr36UUP2hclpSaVT9KjY7roPq6gU8aR/s2wXm
	t46edit8wwNnMkryzbN3m09W1ePWpSPamk2XNZ/6/UUSo27dzN9MPJCyOa2u8QC7OwB7
	MCRw==
X-Gm-Message-State: AKaTC03rQunUxaPjABCPix0AbW2edc4U3ysH5WLEBDRc+8ACJrFpvNUYZXl6hL6S921hh4+8wZiTfyYJ9duO9siK
X-Received: by 10.200.47.38 with SMTP id j35mr61032937qta.136.1481113586430;
	Wed, 07 Dec 2016 04:26:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Wed, 7 Dec 2016 04:25:56 -0800 (PST)
In-Reply-To: <6D6B8004-668B-4C5B-96BE-7A231F365788@gmail.com>
References: <20161201083726.6160-1-raj.khem@gmail.com>
	<CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
	<6D6B8004-668B-4C5B-96BE-7A231F365788@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 7 Dec 2016 14:25:56 +0200
Message-ID: <CAHiDW_G52CHLn9A9Hk8Z-m=LvmA5yzUbHjC-Rx9B9oQeZZW4qQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Add PKG_CONFIG_SYSROOT_DIR to output of pkg-config
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
X-List-Received-Date: Wed, 07 Dec 2016 12:26:25 -0000
Content-Type: multipart/alternative; boundary=001a1135da06310bc7054310a167

--001a1135da06310bc7054310a167
Content-Type: text/plain; charset=UTF-8

On 5 December 2016 at 21:08, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Dec 5, 2016, at 5:20 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
>
>
>
> On 1 December 2016 at 10:37, Khem Raj <raj.khem@gmail.com> wrote:
>
>> When configure pokes for wayland-protocols isntallations it ended up
>> using the ones from host, which is because it did not account for sysroot
>> prefix
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
>>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 37
>> ++++++++++++++++++++++
>>  .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb   |  1 +
>>  3 files changed, 39 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-multimedia/gstrea
>> mer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_
>> SYSROOT_DIR-to-pkg-config-output.patch
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> index d26a6a9..d3c5326 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> @@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]            =
>> "--enable-srtp,--disable-srtp,libsrtp"
>>  PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1
>> libgudev"
>>  PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-v
>> oaacenc,vo-aacenc"
>>  PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable
>> -voamrwbenc,vo-amrwbenc"
>> -PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native
>> wayland"
>> +PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native
>> wayland wayland-protocols"
>>  PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
>>
>>  # these plugins have not been ported to 1.0 (yet):
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>> bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>> bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>> new file mode 100644
>> index 0000000..eb789df
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>> bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>> @@ -0,0 +1,37 @@
>> +From c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 1 Dec 2016 00:27:13 -0800
>> +Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
>> +
>> +In cross environment we have to prepend the sysroot to the path found by
>> +pkgconfig since the path returned from pkgconfig does not have sysroot
>> prefixed
>> +it ends up using the files from host system. If build host has wayland
>> installed
>> +the build will succeed but if you dont have wayland-protocols installed
>> on build host then
>> +it wont find the files on build host
>> +
>> +This should work ok with non sysrooted builds too since in those cases
>> PKG_CONFIG_SYSROOT_DIR
>> +will be empty
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index f8ac96b..dc87b08 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink],
>> wayland , [
>> +     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
>> +       if test "x$wayland_scanner" != "x"; then
>> +         HAVE_WAYLAND="yes"
>> +-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
>> --variable=pkgdatadir wayland-protocols`)
>> ++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,
>> ${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir
>> wayland-protocols`)
>>
>
> I believe this breaks multilib because wayland-protocols is allarch so
> PKG_CONFIG_SYSROOT_DIR may then be incorrect.
>
>
> Realized my last reply is too terse. expanding on it a bit more.
> this is not really the case. Since PKG_CONFIG_SYSROOT_DIR is set to
>  STAGING_DIR_HOST which is then set to ${STAGING_DIR}/${MACHINE} so
> effectively its just
> reusing an existing var compared to your case where a new redundant
> variable is introduced.
>
> having said that, there could be a multilib issue if pkgdatadir thats in
> .pc file from wayland-protocols package is using variables like ${libdir}
> which then are
> multilib dependent, if this is the case then we need to fix .pc file.
> however when I look at the <target-sysroot>/usr/share/pkgconfig/wayland-protocols.pc
> it has
>
> prefix=/usr
> datarootdir=${prefix}/share
> pkgdatadir=/usr/share/wayland-protocols
>
> seems to be free of multilib deps.
>
>
It's not about the .pc file, the issue is that if you build
lib32-gstreamer1.0-plugins-bad WAYLAND_PROTOCOLS_DATADIR will end up as (as
an example)
    $TMPDIR/sysroots/lib32-qemux86-64/usr/share/wayland-protocols/
but that's not where wayland protocols are. The actual path is
    $TMPDIR/sysroots/qemux86-64/usr/share/wayland-protocols/

Maybe there should be a generic multilib fix for this but I can't figure
out what it would be...

Jussi

--001a1135da06310bc7054310a167
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 December 2016 at 21:08, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=
=3D"word-wrap:break-word"><br><div><div><div class=3D"gmail-h5"><blockquote=
 type=3D"cite"><div>On Dec 5, 2016, at 5:20 AM, Jussi Kukkonen &lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt; wrote:</div><br class=3D"gmail-m_-7104777156855689810Apple-int=
erchange-newline"><div><br class=3D"gmail-m_-7104777156855689810Apple-inter=
change-newline"><br style=3D"font-family:times-roman;font-size:14px;font-st=
yle:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px"><div class=3D"gmail_quote" style=3D"font-family:times-roma=
n;font-size:14px;font-style:normal;font-variant-caps:normal;font-weight:nor=
mal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px">On 1 December 2016 at 10:37, Khem =
Raj<span class=3D"gmail-m_-7104777156855689810Apple-converted-space">=C2=A0=
</span><span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span><span class=3D"gmail-m_-710477=
7156855689810Apple-converted-space">=C2=A0</span>wrote<wbr>:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">When configure pokes for wayland-pro=
tocols isntallations it ended up<br>using the ones from host, which is beca=
use it did not account for sysroot<br>prefix<br><br>Signed-off-by: Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>&gt;<br>---<br>=C2=A0.../gstreamer/gstreamer1.0-pl<wbr>ugins-bad.in=
c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>=C2=A0...G_CONFIG_SYSROO=
T_DIR-to-pk<wbr>g-config-output.patch | 37 ++++++++++++++++++++++<br>=C2=A0=
.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.10.1.bb/" rel=3D=
"noreferrer" target=3D"_blank">gstreamer1.0-pl<wbr>ugins-bad_1.10.1.bb</a>=
=C2=A0 =C2=A0|=C2=A0 1 +<br>=C2=A03 files changed, 39 insertions(+), 1 dele=
tion(-)<br>=C2=A0create mode 100644 meta/recipes-multimedia/gstrea<wbr>mer/=
gstreamer1.0-plugins-bad/<wbr>0001-Prepend-PKG_CONFIG_<wbr>SYSROOT_DIR-to-p=
kg-config-<wbr>output.patch<br><br>diff --git a/meta/recipes-multimedia/gst=
r<wbr>eamer/gstreamer1.0-plugins-<wbr>bad.inc b/meta/recipes-multimedia/gst=
r<wbr>eamer/gstreamer1.0-plugins-<wbr>bad.inc<br>index d26a6a9..d3c5326 100=
644<br>--- a/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0-plugins-<w=
br>bad.inc<br>+++ b/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0-plu=
gins-<wbr>bad.inc<br>@@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-srtp,--disable-srtp,<wbr>libsrt=
p&quot;<br>=C2=A0PACKAGECONFIG[uvch264]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;--enable-uvch264,--disable-uv<wbr>ch264,libusb1 libgudev&quot;<br=
>=C2=A0PACKAGECONFIG[voaacenc]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enabl=
e-voaacenc,--disable-v<wbr>oaacenc,vo-aacenc&quot;<br>=C2=A0PACKAGECONFIG[v=
oamrwbenc]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-voamrwbenc,--disable<wbr>=
-voamrwbenc,vo-amrwbenc&quot;<br>-PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;--enable-wayland,--disable-wa<wbr>yland,wayland-=
native wayland&quot;<br>+PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;--enable-wayland,--disable-wa<wbr>yland,wayland-native wayl=
and wayland-protocols&quot;<br>=C2=A0PACKAGECONFIG[webp]=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-webp,--disable-webp,<wbr>libweb=
p&quot;<br><br>=C2=A0# these plugins have not been ported to 1.0 (yet):<br>=
diff --git a/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0-plugins-<w=
br>bad/0001-Prepend-PKG_CONFIG_<wbr>SYSROOT_DIR-to-pkg-config-<wbr>output.p=
atch b/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0-plugins-<wbr>bad=
/0001-Prepend-PKG_CONFIG_<wbr>SYSROOT_DIR-to-pkg-config-<wbr>output.patch<b=
r>new file mode 100644<br>index 0000000..eb789df<br>--- /dev/null<br>+++ b/=
meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0-plugins-<wbr>bad/0001-P=
repend-PKG_CONFIG_<wbr>SYSROOT_DIR-to-pkg-config-<wbr>output.patch<br>@@ -0=
,0 +1,37 @@<br>+From c271503d7e233428ac0323c51d6517<wbr>113e26bef7 Mon Sep =
17 00:00:00 2001<br>+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>+Date: Thu, 1 Dec 2016 0=
0:27:13 -0800<br>+Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-co=
nfig output<br>+<br>+In cross environment we have to prepend the sysroot to=
 the path found by<br>+pkgconfig since the path returned from pkgconfig doe=
s not have sysroot prefixed<br>+it ends up using the files from host system=
. If build host has wayland installed<br>+the build will succeed but if you=
 dont have wayland-protocols installed on build host then<br>+it wont find =
the files on build host<br>+<br>+This should work ok with non sysrooted bui=
lds too since in those cases PKG_CONFIG_SYSROOT_DIR<br>+will be empty<br>+<=
br>+Upstream-Status: Pending<br>+<br>+Signed-off-by: Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
<br>+---<br>+<span class=3D"gmail-m_-7104777156855689810Apple-converted-spa=
ce">=C2=A0</span><a href=3D"http://configure.ac/" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><span class=3D"gmail-m_-7104777156855689810Appl=
e-converted-space">=C2=A0</span>| 2 +-<br>+ 1 file changed, 1 insertion(+),=
 1 deletion(-)<br>+<br>+diff --git a/<a href=3D"http://configure.ac/" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><span class=3D"gmail-m_-7=
104777156855689810Apple-converted-space">=C2=A0</span>b/<a href=3D"http://c=
onfigure.ac/" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>+ind=
ex f8ac96b..dc87b08 100644<br>+--- a/<a href=3D"http://configure.ac/" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>++++ b/<a href=3D"htt=
p://configure.ac/" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br=
>+@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayla=
nd , [<br>+=C2=A0 =C2=A0 =C2=A0PKG_CHECK_MODULES(WAYLAND_PRO<wbr>TOCOLS, wa=
yland-protocols &gt;=3D 1.4, [<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot=
;x$wayland_scanner&quot; !=3D &quot;x&quot;; then<br>+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0HAVE_WAYLAND=3D&quot;yes&quot;<br>+-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AC_SUBST(WAYLAND_PROTOCOLS_DAT<wbr>ADIR, `$PKG_CONFIG --variable=3Dpkgd=
atadir wayland-protocols`)<br>++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(WAYLAN=
D_PROTOCOLS_DAT<wbr>ADIR, ${PKG_CONFIG_SYSROOT_DIR}`$PKG<wbr>_CONFIG --vari=
able=3Dpkgdatadir wayland-protocols`)<br></blockquote><div><br></div><div>I=
 believe this breaks multilib because wayland-protocols is allarch so PKG_C=
ONFIG_SYSROOT_DIR may then be incorrect.</div></div></div></blockquote><div=
><br></div></div></div><div>Realized my last reply is too terse. expanding =
on it a bit more.</div><div>this is not really the case. Since PKG_CONFIG_S=
YSROOT_DIR is set to =C2=A0STAGING_DIR_HOST which is then set to=C2=A0${STA=
GING_DIR}/${MACHINE} so effectively its just</div><div>reusing an existing =
var compared to your case where a new redundant variable is introduced.=C2=
=A0</div><div><br></div><div>having said that, there could be a multilib is=
sue if pkgdatadir thats in .pc file from wayland-protocols package is using=
 variables like ${libdir} which then are</div><div>multilib dependent, if t=
his is the case then we need to fix .pc file. however when I look at the &l=
t;target-sysroot&gt;/usr/share/<wbr>pkgconfig/wayland-protocols.pc it has</=
div><div><br></div><div><div>prefix=3D/usr</div><div>datarootdir=3D${prefix=
}/share</div><div>pkgdatadir=3D/usr/share/wayland-<wbr>protocols</div><div>=
<br></div><div>seems to be free of multilib deps.</div></div><div><div clas=
s=3D"gmail-h5"><br></div></div></div></div></blockquote></div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">It&#39;s not about the .=
pc file, the issue is that if you build lib32-gstreamer1.0-plugins-bad WAYL=
AND_PROTOCOLS_DATADIR will end up as (as an example)=C2=A0</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 $TMPDIR/sysroots/lib32-qemux86-64/usr/share/=
wayland-protocols/</div><div class=3D"gmail_extra">but that&#39;s not where=
 wayland protocols are. The actual path is</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 $TMPDIR/sysroots/qemux86-64/usr/share/wayland-protocols/</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Maybe ther=
e should be a generic multilib fix for this but I can&#39;t figure out what=
 it would be...</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Jussi</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra"><br></div></div></div>

--001a1135da06310bc7054310a167--
