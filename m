Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RA4Sq-0006eP-16
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Oct 2011 20:39:08 +0200
Received: by iadx2 with SMTP id x2so3311463iad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Oct 2011 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=UIlHJixWglscBKUk6G9QJe2jkWn34QeuWfYXEuFk0II=;
	b=seBSUZUYeJgRT05A8lIg1bNOGDbtnBwJlHO/Z1zI4j6kBs/B5MyJk9c9KunuhtRosj
	bMlo6OyjZArEL0jAX4IkLv8M9EzdBl6QCZqiab2MyfD1gMshbKWPRIEpMdxgiOSeqv7b
	NQyocpoOmoEFKFBMJFqdlkbDWL/HufdjGdYv0=
MIME-Version: 1.0
Received: by 10.68.34.69 with SMTP id x5mr8353744pbi.92.1317494016843; Sat, 01
	Oct 2011 11:33:36 -0700 (PDT)
Received: by 10.142.185.10 with HTTP; Sat, 1 Oct 2011 11:33:36 -0700 (PDT)
In-Reply-To: <20110930184603.GI7364@jama.jama.net>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E0905BBC@orsmsx504.amr.corp.intel.com>
	<20110930184603.GI7364@jama.jama.net>
Date: Sat, 1 Oct 2011 20:33:36 +0200
Message-ID: <CA+chaQcSHh=j9rGCYehU4ce4iQw_ZCoL_oaqxH7kWFZB16NqyQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Sat, 01 Oct 2011 18:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 8:46 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Sep 30, 2011 at 11:40:47AM -0700, Kamble, Nitin A wrote:
>>
>> > -----Original Message-----
>> > From: openembedded-core-bounces@lists.openembedded.org
>> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> > Martin Jansa
>> > Sent: Friday, September 30, 2011 11:38 AM
>> > To: Patches and discussions about the oe-core layer
>> > Subject: Re: [OE-core] [PATCH 4/4] python, python-native: upgrade from
>> > 2.6.6 to 2.7.2
>> >
>> > On Thu, Sep 29, 2011 at 06:27:11PM -0700, nitin.a.kamble@intel.com
>> > wrote:
>> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> > >
>> > > rename from meta/recipes-devtools/python/python-2.6-manifest.inc
>> > > rename to meta/recipes-devtools/python/python-2.7-manifest.inc
>> >
>> > this is wrong.. just to rename it isn't enough
>> >
>> > I will send patch which regenerates manifest with right paths to
>> > actually package something..
>> >
>> > Regards,
>>
>> Hi Martin,
>> =C2=A0 Thanks for catching this. I did not see issue with old manifest. =
But getting new manifest would be better.
>
> Maybe you had python2.6 packages still arround, but for me the issue
> looked like this (because almost all python-* packages were skipped as
> empty)
> -FILES_${PN}-foo=3D"${libdir}/python2.6/foo"
> +FILES_${PN}-foo=3D"${libdir}/python2.7/foo"
>
>
> | Collected errors:
> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependen=
cies
> for task-shr-minimal-fso:
> | =C2=A0* =C2=A0 =C2=A0python-textutils * =C2=A0 =C2=A0 =C2=A0python-mult=
iprocessing *
> python-shell * =C2=A0python-syslog * =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-t=
hreading *
> python-xml * =C2=A0 =C2=A0python-io * =C2=A0python-logging * =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 python-stringold *
> python-ctypes * =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-difflib * =C2=A0 =C2=
=A0 =C2=A0 =C2=A0python-datetime *
> python-logging * =C2=A0 =C2=A0 =C2=A0 =C2=A0python-textutils * =C2=A0 =C2=
=A0python-sqlite3 *
> python-subprocess * =C2=A0 =C2=A0 python-io * =C2=A0 =C2=A0 python-fcntl =
* =C2=A0python-stringold
> * =C2=A0 =C2=A0 =C2=A0python-pprint * =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-=
shell * =C2=A0python-datetime *
> * =C2=A0 =C2=A0 =C2=A0python-codecs *
> | =C2=A0* opkg_install_cmd: Cannot install package task-shr-minimal-fso.
> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependen=
cies
> for task-shr-minimal-gtk:
> | =C2=A0* =C2=A0 =C2=A0libpoppler5 (>=3D 0.12.3) * =C2=A0 =C2=A0 =C2=A0 l=
ibpoppler5 (>=3D 0.12.3) *
> libpoppler5 (>=3D 0.12.3) *
> | =C2=A0* opkg_install_cmd: Cannot install package task-shr-minimal-gtk.
> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependen=
cies
> for task-shr-minimal-apps:
> | =C2=A0* =C2=A0 =C2=A0python-resource * =C2=A0 =C2=A0 =C2=A0 python-io *=
 =C2=A0 =C2=A0 python-terminal *
> python-fcntl * =C2=A0python-shell * =C2=A0python-lang * =C2=A0 python-lan=
g *
> python-lang * =C2=A0 python-lang * =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-cod=
ecs *
> python-lang * =C2=A0 libpoppler5 (>=3D 0.12.3) *
> | =C2=A0* opkg_install_cmd: Cannot install package task-shr-minimal-apps.
> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependen=
cies
> for task-shr-cli:
> | =C2=A0* =C2=A0 =C2=A0python-compression * =C2=A0 =C2=A0python-netclient=
 * =C2=A0 =C2=A0 =C2=A0python-textutils
> * =C2=A0 =C2=A0 =C2=A0python-image * =C2=A0python-mime * =C2=A0 python-js=
on * =C2=A0 python-html *
> * =C2=A0 =C2=A0 =C2=A0python-sqlite3 * =C2=A0 =C2=A0 =C2=A0python-netclie=
nt * =C2=A0 =C2=A0 =C2=A0python-sqlite3 *
> * =C2=A0 =C2=A0 =C2=A0python-netclient *
> | =C2=A0* opkg_install_cmd: Cannot install package task-shr-cli.
> | ERROR: Function 'do_rootfs' failed (see
> /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/shr-image-2.0-r18/temp/lo=
g.do_rootfs.13435
> for further information)
> NOTE: package shr-image-2.0-r18: task do_rootfs: Failed
> ERROR: Task 8
> (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-image.bb,
> do_rootfs) failed with exit code '1'
> ERROR:
> '/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-image.bb'
> failed

Even with right manifest few modules which were built fine before are
failing now

At least
python-syslog
python-elementtree
python-zlib
python-fcntl
python-resource

should be built and maybe they are failing because of:
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/cfield.c:
In function 'PyCField_FromDesc':
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/cfield.c:50:29:
warning: variable 'length' set but not u
sed [-Wunused-but-set-variable]
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/dlmalloc.c:
In function 'mmap_resize':
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/dlmalloc.c:3193:5:
warning: implicit declarat
ion of function 'mremap' [-Wimplicit-function-declaration]
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/dlmalloc.c:
In function 'sys_trim':
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/dlmalloc.c:3612:62:
warning: comparison betwe
en pointer and integer [enabled by default]
"../temp/log.do_compile" [converted] 651L, 90722C

549,1         86%
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/dlmalloc.c:
In function 'sys_trim':
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/dlmalloc.c:3612:62:
warning: comparison betwe
en pointer and integer [enabled by default]
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/python-2.7.2-r0.0/Py=
thon-2.7.2/Modules/_ctypes/libffi/src/arm/ffi.c:204:1:
warning: function declaratio
n isn't a prototype [-Wstrict-prototypes]
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so: file
not recognized: File format not recognized
collect2: ld returned 1 exit status
Looking in readline for ['/OE/shr-core/tmp/sysroots/nokia900/usr/lib']

where

$ file /OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so:
symbolic link to `libpython2.7.so.1.0'

$ file /OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so.1.0
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so.1.0:
ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically
linked, not stripped

more modules are failing but at least those listed above were building
fine with 2.6, can you check it please?

Python build finished, but the necessary bits to build these modules
were not found:
_bsddb             _tkinter           bsddb185
dbm                dl                 imageop
linuxaudiodev      ossaudiodev        sunaudiodev
To find the necessary bits, look in setup.py in detect_modules() for
the module's name.


Failed to build these modules:
_bisect            _codecs_cn         _codecs_hk
_codecs_iso2022    _codecs_jp         _codecs_kr
_codecs_tw         _collections       _csv
_ctypes            _ctypes_test       _curses
_curses_panel      _elementtree       _functools
_hashlib           _heapq             _hotshot
_io                _json              _locale
_lsprof            _multibytecodec    _multiprocessing
_random            _socket            _sqlite3
_ssl               _struct            _testcapi
array              audioop            binascii
bz2                cmath              cPickle
crypt              cStringIO          datetime
fcntl              future_builtins    gdbm
grp                itertools          math
mmap               nis                operator
parser             pyexpat            readline
resource           select             spwd
strop              syslog             termios
time               unicodedata        zlib

Regards,


