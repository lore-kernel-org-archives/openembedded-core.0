Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1666A71BA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:22:39 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id d10so2457353itj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m6ncV9GghuEStDIS/HQiEMctzPerO/7qV76+GUi6kY4=;
	b=QGfIfsiINAQ1UYHriiS42U1uUDq4wlwOybGM0NMZ9aDUEM0i+Or7Uez6JvJEwrP//u
	KiZnevO2jKTCIZafjvIhfTgon5xpiFs8ngcpmWhYs3MnoJMEgWAy/Zwh/rPmrN1Fy5n1
	XRECjmxk3SnMbeGi7Z9xh+vuwv0FeED6hnHfkCC5+jN8KCW2jOQjff7CIt9XnnA5GlbK
	Qm5OxNZql4Tkr2j6wLgapTxo3B96/Nm9Duso2wtEINbN/kN9REz0oQ53z94PtOPkajOX
	8iXPG+52FwJyJOEho47xGT0E7ntWwQNh+Gk/aZczMfTIAIEWggRL7qkY4bYndw9HkLVN
	vuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m6ncV9GghuEStDIS/HQiEMctzPerO/7qV76+GUi6kY4=;
	b=bS9hwN9CBMbxpJ72Xyz9t2OVx6bgsISLKE4bB7VxCXBc7ccXOo9/wk7CAPifATEvBN
	+kHxi6gl8U7PGdylRqIzqBxbLJil6a1xYNLOHJ3baSZqJ7mUeqF0in1ld6a1WhEBQlUN
	Jq7RKVvDBBLKk+1vExCuGh3+rNA3ql/yuYttgkmoxApEdhqardqaLRrrYmb15MtZ4v6U
	XdhQtAZaWzkaAuhrpbJVPPVRKVbSEgVbgkmbRhwcdOuxI2d0nha7V/Af/lVlXZF+FI/u
	ZqZCk5DwR2stT4U5VpCVXccXHtm8KV+dhVnmwB0eb24rj0uQX2sLkYAJ05SwGYEyX65O
	AJjQ==
X-Gm-Message-State: APf1xPBJPuI4h3ruWuMHzyrBpy0OyghL6AVevlMNBG9UbRePQ4J3Ttac
	+D5MetUUrIBnB5y3EtwU+et7XbSmeAzDgFmUbozbfQ==
X-Google-Smtp-Source: AH8x224ixvvNR00GMGkwhQUwXUrlrfnC0W7qK+ehu7XexdP6g5MSE1Ix6Ab95ZpA8PSuy8LMtw4uqXzKTEIgGGWTwoA=
X-Received: by 10.36.66.195 with SMTP id i186mr3556045itb.45.1519222961102;
	Wed, 21 Feb 2018 06:22:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 21 Feb 2018 06:22:20 -0800 (PST)
In-Reply-To: <c2ec0a5f-8e88-ba01-97e2-e802eae874b3@prevas.dk>
References: <20180205122544.27223-1-mnhu@prevas.dk>
	<20180205122544.27223-2-mnhu@prevas.dk>
	<c2ec0a5f-8e88-ba01-97e2-e802eae874b3@prevas.dk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 14:22:20 +0000
Message-ID: <CAJTo0LaHEzyaQJQzqK+cxPBqrXMqcJ+YO=DS17Yrp8w-jN6-aQ@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: add packageconfig for python-support
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
X-List-Received-Date: Wed, 21 Feb 2018 14:22:40 -0000
Content-Type: multipart/alternative; boundary="001a113b8804ee75350565b9a86f"

--001a113b8804ee75350565b9a86f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Did you test this?

+PACKAGECONFIG[python] =3D "--with-python=3D${PYTHON},--
without-python,python3-core,python3-core"

python3-core isn't a recipe so if Python is enabled:

ERROR: Nothing PROVIDES 'python3-core' (but
/home/ross/Yocto/poky/meta/recipes-connectivity/bind/bind_9.10.6.bb DEPENDS
on or otherwise requires it).

Ross

On 13 February 2018 at 06:21, Martin Hundeb=C3=B8ll <mnhu@prevas.dk> wrote:

> Ping
>
>
> On 2018-02-05 13:25, Martin Hundeb=C3=B8ll wrote:
>
>> Break the hard runtime dependency on python3-core by adding a
>> (default-on) packageconfig option for python.
>>
>> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>> ---
>>   meta/recipes-connectivity/bind/bind_9.10.6.bb | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> b/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> index 8b8835ba80..2ec7ab44f0 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> @@ -38,16 +38,19 @@ EXTRA_OECONF =3D " ${ENABLE_IPV6} --with-libtool
>> --enable-threads \
>>                    --with-openssl=3D${STAGING_LIBDIR}/.. \
>>                  "
>>   -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
>> +inherit autotools update-rc.d systemd useradd pkgconfig
>>     export PYTHON_SITEPACKAGES_DIR
>>     # PACKAGECONFIGs readline and libedit should NOT be set at same time
>> -PACKAGECONFIG ?=3D "readline"
>> +PACKAGECONFIG ?=3D "readline python"
>>   PACKAGECONFIG[httpstats] =3D "--with-libxml2,--without-libxml2,libxml2=
"
>>   PACKAGECONFIG[readline] =3D "--with-readline=3D-lreadline,,readline"
>>   PACKAGECONFIG[libedit] =3D "--with-readline=3D-ledit,,libedit"
>>   PACKAGECONFIG[urandom] =3D "--with-randomdev=3D/dev/urandom
>> ,--with-randomdev=3D/dev/random,,"
>> +PACKAGECONFIG[python] =3D "--with-python=3D${PYTHON},--wit
>> hout-python,python3-core,python3-core"
>> +
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python',
>> 'python3native', '', d)}
>>     USERADD_PACKAGES =3D "${PN}"
>>   USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/cache/bind
>> --no-create-home \
>> @@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} =3D "named.service"
>>     PARALLEL_MAKE =3D ""
>>   -RDEPENDS_${PN} =3D "python3-core"
>>   RDEPENDS_${PN}-dev =3D ""
>>     PACKAGE_BEFORE_PN +=3D "${PN}-utils"
>> @@ -88,7 +90,11 @@ do_install_append() {
>>         install -d "${D}${sysconfdir}/init.d"
>>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>> -       sed -i -e '1s,#!.*python3,#! /usr/bin/python3,'
>> ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
>> +
>> +       if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python',
>> 'python', '', d)}" ]; then
>> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>> +                       ${D}${sbindir}/dnssec-coverage
>> ${D}${sbindir}/dnssec-checkds
>> +       fi
>>         # Install systemd related files
>>         install -d ${D}${sbindir}
>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113b8804ee75350565b9a86f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Did you test this?<div><br></div><div><span style=3D"font-=
size:12.800000190734863px">+PACKAGECONFIG[python] =3D &quot;--with-python=
=3D${PYTHON},--</span><wbr style=3D"font-size:12.800000190734863px"><span s=
tyle=3D"font-size:12.800000190734863px">without-python,python3-core,</span>=
<wbr style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.8=
00000190734863px">python3-core&quot;</span><br style=3D"font-size:12.800000=
190734863px"></div><div><span style=3D"font-size:12.800000190734863px"><br>=
</span></div><div><span style=3D"font-size:12.800000190734863px">python3-co=
re isn&#39;t a recipe so if Python is enabled:</span></div><div><span style=
=3D"font-size:12.800000190734863px"><br></span></div><div>ERROR: Nothing PR=
OVIDES &#39;python3-core&#39; (but /home/ross/Yocto/poky/meta/recipes-conne=
ctivity/bind/<a href=3D"http://bind_9.10.6.bb">bind_9.10.6.bb</a> DEPENDS o=
n or otherwise requires it).<span style=3D"font-size:12.800000190734863px">=
<br></span></div><div><br></div><div>Ross</div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 13 February 2018 at 06:21, Martin Hu=
ndeb=C3=B8ll <span dir=3D"ltr">&lt;<a href=3D"mailto:mnhu@prevas.dk" target=
=3D"_blank">mnhu@prevas.dk</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Ping<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 2018-02-05 13:25, Martin Hundeb=C3=B8ll wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Break the hard runtime dependency on python3-core by adding a<br>
(default-on) packageconfig option for python.<br>
<br>
Signed-off-by: Martin Hundeb=C3=B8ll &lt;<a href=3D"mailto:mnhu@prevas.dk" =
target=3D"_blank">mnhu@prevas.dk</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-connectivity/bind<wbr>/<a href=3D"http://bind_9.10.6.bb=
" rel=3D"noreferrer" target=3D"_blank">bind_9.10.6.bb</a> | 14 ++++++++++--=
--<br>
=C2=A0 1 file changed, 10 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/bi<wbr>nd/<a href=3D"http://bind_9.1=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.6.bb</a> b/meta/reci=
pes-connectivity/bi<wbr>nd/<a href=3D"http://bind_9.10.6.bb" rel=3D"norefer=
rer" target=3D"_blank">bind_9.10.6.bb</a><br>
index 8b8835ba80..2ec7ab44f0 100644<br>
--- a/meta/recipes-connectivity/bi<wbr>nd/<a href=3D"http://bind_9.10.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">bind_9.10.6.bb</a><br>
+++ b/meta/recipes-connectivity/bi<wbr>nd/<a href=3D"http://bind_9.10.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">bind_9.10.6.bb</a><br>
@@ -38,16 +38,19 @@ EXTRA_OECONF =3D &quot; ${ENABLE_IPV6} --with-libtool -=
-enable-threads \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with=
-openssl=3D${STAGING_LIBD<wbr>IR}/.. \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0 -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir=
<br>
+inherit autotools update-rc.d systemd useradd pkgconfig<br>
=C2=A0 =C2=A0 export PYTHON_SITEPACKAGES_DIR<br>
=C2=A0 =C2=A0 # PACKAGECONFIGs readline and libedit should NOT be set at sa=
me time<br>
-PACKAGECONFIG ?=3D &quot;readline&quot;<br>
+PACKAGECONFIG ?=3D &quot;readline python&quot;<br>
=C2=A0 PACKAGECONFIG[httpstats] =3D &quot;--with-libxml2,--without-libx<wbr=
>ml2,libxml2&quot;<br>
=C2=A0 PACKAGECONFIG[readline] =3D &quot;--with-readline=3D-lreadline,,r<wb=
r>eadline&quot;<br>
=C2=A0 PACKAGECONFIG[libedit] =3D &quot;--with-readline=3D-ledit,,libed<wbr=
>it&quot;<br>
=C2=A0 PACKAGECONFIG[urandom] =3D &quot;--with-randomdev=3D/dev/urandom<wbr=
>,--with-randomdev=3D/dev/random,<wbr>,&quot;<br>
+PACKAGECONFIG[python] =3D &quot;--with-python=3D${PYTHON},--wit<wbr>hout-p=
ython,python3-core,pytho<wbr>n3-core&quot;<br>
+<br>
+inherit ${@bb.utils.contains(&#39;PACKAGEC<wbr>ONFIG&#39;, &#39;python&#39=
;, &#39;python3native&#39;, &#39;&#39;, d)}<br>
=C2=A0 =C2=A0 USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0 USERADD_PARAM_${PN} =3D &quot;--system --home ${localstatedir}/cache=
/bind --no-create-home \<br>
@@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} =3D &quot;named.service&quot;<br>
=C2=A0 =C2=A0 PARALLEL_MAKE =3D &quot;&quot;<br>
=C2=A0 -RDEPENDS_${PN} =3D &quot;python3-core&quot;<br>
=C2=A0 RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
=C2=A0 =C2=A0 PACKAGE_BEFORE_PN +=3D &quot;${PN}-utils&quot;<br>
@@ -88,7 +90,11 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${sysconfdir}/init.d&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/conf/* &quot;${D}${sysconfd=
ir}/bind/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 &quot;${S}/init.d&quot; &quot;${=
D}${sysconfdir}/init.d/bind<wbr>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#!.*python3,#! /usr/bin/pytho=
n3,&#39; ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${@bb.utils.contains(&#39;PACKAGE=
<wbr>CONFIG&#39;, &#39;python&#39;, &#39;python&#39;, &#39;&#39;, d)}&quot;=
 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#=
!.*python3,#! /usr/bin/python3,&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${D}${sbindir}/dnssec-<wbr>coverage ${D}${sbindir}/dnssec-checkds=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install systemd related files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sbindir}<br>
<br>
</blockquote>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a113b8804ee75350565b9a86f--
