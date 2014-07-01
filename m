Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-111.rediffmail.com (unknown [203.199.83.114])
	by mail.openembedded.org (Postfix) with ESMTP id 9168265CAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 12:50:00 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-111.rediffmail.com (Postfix) with SMTP id 81C6A2358BE9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 18:19:50 +0530 (IST)
Received: (qmail 4936 invoked by uid 510); 1 Jul 2014 12:49:49 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=mifxMF6nq/G79piCeWeoiVkBLju5O0bMvukAepWcmmQ/jkn2Q0QyQaL7jF8jIP/BgZ6Zl81VIdtgV2V+mY3+KrxotzRF2TuuyQyDg97yNuqVhxQUn98lcB2NI1xkAinPNsp2DxkMNjLZUxynKvLUHD3L18TxGLd5sXwZmIi4Cxo=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160201.53B2AE6C.009E, ss=1, re=-2.300, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 1 Jul 2014 12:49:48 -0000
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	01 Jul 2014 12:49:48 -0000
Message-ID: <1404210684.S.6656.31443.H.WUhpbWFuc2h1ICBQYW5kZXkAW09FLWNvcmVdIEVycm9yOiBuZXQtc25tcCBub3QgZm91bmQgaW4gdGhlIGI_.RU.rfs209,
	rfs209, 597,
	688.f4-235-129.old.1404218988.4765@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Adding PPPoE package
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
X-List-Received-Date: Tue, 01 Jul 2014 12:50:02 -0000
Content-Type: multipart/alternative;
	boundary="=_600cb719ce39c27d2292eaa03e0ffb56"

--=_600cb719ce39c27d2292eaa03e0ffb56
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to add PPPoE package in my image but unfortunately I am getting the below error:

&nbsp;## ----------------- ##
| ## Output variables. ##
| ## ----------------- ##
| 
| ACLOCAL='${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run aclocal-1.12'
| AMTAR='$${TAR-tar}'
| AUTOCONF='${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run autoconf'
| AUTOHEADER='${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run autoheader'
| AUTOMAKE='${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run automake-1.12'
| AWK='gawk'
| CYGPATH_W='echo'
| DEFS='-DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DPACKAGE=\"rp-pppoe\" -DVERSION=\"3.8\"'
| ECHO_C=''
| ECHO_N='-n'
| ECHO_T=''
| INSTALL_DATA='${INSTALL} -m 644'
| INSTALL_PROGRAM='${INSTALL}'
| INSTALL_SCRIPT='${INSTALL}'
| INSTALL_STRIP_PROGRAM='$(install_sh) -c -s'
| LIBOBJS=''
| LIBS=''
| LTLIBOBJS=''
| MAKEINFO='${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run makeinfo'
| MKDIR_P='/bin/mkdir -p'
| PACKAGE='rp-pppoe'
| PACKAGE_BUGREPORT=''
| PACKAGE_NAME=''
| PACKAGE_STRING=''
| PACKAGE_TARNAME=''
| PACKAGE_URL=''
| PACKAGE_VERSION=''
| PATH_SEPARATOR=':'
| SET_MAKE=''
| SHELL='/bin/sh'
| STRIP='x86_64-poky-linux-strip'
| VERSION='3.8'
| am__isrc=''
| am__leading_dot='.'
| am__tar='$${TAR-tar} chof - "$$tardir"'
| am__untar='$${TAR-tar} xf -'
| bindir='/usr/bin'
| build_alias='x86_64-linux'
| datadir='/usr/share'
| datarootdir='${prefix}/share'
| docdir='${datarootdir}/doc/${PACKAGE}'
| dvidir='${docdir}'
| exec_prefix='/usr'
| host_alias='x86_64-poky-linux'
| htmldir='${docdir}'
| includedir='/usr/include'
| infodir='/usr/share/info'
| install_sh='${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/install-sh'
| libdir='/usr/lib'
| libexecdir='/usr/lib/rp-pppoe'
| localedir='${datarootdir}/locale'
| localstatedir='/var'
| mandir='/usr/share/man'
| mkdir_p='$(MKDIR_P)'
| oldincludedir='/usr/include'
| pdfdir='${docdir}'
| prefix='/usr'
| program_transform_name='s,x,x,'
| psdir='${docdir}'
| sbindir='/usr/sbin'
| sharedstatedir='/com'
| subdirs=' src'
| sysconfdir='/etc'
| target_alias='x86_64-poky-linux'
| 
| configure: exit 1
| ERROR: oe_runconf failed
| WARNING: /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/temp/run.do_configure.10211:1 exit 1 from
|&nbsp;&nbsp; exit 1

Regards,
Himanshu






Get your own FREE website,  FREE domain &amp; FREE mobile app with Company email. &nbsp;Know More &gt;
-- 

_______________________________________________

Openembedded-core mailing list

Openembedded-core@lists.openembedded.org

http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=_600cb719ce39c27d2292eaa03e0ffb56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

Hi,<br><br>I am trying to add PPPoE package in my image but unfortunately I=
 am getting the below error:<br><br>&nbsp;## ----------------- ##<br>| ## O=
utput variables. ##<br>| ## ----------------- ##<br>| <br>| ACLOCAL=3D'${SH=
ELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe=
/3.8-r10/rp-pppoe-3.8/missing --run aclocal-1.12'<br>| AMTAR=3D'$${TAR-tar}=
'<br>| AUTOCONF=3D'${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86=
_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run autoconf'<br>| A=
UTOHEADER=3D'${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-po=
ky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run autoheader'<br>| AUTOM=
AKE=3D'${SHELL} /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-lin=
ux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing --run automake-1.12'<br>| AWK=3D'g=
awk'<br>| CYGPATH_W=3D'echo'<br>| DEFS=3D'-DPACKAGE_NAME=3D\"\" -DPACKAGE_T=
ARNAME=3D\"\" -DPACKAGE_VERSION=3D\"\" -DPACKAGE_STRING=3D\"\" -DPACKAGE_BU=
GREPORT=3D\"\" -DPACKAGE_URL=3D\"\" -DPACKAGE=3D\"rp-pppoe\" -DVERSION=3D\"=
3.8\"'<br>| ECHO_C=3D''<br>| ECHO_N=3D'-n'<br>| ECHO_T=3D''<br>| INSTALL_DA=
TA=3D'${INSTALL} -m 644'<br>| INSTALL_PROGRAM=3D'${INSTALL}'<br>| INSTALL_S=
CRIPT=3D'${INSTALL}'<br>| INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'<br>=
| LIBOBJS=3D''<br>| LIBS=3D''<br>| LTLIBOBJS=3D''<br>| MAKEINFO=3D'${SHELL}=
 /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8=
-r10/rp-pppoe-3.8/missing --run makeinfo'<br>| MKDIR_P=3D'/bin/mkdir -p'<br=
>| PACKAGE=3D'rp-pppoe'<br>| PACKAGE_BUGREPORT=3D''<br>| PACKAGE_NAME=3D''<=
br>| PACKAGE_STRING=3D''<br>| PACKAGE_TARNAME=3D''<br>| PACKAGE_URL=3D''<br=
>| PACKAGE_VERSION=3D''<br>| PATH_SEPARATOR=3D':'<br>| SET_MAKE=3D''<br>| S=
HELL=3D'/bin/sh'<br>| STRIP=3D'x86_64-poky-linux-strip'<br>| VERSION=3D'3.8=
'<br>| am__isrc=3D''<br>| am__leading_dot=3D'.'<br>| am__tar=3D'$${TAR-tar}=
 chof - "$$tardir"'<br>| am__untar=3D'$${TAR-tar} xf -'<br>| bindir=3D'/usr=
/bin'<br>| build_alias=3D'x86_64-linux'<br>| datadir=3D'/usr/share'<br>| da=
tarootdir=3D'${prefix}/share'<br>| docdir=3D'${datarootdir}/doc/${PACKAGE}'=
<br>| dvidir=3D'${docdir}'<br>| exec_prefix=3D'/usr'<br>| host_alias=3D'x86=
_64-poky-linux'<br>| htmldir=3D'${docdir}'<br>| includedir=3D'/usr/include'=
<br>| infodir=3D'/usr/share/info'<br>| install_sh=3D'${SHELL} /home/yocto/p=
oky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-=
3.8/install-sh'<br>| libdir=3D'/usr/lib'<br>| libexecdir=3D'/usr/lib/rp-ppp=
oe'<br>| localedir=3D'${datarootdir}/locale'<br>| localstatedir=3D'/var'<br=
>| mandir=3D'/usr/share/man'<br>| mkdir_p=3D'$(MKDIR_P)'<br>| oldincludedir=
=3D'/usr/include'<br>| pdfdir=3D'${docdir}'<br>| prefix=3D'/usr'<br>| progr=
am_transform_name=3D's,x,x,'<br>| psdir=3D'${docdir}'<br>| sbindir=3D'/usr/=
sbin'<br>| sharedstatedir=3D'/com'<br>| subdirs=3D' src'<br>| sysconfdir=3D=
'/etc'<br>| target_alias=3D'x86_64-poky-linux'<br>| <br>| configure: exit 1=
<br>| ERROR: oe_runconf failed<br>| WARNING: /home/yocto/poky-dora-10.0.0/b=
uild/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/temp/run.do_configure.1021=
1:1 exit 1 from<br>|&nbsp;&nbsp; exit 1<br><br>Regards,<br>Himanshu<br><br>=
<br><br><br>
<br><a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.redi=
ffmail.com/signatureline.htm@Middle?'><img src=3D"http://sigads.rediff.com/=
RealMedia/ads/adstream_nx.ads/www.rediffmail.com/signatureline.htm@Middle&r=
ogue=3D1716b54fe387786204c5115fd1c9b84babf33ef6"></a><table cellpadding=3D"=
0" cellspacing=3D"0"><tbody><tr><td><div style=3D"font-family: Arial, Helve=
tica, sans-serif; font-size:14px">Get your own <span style=3D"padding-botto=
m: 0px; background-color: #cc0000; padding-left: 3px; padding-RIGHT: 3px; f=
ont-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; =
padding-top: 0px"><b>FREE</b></span> website,  <span style=3D"padding-botto=
m: 0px; background-color: #c00; padding-left: 3px; padding-RIGHT: 3px; font=
-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; pad=
ding-top: 0px"><b>FREE</b></span> domain &amp; <span style=3D"padding-botto=
m: 0px; background-color: #c00; padding-left: 3px; padding-RIGHT: 3px; font=
-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; pad=
ding-top: 0px"><b>FREE</b></span> mobile app with Company email. &nbsp;</di=
v></td><td><a href=3D'http://track.rediff.com/click?url=3D___http://busines=
semail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_ci=
d=3Dsign-1-10-13___&cmp=3Dhost&lnk=3Dsign-1-10-13&nsrv1=3Dhost'><b>Know Mor=
e &gt;</b></a><!--  <in-put type=3D"button" cl-ass=3D"button" on-click=3D"p=
arent.location=3D&#39;http://track.rediff.com/click?url=3D___http://busines=
semail.rediff.com/company-email-hosting-services?sc_cid=3Dsignature-23-9-13=
___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhost&#39=
;" value=3D"Know more &gt;"> </input>  --></td></tr></tbody></table>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
http://lists.openembedded.org/mailman/listinfo/openembedded-core<br>
<br><A HREF=3D"http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.redi=
ffmail.com/signatureline.htm@Middle?" target=3D"_blank"><IMG SRC=3D"http://=
sigads.rediff.com/RealMedia/ads/adstream_nx.ads/www.rediffmail.com/signatur=
eline.htm@Middle"></A><table cellpadding=3D"0" cellspacing=3D"0"><tbody><tr=
><td><div style=3D"font-family: Arial, Helvetica, sans-serif; font-size:14p=
x">Get your own <span style=3D"padding-bottom: 0px; background-color: #cc00=
00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, s=
ans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></=
span> website,  <span style=3D"padding-bottom: 0px; background-color: #c00;=
 padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans=
-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></spa=
n> domain &amp; <span style=3D"padding-bottom: 0px; background-color: #c00;=
 padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans=
-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></spa=
n> mobile app with Company email. &nbsp;</div></td><td><a href=3D"http://tr=
ack.rediff.com/click?url=3D___http://businessemail.rediff.com/email-ids-for=
-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13___&cmp=3Dhost&=
lnk=3Dsign-1-10-13&nsrv1=3Dhost" style=3D"font-family: Arial, Helvetica, sa=
ns-serif; color: #fff; font-size: 14px; color:#0000cc" target=3D"_blank"><b=
>Know More ></b></a><!-- <in-put type=3D"button" cl-ass=3D"button" on-click=
=3D"parent.location=3D&#39;http://track.rediff.com/click?url=3D___http://bu=
sinessemail.rediff.com/company-email-hosting-services?sc_cid=3Dsignature-23=
-9-13___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhos=
t&#39;" value=3D"Know more &gt;"> </input> --></td></tr></tbody></table>

--=_600cb719ce39c27d2292eaa03e0ffb56--
