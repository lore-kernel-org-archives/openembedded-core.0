Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-123.rediffmail.com (unknown [203.199.83.123])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4507038D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 13:19:24 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-123.rediffmail.com (Postfix) with SMTP id 8F9243082048
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 18:33:16 +0530 (IST)
Received: (qmail 12752 invoked by uid 510); 21 Jul 2014 13:13:09 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=WvFSjKhWjVkAyn6cT2FpR8l2SxXjDku+93oTQE3RLNqHttp2otJM7xxG4N/rQ36EfIX8pLqn4xoXKCsnBAb5TPtLlX9MD1L3//pnyP5TLGH8BotEqhWp9Lwgy+uPysvv7aJJos/e2crh9DlWlto6pIgO+y11bV1scyfNeYFy1PQ=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160206.53CD11E2.01D0, ss=1, re=-2.300, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 21 Jul 2014 13:13:06 -0000
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	21 Jul 2014 13:13:06 -0000
Message-ID: <1405947662.S.26318.RU.sfs21, sfs21, 978,
	266.12072.f4mail-235-95.rediffmail.com.old.1405948386.12247@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Regarding dhcp
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
X-List-Received-Date: Mon, 21 Jul 2014 13:19:27 -0000
X-Groupsio-MsgNum: 55270
Content-Type: multipart/mixed;
	boundary="=_c9cb3e053f5d024ad67fc198c112486a"

--=_c9cb3e053f5d024ad67fc198c112486a
Content-Type: multipart/alternative;
	boundary="=_4ac775a486041af8f57fc9506b151b2d"

--=_4ac775a486041af8f57fc9506b151b2d
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,

Getting error while compiling dhcp. 

Please find the log as attachment.

Please help.

Regards,
Himanshu




From: "Himanshu  Pandey"pandey_himanshu80@rediffmail.com

Sent: Mon, 21 Jul 2014 18:31:02 +0530

To: "Robert Yang "liezhi.yang@windriver.com

Subject: Regarding dhcp





Hi,



I am getting an error in compiling dhcp package. 



Please find the log as attachment. 



Regards,

Himanshu









From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

Sent: Fri, 18 Jul 2014 16:30:11 

To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

Subject: Re: Regarding Lighttpd





On 07/18/2014 05:20 PM, Himanshu Pandey wrote:

&gt; Hi,

&gt;

&gt; I am compiling Lighttpd package. Below is my receipe. I am getting an error,

&gt; please find the log as attachment.

&gt;

&gt; Please help to resolve the same.

&gt;

&gt; DESCRIPTION = "Lightweight high-performance web server"

&gt; HOMEPAGE = "http://www.lighttpd.net/"

&gt; BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"

&gt;

&gt; LICENSE = "BSD"

&gt; LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"

&gt;

&gt;

&gt; SECTION = "net"

&gt; DEPENDS = "zlib libpcre"

&gt; RDEPENDS_${PN} += " \

&gt;         lighttpd-module-access \

&gt;         lighttpd-module-accesslog \

&gt;         lighttpd-module-indexfile \

&gt;         lighttpd-module-dirlisting \

&gt;         lighttpd-module-staticfile \

&gt; "

&gt;

&gt; PR = "r0"

&gt;

&gt; SRC_URI =

&gt; "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \

&gt;     file://index.html.lighttpd \

&gt;     file://lighttpd.conf \

&gt;     file://lighttpd \

&gt;     file://lighttpd.service \

&gt;     "

&gt;

&gt; SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"

&gt; SRC_URI[sha256sum] =

&gt; "60691b2dcf3ad2472c06b23d75eb0c164bf48a08a630ed3f308f61319104701f"

&gt;

&gt; EXTRA_OECONF = " \

&gt;        --without-bzip2 \

&gt;        --without-ldap \

&gt;        --without-lua \

&gt;        --without-memcache \

&gt;        --with-pcre \

&gt;        --without-webdav-props \

&gt;        --without-webdav-locks \

&gt;        --without-openssl \

&gt;        --disable-static \

&gt; "

&gt;

&gt; S = "${WORKDIR}/lighttpd_1.4.32"

&gt; #inherit autotools pkgconfig update-rc.d gettext systemd

&gt;

&gt; #INITSCRIPT_NAME = "lighttpd"

&gt; #INITSCRIPT_PARAMS = "defaults 70"

&gt;

&gt; SYSTEMD_SERVICE_${PN} = "lighttpd.service"

&gt;

&gt; do_configure() {

&gt;

&gt;     ./configure --prefix=${D}/opt/lighttpd --host=${HOST_SYS}





The error is:



run.do_configure.4585: line 97: ./configure: No such file or directory



Is it an autotools class ? You need use the "inherit autotools" if so.



Otherwise you need find our where is the configure.



&gt;     oe_runmake



Don't do this in do_configure, it should be done in do_compile.



// Robert



&gt; }

&gt;

&gt; do_install() {

&gt;        install -d ${D}/opt/lighttpd

&gt;        oe_runmake install

&gt; }

&gt;

&gt; do_install_append() {

&gt;     #install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav

&gt; ${D}/www/var

&gt;     #install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d

&gt;     #install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}

&gt;     #install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html

&gt;

&gt;     #install -d ${D}${systemd_unitdir}/system

&gt;     #install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system

&gt;     #sed -i -e 's,@SBINDIR@,${sbindir},g' \

&gt;         -e 's,@SYSCONFDIR@,${sysconfdir},g' \

&gt;         -e 's,@BASE_BINDIR@,${base_bindir},g' \

&gt;         ${D}${systemd_unitdir}/system/lighttpd.service

&gt; }

&gt;

&gt; #FILES_${PN} += "${sysconfdir} /www"

&gt;

&gt; #CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"

&gt;

&gt; PACKAGES_DYNAMIC += "^lighttpd-module-.*"

&gt;

&gt; python populate_packages_prepend () {

&gt;  #  lighttpd_libdir = d.expand('${libdir}')

&gt;  # do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',

&gt; 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')

&gt; }

&gt;

&gt;

&gt;

&gt;

&gt;

&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; Sent: Thu, 17 Jul 2014 10:38:53

&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; Subject: Re: Regarding pppoe package

&gt;

&gt; Seems that your pppoe is a little old ? See the errors, it searchs for kernel

&gt; 2.4.X, now the kernel is 3.10.

&gt;

&gt; checking for id... /usr/bin/id

&gt; checking for Linux 2.4.X kernel-mode PPPoE support... cross-compiling, default:

&gt; no

&gt; configure: WARNING: *** Oops! I couldn't find pppd, the PPP daemon anywhere.

&gt; configure: WARNING: *** You must install pppd, version 2.3.10 or later.

&gt; configure: WARNING: *** I will keep going, but it may not work.

&gt; configure: WARNING: *** Oops. I cannot figure out what version of pppd you have.

&gt; configure: WARNING: *** All I got back was ''

&gt; configure: WARNING: *** I will keep going, but it may not work.

&gt; checking packing order of bit fields... no defaults for cross-compiling

&gt;

&gt; // Robert

&gt;

&gt; On 07/17/2014 12:31 PM, Himanshu Pandey wrote:

&gt; &gt; Hi,

&gt; &gt;

&gt; &gt; I am compiling pppoe package but facing errors. Please find the log as

&gt; attachment.

&gt; &gt;

&gt; &gt; Please help.

&gt; &gt;

&gt; &gt; Regards,

&gt; &gt; Himanshu

&gt; &gt;

&gt; &gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; email.

&gt; &gt;  *Know More &gt;*

&gt; &gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &gt;

&gt; &gt;

&gt; &gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; email.

&gt; &gt;  *Know More &gt;*

&gt; &gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &gt;

&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company email.

&gt; *Know More &gt;*

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt;



Get your own FREE website,  FREE domain &amp; FREE mobile app with Company email. Know More &gt;

--=_4ac775a486041af8f57fc9506b151b2d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

Hi,<br><br>Getting error while compiling dhcp. <br><br>Please find the log =
as attachment.<br><br>Please help.<br><br>Regards,<br>Himanshu<br><!-- Mess=
age id:1405681211.S.16560.8305.F.H.TlJvYmVydCBZYW5nAFJlOiBSZWdhcmRpbmcgTGln=
aHR0cGQ_.RU.rfs304,rfs304,551,445.f4-234-194.old.1405947660.11642 --><br>
<br>
From: "Himanshu  Pandey"pandey_himanshu80@rediffmail.com<br>
Sent: Mon, 21 Jul 2014 18:31:02 +0530<br>
To: "Robert Yang "liezhi.yang@windriver.com<br>
Subject: Regarding dhcp<br>
<br>
<br>
Hi,<br>
<br>
I am getting an error in compiling dhcp package. <br>
<br>
Please find the log as attachment. <br>
<br>
Regards,<br>
Himanshu<br>
<br>
<br>
<br>
<br>
From: Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
Sent: Fri, 18 Jul 2014 16:30:11 <br>
To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;<br>
Subject: Re: Regarding Lighttpd<br>
<br>
<br>
On 07/18/2014 05:20 PM, Himanshu Pandey wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am compiling Lighttpd package. Below is my receipe. I am getting an =
error,<br>
&gt; please find the log as attachment.<br>
&gt;<br>
&gt; Please help to resolve the same.<br>
&gt;<br>
&gt; DESCRIPTION =3D "Lightweight high-performance web server"<br>
&gt; HOMEPAGE =3D "http://www.lighttpd.net/"<br>
&gt; BUGTRACKER =3D "http://redmine.lighttpd.net/projects/lighttpd/issues"<=
br>
&gt;<br>
&gt; LICENSE =3D "BSD"<br>
&gt; LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb502885=
3a579"<br>
&gt;<br>
&gt;<br>
&gt; SECTION =3D "net"<br>
&gt; DEPENDS =3D "zlib libpcre"<br>
&gt; RDEPENDS_${PN} +=3D " \<br>
&gt;         lighttpd-module-access \<br>
&gt;         lighttpd-module-accesslog \<br>
&gt;         lighttpd-module-indexfile \<br>
&gt;         lighttpd-module-dirlisting \<br>
&gt;         lighttpd-module-staticfile \<br>
&gt; "<br>
&gt;<br>
&gt; PR =3D "r0"<br>
&gt;<br>
&gt; SRC_URI =3D<br>
&gt; "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t=
ar.bz2 \<br>
&gt;     file://index.html.lighttpd \<br>
&gt;     file://lighttpd.conf \<br>
&gt;     file://lighttpd \<br>
&gt;     file://lighttpd.service \<br>
&gt;     "<br>
&gt;<br>
&gt; SRC_URI[md5sum] =3D "8e2d4ae8e918d4de1aeb9842584d170b"<br>
&gt; SRC_URI[sha256sum] =3D<br>
&gt; "60691b2dcf3ad2472c06b23d75eb0c164bf48a08a630ed3f308f61319104701f"<br>
&gt;<br>
&gt; EXTRA_OECONF =3D " \<br>
&gt;        --without-bzip2 \<br>
&gt;        --without-ldap \<br>
&gt;        --without-lua \<br>
&gt;        --without-memcache \<br>
&gt;        --with-pcre \<br>
&gt;        --without-webdav-props \<br>
&gt;        --without-webdav-locks \<br>
&gt;        --without-openssl \<br>
&gt;        --disable-static \<br>
&gt; "<br>
&gt;<br>
&gt; S =3D "${WORKDIR}/lighttpd_1.4.32"<br>
&gt; #inherit autotools pkgconfig update-rc.d gettext systemd<br>
&gt;<br>
&gt; #INITSCRIPT_NAME =3D "lighttpd"<br>
&gt; #INITSCRIPT_PARAMS =3D "defaults 70"<br>
&gt;<br>
&gt; SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"<br>
&gt;<br>
&gt; do_configure() {<br>
&gt;<br>
&gt;     ./configure --prefix=3D${D}/opt/lighttpd --host=3D${HOST_SYS}<br>
<br>
<br>
The error is:<br>
<br>
<a href=3D'http://run.do'>run.do</a>_configure.4585: line 97: ./configure: =
No such file or directory<br>
<br>
Is it an autotools class ? You need use the "inherit autotools" if so.<br>
<br>
Otherwise you need find our where is the configure.<br>
<br>
&gt;     oe_runmake<br>
<br>
Don't do this in do_configure, it should be done in do_compile.<br>
<br>
// Robert<br>
<br>
&gt; }<br>
&gt;<br>
&gt; do_install() {<br>
&gt;        install -d ${D}/opt/lighttpd<br>
&gt;        oe_runmake install<br>
&gt; }<br>
&gt;<br>
&gt; do_install_append() {<br>
&gt;     #install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/=
dav<br>
&gt; ${D}/www/var<br>
&gt;     #install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d<br>
&gt;     #install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}<br>
&gt;     #install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/ind=
ex.html<br>
&gt;<br>
&gt;     #install -d ${D}${systemd_unitdir}/system<br>
&gt;     #install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir=
}/system<br>
&gt;     #sed -i -e 's,@SBINDIR@,${sbindir},g' \<br>
&gt;         -e 's,@SYSCONFDIR@,${sysconfdir},g' \<br>
&gt;         -e 's,@BASE_BINDIR@,${base_bindir},g' \<br>
&gt;         ${D}${systemd_unitdir}/system/lighttpd.service<br>
&gt; }<br>
&gt;<br>
&gt; #FILES_${PN} +=3D "${sysconfdir} /www"<br>
&gt;<br>
&gt; #CONFFILES_${PN} =3D "${sysconfdir}/lighttpd.conf"<br>
&gt;<br>
&gt; PACKAGES_DYNAMIC +=3D "^lighttpd-module-.*"<br>
&gt;<br>
&gt; python populate_packages_prepend () {<br>
&gt;  #  lighttpd_libdir =3D d.expand('${libdir}')<br>
&gt;  # do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',<br>
&gt; 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends=3D'')<br=
>
&gt; }<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
&gt; Sent: Thu, 17 Jul 2014 10:38:53<br>
&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;<br>
&gt; Subject: Re: Regarding pppoe package<br>
&gt;<br>
&gt; Seems that your pppoe is a little old ? See the errors, it searchs for=
 kernel<br>
&gt; 2.4.X, now the kernel is 3.10.<br>
&gt;<br>
&gt; checking for id... /usr/bin/id<br>
&gt; checking for Linux 2.4.X kernel-mode PPPoE support... cross-compiling,=
 default:<br>
&gt; no<br>
&gt; configure: WARNING: *** Oops! I couldn't find pppd, the PPP daemon any=
where.<br>
&gt; configure: WARNING: *** You must install pppd, version 2.3.10 or later=
.<br>
&gt; configure: WARNING: *** I will keep going, but it may not work.<br>
&gt; configure: WARNING: *** Oops. I cannot figure out what version of pppd=
 you have.<br>
&gt; configure: WARNING: *** All I got back was ''<br>
&gt; configure: WARNING: *** I will keep going, but it may not work.<br>
&gt; checking packing order of bit fields... no defaults for cross-compilin=
g<br>
&gt;<br>
&gt; // Robert<br>
&gt;<br>
&gt; On 07/17/2014 12:31 PM, Himanshu Pandey wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I am compiling pppoe package but facing errors. Please find the l=
og as<br>
&gt; attachment.<br>
&gt; &gt;<br>
&gt; &gt; Please help.<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Himanshu<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail=
.com/signatureline.htm@Middle?&gt;<br>
&gt; &gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile ap=
p with Company<br>
&gt; email.<br>
&gt; &gt;  *Know More &gt;*<br>
&gt; &gt;<br>
&gt; &lt;http://track.rediff.com/click?url=3D___http://businessemail.rediff=
.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10=
-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail=
.com/signatureline.htm@Middle?&gt;<br>
&gt; &gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile ap=
p with Company<br>
&gt; email.<br>
&gt; &gt;  *Know More &gt;*<br>
&gt; &gt;<br>
&gt; &lt;http://track.rediff.com/click?url=3D___http://businessemail.rediff=
.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10=
-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail=
.com/signatureline.htm@Middle?&gt;<br>
&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app wit=
h Company email.<br>
&gt; *Know More &gt;*<br>
&gt; &lt;http://track.rediff.com/click?url=3D___http://businessemail.rediff=
.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10=
-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;<br>
&gt;<br>
<br>
<a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffma=
il.com/signatureline.htm@Middle?'><img src=3D"http://sigads.rediff.com/Real=
Media/ads/adstream_nx.ads/www.rediffmail.com/signatureline.htm@Middle&rogue=
=3D1716b54fe387786204c5115fd1c9b84babf33ef6"></a><table cellpadding=3D"0" c=
ellspacing=3D"0"><tbody><tr><td><div style=3D"font-family: Arial, Helvetica=
, sans-serif; font-size:14px">Get your own <span style=3D"padding-bottom: 0=
px; background-color: #cc0000; padding-left: 3px; padding-RIGHT: 3px; font-=
family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; padd=
ing-top: 0px"><b>FREE</b></span> website,  <span style=3D"padding-bottom: 0=
px; background-color: #c00; padding-left: 3px; padding-RIGHT: 3px; font-fam=
ily: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; padding=
-top: 0px"><b>FREE</b></span> domain &amp; <span style=3D"padding-bottom: 0=
px; background-color: #c00; padding-left: 3px; padding-RIGHT: 3px; font-fam=
ily: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; padding=
-top: 0px"><b>FREE</b></span> mobile app with Company email. </div></td><td=
><a href=3D'http://track.rediff.com/click?url=3D___http://businessemail.red=
iff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1=
-10-13___&cmp=3Dhost&lnk=3Dsign-1-10-13&nsrv1=3Dhost'><b>Know More &gt;</b>=
</a><!-- <in-put type=3D"button" cl-ass=3D"button" on-click=3D"parent.locat=
ion=3D&#39;http://track.rediff.com/click?url=3D___http://businessemail.redi=
ff.com/company-email-hosting-services?sc_cid=3Dsignature-23-9-13___&amp;cmp=
=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhost&#39;" value=3D=
"Know more &gt;"> </input> --></td></tr></tbody></table><br><A HREF=3D"http=
://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatur=
eline.htm@Middle?" target=3D"_blank"><IMG SRC=3D"http://sigads.rediff.com/R=
ealMedia/ads/adstream_nx.ads/www.rediffmail.com/signatureline.htm@Middle"><=
/A><table cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td><div style=3D"=
font-family: Arial, Helvetica, sans-serif; font-size:14px">Get your own <sp=
an style=3D"padding-bottom: 0px; background-color: #cc0000; padding-left: 3=
px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans-serif; color: #=
ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></span> website,  <sp=
an style=3D"padding-bottom: 0px; background-color: #c00; padding-left: 3px;=
 padding-RIGHT: 3px; font-family: Arial, Helvetica, sans-serif; color: #fff=
fff; font-size: 12px; padding-top: 0px"><b>FREE</b></span> domain &amp; <sp=
an style=3D"padding-bottom: 0px; background-color: #c00; padding-left: 3px;=
 padding-RIGHT: 3px; font-family: Arial, Helvetica, sans-serif; color: #fff=
fff; font-size: 12px; padding-top: 0px"><b>FREE</b></span> mobile app with =
Company email. &nbsp;</div></td><td><a href=3D"http://track.rediff.com/clic=
k?url=3D___http://businessemail.rediff.com/email-ids-for-companies-with-les=
s-than-50-employees?sc_cid=3Dsign-1-10-13___&cmp=3Dhost&lnk=3Dsign-1-10-13&=
nsrv1=3Dhost" style=3D"font-family: Arial, Helvetica, sans-serif; color: #f=
ff; font-size: 14px; color:#0000cc" target=3D"_blank"><b>Know More ></b></a=
><!-- <in-put type=3D"button" cl-ass=3D"button" on-click=3D"parent.location=
=3D&#39;http://track.rediff.com/click?url=3D___http://businessemail.rediff.=
com/company-email-hosting-services?sc_cid=3Dsignature-23-9-13___&amp;cmp=3D=
signature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhost&#39;" value=3D"Kn=
ow more &gt;"> </input> --></td></tr></tbody></table>

--=_4ac775a486041af8f57fc9506b151b2d--

--=_c9cb3e053f5d024ad67fc198c112486a
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream;
 name="log.do_configure.26001"; 
Content-Disposition: attachment;
 filename="log.do_configure.26001"; 

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3lzcm9vdF9jbGVhbnNzdGF0ZQpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHN5c3Jvb3RfY2xlYW5zc3RhdGUgZmluaXNoZWQKREVCVUc6IFNJ
VEUgZmlsZXMgWydlbmRpYW4tbGl0dGxlJywgJ2NvbW1vbi1saW51eCcsICdjb21tb24tZ2xpYmMn
LCAnYml0LTY0JywgJ3g4Nl82NC1saW51eCcsICdjb21tb24nXQpERUJVRzogRXhlY3V0aW5nIHNo
ZWxsIGZ1bmN0aW9uIGF1dG90b29sc19wcmVjb25maWd1cmUKREVCVUc6IFNoZWxsIGZ1bmN0aW9u
IGF1dG90b29sc19wcmVjb25maWd1cmUgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBm
dW5jdGlvbiBkb19jb25maWd1cmUKY29uZmlndXJlOiBXQVJOSU5HOiBJZiB5b3Ugd2FudGVkIHRv
IHNldCB0aGUgLS1idWlsZCB0eXBlLCBkb24ndCB1c2UgLS1ob3N0LgogICAgSWYgYSBjcm9zcyBj
b21waWxlciBpcyBkZXRlY3RlZCB0aGVuIGNyb3NzIGNvbXBpbGUgbW9kZSB3aWxsIGJlIHVzZWQu
CmNoZWNraW5nIGZvciBhIEJTRC1jb21wYXRpYmxlIGluc3RhbGwuLi4gL3Vzci9iaW4vaW5zdGFs
bCAtYwpjaGVja2luZyB3aGV0aGVyIGJ1aWxkIGVudmlyb25tZW50IGlzIHNhbmUuLi4geWVzCmNo
ZWNraW5nIGZvciBhIHRocmVhZC1zYWZlIG1rZGlyIC1wLi4uIC9iaW4vbWtkaXIgLXAKY2hlY2tp
bmcgZm9yIGdhd2suLi4gZ2F3awpjaGVja2luZyB3aGV0aGVyIG1ha2Ugc2V0cyAkKE1BS0UpLi4u
IHllcwpjaGVja2luZyBmb3IgeDg2XzY0LXBva3ktbGludXgtc3RyaXAuLi4geDg2XzY0LXBva3kt
bGludXgtc3RyaXAKY2hlY2tpbmcgd2hldGhlciB0byBlbmFibGUgbWFpbnRhaW5lci1zcGVjaWZp
YyBwb3J0aW9ucyBvZiBNYWtlZmlsZXMuLi4gbm8KY2hlY2tpbmcgZm9yIHg4Nl82NC1wb2t5LWxp
bnV4LWdjYy4uLiB4ODZfNjQtcG9reS1saW51eC1nY2MgIC1tNjQgLS1zeXNyb290PS9ob21lL3lv
Y3RvL3Bva3ktZG9yYS0xMC4wLjAvYnVpbGQvdG1wL3N5c3Jvb3RzL2dlbmVyaWN4ODYtNjQKY2hl
Y2tpbmcgZm9yIEMgY29tcGlsZXIgZGVmYXVsdCBvdXRwdXQgZmlsZSBuYW1lLi4uIGEub3V0CmNo
ZWNraW5nIHdoZXRoZXIgdGhlIEMgY29tcGlsZXIgd29ya3MuLi4geWVzCmNoZWNraW5nIHdoZXRo
ZXIgd2UgYXJlIGNyb3NzIGNvbXBpbGluZy4uLiB5ZXMKY2hlY2tpbmcgZm9yIHN1ZmZpeCBvZiBl
eGVjdXRhYmxlcy4uLiAKY2hlY2tpbmcgZm9yIHN1ZmZpeCBvZiBvYmplY3QgZmlsZXMuLi4gbwpj
aGVja2luZyB3aGV0aGVyIHdlIGFyZSB1c2luZyB0aGUgR05VIEMgY29tcGlsZXIuLi4geWVzCmNo
ZWNraW5nIHdoZXRoZXIgeDg2XzY0LXBva3ktbGludXgtZ2NjICAtbTY0IC0tc3lzcm9vdD0vaG9t
ZS95b2N0by9wb2t5LWRvcmEtMTAuMC4wL2J1aWxkL3RtcC9zeXNyb290cy9nZW5lcmljeDg2LTY0
IGFjY2VwdHMgLWcuLi4geWVzCmNoZWNraW5nIGZvciB4ODZfNjQtcG9reS1saW51eC1nY2MgIC1t
NjQgLS1zeXNyb290PS9ob21lL3lvY3RvL3Bva3ktZG9yYS0xMC4wLjAvYnVpbGQvdG1wL3N5c3Jv
b3RzL2dlbmVyaWN4ODYtNjQgb3B0aW9uIHRvIGFjY2VwdCBJU08gQzg5Li4uIG5vbmUgbmVlZGVk
CmNoZWNraW5nIGZvciBzdHlsZSBvZiBpbmNsdWRlIHVzZWQgYnkgbWFrZS4uLiBHTlUKY2hlY2tp
bmcgZGVwZW5kZW5jeSBzdHlsZSBvZiB4ODZfNjQtcG9reS1saW51eC1nY2MgIC1tNjQgLS1zeXNy
b290PS9ob21lL3lvY3RvL3Bva3ktZG9yYS0xMC4wLjAvYnVpbGQvdG1wL3N5c3Jvb3RzL2dlbmVy
aWN4ODYtNjQuLi4gZ2NjMwpjaGVja2luZyBob3cgdG8gcnVuIHRoZSBDIHByZXByb2Nlc3Nvci4u
LiB4ODZfNjQtcG9reS1saW51eC1nY2MgLUUgLS1zeXNyb290PS9ob21lL3lvY3RvL3Bva3ktZG9y
YS0xMC4wLjAvYnVpbGQvdG1wL3N5c3Jvb3RzL2dlbmVyaWN4ODYtNjQgIC1tNjQKY2hlY2tpbmcg
Zm9yIGdyZXAgdGhhdCBoYW5kbGVzIGxvbmcgbGluZXMgYW5kIC1lLi4uIC9iaW4vZ3JlcApjaGVj
a2luZyBmb3IgZWdyZXAuLi4gL2Jpbi9ncmVwIC1FCmNoZWNraW5nIGZvciBBSVguLi4gbm8KY2hl
Y2tpbmcgZm9yIEFOU0kgQyBoZWFkZXIgZmlsZXMuLi4geWVzCmNoZWNraW5nIGZvciBzeXMvdHlw
ZXMuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHN5cy9zdGF0LmguLi4geWVzCmNoZWNraW5nIGZvciBz
dGRsaWIuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHN0cmluZy5oLi4uIHllcwpjaGVja2luZyBmb3Ig
bWVtb3J5LmguLi4geWVzCmNoZWNraW5nIGZvciBzdHJpbmdzLmguLi4geWVzCmNoZWNraW5nIGZv
ciBpbnR0eXBlcy5oLi4uIHllcwpjaGVja2luZyBmb3Igc3RkaW50LmguLi4geWVzCmNoZWNraW5n
IGZvciB1bmlzdGQuaC4uLiB5ZXMKY2hlY2tpbmcgbWluaXgvY29uZmlnLmggdXNhYmlsaXR5Li4u
IG5vCmNoZWNraW5nIG1pbml4L2NvbmZpZy5oIHByZXNlbmNlLi4uIG5vCmNoZWNraW5nIGZvciBt
aW5peC9jb25maWcuaC4uLiBubwpjaGVja2luZyB3aGV0aGVyIGl0IGlzIHNhZmUgdG8gZGVmaW5l
IF9fRVhURU5TSU9OU19fLi4uIHllcwpjaGVja2luZyBmb3IgeDg2XzY0LXBva3ktbGludXgtcmFu
bGliLi4uIHg4Nl82NC1wb2t5LWxpbnV4LXJhbmxpYgpjaGVja2luZyB3aGV0aGVyIGJ5dGUgb3Jk
ZXJpbmcgaXMgYmlnZW5kaWFuLi4uIG5vCmNoZWNraW5nIGZvciBkaGNwZC5sZWFzZXMgbG9jYXRp
b24uLi4vdmFyL2RiL2RoY3BkLmxlYXNlcwpjaGVja2luZyBmb3IgZGhjcGQ2LmxlYXNlcyBsb2Nh
dGlvbi4uLi92YXIvZGIvZGhjcGQ2LmxlYXNlcwpjaGVja2luZyBmb3IgZGhjbGllbnQubGVhc2Vz
IGxvY2F0aW9uLi4uL3Zhci9kYi9kaGNsaWVudC5sZWFzZXMKY2hlY2tpbmcgZm9yIGRoY2xpZW50
Ni5sZWFzZXMgbG9jYXRpb24uLi4vdmFyL2RiL2RoY2xpZW50Ni5sZWFzZXMKY2hlY2tpbmcgZm9y
IGludDhfdC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGludDE2X3QuLi4geWVzCmNoZWNraW5nIGZvciBp
bnQzMl90Li4uIHllcwpjaGVja2luZyBmb3IgaW50NjRfdC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHVf
aW50OF90Li4uIHllcwpjaGVja2luZyBmb3IgdV9pbnQxNl90Li4uIHllcwpjaGVja2luZyBmb3Ig
dV9pbnQzMl90Li4uIHllcwpjaGVja2luZyBmb3IgdV9pbnQ2NF90Li4uIHllcwpjaGVja2luZyBp
ZmFkZHJzLmggdXNhYmlsaXR5Li4uIHllcwpjaGVja2luZyBpZmFkZHJzLmggcHJlc2VuY2UuLi4g
eWVzCmNoZWNraW5nIGZvciBpZmFkZHJzLmguLi4geWVzCmNoZWNraW5nIGxpbnV4L3R5cGVzLmgg
dXNhYmlsaXR5Li4uIHllcwpjaGVja2luZyBsaW51eC90eXBlcy5oIHByZXNlbmNlLi4uIHllcwpj
aGVja2luZyBmb3IgbGludXgvdHlwZXMuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGxpbnV4L2ZpbHRl
ci5oLi4uIHllcwpjaGVja2luZyBmb3Igc3RydWN0IGxpZm51bS4uLiBubwpjaGVja2luZyBmb3Ig
c3RydWN0IGlmX2xhZGRyY29uZi4uLiBubwpjaGVja2luZyBmb3Igc3RydWN0IGlmX2xhZGRycmVx
Li4uIG5vCmNoZWNraW5nIGZvciBHQ0Mgbm9yZXR1cm4gYXR0cmlidXRlLi4uIHllcwpjaGVja2lu
ZyBzeXMvc29ja2V0LmggdXNhYmlsaXR5Li4uIHllcwpjaGVja2luZyBzeXMvc29ja2V0LmggcHJl
c2VuY2UuLi4geWVzCmNoZWNraW5nIGZvciBzeXMvc29ja2V0LmguLi4geWVzCmNoZWNraW5nIG5l
dC9pZl9kbC5oIHVzYWJpbGl0eS4uLiBubwpjaGVja2luZyBuZXQvaWZfZGwuaCBwcmVzZW5jZS4u
LiBubwpjaGVja2luZyBmb3IgbmV0L2lmX2RsLmguLi4gbm8KY2hlY2tpbmcgbmV0L2lmNi5oIHVz
YWJpbGl0eS4uLiBubwpjaGVja2luZyBuZXQvaWY2LmggcHJlc2VuY2UuLi4gbm8KY2hlY2tpbmcg
Zm9yIG5ldC9pZjYuaC4uLiBubwpjaGVja2luZyByZWdleC5oIHVzYWJpbGl0eS4uLiB5ZXMKY2hl
Y2tpbmcgcmVnZXguaCBwcmVzZW5jZS4uLiB5ZXMKY2hlY2tpbmcgZm9yIHJlZ2V4LmguLi4geWVz
CmNoZWNraW5nIGZvciBsaWJyYXJ5IGNvbnRhaW5pbmcgc29ja2V0Li4uIG5vbmUgcmVxdWlyZWQK
Y2hlY2tpbmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyBpbmV0X250b2EuLi4gbm9uZSByZXF1aXJl
ZApjaGVja2luZyBmb3IgbGlicmFyeSBjb250YWluaW5nIGluZXRfYXRvbi4uLiBub25lIHJlcXVp
cmVkCmNoZWNraW5nIGZvciBsaWJyYXJ5IGNvbnRhaW5pbmcgcmVnY29tcC4uLiBub25lIHJlcXVp
cmVkCmNoZWNraW5nIGZvciBsaWJyYXJ5IGNvbnRhaW5pbmcgaWZfbmFtZXRvaW5kZXguLi4gbm9u
ZSByZXF1aXJlZApjaGVja2luZyBmb3IgL2Rldi9yYW5kb20uLi4gY29uZmlndXJlOiBlcnJvcjog
Y2Fubm90IGNoZWNrIGZvciBmaWxlIGV4aXN0ZW5jZSB3aGVuIGNyb3NzIGNvbXBpbGluZwpXQVJO
SU5HOiAvaG9tZS95b2N0by9wb2t5LWRvcmEtMTAuMC4wL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1w
b2t5LWxpbnV4L2RoY3AvNC4yLjUtUDEtcjEvdGVtcC9ydW4uZG9fY29uZmlndXJlLjI2MDAxOjEg
ZXhpdCAxIGZyb20KICAuL2NvbmZpZ3VyZSAtLXByZWZpeD0vdXNyIC0taG9zdD14ODZfNjQtcG9r
eS1saW51eApFUlJPUjogRnVuY3Rpb24gZmFpbGVkOiBkb19jb25maWd1cmUgKGxvZyBmaWxlIGlz
IGxvY2F0ZWQgYXQgL2hvbWUveW9jdG8vcG9reS1kb3JhLTEwLjAuMC9idWlsZC90bXAvd29yay94
ODZfNjQtcG9reS1saW51eC9kaGNwLzQuMi41LVAxLXIxL3RlbXAvbG9nLmRvX2NvbmZpZ3VyZS4y
NjAwMSkK

--=_c9cb3e053f5d024ad67fc198c112486a--
