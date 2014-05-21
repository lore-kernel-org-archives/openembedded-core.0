Return-Path: <sujith.h@gmail.com>
X-Greylist: delayed 1432 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 May 2014 13:13:14 UTC
Received: from mail-qg0-f48.google.com (unknown [209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5812A65EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 13:13:13 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so3092832qgf.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=ZpfrPDMghkQvGyD7nnBzth3lUh0VoJy8Ur/4ihk/3G0=;
	b=yU3Wj1HHRkZIntReLfrcfeLhoSWrf1P4yrsUp6V69Ty55LrO6wGtK8IFVkd0nEcCFZ
	I8scHymCfxWXJCKg0mwutmKKTsQjehLzXCBsW2raux7P8jiDqazh5Utop+liEL6L0G2o
	Mz4oDza95bjhBEzgviaz2f+4ivQ+16CrNR9AHSHeL4BEd+V8+rl+3dqZMnvM28tYGN/Y
	M9xBH1YDVaO0nSHmDu/OHpoMRSg0iQ0k9PSnBY1/UolNRqhfnaAZvfcUXbRutTpz1seD
	NJDd6N33qUfq6QoWcRVsxHrkMpIatK0pu/+cVVHFpwl1k3gv6rQfNYM6qOCNTpxLk0md
	ee/g==
X-Received: by 10.140.20.144 with SMTP id 16mr3007102qgj.114.1400676562637;
	Wed, 21 May 2014 05:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.52 with HTTP; Wed, 21 May 2014 05:49:02 -0700 (PDT)
From: sujith h <sujith.h@gmail.com>
Date: Wed, 21 May 2014 18:19:02 +0530
Message-ID: <CADyYWL=XuegRtbJsdOZv11Fbi6UQy1_TdpLPzWkijEvuL6=beg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-qt5] Warnings while building Qt recipes
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
X-List-Received-Date: Wed, 21 May 2014 13:13:20 -0000
Content-Type: multipart/alternative; boundary=001a11c12632f6181804f9e86c63

--001a11c12632f6181804f9e86c63
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

While building qtbase, qtsensors, qtmultimedia, qtquick1 etc I was getting
lot of warnings. Below is the warning messages I were gtting:

WARNING: QA Issue: qtbase-examples-dev: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/echoplugin/plugin/libechoplugin.so
qtbase-examples-dev: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/plugandpaint/plugins/libpnp_extrafilt=
ers.so
qtbase-examples-dev: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/styleplugin/styles/libsimplestyleplug=
in.so
qtbase-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/echoplugin/plugin/.debug/libechoplugi=
n.so
qtbase-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/plugandpaint/plugins/.debug/libpnp_ex=
trafilters.so
qtbase-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/widgets/tools/styleplugin/styles/.debug/libsimplest=
yleplugin.so
WARNING: QA Issue: qtdeclarative-examples-dev: found library in wrong
location:
/usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/libqmlq=
timeexampleplugin.so
qtdeclarative-examples-dev: found library in wrong location:
/usr/share/qt5/examples/quick/customitems/painteditem/TextBalloonPlugin/lib=
qmltextballoonplugin.so
qtdeclarative-examples-dev: found library in wrong location:
/usr/share/qt5/examples/quick/imageprovider/ImageProviderCore/libqmlimagepr=
oviderplugin.so
qtdeclarative-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/.debug/=
libqmlqtimeexampleplugin.so
qtdeclarative-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/quick/customitems/painteditem/TextBalloonPlugin/.de=
bug/libqmltextballoonplugin.so
qtdeclarative-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/quick/imageprovider/ImageProviderCore/.debug/libqml=
imageproviderplugin.so
WARNING: The recipe qtsystems is trying to install files into a shared area
when those files already exist. Those files and their manifest location are=
:

/home/sujith/MEL7/mastertest/atpomap5/tmp/sysroots/mel-omap5-evm/usr/share/=
qt5/examples/
examples.pro
   Matched in manifest-mel-omap5-evm-qtbase.populate_sysroot
Please verify which package should provide the above files.
WARNING: QA Issue: qtsensors-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/.debug/libgruesensor.so.1.0.0
qtsensors-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/Grue/.debug/libdeclarative_grue.so
qtsensors-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/sensors/.debug/libqtsensors_grue.so
qtsensors-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/sensors/sensor_explorer/Explorer/.debug/libdeclarat=
ive_explorer.so
qtsensors-examples-dev: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/libgruesensor.so
qtsensors-examples-dev: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/Grue/libdeclarative_grue.so
qtsensors-examples-dev: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/sensors/libqtsensors_grue.so
qtsensors-examples-dev: found library in wrong location:
/usr/share/qt5/examples/sensors/sensor_explorer/Explorer/libdeclarative_exp=
lorer.so
qtsensors-examples: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/libgruesensor.so.1.0
qtsensors-examples: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/libgruesensor.so.1.0.0

qtsensors-examples: found library in wrong location:
/usr/share/qt5/examples/sensors/grue/libgruesensor.so.1

WARNING: QA Issue: qtmultimedia-examples-dbg: found library in wrong
location:
/usr/share/qt5/examples/multimedia/spectrum/.debug/libfftreal.so.1.0.0
qtmultimedia-examples-dev: found library in wrong location:
/usr/share/qt5/examples/multimedia/spectrum/libfftreal.so
qtmultimedia-examples: found library in wrong location:
/usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1
qtmultimedia-examples: found library in wrong location:
/usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0
qtmultimedia-examples: found library in wrong location:
/usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0.0
WARNING: QA Issue: qtquick1-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/plugins/.debug/libqmlqwid=
getsplugin.so
qtquick1-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/Tim=
eExample/.debug/libqmlqtimeexampleplugin.so
qtquick1-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProvid=
erCore/.debug/libqmlimageproviderplugin.so
qtquick1-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/declarative/tutorials/gettingStarted/filedialog/.de=
bug/libFileDialog.so
qtquick1-examples-dbg: found library in wrong location:
/usr/share/qt5/examples/declarative/tutorials/extending/chapter6-plugins/.d=
ebug/libchapter6-plugins.so
qtquick1-examples-dev: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/plugins/libqmlqwidgetsplu=
gin.so
qtquick1-examples-dev: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/Tim=
eExample/libqmlqtimeexampleplugin.so
qtquick1-examples-dev: found library in wrong location:
/usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProvid=
erCore/libqmlimageproviderplugin.so

qtquick1-examples-dev: found library in wrong location:
/usr/share/qt5/examples/declarative/tutorials/gettingStarted/filedialog/lib=
FileDialog.so

qtquick1-examples-dev: found library in wrong location:
/usr/share/qt5/examples/declarative/tutorials/extending/chapter6-plugins/li=
bchapter6-plugins.so




To overcome this I gave:

WARN_QA :=3D "${@oe_filter_out('libdir', WARN_QA, d)}"

May I know a better option to resolve this warnings?

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c12632f6181804f9e86c63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi,<br><br></div>While building q=
tbase, qtsensors, qtmultimedia, qtquick1 etc I was getting lot of warnings.=
 Below is the warning messages I were gtting:<br><br>WARNING: QA Issue: qtb=
ase-examples-dev: found library in wrong location: /usr/share/qt5/examples/=
widgets/tools/echoplugin/plugin/libechoplugin.so<br>

qtbase-examples-dev: found library in wrong location: /usr/share/qt5/exampl=
es/widgets/tools/plugandpaint/plugins/libpnp_extrafilters.so<br>qtbase-exam=
ples-dev: found library in wrong location: /usr/share/qt5/examples/widgets/=
tools/styleplugin/styles/libsimplestyleplugin.so<br>

qtbase-examples-dbg: found library in wrong location: /usr/share/qt5/exampl=
es/widgets/tools/echoplugin/plugin/.debug/libechoplugin.so<br>qtbase-exampl=
es-dbg: found library in wrong location: /usr/share/qt5/examples/widgets/to=
ols/plugandpaint/plugins/.debug/libpnp_extrafilters.so<br>

qtbase-examples-dbg: found library in wrong location: /usr/share/qt5/exampl=
es/widgets/tools/styleplugin/styles/.debug/libsimplestyleplugin.so<br>WARNI=
NG: QA Issue: qtdeclarative-examples-dev: found library in wrong location: =
/usr/share/qt5/examples/qml/qmlextensionplugins/imports/TimeExample/libqmlq=
timeexampleplugin.so<br>

qtdeclarative-examples-dev: found library in wrong location: /usr/share/qt5=
/examples/quick/customitems/painteditem/TextBalloonPlugin/libqmltextballoon=
plugin.so<br>qtdeclarative-examples-dev: found library in wrong location: /=
usr/share/qt5/examples/quick/imageprovider/ImageProviderCore/libqmlimagepro=
viderplugin.so<br>

qtdeclarative-examples-dbg: found library in wrong location: /usr/share/qt5=
/examples/qml/qmlextensionplugins/imports/TimeExample/.debug/libqmlqtimeexa=
mpleplugin.so<br>qtdeclarative-examples-dbg: found library in wrong locatio=
n: /usr/share/qt5/examples/quick/customitems/painteditem/TextBalloonPlugin/=
.debug/libqmltextballoonplugin.so<br>

qtdeclarative-examples-dbg: found library in wrong location: /usr/share/qt5=
/examples/quick/imageprovider/ImageProviderCore/.debug/libqmlimageproviderp=
lugin.so<br>WARNING: The recipe qtsystems is trying to install files into a=
 shared area when those files already exist. Those files and their manifest=
 location are:<br>

=C2=A0=C2=A0 /home/sujith/MEL7/mastertest/atpomap5/tmp/sysroots/mel-omap5-e=
vm/usr/share/qt5/examples/<a href=3D"http://examples.pro">examples.pro</a><=
br>=C2=A0=C2=A0 Matched in manifest-mel-omap5-evm-qtbase.populate_sysroot<b=
r>Please verify which package should provide the above files.<br>

WARNING: QA Issue: qtsensors-examples-dbg: found library in wrong location:=
 /usr/share/qt5/examples/sensors/grue/.debug/libgruesensor.so.1.0.0<br>qtse=
nsors-examples-dbg: found library in wrong location: /usr/share/qt5/example=
s/sensors/grue/Grue/.debug/libdeclarative_grue.so<br>

qtsensors-examples-dbg: found library in wrong location: /usr/share/qt5/exa=
mples/sensors/grue/sensors/.debug/libqtsensors_grue.so<br>qtsensors-example=
s-dbg: found library in wrong location: /usr/share/qt5/examples/sensors/sen=
sor_explorer/Explorer/.debug/libdeclarative_explorer.so<br>

qtsensors-examples-dev: found library in wrong location: /usr/share/qt5/exa=
mples/sensors/grue/libgruesensor.so<br>qtsensors-examples-dev: found librar=
y in wrong location: /usr/share/qt5/examples/sensors/grue/Grue/libdeclarati=
ve_grue.so<br>

qtsensors-examples-dev: found library in wrong location: /usr/share/qt5/exa=
mples/sensors/grue/sensors/libqtsensors_grue.so<br>qtsensors-examples-dev: =
found library in wrong location: /usr/share/qt5/examples/sensors/sensor_exp=
lorer/Explorer/libdeclarative_explorer.so<br>

qtsensors-examples: found library in wrong location: /usr/share/qt5/example=
s/sensors/grue/libgruesensor.so.1.0<br>qtsensors-examples: found library in=
 wrong location: /usr/share/qt5/examples/sensors/grue/libgruesensor.so.1.0.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>

qtsensors-examples: found library in wrong location: /usr/share/qt5/example=
s/sensors/grue/libgruesensor.so.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>WARNING: QA Issue: qtmult=
imedia-examples-dbg: found library in wrong location: /usr/share/qt5/exampl=
es/multimedia/spectrum/.debug/libfftreal.so.1.0.0<br>

qtmultimedia-examples-dev: found library in wrong location: /usr/share/qt5/=
examples/multimedia/spectrum/libfftreal.so<br>qtmultimedia-examples: found =
library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/libf=
ftreal.so.1<br>

qtmultimedia-examples: found library in wrong location: /usr/share/qt5/exam=
ples/multimedia/spectrum/libfftreal.so.1.0<br>qtmultimedia-examples: found =
library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/libf=
ftreal.so.1.0.0<br>

WARNING: QA Issue: qtquick1-examples-dbg: found library in wrong location: =
/usr/share/qt5/examples/declarative/cppextensions/plugins/.debug/libqmlqwid=
getsplugin.so<br>qtquick1-examples-dbg: found library in wrong location: /u=
sr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/TimeE=
xample/.debug/libqmlqtimeexampleplugin.so<br>

qtquick1-examples-dbg: found library in wrong location: /usr/share/qt5/exam=
ples/declarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqm=
limageproviderplugin.so<br>qtquick1-examples-dbg: found library in wrong lo=
cation: /usr/share/qt5/examples/declarative/tutorials/gettingStarted/filedi=
alog/.debug/libFileDialog.so<br>

qtquick1-examples-dbg: found library in wrong location: /usr/share/qt5/exam=
ples/declarative/tutorials/extending/chapter6-plugins/.debug/libchapter6-pl=
ugins.so<br>qtquick1-examples-dev: found library in wrong location: /usr/sh=
are/qt5/examples/declarative/cppextensions/plugins/libqmlqwidgetsplugin.so<=
br>

qtquick1-examples-dev: found library in wrong location: /usr/share/qt5/exam=
ples/declarative/cppextensions/plugins/org/qtproject/TimeExample/libqmlqtim=
eexampleplugin.so<br>qtquick1-examples-dev: found library in wrong location=
: /usr/share/qt5/examples/declarative/cppextensions/imageprovider/ImageProv=
iderCore/libqmlimageproviderplugin.so=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <br>

qtquick1-examples-dev: found library in wrong location: /usr/share/qt5/exam=
ples/declarative/tutorials/gettingStarted/filedialog/libFileDialog.so=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 <br>qtquick1-examples-dev: found library in wrong location:=
 /usr/share/qt5/examples/declarative/tutorials/extending/chapter6-plugins/l=
ibchapter6-plugins.so=C2=A0=C2=A0=C2=A0 <br>

<br><br><br></div>To overcome this I gave:<br><br></div>WARN_QA :=3D &quot;=
${@oe_filter_out(&#39;libdir&#39;, WARN_QA, d)}&quot;<br><br></div>May I kn=
ow a better option to resolve this warnings?<br><br></div>Thanks,<br>Sujith=
 H<br clear=3D"all">

<div><div><div><div><div><div><br>-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=
=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=
=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE pro=
ject<br><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_=
blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div></div></div></div></div></div>

--001a11c12632f6181804f9e86c63--
