Return-Path: <srifenbark@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 72DFF6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 16:44:45 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id t1-v6so17342863oth.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 09:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nOwwgZtEAvP0nMiNhGuWdpU/tTkGLf/M1alIS1FkMwE=;
	b=Ewj/0AAOTbPU5zye6VBObGY7gcJTsQOpRRfPWxJMJjjdk8+Zj9uBvOK/EvgOoM7KZd
	aCBfylcSjls4+xsifo1n8OA1/YNjKeNZon3jB2jh5RLGvqDEcBGXdNAxfqsD9SIo0lnm
	PzPeoGdFcySVuB7CeMMy1nnk03HItvhpHacylW/BlrvV8vlnuIa2SwvLnXpQLwGON9X0
	ExeGSXhSg0Lx2ci3GbB+oS40eJwe5RruMCz9DndF76Tyv3ujvqlpOKFeYQJj4t9W9f1+
	Y9tvf4QVZeDNzGFC1Iz78yAR1g+vD7w4OsWC8IuNwp/k4ufKk+kT4nL0YC3fHzEg58E+
	KlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nOwwgZtEAvP0nMiNhGuWdpU/tTkGLf/M1alIS1FkMwE=;
	b=ZO00w/EuxCXfxA2xzI6XRt15XMnZCaeYutYJ4G4FFI3X7XVr6CagdXvJ1r3DDwlDrU
	TQ748E4guywJSWBQebek11q3bY1+N3BLFKeXSFNQVQBnELFAqKKo41He5oUyXcF2plwg
	vXT1c2DOk1B+eFMDUxp3v9L3i/7TW7A+3TGSdxx2goYYyAj0OXaWo68gJIN5ROhN6pEU
	Bbl5WvNH1AHdt7kxzH3jJeZr/CQ9k9VD3CsVPmhtT/p41PnqYTuhGTwoSY4r0i79ty4G
	YuuyuE9CVLQpV/1Ia+uqOHExCSkOMX/sBTEQ3AXI/PNJ4Jycl+fS+dx561QjoCuz7Bzt
	5rkw==
X-Gm-Message-State: ALQs6tBZYgPduMbLJ5kG6XOVDan4boQA7nn4+b716xjQ1PU0P9iyhRkv
	LJhdFQCIQX/rCjDuBAwEcv+Dt40MvUmZAQ3hrIY=
X-Google-Smtp-Source: AB8JxZpa+F5Ut4xuTdqgWaCNf9XGgCN0P9kS57cBo26S849uQRN3Pr34GFqLOo7uk9aD6H+NIcoy22ZxUPPyrPV5xpA=
X-Received: by 2002:a9d:56ab:: with SMTP id
	o40-v6mr13339076oth.3.1525279485976; 
	Wed, 02 May 2018 09:44:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7009:0:0:0:0:0 with HTTP;
	Wed, 2 May 2018 09:44:45 -0700 (PDT)
In-Reply-To: <7e87091c-4989-0383-8bf3-7b9acb805ef8@digitalendoscopy.de>
References: <9536e25b-bbf9-8c21-e44a-c96dd79a848c@digitalendoscopy.de>
	<83aa6f73-2835-4b53-621b-4b9fd3b66b15@digitalendoscopy.de>
	<CAPybu_1RMqH4q96Xm6ekNarz015++49Yu4sSP1SMcj1Yn3D-5A@mail.gmail.com>
	<7e87091c-4989-0383-8bf3-7b9acb805ef8@digitalendoscopy.de>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 2 May 2018 09:44:45 -0700
Message-ID: <CAFNP8OsxZhjztMnAxxqBoNKENaPYB+eYov5Lq-b5RPyXcYLrTQ@mail.gmail.com>
To: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 02 May 2018 16:44:45 -0000
Content-Type: multipart/alternative; boundary="000000000000f1e593056b3bcded"

--000000000000f1e593056b3bcded
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a couple Wic-related areas in the Yocto documentation.  Wondering if
this affects documentation.  I don't particularly have sections dedicated
to using specific canned wic files such as the "directdisk-multi-rootfs"
file.  However, if there is some mentioning or changing of the docs to help
avoid this I could see what I could do.

The sections related to Wic are:

   *
https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#creating-partitioned-images-using-wic
   *
https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ref-kickstart

Thanks,
Scott

On Wed, May 2, 2018 at 9:31 AM, Volker Vogelhuber <
v.vogelhuber@digitalendoscopy.de> wrote:

> Hi,
>
> I never got any response to my message (until now). So AFAIK I solved the
> problem with the following patch:
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 84fe85d62b..66ab757aec 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -204,15 +204,10 @@ class Partition():
>
>          Currently handles ext2/3/4, btrfs and vfat.
>          """
> -        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" %
> native_sysroot)
> -        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
> -                                         "%s/../pseudo" %
> get_bitbake_var("IMAGE_ROOTFS"))
> -        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
> +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> self.rootfs_dir
> +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
>          p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
> -        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
> -        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
> -        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
> -        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
>          pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
>
>          rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
>
>
>
> On 02.05.2018 17:51, Ricardo Ribalda Delgado wrote:
>
>> Hi
>>
>> I just got hit by this one. It is specially nasty because nfsroot
>> fails to boot if the uids are wrong.
>>
>> What is the status on this?
>>
>> On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber
>> <v.vogelhuber@digitalendoscopy.de> wrote:
>>
>>> I finally found out, what's the reason why the included recovery rootfs
>>> has
>>> the wrong UIDs, while the main image has the correct one. The reason
>>> seems
>>> to be the PSEUDO_LOCALSTATEDIR variable that is set to the state dir of
>>> the
>>> main image in both cases.
>>> I debugged all the calls up to the environment setup in partition.py's
>>> prepare_rootfs method where a check for an existing PSEUDO_LOCALSTATEDIR
>>> environment variable is done. That seems to be the problem.
>>> Instead of using the correct value passed to the prepare_rootfs method,
>>> an
>>> existing ENV value is used that points to the state dir of the main image
>>> instead of the recovery one's. I guess the reason is that in bitbake.conf
>>> the PSEUDO_LOCALSTATEDIR is set to the image currently build (which is
>>> the
>>> main image and not the recovery image only referenced by the main
>>> image). So
>>> because that environment variable is already set, the call to mkfs.ext4
>>> for
>>> the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and does not apply
>>> the correct UID.
>>>
>>> Any ideas how to fix that? I tend to just remove the patch introduced by
>>> Ed
>>> Bartosh three years ago (https://patchwork.openembedded.org/patch/90419/
>>> )
>>> because I don't need a custom PSEUDO_PREFIX. But maybe not everyone
>>> agrees.
>>>
>>> On 19.01.2018 17:00, Volker Vogelhuber wrote:
>>>
>>>>
>>>> I'm currently trying to create a multi RootFS WIC image as mentioned in
>>>> directdisk-multi-rootfs.wks. For that I have two image recipes. One that
>>>> is creating only an ext4 image (image-recovery), and the second that is
>>>> also
>>>> creating a WIC image (image-main). I used the IMAGE_FSTYPES variable for
>>>> that. The WKS file for the second image is integrating the recovery
>>>> image by
>>>> specifying --rootfs-dir=image-recovery in it's part description.
>>>>
>>>> # primary / recovery image
>>>> part / --source rootfs --rootfs-dir=image-main --exclude-path mnt/data/
>>>> mnt/data2/ --fstype=ext4 --label primary_rootfs --align 1024 --size 700
>>>> --overhead-factor=1.0
>>>> part /recovery --source rootfs --rootfs-dir=image-recovery --fstype=ext4
>>>> --label recovery_rootfs --align 1024 --size 640 --overhead-factor=1.0
>>>>
>>>> The UIDs of the second rootfs (image-main) are correctly set to 0 within
>>>> the file system when calling mkfs.ext4 during prepare_rootfs_ext. For
>>>> the
>>>> recovery rootfs the UID is always set to my own (host) one which is of
>>>> course not valid for the image where that UID does not exist.
>>>> I tried calling the mkfs.ext4 command myself from a terminal and for
>>>> whatever reason an image created out of the rootfs folder of the second
>>>> image (image-main) recipe is deployed with the correct UID 0, while the
>>>> rootfs folder of the first image (image-recovery) recipe always uses
>>>> the UID
>>>> of the source folder/files.
>>>>
>>>> I search the code of e2fsprogs for the line that sets the UID and added
>>>> a
>>>> printf in set_inode_extra. There I can see clearly that the source UID
>>>> for
>>>> the file is 0 for the rootfs of the image-main rootfs folder while it is
>>>> 10000 (my own UID) for the image-recovery. I wonder how the UID of the
>>>> image-main rootfs folder can be zero when I don't call any command with
>>>> root
>>>> permissions. I searched for a preparation step where the UIDs are
>>>> managed in
>>>> the scripts folder of Yocto, but didn't found any hint for the whole
>>>> behavior. So while it is good that the rootfs partition of the main
>>>> rootfs
>>>> has the UID set correctly to zero, I can't understand why it happens.
>>>> On the
>>>> other side I can understand why the UID of the recovery rootfs is set
>>>> to my
>>>> own one, but it stops me from booting that rootfs because the UIDs of
>>>> the
>>>> files and folders are set to a user that does not exist on the target
>>>> system.
>>>>
>>>> Can someone please explain to me, how that UID handling is meant to be
>>>> done?
>>>>
>>>
>>>
>>> --
>>>
>>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f1e593056b3bcded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi, <br><br></div>I have a couple Wic-=
related areas in the Yocto documentation.=C2=A0 Wondering if this affects d=
ocumentation.=C2=A0 I don&#39;t particularly have sections dedicated to usi=
ng specific canned wic files such as the &quot;directdisk-multi-rootfs&quot=
; file.=C2=A0 However, if there is some mentioning or changing of the docs =
to help avoid this I could see what I could do.<br><br></div>The sections r=
elated to Wic are:<br><br>=C2=A0=C2=A0 * <a href=3D"https://www.yoctoprojec=
t.org/docs/2.5/dev-manual/dev-manual.html#creating-partitioned-images-using=
-wic">https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#crea=
ting-partitioned-images-using-wic</a><br>=C2=A0=C2=A0 * <a href=3D"https://=
www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ref-kickstart">htt=
ps://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ref-kickstart=
</a><br><br></div>Thanks,<br></div>Scott<br></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Wed, May 2, 2018 at 9:31 AM, Volker Vog=
elhuber <span dir=3D"ltr">&lt;<a href=3D"mailto:v.vogelhuber@digitalendosco=
py.de" target=3D"_blank">v.vogelhuber@digitalendoscopy.de</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I never got any response to my message (until now). So AFAIK I solved the p=
roblem with the following patch:<br>
<br>
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py<br=
>
index 84fe85d62b..66ab757aec 100644<br>
--- a/scripts/lib/wic/partition.py<br>
+++ b/scripts/lib/wic/partition.py<br>
@@ -204,15 +204,10 @@ class Partition():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Currently handles ext2/3/4, btrfs and vfa=
t.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p_prefix =3D os.environ.get(&quot;PSEUDO_PREFI=
X&quot;<wbr>, &quot;%s/usr&quot; % native_sysroot)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p_localstatedir =3D os.environ.get(&quot;PSEUD=
O_LOCALST<wbr>ATEDIR&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;%s/../pseudo&quot; % get_bitbake_var(&quot;IMAGE_ROOTFS&quot;<wbr>))<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p_passwd =3D os.environ.get(&quot;PSEUDO_PASSW=
D&quot;<wbr>, rootfs_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo =3D &quot;export PSEUDO_PREFIX=3D%s/usr=
;&quot; % native_sysroot<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_LOCALSTATEDIR=
=3D%s/../pse<wbr>udo;&quot; % self.rootfs_dir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_PASSWD=3D%s;&q=
uot; % rootfs_dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p_nosymlinkexp =3D os.environ.get(&quot;P=
SEUDO_NOSYMLI<wbr>NKEXP&quot;, &quot;1&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo =3D &quot;export PSEUDO_PREFIX=3D%s;&qu=
ot; % p_prefix<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_LOCALSTATEDIR=
=3D%s;&quot; % p_localstatedir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_PASSWD=3D%s;&q=
uot; % p_passwd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo +=3D &quot;export PSEUDO_NOSYMLINKEXP=
=3D%s;&quot; % p_nosymlinkexp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo +=3D &quot;%s &quot; % get_bitbake=
_var(&quot;FAKEROOTCMD&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs =3D &quot;%s/rootfs_%s.%s.%s&quot;=
 % (cr_workdir, self.label,<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
On 02.05.2018 17:51, Ricardo Ribalda Delgado wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi<br>
<br>
I just got hit by this one. It is specially nasty because nfsroot<br>
fails to boot if the uids are wrong.<br>
<br>
What is the status on this?<br>
<br>
On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber<br>
&lt;<a href=3D"mailto:v.vogelhuber@digitalendoscopy.de" target=3D"_blank">v=
.vogelhuber@digitalendoscopy<wbr>.de</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I finally found out, what&#39;s the reason why the included recovery rootfs=
 has<br>
the wrong UIDs, while the main image has the correct one. The reason seems<=
br>
to be the PSEUDO_LOCALSTATEDIR variable that is set to the state dir of the=
<br>
main image in both cases.<br>
I debugged all the calls up to the environment setup in partition.py&#39;s<=
br>
prepare_rootfs method where a check for an existing PSEUDO_LOCALSTATEDIR<br=
>
environment variable is done. That seems to be the problem.<br>
Instead of using the correct value passed to the prepare_rootfs method, an<=
br>
existing ENV value is used that points to the state dir of the main image<b=
r>
instead of the recovery one&#39;s. I guess the reason is that in bitbake.co=
nf<br>
the PSEUDO_LOCALSTATEDIR is set to the image currently build (which is the<=
br>
main image and not the recovery image only referenced by the main image). S=
o<br>
because that environment variable is already set, the call to mkfs.ext4 for=
<br>
the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and does not apply<b=
r>
the correct UID.<br>
<br>
Any ideas how to fix that? I tend to just remove the patch introduced by Ed=
<br>
Bartosh three years ago (<a href=3D"https://patchwork.openembedded.org/patc=
h/90419/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedd=
e<wbr>d.org/patch/90419/</a>)<br>
because I don&#39;t need a custom PSEUDO_PREFIX. But maybe not everyone agr=
ees.<br>
<br>
On 19.01.2018 17:00, Volker Vogelhuber wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I&#39;m currently trying to create a multi RootFS WIC image as mentioned in=
<br>
directdisk-multi-rootfs.wks. For that I have two image recipes. One that<br=
>
is creating only an ext4 image (image-recovery), and the second that is als=
o<br>
creating a WIC image (image-main). I used the IMAGE_FSTYPES variable for<br=
>
that. The WKS file for the second image is integrating the recovery image b=
y<br>
specifying --rootfs-dir=3Dimage-recovery in it&#39;s part description.<br>
<br>
# primary / recovery image<br>
part / --source rootfs --rootfs-dir=3Dimage-main --exclude-path mnt/data/<b=
r>
mnt/data2/ --fstype=3Dext4 --label primary_rootfs --align 1024 --size 700<b=
r>
--overhead-factor=3D1.0<br>
part /recovery --source rootfs --rootfs-dir=3Dimage-recovery --fstype=3Dext=
4<br>
--label recovery_rootfs --align 1024 --size 640 --overhead-factor=3D1.0<br>
<br>
The UIDs of the second rootfs (image-main) are correctly set to 0 within<br=
>
the file system when calling mkfs.ext4 during prepare_rootfs_ext. For the<b=
r>
recovery rootfs the UID is always set to my own (host) one which is of<br>
course not valid for the image where that UID does not exist.<br>
I tried calling the mkfs.ext4 command myself from a terminal and for<br>
whatever reason an image created out of the rootfs folder of the second<br>
image (image-main) recipe is deployed with the correct UID 0, while the<br>
rootfs folder of the first image (image-recovery) recipe always uses the UI=
D<br>
of the source folder/files.<br>
<br>
I search the code of e2fsprogs for the line that sets the UID and added a<b=
r>
printf in set_inode_extra. There I can see clearly that the source UID for<=
br>
the file is 0 for the rootfs of the image-main rootfs folder while it is<br=
>
10000 (my own UID) for the image-recovery. I wonder how the UID of the<br>
image-main rootfs folder can be zero when I don&#39;t call any command with=
 root<br>
permissions. I searched for a preparation step where the UIDs are managed i=
n<br>
the scripts folder of Yocto, but didn&#39;t found any hint for the whole<br=
>
behavior. So while it is good that the rootfs partition of the main rootfs<=
br>
has the UID set correctly to zero, I can&#39;t understand why it happens. O=
n the<br>
other side I can understand why the UID of the recovery rootfs is set to my=
<br>
own one, but it stops me from booting that rootfs because the UIDs of the<b=
r>
files and folders are set to a user that does not exist on the target<br>
system.<br>
<br>
Can someone please explain to me, how that UID handling is meant to be<br>
done?<br>
</blockquote>
<br>
<br>
--<br>
<br>
</blockquote></blockquote></div></div><div class=3D"HOEnZb"><div class=3D"h=
5">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--000000000000f1e593056b3bcded--
