Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ubl96-0004uC-1p
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 07:18:05 +0200
Received: by mail-vb0-f46.google.com with SMTP id 10so4788148vbe.19
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 21:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dQjXGw40OEt54ZL2MeY8vcRQ39Oi5N0qG716tzDjrOY=;
	b=Fa8Wbd5bGVvDwpwL+z1PKWi+lL0xUPQNeVFO51+GgdzNk6dEYfnkfMcjF36RBANIse
	sp1cbtGLbYYJOTTAf5OQBdidtid9R04j1VP0NUwnMbX6sTk9rHRuP8pNO2PV00yemd7l
	qNQaZ3cGNKG9g8PArahBq6lls+7fWiKp9OTACWGw1IqmPMQ8QmRBeROIDA5aTa1KUlXs
	AnYMC5VXLRJvvU2GmmMWF+42tKhjjQJixjWf8569VnrV5QSEq1rqTdPi+Cz8mJgmYm63
	LzkFLR/FaBeyY8D/BEeBMTLnzSCopqeqQeqUnFermDfuUXRg/ysTSILPOnr+O+gPcX9W
	2+hA==
MIME-Version: 1.0
X-Received: by 10.220.74.5 with SMTP id s5mr4063177vcj.5.1368421190468; Sun,
	12 May 2013 21:59:50 -0700 (PDT)
Received: by 10.58.66.165 with HTTP; Sun, 12 May 2013 21:59:50 -0700 (PDT)
In-Reply-To: <cover.1367919920.git.liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
Date: Mon, 13 May 2013 14:59:50 +1000
Message-ID: <CANwerB3vdQu+WCYv-WzBMMFyv77LymqLkjp3wVMFHCO=KF53Dg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: dvhart@linux.intel.com, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Mon, 13 May 2013 05:18:32 -0000
X-List-Received-Date: Mon, 13 May 2013 05:18:32 -0000
Content-Type: multipart/alternative; boundary=e89a8ff25604f6194a04dc92629a

--e89a8ff25604f6194a04dc92629a
Content-Type: text/plain; charset=UTF-8

Hi Robert,

I get the following errors doing filesystem check on the ext4 image:

# fsck.ext4 -fn tmp/deploy/images/custom-image-custom.ext4.ext4
e2fsck 1.42.7 (21-Jan-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Entry 'mtd7' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'mtd4' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'fb0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'mtd5' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty6' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'random' in /dev (2739) has an incorrect filetype (was 4, should be
3).
Fix? no

Entry 'mtd1' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'urandom' in /dev (2739) has an incorrect filetype (was 4, should be
3).
Fix? no

Entry 'zero' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'null' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'kmsg' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'kmem' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'mtd6' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty7' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty4' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'apm_bios' in /dev (2739) has an incorrect filetype (was 4, should be
3).
Fix? no

Entry 'tty5' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'mtd0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'ttySA0' in /dev (2739) has an incorrect filetype (was 4, should be
3).
Fix? no

Entry 'mem' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'mtd2' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty8' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'console' in /dev (2739) has an incorrect filetype (was 4, should be
3).
Fix? no

Entry 'ttyS0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty2' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'mtd3' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty1' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Entry 'tty3' in /dev (2739) has an incorrect filetype (was 4, should be 3).
Fix? no

Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Inode 774 ref count is 9, should be 10.  Fix? no

Pass 5: Checking group summary information

tmp/deploy/images/custom-image-custom.ext4.ext4: ********** WARNING:
Filesystem still has errors **********

tmp/deploy/images/custom-image-custom.ext4.ext4: 3899/21336 files (0.5%
non-contiguous), 131042/169656 blocks


After booting the image I get the following:
# dmesg | grep EXT4-fs
EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-machine: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-machine: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs (sda2): re-mounted. Opts: (null)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
0(0), depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810: comm
login: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
depth 0(0)
EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810: comm
sshd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
depth 0(0)


# systemctl --failed | cat
UNIT                     LOAD   ACTIVE SUB    DESCRIPTION
machineid.service        loaded failed failed Machine ID first boot
configure
systemd-journald.service loaded failed failed Journal Service
systemd-journald.socket  loaded failed failed Journal Socket

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

3 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.


I am booting kernel with rootfstype=ext4. IMAGE_FSTYPES = "ext4".

Regards,
Jonathan


On 7 May 2013 19:48, Robert Yang <liezhi.yang@windriver.com> wrote:

> * The benefits:
>   - Really support ext4
>   - Support the sparse file (the sparse file became into the common file
> before)
>   - Have a uniform code for ext2/3/4 generation
>   - Remove the depends on genext2fs-native
>
> * Impact
>   - Build time:
>     a) If we build fresh core-image-sato, there is nearly no impact.
>     b) If we do the image generation, which means:
>        $ bitbake core-image-sato
>        $ bitbake core-image-sato -ccleansstate
>        $ bitbake core-image-sato
>    About 50 extra seconds are needed, here is my test result:
>    Before the patches: 4m25s
>    After the patches: 5m17s
>    This is because the genext2fs is much faster than the
>    populate-extfs.sh, we will replace this script by the mke2fs when it
>    supports create the filesystem from a initial directory.
>
>   - Disk space (take core-image-sato as an example)
>     a) The image file size is the same as before (529M)
>     b) The disk usage is a little different: (du -sh)
>               before       now
>        ext2:  364M         388M
>        ext3:  381M         404M
>        ext4:  380M         387M
>
>    We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 1.4.
>
>    I have done some simple runtime testing on core-image-sato and
>    core-image-minimal, they worked well.
>
> // Robert
>
> The following changes since commit
> 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
>
>   grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib robert/ext4
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4
>
> Robert Yang (4):
>   e2fsprogs: the max length of debugfs argument is too short
>   e2fsprogs: let debugfs do sparse copy
>   e2fsprogs: add populate-extfs.sh
>   image_types.bbclass: replace genext2fs with populate-extfs.sh
>
>  meta/classes/image_types.bbclass                   |   46 ++++----
>  .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 +++++
>  .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   |   93 ++++++++++++++++
>  .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114
> ++++++++++++++++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    4 +
>  5 files changed, 257 insertions(+), 28 deletions(-)
>  create mode 100644
> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
>  create mode 100644
> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
>  create mode 100644
> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8ff25604f6194a04dc92629a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<div><br></div><div>I get the following errors d=
oing filesystem check on the ext4 image:</div><div><br></div><div><div># fs=
ck.ext4 -fn tmp/deploy/images/custom-image-custom.ext4.ext4</div><div>e2fsc=
k 1.42.7 (21-Jan-2013)</div>
<div>Pass 1: Checking inodes, blocks, and sizes</div><div>Pass 2: Checking =
directory structure</div><div>Entry &#39;mtd7&#39; in /dev (2739) has an in=
correct filetype (was 4, should be 3).</div><div>Fix? no</div><div><br>
</div><div>Entry &#39;mtd4&#39; in /dev (2739) has an incorrect filetype (w=
as 4, should be 3).</div><div>Fix? no</div><div><br></div><div>Entry &#39;f=
b0&#39; in /dev (2739) has an incorrect filetype (was 4, should be 3).</div=
>
<div>Fix? no</div><div><br></div><div>Entry &#39;mtd5&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;tty&#39; in /dev (2739) has an incorrect filetype=
 (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;tty6&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;random&#39; in /dev (2739) has an incorrect filet=
ype (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;mtd1&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;urandom&#39; in /dev (2739) has an incorrect file=
type (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;zero&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;null&#39; in /dev (2739) has an incorrect filetyp=
e (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;kmsg&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;kmem&#39; in /dev (2739) has an incorrect filetyp=
e (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;mtd6&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;tty7&#39; in /dev (2739) has an incorrect filetyp=
e (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;tty4&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;apm_bios&#39; in /dev (2739) has an incorrect fil=
etype (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;tty5&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;mtd0&#39; in /dev (2739) has an incorrect filetyp=
e (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;tty0&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;ttySA0&#39; in /dev (2739) has an incorrect filet=
ype (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;mem&#39; in /dev (2739) ha=
s an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div><=
br></div><div>Entry &#39;mtd2&#39; in /dev (2739) has an incorrect filetype=
 (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;tty8&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;console&#39; in /dev (2739) has an incorrect file=
type (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;ttyS0&#39; in /dev (2739) =
has an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div=
><br></div><div>Entry &#39;tty2&#39; in /dev (2739) has an incorrect filety=
pe (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;mtd3&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Entry &#39;tty1&#39; in /dev (2739) has an incorrect filetyp=
e (was 4, should be 3).</div>
<div>Fix? no</div><div><br></div><div>Entry &#39;tty3&#39; in /dev (2739) h=
as an incorrect filetype (was 4, should be 3).</div><div>Fix? no</div><div>=
<br></div><div>Pass 3: Checking directory connectivity</div><div>Pass 4: Ch=
ecking reference counts</div>
<div>Inode 774 ref count is 9, should be 10. =C2=A0Fix? no</div><div><br></=
div><div>Pass 5: Checking group summary information</div><div><br></div><di=
v>tmp/deploy/images/custom-image-custom.ext4.ext4: ********** WARNING: File=
system still has errors **********</div>
<div><br></div><div>tmp/deploy/images/custom-image-custom.ext4.ext4: 3899/2=
1336 files (0.5% non-contiguous), 131042/169656 blocks</div></div><div><br>=
</div><div style><br></div><div style>After booting the image I get the fol=
lowing:</div>
<div style><div># dmesg | grep EXT4-fs</div><div>EXT4-fs (sda2): mounted fi=
lesystem with ordered data mode. Opts: (null)</div><div>EXT4-fs error (devi=
ce sda2): ext4_ext_check_inode:467: inode #883: comm systemd: bad header/ex=
tent: invalid magic - magic 0, entries 0, max 0(0), depth 0(0)</div>
<div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: com=
m systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),=
 depth 0(0)</div><div>EXT4-fs error (device sda2): ext4_ext_check_inode:467=
: inode #883: comm systemd: bad header/extent: invalid magic - magic 0, ent=
ries 0, max 0(0), depth 0(0)</div>
<div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: com=
m systemd-machine: bad header/extent: invalid magic - magic 0, entries 0, m=
ax 0(0), depth 0(0)</div><div>EXT4-fs error (device sda2): ext4_ext_check_i=
node:467: inode #883: comm systemd-machine: bad header/extent: invalid magi=
c - magic 0, entries 0, max 0(0), depth 0(0)</div>
<div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: com=
m systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, m=
ax 0(0), depth 0(0)</div><div>EXT4-fs (sda2): re-mounted. Opts: (null)</div=
>
<div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: com=
m systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, m=
ax 0(0), depth 0(0)</div><div>EXT4-fs error (device sda2): ext4_ext_check_i=
node:467: inode #883: comm systemd-journal: bad header/extent: invalid magi=
c - magic 0, entries 0, max 0(0), depth 0(0)</div>
<div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: com=
m systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, m=
ax 0(0), depth 0(0)</div><div>EXT4-fs error (device sda2): ext4_ext_check_i=
node:467: inode #883: comm systemd-journal: bad header/extent: invalid magi=
c - magic 0, entries 0, max 0(0), depth 0(0)</div>
<div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810: com=
m login: bad header/extent: invalid magic - magic 0, entries 0, max 0(0), d=
epth 0(0)</div><div>EXT4-fs error (device sda2): ext4_ext_check_inode:467: =
inode #810: comm sshd: bad header/extent: invalid magic - magic 0, entries =
0, max 0(0), depth 0(0)</div>
<div><br></div><div><br></div><div><div># systemctl --failed | cat</div><di=
v>UNIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LOAD =C2=A0 ACTIVE SUB =C2=A0 =C2=A0DESCRIPTION</div><div>machineid.ser=
vice =C2=A0 =C2=A0 =C2=A0 =C2=A0loaded failed failed Machine ID first boot =
configure</div>
<div>systemd-journald.service loaded failed failed Journal Service</div><di=
v>systemd-journald.socket =C2=A0loaded failed failed Journal Socket</div><d=
iv><br></div><div>LOAD =C2=A0 =3D Reflects whether the unit definition was =
properly loaded.</div>
<div>ACTIVE =3D The high-level unit activation state, i.e. generalization o=
f SUB.</div><div>SUB =C2=A0 =C2=A0=3D The low-level unit activation state, =
values depend on unit type.</div><div><br></div><div>3 loaded units listed.=
 Pass --all to see loaded but inactive units, too.</div>
<div>To show all installed unit files use &#39;systemctl list-unit-files&#3=
9;.</div></div><div><br></div><div><br></div><div style>I am booting kernel=
 with rootfstype=3Dext4. IMAGE_FSTYPES =3D &quot;ext4&quot;.</div><div><br>
</div></div><div style>Regards,</div><div style>Jonathan</div><div class=3D=
"gmail_extra"><br><br><div class=3D"gmail_quote">On 7 May 2013 19:48, Rober=
t Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" t=
arget=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">* The benefits:<br>
=C2=A0 - Really support ext4<br>
=C2=A0 - Support the sparse file (the sparse file became into the common fi=
le before)<br>
=C2=A0 - Have a uniform code for ext2/3/4 generation<br>
=C2=A0 - Remove the depends on genext2fs-native<br>
<br>
* Impact<br>
=C2=A0 - Build time:<br>
=C2=A0 =C2=A0 a) If we build fresh core-image-sato, there is nearly no impa=
ct.<br>
=C2=A0 =C2=A0 b) If we do the image generation, which means:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ bitbake core-image-sato<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ bitbake core-image-sato -ccleansstate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ bitbake core-image-sato<br>
=C2=A0 =C2=A0About 50 extra seconds are needed, here is my test result:<br>
=C2=A0 =C2=A0Before the patches: 4m25s<br>
=C2=A0 =C2=A0After the patches: 5m17s<br>
=C2=A0 =C2=A0This is because the genext2fs is much faster than the<br>
=C2=A0 =C2=A0populate-extfs.sh, we will replace this script by the mke2fs w=
hen it<br>
=C2=A0 =C2=A0supports create the filesystem from a initial directory.<br>
<br>
=C2=A0 - Disk space (take core-image-sato as an example)<br>
=C2=A0 =C2=A0 a) The image file size is the same as before (529M)<br>
=C2=A0 =C2=A0 b) The disk usage is a little different: (du -sh)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 before =C2=A0 =C2=A0 =C2=
=A0 now<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ext2: =C2=A0364M =C2=A0 =C2=A0 =C2=A0 =C2=A0 388=
M<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ext3: =C2=A0381M =C2=A0 =C2=A0 =C2=A0 =C2=A0 404=
M<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ext4: =C2=A0380M =C2=A0 =C2=A0 =C2=A0 =C2=A0 387=
M<br>
<br>
=C2=A0 =C2=A0We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 1.=
4.<br>
<br>
=C2=A0 =C2=A0I have done some simple runtime testing on core-image-sato and=
<br>
=C2=A0 =C2=A0core-image-minimal, they worked well.<br>
<br>
// Robert<br>
<br>
The following changes since commit 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8=
:<br>
<br>
=C2=A0 grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" target=3D"_b=
lank">git.pokylinux.org/poky-contrib</a> robert/ext4<br>
=C2=A0 <a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dr=
obert/ext4" target=3D"_blank">http://git.pokylinux.org/cgit.cgi/poky-contri=
b/log/?h=3Drobert/ext4</a><br>
<br>
Robert Yang (4):<br>
=C2=A0 e2fsprogs: the max length of debugfs argument is too short<br>
=C2=A0 e2fsprogs: let debugfs do sparse copy<br>
=C2=A0 e2fsprogs: add populate-extfs.sh<br>
=C2=A0 image_types.bbclass: replace genext2fs with populate-extfs.sh<br>
<br>
=C2=A0meta/classes/image_types.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 46 ++++----<br>
=C2=A0.../e2fsprogs-1.42.7/debugfs-too-short.patch =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 28 +++++<br>
=C2=A0.../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh =C2=A0 | =C2=A0 93 +=
+++++++++++++++<br>
=C2=A0.../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch =C2=A0 | =C2=A0114 +=
+++++++++++++++++++<br>
=C2=A0.../recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.7.bb"=
 target=3D"_blank">e2fsprogs_1.42.7.bb</a> | =C2=A0 =C2=A04 +<br>
=C2=A05 files changed, 257 insertions(+), 28 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/d=
ebugfs-too-short.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/p=
opulate-extfs.sh<br>
=C2=A0create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/s=
parse_copy.patch<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
1.7.10.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--e89a8ff25604f6194a04dc92629a--
