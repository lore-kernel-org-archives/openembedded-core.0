Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4rDS-0004JT-FE
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 12:06:30 +0100
Received: by mail-vc0-f181.google.com with SMTP id d16so3719261vcd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 02:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=HOLKpE+vKmO6dHGISwHQSrEmlB4DNSX1FlS5ZLzX24Q=;
	b=MpL9ZbCnLZ2Tb+yLS42zKGdbAVtp5WVeZEzCIlAJOEIQxryPhD7DiVtEbtWnauxcOw
	xYdmkxVQIGlv/vLjo7Ir0wlGkBNZmVFUC5sherf/eZZOrhB1UwNqAFPifsdexI6TEAKQ
	yGSkj15Kza7rTYjcR9H6uK76jsa8wjnsMFGcOYxJo/T31UytG64A6kyqcn81KS+0PRbN
	ps12tT+i7pXjlSA9f48acJMSk8j3lKkhD6VYOEbEUS5EaySSxYcFXPgKIaqLOKOcfHft
	mo6ELSF5NhH1fh6zz0Mc1Ns/ohH+wyVav+8NsJYyhkincA5SA6oUg5RLkT0QRR4fh+2P
	K6sg==
X-Received: by 10.52.26.229 with SMTP id o5mr9744847vdg.66.1360579832130; Mon,
	11 Feb 2013 02:50:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Mon, 11 Feb 2013 02:50:11 -0800 (PST)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 12:50:11 +0200
Message-ID: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmmVOHN6QdqNN5nohraPhL4GVyuHDSfBBpyC/dr/AJd8fitdKTJttp/bT8jWBqMe4RS652G
Subject: [denzil] qt 4.8.0 is not available from source anymore
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
X-List-Received-Date: Mon, 11 Feb 2013 11:06:30 -0000
Content-Type: multipart/alternative; boundary=20cf3079bd90952ca304d570adb8

--20cf3079bd90952ca304d570adb8
Content-Type: text/plain; charset=ISO-8859-1

In denzil SRC_URI for qt4.8.0 uses:
http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz

This source seems to be outdated and replaced by:
http://releases.qt-project.org/qt4/source/

The problem is that the new location doesn't include the 4.8.0 release.
qt-everywhere-opensource-src-4.6.4.tar.gz
qt-everywhere-opensource-src-4.8.1.tar.gz
qt-everywhere-opensource-src-4.8.2.tar.gz
qt-everywhere-opensource-src-4.8.3.tar.gz
qt-everywhere-opensource-src-4.8.4.tar.gz

So right now qt4 in denzil is not fetch-able anymore.

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--20cf3079bd90952ca304d570adb8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In denzil SRC_URI for qt4.8.0 uses:<div><a href=3D"http://=
get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz">http:=
//get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz</a><=
/div>

<div><br></div><div>This source seems to be outdated and replaced by:=A0<a =
href=3D"http://releases.qt-project.org/qt4/source/">http://releases.qt-proj=
ect.org/qt4/source/</a></div><div><br></div><div style>The problem is that =
the new location doesn&#39;t include the 4.8.0 release.=A0</div>

<div style><div>qt-everywhere-opensource-src-4.6.4.tar.gz</div><div>qt-ever=
ywhere-opensource-src-4.8.1.tar.gz<br></div><div>qt-everywhere-opensource-s=
rc-4.8.2.tar.gz<br></div><div>qt-everywhere-opensource-src-4.8.3.tar.gz<br>

</div><div>qt-everywhere-opensource-src-4.8.4.tar.gz<br></div><div><br></di=
v><div style>So right now qt4 in denzil is not=A0fetch-able=A0anymore.</div=
></div><div><div><br></div>-- <br><div dir=3D"ltr"><div style=3D"text-align=
:center">

</div><div style=3D"text-align:center"><div align=3D"left" style=3D"font-fa=
mily:&#39;Times New Roman&#39;;font-size:medium"><b style=3D"color:rgb(51,5=
1,51);font-family:Arial;font-size:small;text-align:center">Andrei Gherzan</=
b><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--20cf3079bd90952ca304d570adb8--
