Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id D61777606B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:28:13 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id t129-v6so8223515lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9TlYnwqz6gxKaHMpDh3cEihFzBpNssgDwBfR1LNvgds=;
	b=omxlYs1MNJ41PU1VRWecBMWuCE1FurvSrD7XFaU8E3yPxge6fBgNs6GQESqd5pcQyw
	NVrnZAzzIZsv80W3OFaKs+f9rcGEBenIdapIujdbfr9w+GVhxjDHOB8YwapsQ+S6KMpN
	DljComS8egAO4P4HVVOvvoD7G8MP4CTXtmOVLDwwMYmATNI5xrbNyII5yXYAXhPDRQQg
	A0iGNsMHkRPMGpm8ma/AMnUOzCrZSL6ysfG8RXINakHlCnAgcuDVXl04GpujRIULLxt3
	MWdVV9mHgOB+08mow0W/1rjuRQB5kgSLhdGYaceEVFizsbKAGDONlxcevhc41Z9lLe0k
	Y65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9TlYnwqz6gxKaHMpDh3cEihFzBpNssgDwBfR1LNvgds=;
	b=tYQqLps3TVKmtSJ9evGfEAi8f/6nND4qGl/XgO3CGimzIhglPpnF0eSPtGLbFc4127
	BYay5uMoT8uUIILNUbWFv30JN+1c2iztCW6G2I6JggWAH0sDR35AcGOKRLgf/QMnKzwe
	r081oKGt0gzbNrt5wFW50+CNarUDoxBmpmcTbJe2tIpKcYwiwjWUeOLv6TBviFgk5K/G
	3QsowOXGnZAgt6VZoe3n/gUKPs6ICSapFMNTGWQ9oGg08DkReKNsMbc0kyVISL7gvsnP
	xjlALvrGfsyafHLcHXUkJ5MoenqknhOPp7TOgxC5ydopzKB4FfpWJF5G9NQ0OYXJPRxL
	glFw==
X-Gm-Message-State: ALKqPwcw3BYsVB8sD2jPCgEHXRnEHZWJUVUuc6j/sAFV6TnlDU5ajAzR
	3Lk6rzuWsHPY2iln8l+J5cHLT9GbgkAWX0GgG6nE/A==
X-Google-Smtp-Source: AB8JxZo8tkjT9lVKVdsj3cPOmxV0PjYe5zo4jp1M76UNdTIUD2yvZg+VFSdA+fI+c+oPlNrHK6ONWrZDnzgG/7NOLxk=
X-Received: by 2002:a2e:998c:: with SMTP id
	w12-v6mr4466868lji.64.1526048893914; 
	Fri, 11 May 2018 07:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <9536e25b-bbf9-8c21-e44a-c96dd79a848c@digitalendoscopy.de>
	<83aa6f73-2835-4b53-621b-4b9fd3b66b15@digitalendoscopy.de>
	<CAPybu_1RMqH4q96Xm6ekNarz015++49Yu4sSP1SMcj1Yn3D-5A@mail.gmail.com>
	<7e87091c-4989-0383-8bf3-7b9acb805ef8@digitalendoscopy.de>
	<CAPybu_05Bb5FiNgh-bBSCJLVggqq7=F2uzUTbtQhj_sqUVMM+g@mail.gmail.com>
	<CAPybu_3dxKNb04+YcG3vueYt4dtMkEFQvt01zTD6sEJ1=cZzaQ@mail.gmail.com>
	<CAPybu_0bguRvJuMF5wjUcSbHewnO0_2UDSiFa-HTAPn3=vL+hQ@mail.gmail.com>
	<2a4550fc-bf3a-b968-c94a-e7b9f12b105d@digitalendoscopy.de>
In-Reply-To: <2a4550fc-bf3a-b968-c94a-e7b9f12b105d@digitalendoscopy.de>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 11 May 2018 16:27:56 +0200
Message-ID: <CAPybu_25QK8pa+FWoGKmiLE=kqj2gt25D6W=FYWzpZ73HvLT3w@mail.gmail.com>
To: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	ed.bartosh@linux.intel.com
Subject: Re: Question about multi rootfs UIDs when using wic
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
X-List-Received-Date: Fri, 11 May 2018 14:28:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hello

So this is what I have tried out:

I have downloaded master from openembedded-core
(f04e6bd144deb0c8fe2742f66b18904b6619a502)
then:
bitbake core-image-minimal core-image-base syslinux

Create a file  test.wks
part / --source rootfs --fstype=ext4 --rootfs-dir=core-image-base
part /mnt/data1/ --fstype=ext4 --source rootfs
--rootfs-dir=core-image-minimal
part /mnt/data2/ --fstype=ext4 --source rootfs
--rootfs-dir=core-image-minimal

bootloader --timeout=0


Then:
losetup --partscan --find --read-only --show test*direct
sudo mount /dev/loop0p1 /mnt
ls -lan /mnt
total 40
drwxr-xr-x 18    0    0  1024 May 11 16:11 .
drwxr-xr-x 25    0    0  4096 May  6 06:31 ..
drwxr-xr-x  2 1000 1000  3072 May 11 15:51 bin
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 boot
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 dev
drwxr-xr-x 25 1000 1000  3072 May 11 15:51 etc
drwxr-xr-x  3 1000 1000  1024 May 11 13:59 home
drwxr-xr-x  6 1000 1000  3072 May 11 15:51 lib
drwx------  2    0    0 12288 May 11 16:11 lost+found
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 media
drwxr-xr-x  3 1000 1000  1024 May 11 15:50 mnt
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 proc
drwxr-xr-x  2 1000 1000  1024 May 11 15:51 run
drwxr-xr-x  2 1000 1000  3072 May 11 15:51 sbin
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 sys
drwxr-xr-t  2 1000 1000  1024 May 11 13:59 tmp
drwxr-xr-x 10 1000 1000  1024 May 11 14:54 usr
drwxr-xr-x  8 1000 1000  1024 May 11 14:55 var


With my patch:
ricardo@neopili:/tmp/openembedded-core/build$ ls -lan /mnt
total 40
drwxr-xr-x 18 0 0  1024 May 11 16:18 .
drwxr-xr-x 25 0 0  4096 May  6 06:31 ..
drwxr-xr-x  2 0 0  3072 May 11 15:51 bin
drwxr-xr-x  2 0 0  1024 May 11 13:59 boot
drwxr-xr-x  2 0 0  1024 May 11 13:59 dev
drwxr-xr-x 25 0 0  3072 May 11 15:51 etc
drwxr-xr-x  3 0 0  1024 May 11 13:59 home
drwxr-xr-x  6 0 0  3072 May 11 15:51 lib
drwx------  2 0 0 12288 May 11 16:18 lost+found
drwxr-xr-x  2 0 0  1024 May 11 13:59 media
drwxr-xr-x  3 0 0  1024 May 11 15:50 mnt
drwxr-xr-x  2 0 0  1024 May 11 13:59 proc
drwxr-xr-x  2 0 0  1024 May 11 15:51 run
drwxr-xr-x  2 0 0  3072 May 11 15:51 sbin
drwxr-xr-x  2 0 0  1024 May 11 13:59 sys
drwxrwxrwt  2 0 0  1024 May 11 13:59 tmp
drwxr-xr-x 10 0 0  1024 May 11 14:54 usr
drwxr-xr-x  8 0 0  1024 May 11 14:55 var


I think that I am going to send a formal patch to the mailing list and see
if we get some feedback


Cheers!

On Tue, May 8, 2018 at 3:39 PM Volker Vogelhuber <
v.vogelhuber@digitalendoscopy.de> wrote:

> Hi Ricardo,

> On 07.05.2018 15:22, Ricardo Ribalda Delgado wrote:
> > In my case this patch does the trick
> Unfortunately your patch results in having the recovery image's UID and
> GID settings to be set to my current user instead of root. So no, your
> patch does not seem to work for me.
> I didn't have the time to check in detail what's wrong with your version.

> >
> > commit 269334f2400c6ee0c7b4fec7d9bf0f701e50c329 (HEAD -> europa,
origin/europa)
> > Author: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > Date:   Mon May 7 13:54:15 2018 +0200
> >
> >      wic: Fix partition files UIDs on multi rootfs images
> >
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > index 84fe85d62b..49921e7494 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -206,7 +206,7 @@ class Partition():
> >           """
> >           p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" %
native_sysroot)
> >           p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
> > -                                         "%s/../pseudo" %
> > get_bitbake_var("IMAGE_ROOTFS"))
> > +                                         "%s/../pseudo" %  rootfs_dir)
> >           p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
> >           p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
> >           pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > b/scripts/lib/wic/plugins/imager/direct.py
> > index da1c061063..a90a47c926 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -121,6 +121,10 @@ class DirectPlugin(ImagerPlugin):
> >           if self._update_fstab(fstab_lines, self.parts):
> >               # copy rootfs dir to workdir to update fstab
> >               # as rootfs can be used by other tasks and can't be
modified
> > +            new_pseudo = os.path.realpath(os.path.join(self.workdir,
"pseudo"))
> > +            from_dir = os.path.join(os.path.join(image_rootfs, ".."),
"pseudo")
> > +            from_dir = os.path.realpath(from_dir)
> > +            copyhardlinktree(from_dir, new_pseudo)
> >               new_rootfs = os.path.realpath(os.path.join(self.workdir,
> > "rootfs_copy"))
> >               copyhardlinktree(image_rootfs, new_rootfs)
> >               fstab_path = os.path.join(new_rootfs, 'etc/fstab')
> >
> >
> >
> > Can you try it on your setup? If it also works for you I will work on
> > getting it merged.
> >
> >
> > Cheers!
> >
> > On Wed, May 2, 2018 at 8:25 PM, Ricardo Ribalda Delgado
> > <ricardo.ribalda@gmail.com> wrote:
> >> cc: ed
> >>
> >> Is it a very bad idea to revert your patch?
> >>
> >> Thanks!
> >>
> >> On Wed, May 2, 2018 at 8:17 PM, Ricardo Ribalda Delgado
> >> <ricardo.ribalda@gmail.com> wrote:
> >>> Hi
> >>>
> >>> I do not know how many people is actively using wic. We have started
> >>> using it from last week, it is hard to replace old scripts that work
> >>> :)
> >>>
> >>> Try sending it as a proper patch, I can help you if you need it.
> >>>
> >>> Regards
> >>>
> >>> On Wed, May 2, 2018 at 6:31 PM, Volker Vogelhuber
> >>> <v.vogelhuber@digitalendoscopy.de> wrote:
> >>>> Hi,
> >>>>
> >>>> I never got any response to my message (until now). So AFAIK I
solved the
> >>>> problem with the following patch:
> >>>>
> >>>> diff --git a/scripts/lib/wic/partition.py
b/scripts/lib/wic/partition.py
> >>>> index 84fe85d62b..66ab757aec 100644
> >>>> --- a/scripts/lib/wic/partition.py
> >>>> +++ b/scripts/lib/wic/partition.py
> >>>> @@ -204,15 +204,10 @@ class Partition():
> >>>>
> >>>>           Currently handles ext2/3/4, btrfs and vfat.
> >>>>           """
> >>>> -        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" %
> >>>> native_sysroot)
> >>>> -        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
> >>>> -                                         "%s/../pseudo" %
> >>>> get_bitbake_var("IMAGE_ROOTFS"))
> >>>> -        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
> >>>> +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> >>>> +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> >>>> self.rootfs_dir
> >>>> +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> >>>>           p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
> >>>> -        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
> >>>> -        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" %
p_localstatedir
> >>>> -        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
> >>>> -        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
> >>>>           pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> >>>>
> >>>>           rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
> >>>>
> >>>>
> >>>>
> >>>> On 02.05.2018 17:51, Ricardo Ribalda Delgado wrote:
> >>>>>
> >>>>> Hi
> >>>>>
> >>>>> I just got hit by this one. It is specially nasty because nfsroot
> >>>>> fails to boot if the uids are wrong.
> >>>>>
> >>>>> What is the status on this?
> >>>>>
> >>>>> On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber
> >>>>> <v.vogelhuber@digitalendoscopy.de> wrote:
> >>>>>>
> >>>>>> I finally found out, what's the reason why the included recovery
rootfs
> >>>>>> has
> >>>>>> the wrong UIDs, while the main image has the correct one. The
reason
> >>>>>> seems
> >>>>>> to be the PSEUDO_LOCALSTATEDIR variable that is set to the state
dir of
> >>>>>> the
> >>>>>> main image in both cases.
> >>>>>> I debugged all the calls up to the environment setup in
partition.py's
> >>>>>> prepare_rootfs method where a check for an existing
PSEUDO_LOCALSTATEDIR
> >>>>>> environment variable is done. That seems to be the problem.
> >>>>>> Instead of using the correct value passed to the prepare_rootfs
method,
> >>>>>> an
> >>>>>> existing ENV value is used that points to the state dir of the
main image
> >>>>>> instead of the recovery one's. I guess the reason is that in
bitbake.conf
> >>>>>> the PSEUDO_LOCALSTATEDIR is set to the image currently build
(which is
> >>>>>> the
> >>>>>> main image and not the recovery image only referenced by the main
image).
> >>>>>> So
> >>>>>> because that environment variable is already set, the call to
mkfs.ext4
> >>>>>> for
> >>>>>> the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and does
not apply
> >>>>>> the correct UID.
> >>>>>>
> >>>>>> Any ideas how to fix that? I tend to just remove the patch
introduced by
> >>>>>> Ed
> >>>>>> Bartosh three years ago (
https://patchwork.openembedded.org/patch/90419/)
> >>>>>> because I don't need a custom PSEUDO_PREFIX. But maybe not everyone
> >>>>>> agrees.
> >>>>>>
> >>>>>> On 19.01.2018 17:00, Volker Vogelhuber wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> I'm currently trying to create a multi RootFS WIC image as
mentioned in
> >>>>>>> directdisk-multi-rootfs.wks. For that I have two image recipes.
One that
> >>>>>>> is creating only an ext4 image (image-recovery), and the second
that is
> >>>>>>> also
> >>>>>>> creating a WIC image (image-main). I used the IMAGE_FSTYPES
variable for
> >>>>>>> that. The WKS file for the second image is integrating the
recovery
> >>>>>>> image by
> >>>>>>> specifying --rootfs-dir=image-recovery in it's part description.
> >>>>>>>
> >>>>>>> # primary / recovery image
> >>>>>>> part / --source rootfs --rootfs-dir=image-main --exclude-path
mnt/data/
> >>>>>>> mnt/data2/ --fstype=ext4 --label primary_rootfs --align 1024
--size 700
> >>>>>>> --overhead-factor=1.0
> >>>>>>> part /recovery --source rootfs --rootfs-dir=image-recovery
--fstype=ext4
> >>>>>>> --label recovery_rootfs --align 1024 --size 640
--overhead-factor=1.0
> >>>>>>>
> >>>>>>> The UIDs of the second rootfs (image-main) are correctly set to 0
within
> >>>>>>> the file system when calling mkfs.ext4 during prepare_rootfs_ext.
For
> >>>>>>> the
> >>>>>>> recovery rootfs the UID is always set to my own (host) one which
is of
> >>>>>>> course not valid for the image where that UID does not exist.
> >>>>>>> I tried calling the mkfs.ext4 command myself from a terminal and
for
> >>>>>>> whatever reason an image created out of the rootfs folder of the
second
> >>>>>>> image (image-main) recipe is deployed with the correct UID 0,
while the
> >>>>>>> rootfs folder of the first image (image-recovery) recipe always
uses the
> >>>>>>> UID
> >>>>>>> of the source folder/files.
> >>>>>>>
> >>>>>>> I search the code of e2fsprogs for the line that sets the UID and
added
> >>>>>>> a
> >>>>>>> printf in set_inode_extra. There I can see clearly that the
source UID
> >>>>>>> for
> >>>>>>> the file is 0 for the rootfs of the image-main rootfs folder
while it is
> >>>>>>> 10000 (my own UID) for the image-recovery. I wonder how the UID
of the
> >>>>>>> image-main rootfs folder can be zero when I don't call any
command with
> >>>>>>> root
> >>>>>>> permissions. I searched for a preparation step where the UIDs are
> >>>>>>> managed in
> >>>>>>> the scripts folder of Yocto, but didn't found any hint for the
whole
> >>>>>>> behavior. So while it is good that the rootfs partition of the
main
> >>>>>>> rootfs
> >>>>>>> has the UID set correctly to zero, I can't understand why it
happens. On
> >>>>>>> the
> >>>>>>> other side I can understand why the UID of the recovery rootfs is
set to
> >>>>>>> my
> >>>>>>> own one, but it stops me from booting that rootfs because the
UIDs of
> >>>>>>> the
> >>>>>>> files and folders are set to a user that does not exist on the
target
> >>>>>>> system.
> >>>>>>>
> >>>>>>> Can someone please explain to me, how that UID handling is meant
to be
> >>>>>>> done?
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>>
> >>>>
> >>>
> >>>
> >>>
> >>> --
> >>> Ricardo Ribalda
> >>
> >>
> >>
> >> --
> >> Ricardo Ribalda
> >
> >
> >



--
Ricardo Ribalda

