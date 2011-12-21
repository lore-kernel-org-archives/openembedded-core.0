Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mdbasith87@gmail.com>) id 1RdIu5-000167-24
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 10:56:05 +0100
Received: by wgbds11 with SMTP id ds11so11859932wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 01:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4EVoaBK24Zge1q8tP6e3qbU/I5ZDAHv34RVJXzlMh5I=;
	b=PLNV9p/ow/eTOG8XiG8IT+0BanyXvyCeVZE1pM2zbhOAzCUuzVCYGk89qBv5U4Wmtc
	i5JmQ7ZZXUr0cDd6681aXhZlWCuYMqTILZBZz/Mi4l2PFgYcWTsu1KZaGPXBZnB7QzLj
	Q67O+tAzhSC1MGRlat9GYCX/Xx213YijHgDbY=
MIME-Version: 1.0
Received: by 10.227.207.206 with SMTP id fz14mr5633061wbb.7.1324460940345;
	Wed, 21 Dec 2011 01:49:00 -0800 (PST)
Received: by 10.223.2.208 with HTTP; Wed, 21 Dec 2011 01:49:00 -0800 (PST)
Date: Wed, 21 Dec 2011 04:49:00 -0500
Message-ID: <CAE=MDVN_3QBq_tr=-xfSrJr-5u4-azhrWytzpugzr+nzcxkJ_g@mail.gmail.com>
From: mohamed basith <mdbasith87@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Architecture mismatch QA issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2011 09:56:05 -0000
Content-Type: multipart/alternative; boundary=0015175d094cde41ff04b497179f

--0015175d094cde41ff04b497179f
Content-Type: text/plain; charset=ISO-8859-1

Hi,

 I got the error when compiling Qt, pls help me to fix this error.

| NOTE: Checking Package: libqt-embeddedpvrqwswsegl4-dbg
| NOTE: Checking Package: qt4-embedded-tools
| ERROR: QA Issue: Architecture did not match (40 to 3) on
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-split/qt4-embedded-tools/usr/bin/rcc
| ERROR: QA Issue: Architecture did not match (40 to 3) on
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-split/qt4-embedded-tools/usr/bin/moc
| ERROR: QA Issue: Architecture did not match (40 to 3) on
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-split/qt4-embedded-tools/usr/bin/uic
| NOTE: Checking Package: qt4-embedded-assistant
| NOTE: Checking Package: qt4-embedded-common
| NOTE: Checking Package: qt4-embedded-dbus
| NOTE: Checking Package: qt4-embedded-demos
| NOTE: Checking Package: qt4-embedded-designer
| NOTE: Checking Package: qt4-embedded-examples
| NOTE: Checking Package: qt4-embedded-fonts
| NOTE: Checking Package: qt4-embedded-fonts-ttf-vera
| NOTE: Checking Package: qt4-embedded-fonts-ttf-dejavu
| NOTE: Checking Package: qt4-embedded-fonts-pfa
| NOTE: Checking Package: qt4-embedded-fonts-pfb
| NOTE: Checking Package: qt4-embedded-fonts-qpf
| NOTE: Checking Package: qt4-embedded-linguist
| NOTE: Checking Package: qt4-embedded-makeqpf
| NOTE: Checking Package: qt4-embedded-mkspecs
| NOTE: Checking Package: qt4-embedded-pixeltool
| NOTE: Checking Package: qt4-embedded-qmlviewer
| NOTE: Checking Package: qt4-embedded-xmlpatterns
| NOTE: Checking Package: qt4-embedded-qt3to4
| NOTE: Checking Package: qt4-embedded-qml-plugins
| NOTE: Checking Package: qt4-embedded-conf
| NOTE: Checking Package: qt4-embedded-translation-qvfb
| NOTE: Checking Package: qt4-embedded-translation-designer
| NOTE: Checking Package: qt4-embedded-translation-qt
| NOTE: Checking Package: qt4-embedded-translation-linguist
| NOTE: Checking Package: qt4-embedded-translation-assistant
| NOTE: Checking Package: qt4-embedded-translation-qtconfig
| NOTE: Checking Package: qt4-embedded-phrasebook-german
| NOTE: Checking Package: qt4-embedded-phrasebook-spanish
| NOTE: Checking Package: qt4-embedded-phrasebook-italian
| NOTE: Checking Package: qt4-embedded-phrasebook-russian
| NOTE: Checking Package: qt4-embedded-phrasebook-norwegian
| NOTE: Checking Package: qt4-embedded-phrasebook-polish
| NOTE: Checking Package: qt4-embedded-phrasebook-finnish
| NOTE: Checking Package: qt4-embedded-phrasebook-french
| NOTE: Checking Package: qt4-embedded-phrasebook-danish
| NOTE: Checking Package: qt4-embedded-phrasebook-dutch
| NOTE: Checking Package: qt4-embedded-phrasebook-hungarian
| NOTE: Checking Package: qt4-embedded-phrasebook-swedish
| NOTE: Checking Package: qt4-embedded-phrasebook-japanese
| NOTE: Checking Package: qt4-embedded-plugin-designer-qwebview
| NOTE: Checking Package: qt4-embedded-plugin-designer-phononwidgets
| NOTE: Checking Package: qt4-embedded-plugin-designer-worldtimeclockplugin
| NOTE: Checking Package: qt4-embedded-plugin-designer-qt3supportwidgets
| NOTE: Checking Package: qt4-embedded-plugin-designer-containerextension
| NOTE: Checking Package: qt4-embedded-plugin-designer-taskmenuextension
| NOTE: Checking Package: qt4-embedded-plugin-designer-qdeclarativeview
| NOTE: Checking Package: qt4-embedded-plugin-designer-customwidgetplugin
| NOTE: Checking Package: qt4-embedded-plugin-designer-qwebview-dbg
| NOTE: Checking Package: qt4-embedded-plugin-designer-phononwidgets-dbg
| NOTE: Checking Package:
qt4-embedded-plugin-designer-worldtimeclockplugin-dbg
| NOTE: Checking Package: qt4-embedded-plugin-designer-qt3supportwidgets-dbg
| NOTE: Checking Package:
qt4-embedded-plugin-designer-containerextension-dbg
| NOTE: Checking Package: qt4-embedded-plugin-designer-taskmenuextension-dbg
| NOTE: Checking Package: qt4-embedded-plugin-designer-qdeclarativeview-dbg
| NOTE: Checking Package:
qt4-embedded-plugin-designer-customwidgetplugin-dbg
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gfxvnc
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-screenvfb
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gfxtransformed
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-directfbscreen
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gfxvnc-dbg
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-screenvfb-dbg
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gfxtransformed-dbg
| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-directfbscreen-dbg
| NOTE: Checking Package: qt4-embedded-plugin-mousedriver-tslib
| NOTE: Checking Package: qt4-embedded-plugin-mousedriver-tslib-dbg
| NOTE: Checking Package: qt4-embedded-plugin-iconengine-svgicon
| NOTE: Checking Package: qt4-embedded-plugin-iconengine-svgicon-dbg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-gif
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-tiff
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-mng
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-svg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-jpeg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-ico
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-gif-dbg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-tiff-dbg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-mng-dbg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-svg-dbg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-jpeg-dbg
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-ico-dbg
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlmysql
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlpsql
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite2
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlmysql-dbg
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite-dbg
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlpsql-dbg
| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite2-dbg
| NOTE: Checking Package: qt4-embedded-plugin-script-dbus
| NOTE: Checking Package: qt4-embedded-plugin-script-dbus-dbg
| NOTE: Checking Package: qt4-embedded-plugin-phonon-backend-gstreamer
| NOTE: Checking Package: qt4-embedded-plugin-phonon-backend-gstreamer-dbg
| NOTE: Checking Package: qt4-embedded-plugin-bearer-nm
| NOTE: Checking Package: qt4-embedded-plugin-bearer-generic
| NOTE: Checking Package: qt4-embedded-plugin-bearer-connman
| NOTE: Checking Package: qt4-embedded-plugin-bearer-nm-dbg
| NOTE: Checking Package: qt4-embedded-plugin-bearer-generic-dbg
| NOTE: Checking Package: qt4-embedded-plugin-bearer-connman-dbg
| ERROR: QA run found fatal errors. Please consider fixing them.
| ERROR: Function 'do_package_qa' failed
NOTE: package qt4-embedded-4.7.4-r39.5: task do_package: Failed
ERROR: Task 618
(/media/Working/angstrom/sources/openembedded-core/meta/recipes-qt/qt4/
qt4-embedded_4.7.4.bb, do_package) failed with exit code '1'
ERROR:
'/media/Working/angstrom/sources/openembedded-core/meta/recipes-qt/qt4/
qt4-embedded_4.7.4.bb' failed


Regards,
Basith

--0015175d094cde41ff04b497179f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family:arial,sans-serif;font=
-size:10px;border-collapse:collapse;color:rgb(34,34,34)"><font face=3D"sans=
-serif" size=3D"3"><span style=3D"border-collapse:collapse;font-size:13px;l=
ine-height:19px">Hi,</span></font><div>
<font face=3D"sans-serif" size=3D"3"><span style=3D"border-collapse:collaps=
e;font-size:13px;line-height:19px"><br></span></font><div><font face=3D"san=
s-serif" size=3D"3"><span style=3D"border-collapse:collapse;font-size:13px;=
line-height:19px">=A0I got the error when compiling Qt, pls help me to fix =
this error.</span></font></div>
<div><font face=3D"sans-serif" size=3D"3"><span style=3D"border-collapse:co=
llapse;font-size:13px;line-height:19px"><br></span></font></div><div><font =
face=3D"sans-serif" size=3D"3"><span style=3D"border-collapse:collapse;font=
-size:13px;line-height:19px"><div>
<div>| NOTE: Checking Package: libqt-embeddedpvrqwswsegl4-dbg</div><div>| N=
OTE: Checking Package: qt4-embedded-tools</div><div>| ERROR: QA Issue: Arch=
itecture did not match (40 to 3) on /work/armv5te-angstrom-linux-gnueabi/qt=
4-embedded-4.7.4-r39.5/packages-split/qt4-embedded-tools/usr/bin/rcc</div>
<div>| ERROR: QA Issue: Architecture did not match (40 to 3) on /work/armv5=
te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-split/qt4-embed=
ded-tools/usr/bin/moc</div><div>| ERROR: QA Issue: Architecture did not mat=
ch (40 to 3) on /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39=
.5/packages-split/qt4-embedded-tools/usr/bin/uic</div>
<div>| NOTE: Checking Package: qt4-embedded-assistant</div><div>| NOTE: Che=
cking Package: qt4-embedded-common</div><div>| NOTE: Checking Package: qt4-=
embedded-dbus</div><div>| NOTE: Checking Package: qt4-embedded-demos</div>
<div>| NOTE: Checking Package: qt4-embedded-designer</div><div>| NOTE: Chec=
king Package: qt4-embedded-examples</div><div>| NOTE: Checking Package: qt4=
-embedded-fonts</div><div>| NOTE: Checking Package: qt4-embedded-fonts-ttf-=
vera</div>
<div>| NOTE: Checking Package: qt4-embedded-fonts-ttf-dejavu</div><div>| NO=
TE: Checking Package: qt4-embedded-fonts-pfa</div><div>| NOTE: Checking Pac=
kage: qt4-embedded-fonts-pfb</div><div>| NOTE: Checking Package: qt4-embedd=
ed-fonts-qpf</div>
<div>| NOTE: Checking Package: qt4-embedded-linguist</div><div>| NOTE: Chec=
king Package: qt4-embedded-makeqpf</div><div>| NOTE: Checking Package: qt4-=
embedded-mkspecs</div><div>| NOTE: Checking Package: qt4-embedded-pixeltool=
</div>
<div>| NOTE: Checking Package: qt4-embedded-qmlviewer</div><div>| NOTE: Che=
cking Package: qt4-embedded-xmlpatterns</div><div>| NOTE: Checking Package:=
 qt4-embedded-qt3to4</div><div>| NOTE: Checking Package: qt4-embedded-qml-p=
lugins</div>
<div>| NOTE: Checking Package: qt4-embedded-conf</div><div>| NOTE: Checking=
 Package: qt4-embedded-translation-qvfb</div><div>| NOTE: Checking Package:=
 qt4-embedded-translation-designer</div><div>| NOTE: Checking Package: qt4-=
embedded-translation-qt</div>
<div>| NOTE: Checking Package: qt4-embedded-translation-linguist</div><div>=
| NOTE: Checking Package: qt4-embedded-translation-assistant</div><div>| NO=
TE: Checking Package: qt4-embedded-translation-qtconfig</div><div>| NOTE: C=
hecking Package: qt4-embedded-phrasebook-german</div>
<div>| NOTE: Checking Package: qt4-embedded-phrasebook-spanish</div><div>| =
NOTE: Checking Package: qt4-embedded-phrasebook-italian</div><div>| NOTE: C=
hecking Package: qt4-embedded-phrasebook-russian</div><div>| NOTE: Checking=
 Package: qt4-embedded-phrasebook-norwegian</div>
<div>| NOTE: Checking Package: qt4-embedded-phrasebook-polish</div><div>| N=
OTE: Checking Package: qt4-embedded-phrasebook-finnish</div><div>| NOTE: Ch=
ecking Package: qt4-embedded-phrasebook-french</div><div>| NOTE: Checking P=
ackage: qt4-embedded-phrasebook-danish</div>
<div>| NOTE: Checking Package: qt4-embedded-phrasebook-dutch</div><div>| NO=
TE: Checking Package: qt4-embedded-phrasebook-hungarian</div><div>| NOTE: C=
hecking Package: qt4-embedded-phrasebook-swedish</div><div>| NOTE: Checking=
 Package: qt4-embedded-phrasebook-japanese</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-designer-qwebview</div><=
div>| NOTE: Checking Package: qt4-embedded-plugin-designer-phononwidgets</d=
iv><div>| NOTE: Checking Package: qt4-embedded-plugin-designer-worldtimeclo=
ckplugin</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-designer-qt3supportwidge=
ts</div><div>| NOTE: Checking Package: qt4-embedded-plugin-designer-contain=
erextension</div><div>| NOTE: Checking Package: qt4-embedded-plugin-designe=
r-taskmenuextension</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-designer-qdeclarativevie=
w</div><div>| NOTE: Checking Package: qt4-embedded-plugin-designer-customwi=
dgetplugin</div><div>| NOTE: Checking Package: qt4-embedded-plugin-designer=
-qwebview-dbg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-designer-phononwidgets-d=
bg</div><div>| NOTE: Checking Package: qt4-embedded-plugin-designer-worldti=
meclockplugin-dbg</div><div>| NOTE: Checking Package: qt4-embedded-plugin-d=
esigner-qt3supportwidgets-dbg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-designer-containerextens=
ion-dbg</div><div>| NOTE: Checking Package: qt4-embedded-plugin-designer-ta=
skmenuextension-dbg</div><div>| NOTE: Checking Package: qt4-embedded-plugin=
-designer-qdeclarativeview-dbg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-designer-customwidgetplu=
gin-dbg</div><div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-g=
fxvnc</div><div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-scr=
eenvfb</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gfxtransformed=
</div><div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-directfb=
screen</div><div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gf=
xvnc-dbg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-screenvfb-dbg<=
/div><div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver-gfxtransf=
ormed-dbg</div><div>| NOTE: Checking Package: qt4-embedded-plugin-gfxdriver=
-directfbscreen-dbg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-mousedriver-tslib</div><=
div>| NOTE: Checking Package: qt4-embedded-plugin-mousedriver-tslib-dbg</di=
v><div>| NOTE: Checking Package: qt4-embedded-plugin-iconengine-svgicon</di=
v>
<div>| NOTE: Checking Package: qt4-embedded-plugin-iconengine-svgicon-dbg</=
div><div>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-gif</div=
><div>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-tiff</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-mng</div><di=
v>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-svg</div><div>|=
 NOTE: Checking Package: qt4-embedded-plugin-imageformat-jpeg</div><div>
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-ico</div><div>| N=
OTE: Checking Package: qt4-embedded-plugin-imageformat-gif-dbg</div><div>| =
NOTE: Checking Package: qt4-embedded-plugin-imageformat-tiff-dbg</div><div>
| NOTE: Checking Package: qt4-embedded-plugin-imageformat-mng-dbg</div><div=
>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-svg-dbg</div><di=
v>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-jpeg-dbg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-imageformat-ico-dbg</div=
><div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlmysql</div=
><div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlpsql</div><=
div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite2</div><d=
iv>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlmysql-dbg</di=
v>
<div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite-dbg</di=
v><div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlpsql-dbg<=
/div><div>| NOTE: Checking Package: qt4-embedded-plugin-sqldriver-sqlite2-d=
bg</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-script-dbus</div><div>| =
NOTE: Checking Package: qt4-embedded-plugin-script-dbus-dbg</div><div>| NOT=
E: Checking Package: qt4-embedded-plugin-phonon-backend-gstreamer</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-phonon-backend-gstreamer=
-dbg</div><div>| NOTE: Checking Package: qt4-embedded-plugin-bearer-nm</div=
><div>| NOTE: Checking Package: qt4-embedded-plugin-bearer-generic</div>
<div>| NOTE: Checking Package: qt4-embedded-plugin-bearer-connman</div><div=
>| NOTE: Checking Package: qt4-embedded-plugin-bearer-nm-dbg</div><div>| NO=
TE: Checking Package: qt4-embedded-plugin-bearer-generic-dbg</div><div>
| NOTE: Checking Package: qt4-embedded-plugin-bearer-connman-dbg</div><div>=
| ERROR: QA run found fatal errors. Please consider fixing them.</div><div>=
| ERROR: Function &#39;do_package_qa&#39; failed</div><div>NOTE: package qt=
4-embedded-4.7.4-r39.5: task do_package: Failed</div>
<div>ERROR: Task 618 (/media/Working/angstrom/sources/openembedded-core/met=
a/recipes-qt/qt4/<a href=3D"http://qt4-embedded_4.7.4.bb" target=3D"_blank"=
 style=3D"color:rgb(17,85,204)">qt4-embedded_4.7.4.bb</a>, do_package) fail=
ed with exit code &#39;1&#39;</div>
<div>ERROR: &#39;/media/Working/angstrom/sources/openembedded-core/meta/rec=
ipes-qt/qt4/<a href=3D"http://qt4-embedded_4.7.4.bb" target=3D"_blank" styl=
e=3D"color:rgb(17,85,204)">qt4-embedded_4.7.4.bb</a>&#39; failed</div></div=
><div>
<br></div><div><br></div><div>Regards,</div><div>Basith</div></span></font>=
</div></div></span>

--0015175d094cde41ff04b497179f--
