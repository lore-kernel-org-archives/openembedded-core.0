Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UF6Th-00061T-KF
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 18:25:41 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so4010309pbc.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:message-id:references:to:x-mailer;
	bh=9xKhm2W/oSYq302jRPMOJmsXti3snyhtZ5GRqGqxSOQ=;
	b=05qbVFrkwuMj6jkIISpoxIS1DCtpe9LAGim1p+nOEHlBV+EiEHPBCqydKzG2CABYnt
	eU40RcKpMsR0mV74zi7khR+A8qGTjT9Xfx0c5V3mNUfgkrnxEVFDT7LAZ42bRISZKf9h
	8lO784gmnsCqCdxS/h4w2T0V6XuL5xEtx9fzgwbnBZlCPRtIHOJOVYqZvHe3AQQH/dxc
	NDbI2KKrkbrBB2HYBW8pwHI2cllawwKTccBeWvLxW7azVhcYV+0RyAIAiRzBZt+/IoWG
	e6hS2OAYogA058I0VcN0vB+9bzJT2GCIId4L6nrcABYpqHTWcp8MKGPyrlhHwdgjpFtP
	Fkeg==
X-Received: by 10.68.47.39 with SMTP id a7mr30252388pbn.155.1363021738582;
	Mon, 11 Mar 2013 10:08:58 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hu2sm21156170pbc.38.2013.03.11.10.08.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 10:08:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B06678A38@COSNADEXC13.usr.ingenico.loc>
Date: Mon, 11 Mar 2013 10:08:54 -0700
Message-Id: <59639B8B-8AA2-4D94-A3C3-7721534DFFC5@gmail.com>
References: <8672BB614B4CCA40A6B3BDD6FD82050B06678A38@COSNADEXC13.usr.ingenico.loc>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
X-Mailer: Apple Mail (2.1499)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Libtool & external toolchain & .la files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 17:25:51 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7D547D0F-8D3F-4E4D-980D-A7A410C4EA41"

--Apple-Mail=_7D547D0F-8D3F-4E4D-980D-A7A410C4EA41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Mar 11, 2013, at 3:32 AM, Matthieu CRAPET =
<Matthieu.CRAPET@ingenico.com> wrote:

> Dear all,
> =20
> I have some issue regarding  Libtool and my external toolchain =
(located in /opt)
> I've created a basic C++ (STL) library using autotools.
> =20
> My configure.ac is very simple:
> <code>
> AC_PREREQ([2.60])
> AC_INIT([exemple], [1.2.3], [test@exemple.org])
> =20
> AC_CONFIG_SRCDIR([Makefile.am])
> AC_CANONICAL_HOST
> =20
> AC_CONFIG_MACRO_DIR([m4])
> AM_INIT_AUTOMAKE([foreign])
> =20
> LT_PREREQ([2.4])
> LT_INIT
> =20
> dnl Check for progs
> AC_PROG_CXX
> =20
> AC_SUBST([LIBEXEMPLE_SO_VERSION], [1:2:3])
> =20
> AC_OUTPUT([
>     Makefile
> ])
> </code>
> =20
> Then I've made a basic OE recipe to build it:
> =20
> <code>
> SUMMARY =3D "Libtool simple exemple"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "\
>                =
file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>                =
file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420=
 \
> "
> =20
> PR =3D "r1"
> =20
> SRC_URI =3D "git://xx.xx.xx.xx/libexemple.git"
> SRCREV =3D "HEAD"
> S =3D "${WORKDIR}/git"
> =20
> inherit autotools
> </code>
> =20
> Works fine but resulting .la files (in libexemple-dev package) =
contains:
> =20
> dependency_libs=3D'/opt/...-linux-gnueabi/lib/libstdc++.la'


somewhere I think lib tool is not honoring the sys root. Figure that =
out.

> =20
> This is bad because if another program (using libtool) depends on =
libexample, libtool will search
> libstdc++ in =
"${STAGING_DIR_HOST}/opt/...-linux-gnueabi/lib/libstdc++.la" (instead of =
"${STAGING_DIR_HOST}/lib/libstdc++.la").
> I would like that dependency_libs points to openembedded sysroot.
> =20
> Note: Toolchain's .la files located in ${STAGING_DIR_HOST} are correct =
(and not referencing /opt).
> =20
> I am wondering what is the best workaround for this. For now I=92ve =
patched my recipe:
> =20
> <code>
> do_compile_prepend () {
>                 cd ${S}
>                 sed -i -e  =
'/^compiler_lib_search_dirs=3D/s/.*/compiler_lib_search_dirs=3D""/' =
${HOST_SYS}-libtool
>                 sed -i -e  =
'/^compiler_lib_search_path=3D/s/.*/compiler_lib_search_path=3D""/' =
${HOST_SYS}-libtool
>                 sed -i -e  =
'/^sys_lib_search_path_spec=3D/s/.*/sys_lib_search_path_spec=3D""/' =
${HOST_SYS}-libtool
> }
> </code>
> =20
> Ugly but works because libstdc++ can be found (using --sysroot =
argument). But "dependency_libs" is empty is .la file.
> =20
> In real life: this is libglu and glew.
> =20
> Regards,
> Matthieu Crapet
> PS: "exemple" is french word for "example" ;)
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_7D547D0F-8D3F-4E4D-980D-A7A410C4EA41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"><base href=3D"x-msg://1221/"></head><body =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><br><div><div>On Mar 11, 2013, =
at 3:32 AM, Matthieu CRAPET &lt;<a =
href=3D"mailto:Matthieu.CRAPET@ingenico.com">Matthieu.CRAPET@ingenico.com<=
/a>&gt; wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div lang=3D"FR" link=3D"blue" vlink=3D"purple" =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
"><div class=3D"WordSection1" style=3D"page: WordSection1; "><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">Dear =
all,<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">I have some issue regarding &nbsp;Libtool and my external =
toolchain (located in /opt)<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">I've created a basic C++ (STL) library using =
autotools.<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">My configure.ac is very =
simple:<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; =
">&lt;code&gt;<o:p></o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; =
">AC_PREREQ([2.60])<o:p></o:p></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
">AC_INIT([exemple], [1.2.3], [<a href=3D"mailto:test@exemple.org" =
style=3D"color: purple; text-decoration: underline; =
">test@exemple.org</a>])<o:p></o:p></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><o:p>&nbsp;</o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">AC_CONFIG_SRCDIR([Makefile.am])<o:p></o:p></span></div><div=
 style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">AC_CANONICAL_HOST<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">&nbsp;</span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">AC_CONFIG_MACRO_DIR([m4])<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">AM_INIT_AUTOMAKE([foreign])<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">&nbsp;</span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">LT_PREREQ([2.4])<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">LT_INIT<o:p></o:p></span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">dnl Check for progs<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">AC_PROG_CXX<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">AC_SUBST([LIBEXEMPLE_SO_VERSION], =
[1:2:3])<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">AC_OUTPUT([<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; =
Makefile<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">])<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&lt;/code&gt;<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">Then I've made a basic OE recipe to build =
it:<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&lt;code&gt;<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">SUMMARY =3D "Libtool simple =
exemple"<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">LICENSE =3D "MIT"<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">LIC_FILES_CHKSUM =3D =
"\<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58=
" style=3D"color: purple; text-decoration: underline; =
">file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58</a><sp=
an =
class=3D"Apple-converted-space">&nbsp;</span>\<o:p></o:p></span></div><div=
 style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361=
b4de20420" style=3D"color: purple; text-decoration: underline; =
">file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20</a><span =
class=3D"Apple-converted-space">&nbsp;</span>\<o:p></o:p></span></div><div=
 style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; ">"<o:p></o:p></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><o:p>&nbsp;</o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; ">PR =3D =
"r1"<o:p></o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><o:p>&nbsp;</o:p></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; ">SRC_URI =3D "<a =
href=3D"git://xx.xx.xx.xx/libexemple.git" style=3D"color: purple; =
text-decoration: underline; =
">git://xx.xx.xx.xx/libexemple.git</a>"<o:p></o:p></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">SRCREV =3D =
"HEAD"<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">S =3D "${WORKDIR}/git"<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">&nbsp;</span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">inherit =
autotools<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&lt;/code&gt;<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">Works fine but resulting .la files (in libexemple-dev =
package) contains:<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">dependency_libs=3D'/opt/...-linux-gnueabi/lib/libstdc++.la'=
</span></div></div></div></blockquote><div><br></div><div><br></div><div>s=
omewhere I think lib tool is not honoring the sys root. Figure that =
out.</div><br><blockquote type=3D"cite"><div lang=3D"FR" link=3D"blue" =
vlink=3D"purple" style=3D"font-family: Helvetica; font-size: medium; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; "><div class=3D"WordSection1" =
style=3D"page: WordSection1; "><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB"><o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">This is bad because if another program (using libtool) =
depends on libexample, libtool will search<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">libstdc++ in =
"${STAGING_DIR_HOST}/opt/...-linux-gnueabi/lib/libstdc++.la" (instead of =
"${STAGING_DIR_HOST}/lib/libstdc++.la").<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-GB">I would like that =
dependency_libs points to openembedded =
sysroot.<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">Note: Toolchain's .la files located in =
${STAGING_DIR_HOST} are correct (and not referencing =
/opt).<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">I am wondering what is the best workaround for this. For =
now I=92ve patched my recipe:<o:p></o:p></span></div><div style=3D"margin:=
 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&lt;code&gt;<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">do_compile_prepend () =
{<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e&nbsp; =
'/^compiler_lib_search_dirs=3D/s/.*/compiler_lib_search_dirs=3D""/' =
${HOST_SYS}-libtool<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e&nbsp; =
'/^compiler_lib_search_path=3D/s/.*/compiler_lib_search_path=3D""/' =
${HOST_SYS}-libtool<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e&nbsp; =
'/^sys_lib_search_path_spec=3D/s/.*/sys_lib_search_path_spec=3D""/' =
${HOST_SYS}-libtool<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">}<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&lt;/code&gt;<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
"><span lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">Ugly but works because libstdc++ can be found (using =
--sysroot argument). But "dependency_libs" is empty is .la =
file.<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">In real life: this is libglu and =
glew.<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-GB">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; =
">Regards,<o:p></o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; ">Matthieu =
Crapet<o:p></o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; =
"><o:p></o:p></div><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-GB">PS: =
"exemple" is french word for "example" =
;)<o:p></o:p></span></div></div>__________________________________________=
_____<br>Openembedded-core mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" style=3D"color: =
purple; text-decoration: underline; =
">Openembedded-core@lists.openembedded.org</a><br><a =
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore" style=3D"color: purple; text-decoration: underline; =
">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a=
><br></div></blockquote></div><br></body></html>=

--Apple-Mail=_7D547D0F-8D3F-4E4D-980D-A7A410C4EA41--
