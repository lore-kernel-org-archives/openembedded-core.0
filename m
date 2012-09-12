Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TBo9j-0007Wf-R2
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:43:08 +0200
Received: by iaky10 with SMTP id y10so1401773iak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to:cc
	:content-type:x-gm-message-state;
	bh=fj9e+Z3ldg432tgm6gnHh7Qf3PE/gurOOGAFb4P/CD4=;
	b=GkvvtuuDEuGfCk3OOJv8rIgJX3hK93ucsmvZ8Ip+WaAUgBlYDUfsU8U+Jc1XqYb6kL
	Bf1POfiIibn9kdE5PQca/pGeIQg+uOqGyk86g6Dyiv9TTo9jbK+GqzD7h6LOZ0tC9+jq
	/+aRVBZbcHjl55BDFkpNn0qfx0tZGMOYSBnsMaCCsytny/wcmEWsSmRDl3WwCAxeaSb2
	0StsvBJb4foskzjWv3PQv3ZMBEg9Jovx49NYv6lN3Asq9MBkI0GN3Q8i7dtLmjF6weg5
	TZ4c3z5pluq40W3JgLHLYZRhm88XDzeAcsL8VZkDNXWnKmXE3nGK8il16F/N8XIXarpt
	ciVQ==
Received: by 10.50.34.132 with SMTP id z4mr21172886igi.34.1347460235083; Wed,
	12 Sep 2012 07:30:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Wed, 12 Sep 2012 07:30:14 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 12 Sep 2012 17:30:14 +0300
Message-ID: <CAK18fxH0L1-fkNwVa7oh5PR_H8OC5RBx3wo96Vvrm-NMRxo2Tw@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnnTHDjTf+GT/tTnQDGjuti+tc+qofkyuoLwDUVP7FALdgV8z1rRo7BZfzZHgMmTXXtB8mc
Subject: error: impossible constraint in 'asm'
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
X-List-Received-Date: Wed, 12 Sep 2012 14:43:08 -0000
Content-Type: multipart/alternative; boundary=14dae9340a13a93ece04c982087a

--14dae9340a13a93ece04c982087a
Content-Type: text/plain; charset=ISO-8859-1

Hello,

While compiling xbmc for rpi i ran into a dead-end:
[...]
| arm-poky-linux-gnueabi-g++  -march=armv6    -mthumb-interwork
-mfloat-abi=softfp -mtune=arm1176jzf-s
--sysroot={BUILD}/tmp/sysroots/raspberrypi -MF DVDClock.d -MD -c -O2 -pipe
-g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden
 -mfpu=vfp -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -D_DEBUG -Wall -O2 -mno-apcs-stack-check -O2
-pipe -g -feliminate-unused-debug-types -fpermissive
-fvisibility-inlines-hidden  -mfpu=vfp -fPIC -DPIC -D_REENTRANT
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -D_DEBUG -Wall -O2
-mno-apcs-stack-check -D__STDC_FORMAT_MACROS -O2 -pipe -g
-feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden
 -mfpu=vfp -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -D_DEBUG -Wall -O2 -mno-apcs-stack-check
-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_ARMEL -D_FILE_DEFINED
-D__STDC_CONSTANT_MACROS -DBIN_INSTALL_PATH="\"/usr/lib/xbmc\""
-DINSTALL_PATH="\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK
-D'GIT_REV="20120510-82388d5"' -DHAVE_CONFIG_H  -D_GNU_SOURCE=1
-D_REENTRANT -I/{BUILD}/tmp/sysroots/raspberrypi/usr/include
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/SDL
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/alsa
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/dbus-1.0
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/freetype2
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/fribidi
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/libcec
-I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/libpng12
-I/{BUILD}tmp/sysroots/raspberrypi/usr/lib/dbus-1.0/include
-I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git
-I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/lib
-I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc
-I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/linux
-I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/cores/dvdplayer
DVDClock.cpp -o DVDClock.o \
[...]
In file included from DVDClock.cpp:25:0:
|
/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:
In member function 'int CDVDClock::UpdateFramerate(double, double*)':
|
/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442:
error: impossible constraint in 'asm'
|
/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442:
error: impossible constraint in 'asm'
|
/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442:
error: impossible constraint in 'asm'
|
/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442:
error: impossible constraint in 'asm'

Preprocessed output + error messages:
https://gist.github.com/3706972

Any hints to get over this?

ag

--14dae9340a13a93ece04c982087a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,
<div><br></div><div>While compiling xbmc for rpi i ran into a=A0dead-end:</=
div><div>[...]</div><div><div>| arm-poky-linux-gnueabi-g++ =A0-march=3Darmv=
6 =A0 =A0-mthumb-interwork -mfloat-abi=3Dsoftfp -mtune=3Darm1176jzf-s --sys=
root=3D{BUILD}/tmp/sysroots/raspberrypi -MF DVDClock.d -MD -c -O2 -pipe -g =
-feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden =A0=
-mfpu=3Dvfp -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_B=
ITS=3D64 -g -D_DEBUG -Wall -O2 -mno-apcs-stack-check -O2 -pipe -g -felimina=
te-unused-debug-types -fpermissive -fvisibility-inlines-hidden =A0-mfpu=3Dv=
fp -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-g -D_DEBUG -Wall -O2 -mno-apcs-stack-check -D__STDC_FORMAT_MACROS -O2 -pip=
e -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidde=
n =A0-mfpu=3Dvfp -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mno-apcs-stack-check -DTARGET_POSIX -D=
TARGET_LINUX -D_LINUX -D_ARMEL -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS -DB=
IN_INSTALL_PATH=3D&quot;\&quot;/usr/lib/xbmc\&quot;&quot; -DINSTALL_PATH=3D=
&quot;\&quot;/usr/share/xbmc\&quot;&quot; -DHAS_SDL_JOYSTICK -D&#39;GIT_REV=
=3D&quot;20120510-82388d5&quot;&#39; -DHAVE_CONFIG_H =A0-D_GNU_SOURCE=3D1 -=
D_REENTRANT -I/{BUILD}/tmp/sysroots/raspberrypi/usr/include -I/{BUILD}/tmp/=
sysroots/raspberrypi/usr/include/SDL -I/{BUILD}/tmp/sysroots/raspberrypi/us=
r/include/alsa -I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/dbus-1.0 -I/=
{BUILD}/tmp/sysroots/raspberrypi/usr/include/freetype2 -I/{BUILD}/tmp/sysro=
ots/raspberrypi/usr/include/fribidi -I/{BUILD}/tmp/sysroots/raspberrypi/usr=
/include/libcec -I/{BUILD}/tmp/sysroots/raspberrypi/usr/include/libpng12 -I=
/{BUILD}tmp/sysroots/raspberrypi/usr/lib/dbus-1.0/include -I/{BUILD}/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e3=
07e23202e76a43efa/git -I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc=
-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/lib -I/{BUILD}=
/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb=
2e486e307e23202e76a43efa/git/xbmc -I/{BUILD}/tmp/work/armv6-vfp-poky-linux-=
gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xb=
mc/linux -I/{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+git=
r1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/cores/dvdplayer DVDClo=
ck.cpp -o DVDClock.o \</div>



</div><div>[...]</div><div><div>In file included from DVDClock.cpp:25:0:</d=
iv><div>| /{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr=
1+82388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h: In m=
ember function &#39;int CDVDClock::UpdateFramerate(double, double*)&#39;:</=
div>



<div>| /{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+8=
2388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442: =
error: impossible constraint in &#39;asm&#39;</div><div>| /{BUILD}/tmp/work=
/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307=
e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442: error: impossible constr=
aint in &#39;asm&#39;</div>



<div>| /{BUILD}/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+8=
2388d55dae79cbb2e486e307e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442: =
error: impossible constraint in &#39;asm&#39;</div><div>| /{BUILD}/tmp/work=
/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+82388d55dae79cbb2e486e307=
e23202e76a43efa/git/xbmc/utils/MathUtils.h:86:442: error: impossible constr=
aint in &#39;asm&#39;</div>



</div><div><br></div><div>Preprocessed output + error messages:</div><div><=
a href=3D"https://gist.github.com/3706972" target=3D"_blank">https://gist.g=
ithub.com/3706972</a></div><div><br></div><div>Any hints to get over this?<=
/div>

<div><br></div>
<div>ag</div>

--14dae9340a13a93ece04c982087a--
