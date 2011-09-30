Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9gmq-0007Qn-2v
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:22:12 +0200
Received: by vwe42 with SMTP id 42so1605497vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=b4XMkGJTDREaNboozbDZd26FzDnk7pfkAf/FfYEEZK0=;
	b=cuxOS9ItIHYbfasfnNNPifHFLhor4tNGg7ESaEKSztc9lOZWq+nNX/vWSv43gjzGyS
	RDz0ttbUeTTQXrUwgwbJzIjDHNtBgikUXIkpU9tayurNeyhF20j5O6xTuRziR6cq33hJ
	/rou39mJTMRfrvhIk0+Cu1/8D/Dk9RmnG7rXc=
MIME-Version: 1.0
Received: by 10.68.57.102 with SMTP id h6mr47703117pbq.7.1317402998933; Fri,
	30 Sep 2011 10:16:38 -0700 (PDT)
Received: by 10.142.199.2 with HTTP; Fri, 30 Sep 2011 10:16:38 -0700 (PDT)
In-Reply-To: <cover.1317344910.git.nitin.a.kamble@intel.com>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
Date: Fri, 30 Sep 2011 19:16:38 +0200
Message-ID: <CA+chaQdwbVqsydNmzvGpHcUQS5JiU5x7HKE5Wf9R1T4_jUmrKQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes upgrades
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
X-List-Received-Date: Fri, 30 Sep 2011 17:22:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 3:27 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> The following changes since commit 9d1db6cc928199f8ac4960e8d4648563ef1414=
27:
>
> =C2=A0python: fix sqlite RPATH issue (2011-09-29 16:57:30 +0100)
>
> are available in the git repository at:
> =C2=A0git://git.pokylinux.org/poky-contrib nitin/upgrades
> =C2=A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dnitin/upgra=
des
>
> Nitin A Kamble (4):
> =C2=A0gdb: upgrade from 7.3a to 7.3.1
> =C2=A0byacc: upgrade from 20101229 to 20110908
> =C2=A0python-dbus: upgrade from 0.83.2 to 0.84.0
> =C2=A0python, python-native: upgrade from 2.6.6 to 2.7.2

Just for record, upgrading python needs few PR bumps for recipes
linking to libpython (RDEPENDing on libpython2.6-1.0)

bitbake -c cleansstate python-setuptools python-setuptools-native
python-pyrex python-pyrex-native
In my case:
NOTE: Running task 3 of 18 (ID: 15,
/OE/shr-core/meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.7.9.=
bb,
do_cleansstate)
NOTE: Running task 5 of 18 (ID: 13,
/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyyam=
l_svn.bb,
do_cleansstate)
NOTE: Running task 7 of 18 (ID: 11,
/OE/shr-core/meta-smartphone/meta-fso/recipes-freesmartphone/python/python-=
pyrtc_git.bb,
do_cleansstate)
NOTE: Running task 9 of 18 (ID: 9,
/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python-pygobjec=
t_2.27.91.bb,
do_cleansstate)
NOTE: Running task 10 of 18 (ID: 17,
/OE/shr-core/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb=
,
do_cleansstate)
NOTE: Running task 13 of 18 (ID: 7,
/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python-pycairo_=
1.8.10.bb,
do_cleansstate)
NOTE: Running task 14 of 18 (ID: 5,
/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyals=
aaudio_0.4.bb,
do_cleansstate)
NOTE: Running task 17 of 18 (ID: 3,
/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/python/python-phone=
utils_git.bb,
do_cleansstate)
NOTE: Running task 18 of 18 (ID: 1,
/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/python/python-numer=
ic_24.2.bb,
do_cleansstate)
NOTE: Running task 3 of 4 (ID: 1,
/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python-pyrex_0.=
9.9.bb,
do_cleansstate)
NOTE: Running task 4 of 4 (ID: 3,
/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python-pyrex-na=
tive_0.9.9.bb,
do_cleansstate)
NOTE: Running task 3 of 4 (ID: 1,
/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/python/python-setup=
tools_0.6c11.bb,
do_cleansstate)
NOTE: Running task 4 of 4 (ID: 3,
virtual:native:/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/pyth=
on/python-setuptools_0.6c11.bb,
do_cleansstate)

Another source of issues are setuptools versions like
http://git.shr-project.org/git/?p=3Dshr-settings.git;a=3Dcommit;h=3Df5d9deb=
ad096e35556261401793d39e1b6c39a3f

or pyrex
NOTE: package python-pycairo-1.8.10-r1: task do_package: Started
ERROR: Function 'do_compile' failed (see
/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-phoneutils-0.0.2+gitr1=
+8a7c719e0c3f1f8c10f77f17422da02d7177f0dd-r3/temp/log.do_compile.14861
for further information)
ERROR: Logfile of failure stored in:
/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-phoneutils-0.0.2+gitr1=
+8a7c719e0c3f1f8c10f77f17422da02d7177f0dd-r3/temp/log.do_compile.14861
Log data follows:
| + cd /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-phoneutils-0.0.=
2+gitr1+8a7c719e0c3f1f8c10f77f17422da02d7177f0dd-r3/git/src/python
| + do_compile
| + setuptools_do_compile
| + distutils_do_compile
| + STAGING_INCDIR=3D/OE/shr-core/tmp/sysroots/om-gta02/usr/include
| + STAGING_LIBDIR=3D/OE/shr-core/tmp/sysroots/om-gta02/usr/lib
| + BUILD_SYS=3Dx86_64-linux
| + HOST_SYS=3Darm-oe-linux-gnueabi
| + /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/python setup.py build
| You need Pyrex -- http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyre=
x/
| + bbfatal 'python setup.py build_ext execution failed.'
| + echo 'ERROR: python setup.py build_ext execution failed.'
| ERROR: python setup.py build_ext execution failed.
| + exit 1
| ERROR: Function 'do_compile' failed (see
/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-phoneutils-0.0.2+gitr1=
+8a7c719e0c3f1f8c10f77f17422da02d7177f0dd-r3/temp/log.do_compile.14861
for further information)


And python-cython-0.13 doesn't work with python-2.7 (maybe it needed
only PR bump for python-cython-native)
ie python-evas fails with:
| checking for pre-generated ./evas/evas.c_evas.c for
./evas/evas.c_evas.pyx... no
| configure: error: PACKAGING ERROR RELEASE BUILD WITHOUT PRE-GENERATED FIL=
ES
cython upgrade sent to meta-oe
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/0353=
16.html

And still trying to fix python-pyrtc and python-pyyaml:
| + /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/python setup.py build
| Traceback (most recent call last):
|   File "setup.py", line 34, in <module>
|     from Cython.Distutils import build_ext
|   File "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-pac=
kages/Cython/Distutils/__init__.py",
line 2, in <module>
|     from Cython.Distutils.extension import Extension
|   File "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-pac=
kages/Cython/Distutils/extension.py",
line 18, in <module>
|     class Extension(_Extension.Extension):
|   File "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-pac=
kages/Cython/Distutils/extension.py",
line 39, in Extension
|     """
| TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
| + bbfatal 'python setup.py build_ext execution failed.'
| + echo 'ERROR: python setup.py build_ext execution failed.'

Regards,


