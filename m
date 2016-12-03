Return-Path: <mgloff@emacinc.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0E83B62132
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Dec 2016 05:09:46 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id 20so301715692uak.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 21:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h8jup8VYNE47D9CnwHJwgr7pLZ2PxMQVEJhB+sk48gQ=;
	b=Le1sL9wO9m3evcbQB6EsiyJRj3osQ+FjtT9OXGt1JxL5BTpuQRxo/1c/OKc46t3x+v
	gQb4OELY3FrWSfJTrtZhYxzYPnGMRRM1tSPojsfzvSGi89kN7M/cIZHCHuoECpsUUp0s
	UHB6RG+I7wVemn9NzUB4wJGvsTFm5JQ/jYrh/xZwYbr8duaW5YNrgfFNrjCA30H9WZj4
	fwu2aGUeY2IY9j8mY8ShOsGhb4FSgimM6AZ2gJbI2LZtmhF6CzfsJGo9p5wOkpfxquAN
	rq2AnE8FO8Y/5sVhnV44lP1NiGNATRmMGzFciFhAZ31NKUP2Vhvn9ua3vl3pyFemhKnW
	Pu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h8jup8VYNE47D9CnwHJwgr7pLZ2PxMQVEJhB+sk48gQ=;
	b=i0cBuddsQTmE/q9DogJciOM0yxZr347PxhO1LzH7la7mDIOv/pX4nydS1iThA8NSKy
	c5XuvIQHvUYW30vnQ4ztDZ5nweOMMF4nskO72iNagVmyz6Kb9tef5Dtt9CuLJ+NqgYLm
	KSE5c/oCb6Ev3dQH4fKa3Al8Kkt1M7uEZooXElo47QyfTABfciMesB6E80jLwDGqeRt1
	3mMzi8NoY0HeEaFigbC0JxLzcx5ql4cNqvCBT0ul/wot+f9BFziDwbceKjuDgKYHqH5N
	2Kc7kH9baFtKkwWFqIA4vF+et4rvhH+t83kan2gyUUzcLIjYJiRmvNUsl8fC3JYnHrSW
	nkaQ==
X-Gm-Message-State: AKaTC0030riOu4jhsi6xhKmnrW4aMtNzWqgPT+8tI+WdsRnpbdJ5uK66UKD1YACUQtG/rDztiKySLKyfp9xQ6ulY
X-Received: by 10.176.83.148 with SMTP id k20mr36121847uaa.64.1480741787672;
	Fri, 02 Dec 2016 21:09:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.4.10 with HTTP; Fri, 2 Dec 2016 21:09:07 -0800 (PST)
In-Reply-To: <39e9a81f-28ed-3a83-afdb-4ce3886e7830@windriver.com>
References: <CALXw4G5XD=N5QJg8OgvOGi-BDsAqUgmFqMddumdAq6MkC_LY5A@mail.gmail.com>
	<39e9a81f-28ed-3a83-afdb-4ce3886e7830@windriver.com>
From: Michael Gloff <mgloff@emacinc.com>
Date: Fri, 2 Dec 2016 23:09:07 -0600
Message-ID: <CALXw4G4K7itQBcjhotOgrtj8GFjY3+JCSGy260k2YRUCoEVo5Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Debugfs + nfs-utils-client + ipkg
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
X-List-Received-Date: Sat, 03 Dec 2016 05:09:47 -0000
Content-Type: multipart/alternative; boundary=f403045dd8fc4248d40542ba10f9

--f403045dd8fc4248d40542ba10f9
Content-Type: text/plain; charset=UTF-8

Thanks Robert!
Bug filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10761

Michael

On Fri, Dec 2, 2016 at 1:17 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi Michael,
>
> On 12/02/2016 11:19 AM, Michael Gloff wrote:
>
>> I've run into an issue recently when trying to build an image along with
>> the
>> companion debugfs. This error only occurs if 'nfs-utils-client' is added
>> to
>> IMAGE_INSTALL and ipkg packages are selected. I don't get the error with
>> RPM or
>> with removing nfs-utils-client. Also, I can see the missing files are
>> present at
>> some point during do_rootfs, but then must be getting wiped out? I
>> noticed this
>> in Krogoth first, but can reproduce in latest master. Any ideas?
>>
>
> Maybe something is wrong with opkg, it only happens when files are in
> /var/lib/foo, here is a *workaround*:
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index a348b97..ba072c0 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -951,7 +951,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>
> -        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
> +        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl',
> '/var/lib/nfs'])
>
>          execute_pre_post_process(self.d, opkg_post_process_cmds)
>
>
> This is not a regular fix, you can file a bug here:
> https://bugzilla.yoctoproject.org/
>
> We may fix it later.
>
> // Robert
>
>
>> developer@OEBuilder:~/oe/recipes/poky/build$ bitbake core-image-minimal
>> Loading cache: 100%
>> |###########################################################
>> ############################################################
>> ###################################|
>> Time: 0:00:00
>> Loaded 1304 entries from dependency cache.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION        = "1.32.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "universal"
>> TARGET_SYS        = "i586-poky-linux"
>> MACHINE           = "qemux86"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "2.2"
>> TUNE_FEATURES     = "m32 i586"
>> TARGET_FPU        = ""
>> meta
>> meta-poky
>> meta-yocto-bsp    = "master:9e63f81c78e284c9b325fe04a1b59e61c7ad8a1a"
>>
>> Initialising tasks: 100%
>> |###########################################################
>> ############################################################
>> ##############################|
>> Time: 0:00:03
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed
>> packages
>> list. Command
>> '/home/developer/oe/recipes/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg
>> -f
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/opkg.conf
>> -o
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/rootfs
>> --force_postinstall --prefer-arch-to-version   status' returned 0 and
>> stderr:
>> Collected errors:
>>  * file_md5sum_alloc: Failed to open file
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/etab:
>> No such file or directory.
>>  * file_md5sum_alloc: Failed to open file
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/rmtab:
>> No such file or directory.
>>  * file_md5sum_alloc: Failed to open file
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/xtab:
>> No such file or directory.
>>  * file_md5sum_alloc: Failed to open file
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/statd/state:
>> No such file or directory.
>>
>> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
>> ERROR: Logfile of failure stored in:
>> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-
>> linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.5361
>> ERROR: Task
>> (/home/developer/oe/recipes/poky/meta/recipes-core/images/co
>> re-image-minimal.bb:do_rootfs)
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2168 tasks of which 2167 didn't need to be
>> rerun
>> and 1 failed.
>>
>> Summary: 1 task failed:
>>
>> /home/developer/oe/recipes/poky/meta/recipes-core/images/cor
>> e-image-minimal.bb:do_rootfs
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit
>> code.
>>
>> Thanks,
>>
>> Michael Gloff
>> mgloff@emacinc.com <mailto:mgloff@emacinc.com>
>>
>>
>>

--f403045dd8fc4248d40542ba10f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Thanks Robert!<br></div>Bug filed:<br><a href=3D=
"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10761">https://bugzill=
a.yoctoproject.org/show_bug.cgi?id=3D10761</a><br><br></div>Michael<br></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Dec 2, =
2016 at 1:17 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi=
.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hi Michael,<br>
<br>
On 12/02/2016 11:19 AM, Michael Gloff wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;ve run into an issue recently when trying to build an image along wit=
h the<br>
companion debugfs. This error only occurs if &#39;nfs-utils-client&#39; is =
added to<br>
IMAGE_INSTALL and ipkg packages are selected. I don&#39;t get the error wit=
h RPM or<br>
with removing nfs-utils-client. Also, I can see the missing files are prese=
nt at<br>
some point during do_rootfs, but then must be getting wiped out? I noticed =
this<br>
in Krogoth first, but can reproduce in latest master. Any ideas?<br>
</blockquote>
<br>
Maybe something is wrong with opkg, it only happens when files are in /var/=
lib/foo, here is a *workaround*:<br>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
index a348b97..ba072c0 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -951,7 +951,7 @@ class OpkgRootfs(DpkgOpkgRootfs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.progress_reporter:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.progress_reporter.next=
_s<wbr>tage()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc&#39;<wbr>, &=
#39;/var/lib/opkg&#39;, &#39;/usr/lib/ssl&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc&#39;<wbr>, &=
#39;/var/lib/opkg&#39;, &#39;/usr/lib/ssl&#39;, &#39;/var/lib/nfs&#39;])<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execute_pre_post_process(<wbr>self.d, opk=
g_post_process_cmds)<br>
<br>
<br>
This is not a regular fix, you can file a bug here:<br>
<a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"noreferrer" target=3D=
"_blank">https://bugzilla.yoctoproject.<wbr>org/</a><br>
<br>
We may fix it later.<br>
<br>
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
developer@OEBuilder:~/oe/recip<wbr>es/poky/build$ bitbake core-image-minima=
l<br>
Loading cache: 100%<br>
|#############################<wbr>##############################<wbr>#####=
#########################<wbr>##############################<wbr>##########=
####################<wbr>#####|<br>
Time: 0:00:00<br>
Loaded 1304 entries from dependency cache.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.32.0&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i586-poky-linux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;qemux86&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.2&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;m32 i586&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;master:9e63f81c78e284c9b325fe<wbr>04a=
1b59e61c7ad8a1a&quot;<br>
<br>
Initialising tasks: 100%<br>
|#############################<wbr>##############################<wbr>#####=
#########################<wbr>##############################<wbr>##########=
####################<wbr>|<br>
Time: 0:00:03<br>
NOTE: Executing SetScene Tasks<br>
NOTE: Executing RunQueue Tasks<br>
ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packag=
es<br>
list. Command<br>
&#39;/home/developer/oe/recipes/po<wbr>ky/build/tmp/sysroots/x86_64-<wbr>li=
nux/usr/bin/opkg -f<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/opkg.conf<br>
-o<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/rootfs<br>
--force_postinstall --prefer-arch-to-version=C2=A0 =C2=A0status&#39; return=
ed 0 and stderr:<br>
Collected errors:<br>
=C2=A0* file_md5sum_alloc: Failed to open file<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/rootfs/var/lib/nfs/etab:<br>
No such file or directory.<br>
=C2=A0* file_md5sum_alloc: Failed to open file<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/rootfs/var/lib/nfs/rmtab:<br>
No such file or directory.<br>
=C2=A0* file_md5sum_alloc: Failed to open file<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/rootfs/var/lib/nfs/xtab:<br>
No such file or directory.<br>
=C2=A0* file_md5sum_alloc: Failed to open file<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/rootfs/var/lib/nfs/statd/<wbr>state:<br>
No such file or directory.<br>
<br>
ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs<br>
ERROR: Logfile of failure stored in:<br>
/home/developer/oe/recipes/pok<wbr>y/build/tmp/work/qemux86-poky-<wbr>linux=
/core-image-minimal/1.0-<wbr>r0/temp/log.do_rootfs.5361<br>
ERROR: Task<br>
(/home/developer/oe/recipes/po<wbr>ky/meta/recipes-core/images/co<wbr>re-im=
age-minimal.bb:do_rootfs)<br>
failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 2168 tasks of which 2167 didn&#39;t need to =
be rerun<br>
and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
<br>
/home/developer/oe/recipes/pok<wbr>y/meta/recipes-core/images/cor<wbr>e-ima=
ge-minimal.bb:do_rootfs<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
<br>
<br>
Thanks,<br>
<br>
Michael Gloff<br>
<a href=3D"mailto:mgloff@emacinc.com" target=3D"_blank">mgloff@emacinc.com<=
/a> &lt;mailto:<a href=3D"mailto:mgloff@emacinc.com" target=3D"_blank">mglo=
ff@emacinc.com</a>&gt;<br>
<br>
<br>
</blockquote>
</blockquote></div><br></div>

--f403045dd8fc4248d40542ba10f9--
