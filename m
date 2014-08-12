Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.216])
	by mail.openembedded.org (Postfix) with SMTP id 05A1A65DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:16:01 +0000 (UTC)
Received: (qmail 16741 invoked by uid 510); 12 Aug 2014 05:15:54 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=AIutxoXTMfeZTS2Gnq7QK7UsrACM0MKG3eVhUouVbvhMK4ZVumMJ58433wEghq4NI2F5wx/qixknEQs8RUO5usuLsxdnd1z1ijAXa5IP6iZOx9trbudpTzJl42J6fKv/rSsiQrEmgUjK+9VR8RN7Blxv+Natdn2HDF+JS+PnDVM=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: 
X-CTCH-VOD: 
X-CTCH-Flags: 
X-CTCH-RefID: 
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 12 Aug 2014 05:15:48 -0000
Message-ID: <20140812051548.15823.qmail@f4mail-235-216.rediffmail.com>
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	12 Aug 2014 05:15:48 -0000
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Error: package not found in the base feeds (genericx86_64 x86_64 noarch any all)
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
X-List-Received-Date: Tue, 12 Aug 2014 05:16:10 -0000
Content-Type: multipart/alternative;
	boundary="=_f320e699425e52085b38dad1591d4fec"

--=_f320e699425e52085b38dad1591d4fec
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,
I am constantly getting error:Error: liburiparser1 not found in the base feeds (genericx86_64 x86_64 noarch any all). My receipe name is liburiparser_0.8.0.bb. So from where liburiparser1 is coming from. Very surprising for me.
For each and every package it is giving the same error i.e. package not found in the base feeds&nbsp;&nbsp;(genericx86_64 x86_64 noarch any all).
My liburiparser receipe is as follows:
DESCRIPTION = "uriparser is a strictly RFC 3986 compliant URI parsing library."HOMEPAGE = "http://uriparser.sf.net"SECTION = "base"PR="r10"LICENSE = "BSD"LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"SRC_URI = "http://ncu.dl.sourceforge.net/project/uriparser/Sources/0.8.0/uriparser-${PV}.tar.bz2"SRC_URI[md5sum] = "77601f52ab91c0e100fc5d783d9c1ee5"SRC_URI[sha256sum] = "1dd9f9779d8f17822bd7d68ba042fd67779b6e4ccf162bd3c9d0ff19a8ba9bf7"
S = "${WORKDIR}/uriparser-0.8.0"
EXTRA_OECONF= "--disable-test --disable-doc"
inherit autotools
do_compile() {&nbsp; &nbsp; &nbsp; &nbsp; oe_runconf&nbsp; &nbsp; &nbsp; &nbsp; oe_runmake}do_install() {&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}/usr/lib&nbsp; &nbsp; &nbsp; &nbsp; install -d ${STAGING_INCDIR}/uriparser/&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ./include/uriparser/*.h ${STAGING_INCDIR}/uriparser/&nbsp; &nbsp; &nbsp; &nbsp; install -m 644 ${S}/.libs/*.so* ${D}/usr/lib/}PACKAGES =+ "liburiparser"FILES_liburiparser += "${D}${libdir} ${D}${libdir}/liburiparser.so&nbsp;${D}${libdir}/liburiparser.so.1 ${D}${libdir}/liburiparser.so.1.*"BBCLASSEXTEND = "native"

Please help to resolve the same.
Regards,Himanshu

--=_f320e699425e52085b38dad1591d4fec
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<div style=3D"position: static; font-family: sans-serif; font-size: 14px; b=
ackground-color: rgb(255, 255, 255); background-repeat: no-repeat;">Hi,</di=
v><div style=3D"position: static; font-family: sans-serif; font-size: 14px;=
 background-color: rgb(255, 255, 255); background-repeat: no-repeat;"><br><=
/div><div style=3D"position: static; font-family: sans-serif; font-size: 14=
px; background-color: rgb(255, 255, 255); background-repeat: no-repeat;">I =
am constantly getting error:</div><div style=3D"position: static; font-fami=
ly: sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); back=
ground-repeat: no-repeat;">Error: liburiparser1 not found in the base feeds=
 (genericx86_64 x86_64 noarch any all). My receipe name is liburiparser_0.8=
.0.bb. So from where liburiparser1 is coming from. Very surprising for me.<=
/div><div style=3D"position: static; font-family: sans-serif; font-size: 14=
px; background-color: rgb(255, 255, 255); background-repeat: no-repeat;"><b=
r></div><div style=3D"position: static; font-family: sans-serif; font-size:=
 14px; background-color: rgb(255, 255, 255); background-repeat: no-repeat;"=
>For each and every package it is giving the same error i.e. package not fo=
und in the base feeds&nbsp;&nbsp;(genericx86_64 x86_64 noarch any all).</di=
v><div style=3D"position: static; font-family: sans-serif; font-size: 14px;=
 background-color: rgb(255, 255, 255); background-repeat: no-repeat;"><br>M=
y liburiparser receipe is as follows:</div><div style=3D"position: static; =
font-family: sans-serif; font-size: 14px; background-color: rgb(255, 255, 2=
55); background-repeat: no-repeat;"><br></div><div style=3D"position: stati=
c; font-family: sans-serif; font-size: 14px; background-color: rgb(255, 255=
, 255); background-repeat: no-repeat;"><div style=3D"position: static; back=
ground-repeat: no-repeat;">DESCRIPTION =3D "uriparser is a strictly RFC 398=
6 compliant URI parsing library."</div><div style=3D"position: static; back=
ground-repeat: no-repeat;">HOMEPAGE =3D "<a href=3D'http://uriparser.sf.net=
'>http://uriparser.sf.net</a>"</div><div style=3D"position: static; backgro=
und-repeat: no-repeat;">SECTION =3D "base"</div><div style=3D"position: sta=
tic; background-repeat: no-repeat;">PR=3D"r10"</div><div style=3D"position:=
 static; background-repeat: no-repeat;">LICENSE =3D "BSD"</div><div style=
=3D"position: static; background-repeat: no-repeat;">LIC_FILES_CHKSUM =3D "=
file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"</d=
iv><div style=3D"position: static; background-repeat: no-repeat;">SRC_URI =
=3D "http://ncu.dl.sourceforge.net/project/uriparser/Sources/0.8.0/uriparse=
r-${PV}.tar.bz2"</div><div style=3D"position: static; background-repeat: no=
-repeat;">SRC_URI[md5sum] =3D "77601f52ab91c0e100fc5d783d9c1ee5"</div><div =
style=3D"position: static; background-repeat: no-repeat;">SRC_URI[sha256sum=
] =3D "1dd9f9779d8f17822bd7d68ba042fd67779b6e4ccf162bd3c9d0ff19a8ba9bf7"</d=
iv><div style=3D"position: static; background-repeat: no-repeat;"><br></div=
><div style=3D"position: static; background-repeat: no-repeat;">S =3D "${WO=
RKDIR}/uriparser-0.8.0"</div><div style=3D"position: static; background-rep=
eat: no-repeat;"><br></div><div style=3D"position: static; background-repea=
t: no-repeat;">EXTRA_OECONF=3D "--disable-test --disable-doc"</div><div sty=
le=3D"position: static; background-repeat: no-repeat;"><br></div><div style=
=3D"position: static; background-repeat: no-repeat;">inherit autotools</div=
><div style=3D"position: static; background-repeat: no-repeat;"><br></div><=
div style=3D"position: static; background-repeat: no-repeat;">do_compile() =
{</div><div style=3D"position: static; background-repeat: no-repeat;">&nbsp=
; &nbsp; &nbsp; &nbsp; oe_runconf</div><div style=3D"position: static; back=
ground-repeat: no-repeat;">&nbsp; &nbsp; &nbsp; &nbsp; oe_runmake</div><div=
 style=3D"position: static; background-repeat: no-repeat;">}</div><div styl=
e=3D"position: static; background-repeat: no-repeat;">do_install() {</div><=
div style=3D"position: static; background-repeat: no-repeat;">&nbsp; &nbsp;=
 &nbsp; &nbsp; install -d ${D}/usr/lib</div><div style=3D"position: static;=
 background-repeat: no-repeat;">&nbsp; &nbsp; &nbsp; &nbsp; install -d ${ST=
AGING_INCDIR}/uriparser/</div><div style=3D"position: static; background-re=
peat: no-repeat;">&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ./include/uri=
parser/*.h ${STAGING_INCDIR}/uriparser/</div><div style=3D"position: static=
; background-repeat: no-repeat;">&nbsp; &nbsp; &nbsp; &nbsp; install -m 644=
 ${S}/.libs/*.so* ${D}/usr/lib/</div><div style=3D"position: static; backgr=
ound-repeat: no-repeat;">}</div><div style=3D"position: static; background-=
repeat: no-repeat;">PACKAGES =3D+ "liburiparser"</div><div style=3D"positio=
n: static; background-repeat: no-repeat;">FILES_liburiparser +=3D "${D}${li=
bdir} ${D}${libdir}/<a href=3D'http://liburiparser.so'>liburiparser.so</a>&=
nbsp;${D}${libdir}/<a href=3D'http://liburiparser.so'>liburiparser.so</a>.1=
 ${D}${libdir}/<a href=3D'http://liburiparser.so'>liburiparser.so</a>.1.*"<=
/div><div style=3D"position: static; background-repeat: no-repeat;">BBCLASS=
EXTEND =3D "native"</div><div style=3D"position: static; background-repeat:=
 no-repeat;"><br></div><div style=3D"position: static; background-repeat: n=
o-repeat;"><br></div><div style=3D"position: static; background-repeat: no-=
repeat;">Please help to resolve the same.</div><div style=3D"position: stat=
ic; background-repeat: no-repeat;"><br></div><div style=3D"position: static=
; background-repeat: no-repeat;">Regards,</div><div style=3D"position: stat=
ic; background-repeat: no-repeat;">Himanshu</div></div><br><A HREF=3D"http:=
//sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signature=
line.htm@Middle?" target=3D"_blank"><IMG SRC=3D"http://sigads.rediff.com/Re=
alMedia/ads/adstream_nx.ads/www.rediffmail.com/signatureline.htm@Middle"></=
A><table cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td><div style=3D"f=
ont-family: Arial, Helvetica, sans-serif; font-size:14px">Get your own <spa=
n style=3D"padding-bottom: 0px; background-color: #cc0000; padding-left: 3p=
x; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans-serif; color: #f=
fffff; font-size: 12px; padding-top: 0px"><b>FREE</b></span> website,  <spa=
n style=3D"padding-bottom: 0px; background-color: #c00; padding-left: 3px; =
padding-RIGHT: 3px; font-family: Arial, Helvetica, sans-serif; color: #ffff=
ff; font-size: 12px; padding-top: 0px"><b>FREE</b></span> domain &amp; <spa=
n style=3D"padding-bottom: 0px; background-color: #c00; padding-left: 3px; =
padding-RIGHT: 3px; font-family: Arial, Helvetica, sans-serif; color: #ffff=
ff; font-size: 12px; padding-top: 0px"><b>FREE</b></span> mobile app with C=
ompany email. &nbsp;</div></td><td><a href=3D"http://track.rediff.com/click=
?url=3D___http://businessemail.rediff.com/email-ids-for-companies-with-less=
-than-50-employees?sc_cid=3Dsign-1-10-13___&cmp=3Dhost&lnk=3Dsign-1-10-13&n=
srv1=3Dhost" style=3D"font-family: Arial, Helvetica, sans-serif; color: #ff=
f; font-size: 14px; color:#0000cc" target=3D"_blank"><b>Know More ></b></a>=
<!-- <in-put type=3D"button" cl-ass=3D"button" on-click=3D"parent.location=
=3D&#39;http://track.rediff.com/click?url=3D___http://businessemail.rediff.=
com/company-email-hosting-services?sc_cid=3Dsignature-23-9-13___&amp;cmp=3D=
signature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhost&#39;" value=3D"Kn=
ow more &gt;"> </input> --></td></tr></tbody></table>

--=_f320e699425e52085b38dad1591d4fec--
