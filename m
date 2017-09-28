Return-Path: <nandojve@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 19F1960557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 12:28:31 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id w22so846996ywa.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MAQOhexuw/kI+dMUoFqYDiZ4vdxmBYhWSeZirWjJO3o=;
	b=UeX/KnkYCgcc8brnd2fD/i7aIafdn4pqkSamKGiTjTL6+08L2wlAhz3ZVTdqQ8K7Dh
	ItSnM0x7ZMlQOiB7LdQOlAmRIjmr5NMdf39SRQviNhlR7vI45iKkOydcDlFyhNXtYWdc
	K0Kk37MGaSe9Z+YZkML9WvnNwdDRdPOgHQXzWjI8ICDbJc6HK/oCLY2DdNiFWyD8bH6U
	fkdpor5EbBaCpzkMaCZ5vgKJEkHnZopxSYGEhm3DkVY8GG5gnMoKjFsYTxaRa9LmDrJt
	JK0IUZcblRzPZHCriptQfOSrC7oWqyQ9rEDCr642joY9+3PscoB/Bz+3sLppe8C6OeGw
	dNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MAQOhexuw/kI+dMUoFqYDiZ4vdxmBYhWSeZirWjJO3o=;
	b=tG0T1X23epeLQ4zqjSfBPKnn9QXl64JC1V3rOBFqcBYCfr+aqnVisCaEetgEkjNIV2
	TK7xOKTME/SHvt4VqmGWwfuAP+QTC/VEDp40vNMfZVDky56wKmYvBTaO3eMllj6LqkQr
	EHYhYp7pOGJjK0V/xI74pC85N8ImdM6SZqoCgwu/hk0VZMJCnzh/ylW0nBX/eb/b8Xo3
	TGWQplvzFh1AmQE1HmsJrO5o+/RsVJdVORzz74UY3uubBieWTBSM1Fh/We9bhepcHh/2
	VT+tsldnFef5vOwoylyb+4Uu64KqzdDWJyUWHuDxj32o9/M87xAT9T0PoFWVpwbq7/Bf
	S7kw==
X-Gm-Message-State: AHPjjUj/zxghtvr0ZSSoiMI09ktuxxsRGjUt67/pmpkI9GMNjUW9Bw6V
	6awXgJxm3ZYHZgvyY9KoKUSteOo5Vz0yIZvrj7d1qw==
X-Google-Smtp-Source: AOwi7QD/L5N+fFvAbzY3c2XZawKiDgbZ7B8Zb71e45DNMosYwIwmvaEi6PtupEA4T4spzWNNGDSQlFk882WJRimysaw=
X-Received: by 10.37.199.19 with SMTP id w19mr3545705ybe.168.1506601711646;
	Thu, 28 Sep 2017 05:28:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.197.84 with HTTP; Thu, 28 Sep 2017 05:28:31 -0700 (PDT)
From: Gerson Fernando Budke <nandojve@gmail.com>
Date: Thu, 28 Sep 2017 09:28:31 -0300
Message-ID: <CABOv41MVnzpNZskLsBtuVGJYrgoWEmbCYAOcQu1DztWgPypixQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Building python modules using the SDK emit errors
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
X-List-Received-Date: Thu, 28 Sep 2017 12:28:33 -0000
Content-Type: multipart/alternative; boundary="94eb2c1480a4d73fad055a3f0b39"

--94eb2c1480a4d73fad055a3f0b39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,

I've been facing problems with python and I need some help. My current
branch is morty but I think this could affect others too.
At firstly, it works perfecly and run OK when using bitbake (even using
with distutils in setup.py - see below) but when tring build using SDK I
get this:

inet@ubuntu:~/workspace/upstream/router-ibd$ python setup.py build
running build
running build_py
package init file 'python-ibd/__init__.py' not found (or not a regular file=
)
package init file 'python-ibd/__init__.py' not found (or not a regular file=
)
running build_ext
building 'pyibd' extension
powerpc-iep-linux-gnuspe-gcc -m32 -mcpu=3D8548 -mabi=3Dspe -mspe
-mfloat-gprs=3Ddouble
--sysroot=3D/opt/iep/16.2/sysroots/ppce500v2-iep-linux-gnuspe -DNDEBUG -g -=
O3
-Wall -Wstrict-prototypes -O -fno-omit-frame-pointer -g
-feliminate-unused-debug-types -pipe -fPIC -DMAJOR_VERSION=3D1
-DMINOR_VERSION=3D0 -I./include
-I/opt/iep/16.2/sysroots/x86_64-iepsdk-linux/usr/include/python2.7 -c
python-ibd/ibdmodule.c -o build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.=
o
In file included from
/opt/iep/16.2/sysroots/x86_64-iepsdk-linux/usr/include/python2.7/Python.h:8=
:0,
                 from python-ibd/ibdmodule.c:11:
/opt/iep/16.2/sysroots/x86_64-iepsdk-linux/usr/include/python2.7/pyconfig.h=
:1193:0:
warning: "_POSIX_C_SOURCE" redefined
 #define _POSIX_C_SOURCE 200112L

In file included from
/opt/iep/16.2/sysroots/ppce500v2-iep-linux-gnuspe/usr/include/stdint.h:25:0=
,
                 from
/opt/iep/16.2/sysroots/x86_64-iepsdk-linux/usr/lib/powerpc-iep-linux/gcc/po=
werpc-iep-linux/6.2.0/include/stdint.h:9,
                 from ./include/ibd.h:12,
                 from python-ibd/ibdmodule.c:9:
/opt/iep/16.2/sysroots/ppce500v2-iep-linux-gnuspe/usr/include/features.h:22=
5:0:
note: this is the location of the previous definition
 # define _POSIX_C_SOURCE 200809L

x86_64-iepsdk-linux-gcc -shared -Wl,-O1 -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed -O -fno-omit-frame-pointer -g
-feliminate-unused-debug-types -pipe
build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o
-L/opt/iep/16.2/sysroots/x86_64-iepsdk-linux/usr/lib -lrouter-ibd
-lpython2.7 -o build/lib.linux-x86_64-2.7/pyibd.so
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:
Relocations in generic ELF (EM: 20)
build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o: error adding symbols:
File in wrong format
collect2: error: ld returned 1 exit status
error: command 'x86_64-iepsdk-linux-gcc' failed with exit status 1

The resulting build tree from SDK (distutils/setuptools) and bitbake
(distutils) is:
.
=E2=94=9C=E2=94=80=E2=94=80 build
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 lib.linux-x86_64-2.7
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 temp.linux-x86_64-2.7
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 python-ibd
=E2=94=82           =E2=94=94=E2=94=80=E2=94=80 ibdmodule.o

I can see a build problem here since the platform is ppc. If I change from
distutils to setuptools in setup.py I get the same.
I've seen this been generated by bitbake using distutils in setup.py too
but works on the board, I don't known why.
If I change from distutils to setuptools in setup.py and run bitbake the
system looks correctly.

bitbake (setuptools)
=E2=94=9C=E2=94=80=E2=94=80 deploy-ipks
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 ppce500v2
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 python-ibd-dbg_git-r0.5_ppce500=
v2.ipk
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 python-ibd-dev_git-r0.5_ppce500=
v2.ipk
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 python-ibd_git-r0.5_ppce500v2.i=
pk

To get that wrong result using the SDK was needed add as follow, otherwise
the Python.h include error appears:

nativesdk-packagegroup-sdk-host.bbappend

+RDEPENDS_${PN} +=3D " \
+    nativesdk-gcc \
+    \
+    nativesdk-python-dev \
+    nativesdk-python-setuptools \
+"

There seems to be missing some cross compile patch. Does anyone have any
ideas?

--94eb2c1480a4d73fad055a3f0b39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello guys,<div><br></div><div>I&#39;ve been facing proble=
ms with python and I need some help. My current branch is morty but I think=
 this could affect others too.</div><div>At firstly, it works perfecly and =
run OK when using bitbake (even using with distutils in setup.py - see belo=
w) but when tring build using SDK I get this:<br></div><div><br></div><div>=
<div>inet@ubuntu:~/workspace/upstream/router-ibd$ python setup.py build</di=
v><div>running build<br></div><div>running build_py</div><div>package init =
file &#39;python-ibd/__init__.py&#39; not found (or not a regular file)</di=
v><div>package init file &#39;python-ibd/__init__.py&#39; not found (or not=
 a regular file)</div><div>running build_ext</div><div>building &#39;pyibd&=
#39; extension</div><div>powerpc-iep-linux-gnuspe-gcc -m32 -mcpu=3D8548 -ma=
bi=3Dspe -mspe -mfloat-gprs=3Ddouble --sysroot=3D/opt/iep/16.2/sysroots/ppc=
e500v2-iep-linux-gnuspe -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O -fno-o=
mit-frame-pointer -g -feliminate-unused-debug-types -pipe -fPIC -DMAJOR_VER=
SION=3D1 -DMINOR_VERSION=3D0 -I./include -I/opt/iep/16.2/sysroots/x86_64-ie=
psdk-linux/usr/include/python2.7 -c python-ibd/ibdmodule.c -o build/temp.li=
nux-x86_64-2.7/python-ibd/ibdmodule.o</div><div>In file included from /opt/=
iep/16.2/sysroots/x86_64-iepsdk-linux/usr/include/python2.7/Python.h:8:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 python-ibd/ibdmodule.c:11:</div><div>/opt/iep/16.2/sysroots/x86_64-iepsdk-=
linux/usr/include/python2.7/pyconfig.h:1193:0: warning: &quot;_POSIX_C_SOUR=
CE&quot; redefined</div><div>=C2=A0#define _POSIX_C_SOURCE 200112L</div><di=
v>=C2=A0</div><div>In file included from /opt/iep/16.2/sysroots/ppce500v2-i=
ep-linux-gnuspe/usr/include/stdint.h:25:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /opt/iep/16.2/sysroots/x86_64=
-iepsdk-linux/usr/lib/powerpc-iep-linux/gcc/powerpc-iep-linux/6.2.0/include=
/stdint.h:9,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from ./include/ibd.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from python-ibd/ibdmodule.c:9:</div><div>=
/opt/iep/16.2/sysroots/ppce500v2-iep-linux-gnuspe/usr/include/features.h:22=
5:0: note: this is the location of the previous definition</div><div>=C2=A0=
# define _POSIX_C_SOURCE 200809L</div><div>=C2=A0</div><div>x86_64-iepsdk-l=
inux-gcc -shared -Wl,-O1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -O =
-fno-omit-frame-pointer -g -feliminate-unused-debug-types -pipe build/temp.=
linux-x86_64-2.7/python-ibd/ibdmodule.o -L/opt/iep/16.2/sysroots/x86_64-iep=
sdk-linux/usr/lib -lrouter-ibd -lpython2.7 -o build/lib.linux-x86_64-2.7/py=
ibd.so</div><div>/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmod=
ule.o: Relocations in generic ELF (EM: 20)</div><div>/usr/bin/ld: build/tem=
p.linux-x86_64-2.7/python-ibd/ibdmodule.o: Relocations in generic ELF (EM: =
20)</div><div>/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule=
.o: Relocations in generic ELF (EM: 20)</div><div>/usr/bin/ld: build/temp.l=
inux-x86_64-2.7/python-ibd/ibdmodule.o: Relocations in generic ELF (EM: 20)=
</div><div>/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o:=
 Relocations in generic ELF (EM: 20)</div><div>/usr/bin/ld: build/temp.linu=
x-x86_64-2.7/python-ibd/ibdmodule.o: Relocations in generic ELF (EM: 20)</d=
iv><div>/usr/bin/ld: build/temp.linux-x86_64-2.7/python-ibd/ibdmodule.o: Re=
locations in generic ELF (EM: 20)</div><div>build/temp.linux-x86_64-2.7/pyt=
hon-ibd/ibdmodule.o: error adding symbols: File in wrong format</div><div>c=
ollect2: error: ld returned 1 exit status</div><div>error: command &#39;x86=
_64-iepsdk-linux-gcc&#39; failed with exit status 1</div></div><div><br></d=
iv><div>The resulting build tree from SDK (distutils/setuptools) and bitbak=
e (distutils) is:</div><div>.<br></div><div><div>=E2=94=9C=E2=94=80=E2=94=
=80 build<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 lib.linux-x86_64-=
2.7<br>=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 temp.linux-x86_64-2.7<b=
r>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 python-ibd<br>=
=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 ib=
dmodule.o</div></div><div><br></div><div><div>I can see a build problem her=
e since the platform is ppc. If I change from distutils to setuptools in se=
tup.py I get the same.</div><div>I&#39;ve seen this been generated by bitba=
ke using distutils in setup.py too but works on the board, I don&#39;t know=
n why.</div><div>If I change from distutils to setuptools in setup.py and r=
un bitbake the system looks correctly.</div></div><div><br></div><div>bitba=
ke (setuptools)</div><div><div>=E2=94=9C=E2=94=80=E2=94=80 deploy-ipks</div=
><div>=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 ppce500v2</div><div=
>=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 python-ibd=
-dbg_git-r0.5_ppce500v2.ipk</div><div>=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=E2=94=9C=E2=94=80=E2=94=80 python-ibd-dev_git-r0.5_ppce500v2.ipk</div><div=
>=E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 python-ibd=
_git-r0.5_ppce500v2.ipk</div></div><div><br></div><div>To get that wrong re=
sult using the SDK was needed add as follow, otherwise the Python.h include=
 error appears:</div><div><br></div><div>nativesdk-packagegroup-sdk-host.bb=
append<br></div><div><br></div><div><div>+RDEPENDS_${PN} +=3D &quot; \</div=
><div>+=C2=A0 =C2=A0 nativesdk-gcc \</div><div>+=C2=A0 =C2=A0 \</div><div>+=
=C2=A0 =C2=A0 nativesdk-python-dev \<br></div><div>+=C2=A0 =C2=A0 nativesdk=
-python-setuptools \</div><div>+&quot;<br></div></div><div><br></div><div>T=
here seems to be missing some cross compile patch. Does anyone have any ide=
as?<br></div></div>

--94eb2c1480a4d73fad055a3f0b39--
