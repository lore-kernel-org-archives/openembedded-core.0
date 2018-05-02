Return-Path: <srifenbark@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 96AE5747F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 18:22:25 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 11-v6so13798567ois.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0KBaTky2FYbXi5WWCfHrNMlvVJTzpUE9NDAMtuEg6Ak=;
	b=bSIImadLq9ULXR/xbprAnZYc9hrFAfPaZR2ofPxu5QHt9wu7w/EW3Tsb/KIgQZe0/6
	kcI1gUM+1mx1deFsS3+nVW3hFaq6Yo+ECCUFl6IA6LlgtFWb6Csfy17iG8W/jcnv4+Nw
	C3B2iQmMD099udmXeCIga5+u/cxasA6SaF5Kxt80bWW2blHg+Lh/el9ZyOIrMwuzxBC0
	r+tMFGTmSANpW6b4o0UhJslCayYrkbEmR/FTRqw3hEZZ1tBuV00ag//9drhd+eK7GIMK
	G4OifB54c9zPejZ9ZzgFRWb9/3HrQr1Cq9DF2BGzHdGiU2G0AVWci9zd3ihDHmDO2ytL
	fAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0KBaTky2FYbXi5WWCfHrNMlvVJTzpUE9NDAMtuEg6Ak=;
	b=XZBnFoCY0iH2niNEJDpR+5Ch/gXdmuUT5sPwShgfFf07UdT3IyK7xMeENahvQEiCiq
	AO6bQx1WxhQykoORzzomRo+DYZUnBILi/aJoud7WdBCuh/uBuMUyfesoZUXhnYE7eImM
	gNutwd+nvZn7dcuNhmbBmoctBySI8tCkb8Kx6ZYNb695TaL4LjrsLUhHWwdr6L9Mqwfc
	jU/s+o844sLvffn5zjMuWHTjp8Qvg0YUA41HDKMOnvfxv+TzrFIO7lXHmsbRydjbrh1j
	TutWAhS3CnUrrSBui1EtSTMvL6jRLFk0MLlRuI6XW8xWAGGoI8qoHbvZ8e5ae7Ty97T0
	kqEg==
X-Gm-Message-State: ALQs6tC8t4/Fk+G1MrheQIvPqJz4/eHCMceqqj3dJgVfyYA8YVR4lKJI
	jNvkG3hjJldCCmZn4+YsA6DJ+pAZMznT/8e2DH8=
X-Google-Smtp-Source: AB8JxZqhQwUguE7N2fBa53ILxOUsp963zdklmUsQWLPJOd6tZ3rxe7FBnL+SIZw/is/tarc7LiA793h9uvMaAkmNCsA=
X-Received: by 2002:aca:d906:: with SMTP id
	q6-v6mr12027872oig.349.1525285346451; 
	Wed, 02 May 2018 11:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7009:0:0:0:0:0 with HTTP;
	Wed, 2 May 2018 11:22:26 -0700 (PDT)
In-Reply-To: <CAPybu_0Qv34jbUdm6HQG_b6Oa9yOgnpkGcqoCkvTCB9fFwEqZw@mail.gmail.com>
References: <9536e25b-bbf9-8c21-e44a-c96dd79a848c@digitalendoscopy.de>
	<83aa6f73-2835-4b53-621b-4b9fd3b66b15@digitalendoscopy.de>
	<CAPybu_1RMqH4q96Xm6ekNarz015++49Yu4sSP1SMcj1Yn3D-5A@mail.gmail.com>
	<7e87091c-4989-0383-8bf3-7b9acb805ef8@digitalendoscopy.de>
	<CAFNP8OsxZhjztMnAxxqBoNKENaPYB+eYov5Lq-b5RPyXcYLrTQ@mail.gmail.com>
	<CAPybu_0Qv34jbUdm6HQG_b6Oa9yOgnpkGcqoCkvTCB9fFwEqZw@mail.gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 2 May 2018 11:22:26 -0700
Message-ID: <CAFNP8OtrxrAPXT5eVT5h3sO5abTPM5G4ENuzCFv=t+cRCw9=2w@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 02 May 2018 18:22:25 -0000
Content-Type: multipart/alternative; boundary="00000000000041a74f056b3d2b38"

--00000000000041a74f056b3d2b38
Content-Type: text/plain; charset="UTF-8"

Thanks Ricardo... that helps me.

Scott

On Wed, May 2, 2018 at 11:18 AM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Hi Scott
>
> In this case I believe that it is a bug in wic, for no reason the user
> id of bitbake should be leaked into the rootfs.
>
> Regards
>
> On Wed, May 2, 2018 at 6:44 PM, Scott Rifenbark <srifenbark@gmail.com>
> wrote:
> > Hi,
> >
> > I have a couple Wic-related areas in the Yocto documentation.  Wondering
> if
> > this affects documentation.  I don't particularly have sections
> dedicated to
> > using specific canned wic files such as the "directdisk-multi-rootfs"
> file.
> > However, if there is some mentioning or changing of the docs to help
> avoid
> > this I could see what I could do.
> >
> > The sections related to Wic are:
> >
> >    *
> > https://www.yoctoproject.org/docs/2.5/dev-manual/dev-
> manual.html#creating-partitioned-images-using-wic
> >    *
> > https://www.yoctoproject.org/docs/2.5/ref-manual/ref-
> manual.html#ref-kickstart
> >
> > Thanks,
> > Scott
> >
> > On Wed, May 2, 2018 at 9:31 AM, Volker Vogelhuber
> > <v.vogelhuber@digitalendoscopy.de> wrote:
> >>
> >> Hi,
> >>
> >> I never got any response to my message (until now). So AFAIK I solved
> the
> >> problem with the following patch:
> >>
> >> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> >> index 84fe85d62b..66ab757aec 100644
> >> --- a/scripts/lib/wic/partition.py
> >> +++ b/scripts/lib/wic/partition.py
> >> @@ -204,15 +204,10 @@ class Partition():
> >>
> >>          Currently handles ext2/3/4, btrfs and vfat.
> >>          """
> >> -        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" %
> >> native_sysroot)
> >> -        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
> >> -                                         "%s/../pseudo" %
> >> get_bitbake_var("IMAGE_ROOTFS"))
> >> -        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
> >> +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> >> +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> >> self.rootfs_dir
> >> +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> >>          p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
> >> -        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
> >> -        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
> >> -        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
> >> -        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
> >>          pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> >>
> >>          rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
> >>
> >>
> >>
> >> On 02.05.2018 17:51, Ricardo Ribalda Delgado wrote:
> >>>
> >>> Hi
> >>>
> >>> I just got hit by this one. It is specially nasty because nfsroot
> >>> fails to boot if the uids are wrong.
> >>>
> >>> What is the status on this?
> >>>
> >>> On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber
> >>> <v.vogelhuber@digitalendoscopy.de> wrote:
> >>>>
> >>>> I finally found out, what's the reason why the included recovery
> rootfs
> >>>> has
> >>>> the wrong UIDs, while the main image has the correct one. The reason
> >>>> seems
> >>>> to be the PSEUDO_LOCALSTATEDIR variable that is set to the state dir
> of
> >>>> the
> >>>> main image in both cases.
> >>>> I debugged all the calls up to the environment setup in partition.py's
> >>>> prepare_rootfs method where a check for an existing
> PSEUDO_LOCALSTATEDIR
> >>>> environment variable is done. That seems to be the problem.
> >>>> Instead of using the correct value passed to the prepare_rootfs
> method,
> >>>> an
> >>>> existing ENV value is used that points to the state dir of the main
> >>>> image
> >>>> instead of the recovery one's. I guess the reason is that in
> >>>> bitbake.conf
> >>>> the PSEUDO_LOCALSTATEDIR is set to the image currently build (which is
> >>>> the
> >>>> main image and not the recovery image only referenced by the main
> >>>> image). So
> >>>> because that environment variable is already set, the call to
> mkfs.ext4
> >>>> for
> >>>> the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and does not
> >>>> apply
> >>>> the correct UID.
> >>>>
> >>>> Any ideas how to fix that? I tend to just remove the patch introduced
> by
> >>>> Ed
> >>>> Bartosh three years ago
> >>>> (https://patchwork.openembedded.org/patch/90419/)
> >>>> because I don't need a custom PSEUDO_PREFIX. But maybe not everyone
> >>>> agrees.
> >>>>
> >>>> On 19.01.2018 17:00, Volker Vogelhuber wrote:
> >>>>>
> >>>>>
> >>>>> I'm currently trying to create a multi RootFS WIC image as mentioned
> in
> >>>>> directdisk-multi-rootfs.wks. For that I have two image recipes. One
> >>>>> that
> >>>>> is creating only an ext4 image (image-recovery), and the second that
> is
> >>>>> also
> >>>>> creating a WIC image (image-main). I used the IMAGE_FSTYPES variable
> >>>>> for
> >>>>> that. The WKS file for the second image is integrating the recovery
> >>>>> image by
> >>>>> specifying --rootfs-dir=image-recovery in it's part description.
> >>>>>
> >>>>> # primary / recovery image
> >>>>> part / --source rootfs --rootfs-dir=image-main --exclude-path
> mnt/data/
> >>>>> mnt/data2/ --fstype=ext4 --label primary_rootfs --align 1024 --size
> 700
> >>>>> --overhead-factor=1.0
> >>>>> part /recovery --source rootfs --rootfs-dir=image-recovery
> >>>>> --fstype=ext4
> >>>>> --label recovery_rootfs --align 1024 --size 640 --overhead-factor=1.0
> >>>>>
> >>>>> The UIDs of the second rootfs (image-main) are correctly set to 0
> >>>>> within
> >>>>> the file system when calling mkfs.ext4 during prepare_rootfs_ext. For
> >>>>> the
> >>>>> recovery rootfs the UID is always set to my own (host) one which is
> of
> >>>>> course not valid for the image where that UID does not exist.
> >>>>> I tried calling the mkfs.ext4 command myself from a terminal and for
> >>>>> whatever reason an image created out of the rootfs folder of the
> second
> >>>>> image (image-main) recipe is deployed with the correct UID 0, while
> the
> >>>>> rootfs folder of the first image (image-recovery) recipe always uses
> >>>>> the UID
> >>>>> of the source folder/files.
> >>>>>
> >>>>> I search the code of e2fsprogs for the line that sets the UID and
> added
> >>>>> a
> >>>>> printf in set_inode_extra. There I can see clearly that the source
> UID
> >>>>> for
> >>>>> the file is 0 for the rootfs of the image-main rootfs folder while it
> >>>>> is
> >>>>> 10000 (my own UID) for the image-recovery. I wonder how the UID of
> the
> >>>>> image-main rootfs folder can be zero when I don't call any command
> with
> >>>>> root
> >>>>> permissions. I searched for a preparation step where the UIDs are
> >>>>> managed in
> >>>>> the scripts folder of Yocto, but didn't found any hint for the whole
> >>>>> behavior. So while it is good that the rootfs partition of the main
> >>>>> rootfs
> >>>>> has the UID set correctly to zero, I can't understand why it happens.
> >>>>> On the
> >>>>> other side I can understand why the UID of the recovery rootfs is set
> >>>>> to my
> >>>>> own one, but it stops me from booting that rootfs because the UIDs of
> >>>>> the
> >>>>> files and folders are set to a user that does not exist on the target
> >>>>> system.
> >>>>>
> >>>>> Can someone please explain to me, how that UID handling is meant to
> be
> >>>>> done?
> >>>>
> >>>>
> >>>>
> >>>> --
> >>>>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>
>
>
> --
> Ricardo Ribalda
>

--00000000000041a74f056b3d2b38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Ricardo... that helps me.<br><br></div>Scott<b=
r></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, M=
ay 2, 2018 at 11:18 AM, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Scott=
<br>
<br>
In this case I believe that it is a bug in wic, for no reason the user<br>
id of bitbake should be leaked into the rootfs.<br>
<br>
Regards<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, May 2, 2018 at 6:44 PM, Scott Rifenbark &lt;<a href=3D"mailto:srife=
nbark@gmail.com">srifenbark@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have a couple Wic-related areas in the Yocto documentation.=C2=A0 Wo=
ndering if<br>
&gt; this affects documentation.=C2=A0 I don&#39;t particularly have sectio=
ns dedicated to<br>
&gt; using specific canned wic files such as the &quot;directdisk-multi-roo=
tfs&quot; file.<br>
&gt; However, if there is some mentioning or changing of the docs to help a=
void<br>
&gt; this I could see what I could do.<br>
&gt;<br>
&gt; The sections related to Wic are:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; <a href=3D"https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual=
.html#creating-partitioned-images-using-wic" rel=3D"noreferrer" target=3D"_=
blank">https://www.yoctoproject.org/<wbr>docs/2.5/dev-manual/dev-<wbr>manua=
l.html#creating-<wbr>partitioned-images-using-wic</a><br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; <a href=3D"https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual=
.html#ref-kickstart" rel=3D"noreferrer" target=3D"_blank">https://www.yocto=
project.org/<wbr>docs/2.5/ref-manual/ref-<wbr>manual.html#ref-kickstart</a>=
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Scott<br>
&gt;<br>
&gt; On Wed, May 2, 2018 at 9:31 AM, Volker Vogelhuber<br>
&gt; &lt;<a href=3D"mailto:v.vogelhuber@digitalendoscopy.de">v.vogelhuber@<=
wbr>digitalendoscopy.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I never got any response to my message (until now). So AFAIK I sol=
ved the<br>
&gt;&gt; problem with the following patch:<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partit=
ion.py<br>
&gt;&gt; index 84fe85d62b..66ab757aec 100644<br>
&gt;&gt; --- a/scripts/lib/wic/partition.py<br>
&gt;&gt; +++ b/scripts/lib/wic/partition.py<br>
&gt;&gt; @@ -204,15 +204,10 @@ class Partition():<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Currently handles ext2/3/4, btrf=
s and vfat.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p_prefix =3D os.environ.get(&quot;PSE=
UDO_PREFIX&quot;<wbr>, &quot;%s/usr&quot; %<br>
&gt;&gt; native_sysroot)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p_localstatedir =3D os.environ.get(&q=
uot;PSEUDO_<wbr>LOCALSTATEDIR&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;%s/../pseudo&quot; %<br>
&gt;&gt; get_bitbake_var(&quot;IMAGE_ROOTFS&quot;<wbr>))<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p_passwd =3D os.environ.get(&quot;PSE=
UDO_PASSWD&quot;<wbr>, rootfs_dir)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo =3D &quot;export PSEUDO_PREFIX=
=3D%s/usr;&quot; % native_sysroot<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_LOCAL=
STATEDIR=3D%s/../<wbr>pseudo;&quot; %<br>
&gt;&gt; self.rootfs_dir<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_PASSW=
D=3D%s;&quot; % rootfs_dir<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p_nosymlinkexp =3D os.environ.ge=
t(&quot;PSEUDO_<wbr>NOSYMLINKEXP&quot;, &quot;1&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo =3D &quot;export PSEUDO_PREFIX=
=3D%s;&quot; % p_prefix<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_LOCAL=
STATEDIR=3D%s;&quot; % p_localstatedir<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_PASSW=
D=3D%s;&quot; % p_passwd<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_NOSYM=
LINKEXP=3D%s;&quot; % p_nosymlinkexp<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;%s &quot; % ge=
t_bitbake_var(&quot;FAKEROOTCMD&quot;)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs =3D &quot;%s/rootfs_%s.%s=
.%s&quot; % (cr_workdir, self.label,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 02.05.2018 17:51, Ricardo Ribalda Delgado wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I just got hit by this one. It is specially nasty because nfsr=
oot<br>
&gt;&gt;&gt; fails to boot if the uids are wrong.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What is the status on this?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:v.vogelhuber@digitalendoscopy.de">v.voge=
lhuber@<wbr>digitalendoscopy.de</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I finally found out, what&#39;s the reason why the include=
d recovery rootfs<br>
&gt;&gt;&gt;&gt; has<br>
&gt;&gt;&gt;&gt; the wrong UIDs, while the main image has the correct one. =
The reason<br>
&gt;&gt;&gt;&gt; seems<br>
&gt;&gt;&gt;&gt; to be the PSEUDO_LOCALSTATEDIR variable that is set to the=
 state dir of<br>
&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt; main image in both cases.<br>
&gt;&gt;&gt;&gt; I debugged all the calls up to the environment setup in pa=
rtition.py&#39;s<br>
&gt;&gt;&gt;&gt; prepare_rootfs method where a check for an existing PSEUDO=
_LOCALSTATEDIR<br>
&gt;&gt;&gt;&gt; environment variable is done. That seems to be the problem=
.<br>
&gt;&gt;&gt;&gt; Instead of using the correct value passed to the prepare_r=
ootfs method,<br>
&gt;&gt;&gt;&gt; an<br>
&gt;&gt;&gt;&gt; existing ENV value is used that points to the state dir of=
 the main<br>
&gt;&gt;&gt;&gt; image<br>
&gt;&gt;&gt;&gt; instead of the recovery one&#39;s. I guess the reason is t=
hat in<br>
&gt;&gt;&gt;&gt; bitbake.conf<br>
&gt;&gt;&gt;&gt; the PSEUDO_LOCALSTATEDIR is set to the image currently bui=
ld (which is<br>
&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt; main image and not the recovery image only referenced by t=
he main<br>
&gt;&gt;&gt;&gt; image). So<br>
&gt;&gt;&gt;&gt; because that environment variable is already set, the call=
 to mkfs.ext4<br>
&gt;&gt;&gt;&gt; for<br>
&gt;&gt;&gt;&gt; the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and=
 does not<br>
&gt;&gt;&gt;&gt; apply<br>
&gt;&gt;&gt;&gt; the correct UID.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Any ideas how to fix that? I tend to just remove the patch=
 introduced by<br>
&gt;&gt;&gt;&gt; Ed<br>
&gt;&gt;&gt;&gt; Bartosh three years ago<br>
&gt;&gt;&gt;&gt; (<a href=3D"https://patchwork.openembedded.org/patch/90419=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded=
.org/patch/90419/</a>)<br>
&gt;&gt;&gt;&gt; because I don&#39;t need a custom PSEUDO_PREFIX. But maybe=
 not everyone<br>
&gt;&gt;&gt;&gt; agrees.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 19.01.2018 17:00, Volker Vogelhuber wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;m currently trying to create a multi RootFS WIC =
image as mentioned in<br>
&gt;&gt;&gt;&gt;&gt; directdisk-multi-rootfs.wks. For that I have two image=
 recipes. One<br>
&gt;&gt;&gt;&gt;&gt; that<br>
&gt;&gt;&gt;&gt;&gt; is creating only an ext4 image (image-recovery), and t=
he second that is<br>
&gt;&gt;&gt;&gt;&gt; also<br>
&gt;&gt;&gt;&gt;&gt; creating a WIC image (image-main). I used the IMAGE_FS=
TYPES variable<br>
&gt;&gt;&gt;&gt;&gt; for<br>
&gt;&gt;&gt;&gt;&gt; that. The WKS file for the second image is integrating=
 the recovery<br>
&gt;&gt;&gt;&gt;&gt; image by<br>
&gt;&gt;&gt;&gt;&gt; specifying --rootfs-dir=3Dimage-recovery in it&#39;s p=
art description.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; # primary / recovery image<br>
&gt;&gt;&gt;&gt;&gt; part / --source rootfs --rootfs-dir=3Dimage-main --exc=
lude-path mnt/data/<br>
&gt;&gt;&gt;&gt;&gt; mnt/data2/ --fstype=3Dext4 --label primary_rootfs --al=
ign 1024 --size 700<br>
&gt;&gt;&gt;&gt;&gt; --overhead-factor=3D1.0<br>
&gt;&gt;&gt;&gt;&gt; part /recovery --source rootfs --rootfs-dir=3Dimage-re=
covery<br>
&gt;&gt;&gt;&gt;&gt; --fstype=3Dext4<br>
&gt;&gt;&gt;&gt;&gt; --label recovery_rootfs --align 1024 --size 640 --over=
head-factor=3D1.0<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The UIDs of the second rootfs (image-main) are correct=
ly set to 0<br>
&gt;&gt;&gt;&gt;&gt; within<br>
&gt;&gt;&gt;&gt;&gt; the file system when calling mkfs.ext4 during prepare_=
rootfs_ext. For<br>
&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt; recovery rootfs the UID is always set to my own (host)=
 one which is of<br>
&gt;&gt;&gt;&gt;&gt; course not valid for the image where that UID does not=
 exist.<br>
&gt;&gt;&gt;&gt;&gt; I tried calling the mkfs.ext4 command myself from a te=
rminal and for<br>
&gt;&gt;&gt;&gt;&gt; whatever reason an image created out of the rootfs fol=
der of the second<br>
&gt;&gt;&gt;&gt;&gt; image (image-main) recipe is deployed with the correct=
 UID 0, while the<br>
&gt;&gt;&gt;&gt;&gt; rootfs folder of the first image (image-recovery) reci=
pe always uses<br>
&gt;&gt;&gt;&gt;&gt; the UID<br>
&gt;&gt;&gt;&gt;&gt; of the source folder/files.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I search the code of e2fsprogs for the line that sets =
the UID and added<br>
&gt;&gt;&gt;&gt;&gt; a<br>
&gt;&gt;&gt;&gt;&gt; printf in set_inode_extra. There I can see clearly tha=
t the source UID<br>
&gt;&gt;&gt;&gt;&gt; for<br>
&gt;&gt;&gt;&gt;&gt; the file is 0 for the rootfs of the image-main rootfs =
folder while it<br>
&gt;&gt;&gt;&gt;&gt; is<br>
&gt;&gt;&gt;&gt;&gt; 10000 (my own UID) for the image-recovery. I wonder ho=
w the UID of the<br>
&gt;&gt;&gt;&gt;&gt; image-main rootfs folder can be zero when I don&#39;t =
call any command with<br>
&gt;&gt;&gt;&gt;&gt; root<br>
&gt;&gt;&gt;&gt;&gt; permissions. I searched for a preparation step where t=
he UIDs are<br>
&gt;&gt;&gt;&gt;&gt; managed in<br>
&gt;&gt;&gt;&gt;&gt; the scripts folder of Yocto, but didn&#39;t found any =
hint for the whole<br>
&gt;&gt;&gt;&gt;&gt; behavior. So while it is good that the rootfs partitio=
n of the main<br>
&gt;&gt;&gt;&gt;&gt; rootfs<br>
&gt;&gt;&gt;&gt;&gt; has the UID set correctly to zero, I can&#39;t underst=
and why it happens.<br>
&gt;&gt;&gt;&gt;&gt; On the<br>
&gt;&gt;&gt;&gt;&gt; other side I can understand why the UID of the recover=
y rootfs is set<br>
&gt;&gt;&gt;&gt;&gt; to my<br>
&gt;&gt;&gt;&gt;&gt; own one, but it stops me from booting that rootfs beca=
use the UIDs of<br>
&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt; files and folders are set to a user that does not exis=
t on the target<br>
&gt;&gt;&gt;&gt;&gt; system.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Can someone please explain to me, how that UID handlin=
g is meant to be<br>
&gt;&gt;&gt;&gt;&gt; done?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
Ricardo Ribalda<br>
</font></span></blockquote></div><br></div>

--00000000000041a74f056b3d2b38--
