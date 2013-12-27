Return-Path: <david.good1@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B777960E1E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 00:27:22 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so13848903wib.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2013 16:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=v18zFRrA/ZlM51nz4OVYfuv7XZAAQPUwW3udIEznVOs=;
	b=qSqJs41TkDTGsDf0kEsus2JiS/Gs2YUjQaCVcaxHXWc7gzT5mh5rJ4ZLfDFRu5iOM7
	slsKZ+L/yaylignxF+kghFow1NwjEAi++REy+3uWcEjoSCkzyX3dR4wIobLbcq4hgAaf
	mpj88/Jtwisz90X+2G3QFddCjqG1PZMol9FN+IXy+979ct9v9jUqmMNiElsg3NxbNhFO
	ywNCbxsFTA5ZwVY0ERi0lNH+ufd1oN4BI2BlE4IcO0zDQ0Keq3JHwHVxzGpn9wfhx51I
	ytHuqjZckTuAf6Igo/CC/ZlK6c26XjmV5LrF8797QugYTCJzqiSIE42bC0uQ9O4CXJkJ
	XXKw==
X-Received: by 10.180.206.11 with SMTP id lk11mr31122512wic.16.1388104043306; 
	Thu, 26 Dec 2013 16:27:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.171.202 with HTTP; Thu, 26 Dec 2013 16:27:03 -0800 (PST)
From: David Good <david.good1@gmail.com>
Date: Thu, 26 Dec 2013 18:27:03 -0600
Message-ID: <CALMFhSxzi2HUDObDudmq6VDxxdDMhMCjBmj3w6p2v11dzwpDVQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: tdom recipe
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
X-List-Received-Date: Fri, 27 Dec 2013 00:27:23 -0000
Content-Type: multipart/alternative; boundary=001a11c37c1069a7e104ee792800

--001a11c37c1069a7e104ee792800
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I've created a recipe which I would like to add to OpenEmbedded: tDOM.

How do I submit a recipe for approval?

--David

DESCRIPTION = "XML data processing in Tcl"
LICENSE = "MPL-1"
SECTION = "devel/tcltk"
HOMEPAGE = "http://tdom.github.io/"
DEPENDS = "tcl-native"
LIC_FILES_CHKSUM = "file://../LICENSE;md5=
4673aaff544d4c9b9a521cb8e0860bfb"
PR = "r0"

SRC_URI = "git://github.com/tDOM/tdom.git;protocol=git;tag=master"

S = "${WORKDIR}/git/unix"

inherit autotools

FILES_${PN} += "${libdir}/tdom0.8.3/"

CONFIGUREOPTS = " \
             --build=${BUILD_SYS} \
         --host=${HOST_SYS} \
             --target=${TARGET_SYS} \
"
EXTRA_OECONF = " \
             --with-tcl=${STAGING_BINDIR_CROSS} \
             --with-tclinclude=${STAGING_INCDIR} \
             "

do_configure() {
        oe_runconf
}

oe_runconf () {
    cfgscript="${S}/../configure"
    if [ -x "$cfgscript" ] ; then
        bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
        set +e
        ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF}
"$@"
        if [ "$?" != "0" ]; then
            echo "Configure failed. The contents of all config.log files
follows to aid debugging"
            find ${S} -name config.log -print -exec cat {} \;
            bbfatal "oe_runconf failed"
        fi
        set -e
    else
        bbfatal "no configure script found at $cfgscript"
    fi
}

--001a11c37c1069a7e104ee792800
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I&#39;ve created a recipe which I would like=
 to add to OpenEmbedded: tDOM.<br><br>How do I submit a recipe for approval=
?<br><br>--David<br><br>DESCRIPTION =3D &quot;XML data processing in Tcl&qu=
ot;<br>



LICENSE =3D &quot;MPL-1&quot;<br>SECTION =3D &quot;devel/tcltk&quot;<br>HOM=
EPAGE =3D &quot;<a href=3D"http://tdom.github.io/" target=3D"_blank">http:/=
/tdom.github.io/</a>&quot;<br>DEPENDS =3D &quot;tcl-native&quot;<br>LIC_FIL=
ES_CHKSUM =3D &quot;file://../LICENSE;md5=3D<div>

4673aaff544d4c9b9a521cb8e0860bfb&quot;<br>

PR =3D &quot;r0&quot;<br><br>SRC_URI =3D &quot;git://<a href=3D"http://gith=
ub.com/tDOM/tdom.git;protocol=3Dgit;tag=3Dmaster" target=3D"_blank">github.=
com/tDOM/tdom.git;protocol=3Dgit;tag=3Dmaster</a>&quot;<br><br>S =3D &quot;=
${WORKDIR}/git/unix&quot;<br>


<br>
inherit autotools<br><br>FILES_${PN} +=3D &quot;${libdir}/tdom0.8.3/&quot;<=
br><br>CONFIGUREOPTS =3D &quot; \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -=
-build=3D${BUILD_SYS} \<br>=A0=A0=A0 =A0=A0=A0=A0 --host=3D${HOST_SYS} \<br=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --target=3D${TARGET_SYS} \<br>



&quot;<br>EXTRA_OECONF =3D &quot; \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 --with-tcl=3D${STAGING_BINDIR_CROSS} \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 --with-tclinclude=3D${STAGING_INCDIR} \<br>=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 &quot;<br><br>do_configure() {<br>=A0=A0=A0=A0=A0=A0=A0 oe_run=
conf<br>}<br><br>



oe_runconf () {<br>=A0=A0=A0 cfgscript=3D&quot;${S}/../configure&quot;<br>=
=A0=A0=A0 if [ -x &quot;$cfgscript&quot; ] ; then<br>=A0=A0=A0 =A0=A0=A0 bb=
note &quot;Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@&quot;<br>=
=A0=A0=A0 =A0=A0=A0 set +e<br>=A0=A0=A0 =A0=A0=A0 ${CACHED_CONFIGUREVARS} $=
cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} &quot;$@&quot;<br>



=A0=A0=A0 =A0=A0=A0 if [ &quot;$?&quot; !=3D &quot;0&quot; ]; then<br>=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 echo &quot;Configure failed. The contents of all=
 config.log files follows to aid debugging&quot;<br>=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 find ${S} -name config.log -print -exec cat {} \;<br>



=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bbfatal &quot;oe_runconf failed&quot;<br>=A0=
=A0=A0 =A0=A0=A0 fi<br>=A0=A0=A0 =A0=A0=A0 set -e<br>=A0=A0=A0 else<br>=A0=
=A0=A0 =A0=A0=A0 bbfatal &quot;no configure script found at $cfgscript&quot=
;<br>=A0=A0=A0 fi<br>}</div></div>

--001a11c37c1069a7e104ee792800--
