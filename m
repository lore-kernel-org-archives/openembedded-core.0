Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 60822780C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 14:11:24 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id j46so10546870uag.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8dnqkArPYpX/Zlwg9zJM/0ULc1t336AQ8Kw5iih33bk=;
	b=pdSZMvuH4Si82Qrx3yLslLK7SG5nn7hJQ2bv/7L+zNPhNzd+Tp4zXsaHQKzT5mTgKL
	3whsrsJ1gg7j7VyOiORtq/ICRnSVAasGcWIf20R1Z2EUf01jsuoBWU7yTB/yeDvTTc3t
	KasP5fpehu6gt6s+SU+2YUEE3kQOaBtyBICi8prpeasGlepdU4fYA4JP2cQzvxbv9Woz
	ohMGpzbdviIM4CMeFyxWf99Wddory1nF56U0dkmtsoHvchCtCadf86jHJeS0h1nr50Y0
	zIXBb/I7ULB9Mva1NX/CPhFyj0ZSzWxKrK/sG3pw/CBv/Wfy+G52m7z7fdHFBOKF1w3m
	hKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8dnqkArPYpX/Zlwg9zJM/0ULc1t336AQ8Kw5iih33bk=;
	b=rKY4vL163zzcqxT/PN3NrPa8ZjXIU0aC+bFO1JngvYxTplDbNKQaSxzckpZpdU51H/
	u9T8a8j2c9ATXlpd3Ymb+79BLqCLle9N1xeWSrh2wXzi0/7kJNbejEdDJp2xW3DiFJuY
	QN0j7dJAY/jfDkJ7aaYprRhV3KsCDlgbyockh1FfOPC8U/c6zobyg4KbUXR4OHqfYcBo
	cia4rWGkXSX81S8dqJip8EcUX5iV8dQSq5Mm7GdxL1BxO1UEmWlD2WwbYa5lts2hV7OZ
	/cdCKWhUY58krpDuE5J7+DYr0RoX0y6IRdpxHC9o1iejL4WVlH9clSc7dXCqGTcDyUUL
	xA3Q==
X-Gm-Message-State: AHYfb5h9ZlDuT/+BDAamuOFXB3XxPcNfZYF2g+UbotU67vvvS/Pw90Rd
	PPpeyXOeItDcw6PeB2Q20LEiMmbYIA==
X-Received: by 10.159.48.80 with SMTP id i16mr265990uab.191.1504015886190;
	Tue, 29 Aug 2017 07:11:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Tue, 29 Aug 2017 07:11:25 -0700 (PDT)
In-Reply-To: <a691910e-8d87-803b-f135-7f71a71105dd@linux.intel.com>
References: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
	<20170829114526.37559-2-alexander.kanavin@linux.intel.com>
	<1504010995.2175.2.camel@linuxfoundation.org>
	<a691910e-8d87-803b-f135-7f71a71105dd@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Aug 2017 16:11:25 +0200
Message-ID: <CA+chaQfY8gy63hyb7=yqsTPsKoE8pk8kWhxaD9LfPy7y9uM31w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] subversion: inherit pkgconfig, so that serf can be found
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
X-List-Received-Date: Tue, 29 Aug 2017 14:11:25 -0000
Content-Type: multipart/alternative; boundary="94eb2c1b0fcea20d7b0557e4fc04"

--94eb2c1b0fcea20d7b0557e4fc04
Content-Type: text/plain; charset="UTF-8"

Dejavu

http://lists.openembedded.org/pipermail/openembedded-core/2014-July/094942.html

it might be less likely to trigger in internal builds, because we use some
old components from svn, but because they weren't updated in ages, we still
use the same archive from premirror.

There are few recipes in meta-oe and meta-multimedia layers:
meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:SRC_URI = "svn://
www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb:SRC_URI =
"svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb:SRC_URI =
"svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb:SRC_URI =
"svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb:SRC_URI
= "svn://svn.openmoko.org/trunk/src/host/;module=sjf2410-linux;protocol=http
"
meta-oe/recipes-support/usbpath/usbpath_svn.bb:SRC_URI = "svn://
svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http \
meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb:SRC_URI = "svn://
svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http \

Regards,

On Tue, Aug 29, 2017 at 2:57 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 08/29/2017 03:49 PM, Richard Purdie wrote:
>
> --- a/meta/recipes-devtools/subversion/subversion_1.9.6.bb
>>> +++ b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
>>> @@ -8,7 +8,7 @@ HOMEPAGE = "http://subversion.tigris.org"
>>>     BBCLASSEXTEND = "native"
>>>   -inherit gettext
>>> +inherit gettext pkgconfig
>>>     SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>>>              file://disable_macos.patch \
>>>
>>
>> Any idea why we haven't had errors from this? Did it mean we just lost
>> something like https support?
>>
>
> We didn't get errors because subversion's build system didn't deem absence
> of pkgconfig (and thus, disabling of serf) an error. Also, I think we no
> longer have any recipes in oe-core that fetch from svn, so nothing is
> testing that subversion-native does in fact work.
>
> How necessary is subversion nowadays for those company-internal repos?
>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1b0fcea20d7b0557e4fc04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dejavu<div><br></div><div><a href=3D"http://lists.openembe=
dded.org/pipermail/openembedded-core/2014-July/094942.html">http://lists.op=
enembedded.org/pipermail/openembedded-core/2014-July/094942.html</a><br></d=
iv><div><br></div><div>it might be less likely to trigger in internal build=
s, because we use some old components from svn, but because they weren&#39;=
t updated in ages, we still use the same archive from premirror.</div><div>=
<br></div><div>There are few recipes in meta-oe and meta-multimedia layers:=
</div><div><div>meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:SRC_URI =3D =
&quot;svn://<a href=3D"http://www.streamboard.tv/svn/oscam;module=3Dtrunk;p=
rotocol=3Dhttp">www.streamboard.tv/svn/oscam;module=3Dtrunk;protocol=3Dhttp=
</a> \</div><div>meta-multimedia/recipes-multimedia/tremor/tremor_20150107.=
bb:SRC_URI =3D &quot;svn://<a href=3D"http://svn.xiph.org/trunk;module=3DTr=
emor;rev=3D19427;protocol=3Dhttp">svn.xiph.org/trunk;module=3DTremor;rev=3D=
19427;protocol=3Dhttp</a> \</div><div>meta-oe/recipes-support/samsung-soc-u=
tils/s3c24xx-gpio_svn.bb:SRC_URI =3D &quot;svn://<a href=3D"http://svn.open=
moko.org/trunk/src/target;module=3Dgpio;protocol=3Dhttp">svn.openmoko.org/t=
runk/src/target;module=3Dgpio;protocol=3Dhttp</a>&quot;</div><div>meta-oe/r=
ecipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb:SRC_URI =3D &quot;svn:=
//<a href=3D"http://svn.openmoko.org/trunk/src/target;module=3Dgpio;protoco=
l=3Dhttp">svn.openmoko.org/trunk/src/target;module=3Dgpio;protocol=3Dhttp</=
a>&quot;</div><div>meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-=
native_svn.bb:SRC_URI =3D &quot;svn://<a href=3D"http://svn.openmoko.org/tr=
unk/src/host/;module=3Dsjf2410-linux;protocol=3Dhttp">svn.openmoko.org/trun=
k/src/host/;module=3Dsjf2410-linux;protocol=3Dhttp</a>&quot;</div><div>meta=
-oe/recipes-support/usbpath/usbpath_svn.bb:SRC_URI =3D &quot;svn://<a href=
=3D"http://svn.openmoko.org/trunk/src/host;module=3Dusbpath;protocol=3Dhttp=
">svn.openmoko.org/trunk/src/host;module=3Dusbpath;protocol=3Dhttp</a> \</d=
iv><div>meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb:SRC_URI =3D &quo=
t;svn://<a href=3D"http://svn.openmoko.org/trunk/src/target;module=3DAR6kSD=
K.build_sw.18;protocol=3Dhttp">svn.openmoko.org/trunk/src/target;module=3DA=
R6kSDK.build_sw.18;protocol=3Dhttp</a> \</div></div><div><br></div><div>Reg=
ards,</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 29, 2017 at 2:57 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexan=
der.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">On 08/29/2017 03:49 PM, Richard Purdie wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
--- a/meta/recipes-devtools/subver<wbr>sion/<a href=3D"http://subversion_1.=
9.6.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.9.6.bb</a><br>
+++ b/meta/recipes-devtools/subver<wbr>sion/<a href=3D"http://subversion_1.=
9.6.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.9.6.bb</a><br>
@@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://subversion.tigris.org"=
 rel=3D"noreferrer" target=3D"_blank">http://subversion.tigris.org</a>&quot=
;<br>
=C2=A0 =C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
=C2=A0 -inherit gettext<br>
+inherit gettext pkgconfig<br>
=C2=A0 =C2=A0 SRC_URI =3D &quot;${APACHE_MIRROR}/${BPN}/${BPN<wbr>}-${PV}.t=
ar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_macos.patch =
\<br>
</blockquote>
<br>
Any idea why we haven&#39;t had errors from this? Did it mean we just lost<=
br>
something like https support?<br>
</blockquote>
<br></span>
We didn&#39;t get errors because subversion&#39;s build system didn&#39;t d=
eem absence of pkgconfig (and thus, disabling of serf) an error. Also, I th=
ink we no longer have any recipes in oe-core that fetch from svn, so nothin=
g is testing that subversion-native does in fact work.<br>
<br>
How necessary is subversion nowadays for those company-internal repos?<br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c1b0fcea20d7b0557e4fc04--
