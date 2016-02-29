Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S9.hotmail.com (dub004-omc3s9.hotmail.com
	[157.55.2.18])
	by mail.openembedded.org (Postfix) with ESMTP id D62A475894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:31:40 +0000 (UTC)
Received: from DUB130-W48 ([157.55.2.9]) by DUB004-OMC3S9.hotmail.com over TLS
	secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Mon, 29 Feb 2016 14:31:40 -0800
X-TMN: [PxzHwA0YNIReIfC5C8t7S/xAeYq3xp0v]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W48DF9157CA7FB28EB22361DABA0@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Feb 2016 22:31:39 +0000
Importance: Normal
In-Reply-To: <BLU436-SMTP249E7CB0620E278757F68E5DABA0@phx.gbl>
References: <BLU436-SMTP249E7CB0620E278757F68E5DABA0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 29 Feb 2016 22:31:40.0754 (UTC)
	FILETIME=[F5B07B20:01D17340]
Subject: Re: [meta-oe][PATCH] wireshark: 2.0.2 update including security
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
X-List-Received-Date: Mon, 29 Feb 2016 22:31:42 -0000
Content-Type: multipart/alternative;
	boundary="_66fd8efa-2e2f-4a40-8d0f-53205450f767_"

--_66fd8efa-2e2f-4a40-8d0f-53205450f767_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this - sent in error.

> From: christrobridge@hotmail.com
> To: christrobridge@hotmail.com
> CC: akuster808@gmail.com=3B Martin.Jansa@gmail.com
> Subject: [OE-core][meta-oe][PATCH] wireshark: 2.0.2 update including secu=
rity
> Date: Mon=2C 29 Feb 2016 22:22:18 +0000
>=20
> From: Armin Kuster <akuster808@gmail.com>
>=20
> The following vulnerabilities have been fixed:
> * [1]wnpa-sec-2016-01
>   DLL hijacking vulnerability. [2]CVE-2016-2521
> * [3]wnpa-sec-2016-02
>   ASN.1 BER dissector crash. ([4]Bug 11828) [5]CVE-2016-2522
> * [6]wnpa-sec-2016-03
>   DNP dissector infinite loop. ([7]Bug 11938) [8]CVE-2016-2523
> * [9]wnpa-sec-2016-04
>   X.509AF dissector crash. ([10]Bug 12002) [11]CVE-2016-2524
> * [12]wnpa-sec-2016-05
>   HTTP/2 dissector crash. ([13]Bug 12077) [14]CVE-2016-2525
> * [15]wnpa-sec-2016-06
>   HiQnet dissector crash. ([16]Bug 11983) [17]CVE-2016-2526
> * [18]wnpa-sec-2016-07
>   3GPP TS 32.423 Trace file parser crash. ([19]Bug 11982) [20]CVE-2016-25=
27
> * [21]wnpa-sec-2016-08
>   LBMC dissector crash. ([22]Bug 11984) [23]CVE-2016-2528
> * [24]wnpa-sec-2016-09
>   iSeries file parser crash. ([25]Bug 11985) [26]CVE-2016-2529
> * [27]wnpa-sec-2016-10
>   RSL dissector crash. ([28]Bug 11829) [29]CVE-2016-2530 [30]CVE-2016-253=
1
> * [31]wnpa-sec-2016-11
>   LLRP dissector crash. ([32]Bug 12048) [33]CVE-2016-2532
> * [34]wnpa-sec-2016-12
>   Ixia IxVeriWave file parser crash. ([35]Bug 11795)
> * [36]wnpa-sec-2016-13
>   IEEE 802.11 dissector crash. ([37]Bug 11818)
> * [38]wnpa-sec-2016-14
>   GSM A-bis OML dissector crash. ([39]Bug 11825)
> * [40]wnpa-sec-2016-15
>   ASN.1 BER dissector crash. ([41]Bug 12106)
> * [42]wnpa-sec-2016-16
>   SPICE dissector large loop. ([43]Bug 12151)
> * [44]wnpa-sec-2016-17
>   NFS dissector crash.
> * [45]wnpa-sec-2016-18
>   ASN.1 BER dissector crash. ([46]Bug 11822)
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../wireshark/{wireshark_2.0.1.bb =3D> wireshark_2.0.2.bb}              =
| 4 ++--
>  1 file changed=2C 2 insertions(+)=2C 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.0.1.bb =3D=
> wireshark_2.0.2.bb} (94%)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb=
 b/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
> similarity index 94%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
> index 49b5de6..b140099 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
> @@ -8=2C8 +8=2C8 @@ DEPENDS =3D "perl-native pcre expat glib-2.0 sbc"
> =20
>  SRC_URI =3D "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz=
2"
> =20
> -SRC_URI[md5sum] =3D "c1610ab2238965363b811e5188750fb1"
> -SRC_URI[sha256sum] =3D "c9bd07dd0d0045d6ca7537390a1afbcdf33716d193ea7d70=
84ae4f6c30b683ab"
> +SRC_URI[md5sum] =3D "204d053e0796c7da09292e0b54bc8503"
> +SRC_URI[sha256sum] =3D "e921fb072085a5654d899949bb561d0687f4819f7b63ba35=
777bb949a9b6b9c1"
> =20
>  PE =3D "1"
> =20
> --=20
> 2.4.3
>=20
 		 	   		  =

--_66fd8efa-2e2f-4a40-8d0f-53205450f767_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>Please ignore this - sent in err=
or.<br><br><div>&gt=3B From: christrobridge@hotmail.com<br>&gt=3B To: chris=
trobridge@hotmail.com<br>&gt=3B CC: akuster808@gmail.com=3B Martin.Jansa@gm=
ail.com<br>&gt=3B Subject: [OE-core][meta-oe][PATCH] wireshark: 2.0.2 updat=
e including security<br>&gt=3B Date: Mon=2C 29 Feb 2016 22:22:18 +0000<br>&=
gt=3B <br>&gt=3B From: Armin Kuster &lt=3Bakuster808@gmail.com&gt=3B<br>&gt=
=3B <br>&gt=3B The following vulnerabilities have been fixed:<br>&gt=3B * [=
1]wnpa-sec-2016-01<br>&gt=3B   DLL hijacking vulnerability. [2]CVE-2016-252=
1<br>&gt=3B * [3]wnpa-sec-2016-02<br>&gt=3B   ASN.1 BER dissector crash. ([=
4]Bug 11828) [5]CVE-2016-2522<br>&gt=3B * [6]wnpa-sec-2016-03<br>&gt=3B   D=
NP dissector infinite loop. ([7]Bug 11938) [8]CVE-2016-2523<br>&gt=3B * [9]=
wnpa-sec-2016-04<br>&gt=3B   X.509AF dissector crash. ([10]Bug 12002) [11]C=
VE-2016-2524<br>&gt=3B * [12]wnpa-sec-2016-05<br>&gt=3B   HTTP/2 dissector =
crash. ([13]Bug 12077) [14]CVE-2016-2525<br>&gt=3B * [15]wnpa-sec-2016-06<b=
r>&gt=3B   HiQnet dissector crash. ([16]Bug 11983) [17]CVE-2016-2526<br>&gt=
=3B * [18]wnpa-sec-2016-07<br>&gt=3B   3GPP TS 32.423 Trace file parser cra=
sh. ([19]Bug 11982) [20]CVE-2016-2527<br>&gt=3B * [21]wnpa-sec-2016-08<br>&=
gt=3B   LBMC dissector crash. ([22]Bug 11984) [23]CVE-2016-2528<br>&gt=3B *=
 [24]wnpa-sec-2016-09<br>&gt=3B   iSeries file parser crash. ([25]Bug 11985=
) [26]CVE-2016-2529<br>&gt=3B * [27]wnpa-sec-2016-10<br>&gt=3B   RSL dissec=
tor crash. ([28]Bug 11829) [29]CVE-2016-2530 [30]CVE-2016-2531<br>&gt=3B * =
[31]wnpa-sec-2016-11<br>&gt=3B   LLRP dissector crash. ([32]Bug 12048) [33]=
CVE-2016-2532<br>&gt=3B * [34]wnpa-sec-2016-12<br>&gt=3B   Ixia IxVeriWave =
file parser crash. ([35]Bug 11795)<br>&gt=3B * [36]wnpa-sec-2016-13<br>&gt=
=3B   IEEE 802.11 dissector crash. ([37]Bug 11818)<br>&gt=3B * [38]wnpa-sec=
-2016-14<br>&gt=3B   GSM A-bis OML dissector crash. ([39]Bug 11825)<br>&gt=
=3B * [40]wnpa-sec-2016-15<br>&gt=3B   ASN.1 BER dissector crash. ([41]Bug =
12106)<br>&gt=3B * [42]wnpa-sec-2016-16<br>&gt=3B   SPICE dissector large l=
oop. ([43]Bug 12151)<br>&gt=3B * [44]wnpa-sec-2016-17<br>&gt=3B   NFS disse=
ctor crash.<br>&gt=3B * [45]wnpa-sec-2016-18<br>&gt=3B   ASN.1 BER dissecto=
r crash. ([46]Bug 11822)<br>&gt=3B <br>&gt=3B Signed-off-by: Armin Kuster &=
lt=3Bakuster808@gmail.com&gt=3B<br>&gt=3B Signed-off-by: Martin Jansa &lt=
=3BMartin.Jansa@gmail.com&gt=3B<br>&gt=3B ---<br>&gt=3B  .../wireshark/{wir=
eshark_2.0.1.bb =3D&gt=3B wireshark_2.0.2.bb}              | 4 ++--<br>&gt=
=3B  1 file changed=2C 2 insertions(+)=2C 2 deletions(-)<br>&gt=3B  rename =
meta-networking/recipes-support/wireshark/{wireshark_2.0.1.bb =3D&gt=3B wir=
eshark_2.0.2.bb} (94%)<br>&gt=3B <br>&gt=3B diff --git a/meta-networking/re=
cipes-support/wireshark/wireshark_2.0.1.bb b/meta-networking/recipes-suppor=
t/wireshark/wireshark_2.0.2.bb<br>&gt=3B similarity index 94%<br>&gt=3B ren=
ame from meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb<br>&g=
t=3B rename to meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb=
<br>&gt=3B index 49b5de6..b140099 100644<br>&gt=3B --- a/meta-networking/re=
cipes-support/wireshark/wireshark_2.0.1.bb<br>&gt=3B +++ b/meta-networking/=
recipes-support/wireshark/wireshark_2.0.2.bb<br>&gt=3B @@ -8=2C8 +8=2C8 @@ =
DEPENDS =3D "perl-native pcre expat glib-2.0 sbc"<br>&gt=3B  <br>&gt=3B  SR=
C_URI =3D "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"<br=
>&gt=3B  <br>&gt=3B -SRC_URI[md5sum] =3D "c1610ab2238965363b811e5188750fb1"=
<br>&gt=3B -SRC_URI[sha256sum] =3D "c9bd07dd0d0045d6ca7537390a1afbcdf33716d=
193ea7d7084ae4f6c30b683ab"<br>&gt=3B +SRC_URI[md5sum] =3D "204d053e0796c7da=
09292e0b54bc8503"<br>&gt=3B +SRC_URI[sha256sum] =3D "e921fb072085a5654d8999=
49bb561d0687f4819f7b63ba35777bb949a9b6b9c1"<br>&gt=3B  <br>&gt=3B  PE =3D "=
1"<br>&gt=3B  <br>&gt=3B -- <br>&gt=3B 2.4.3<br>&gt=3B <br></div> 		 	   		=
  </div></body>
</html>=

--_66fd8efa-2e2f-4a40-8d0f-53205450f767_--
