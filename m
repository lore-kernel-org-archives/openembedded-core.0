Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9238F60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 12:12:05 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k23so74690681oih.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=vmxrRz2nyCZob35bz2U0dpQE7+Uu/w9jFVUoBamzj60=;
	b=toUGKay41gSbvswrMEbzxztObxLJDLGZS2OrmwPE/LDht/7GxudmH6KshI4qulfKTN
	a11dvt4Y6ILVlesrw0EpW0eVuKbCb3fWd768cOv3b7wtcCtk/p0wJ9e8uP8siK+n/Q7W
	gY+9Lv5KlWcqZtX2KRTbQBtFrQSkNwgG15UsSZO47SOdHh4n2Vy9KjhlVw0STOJVjrj2
	mtmIHcxJTb2xphrrleH2pb4kqcztZabn7Qv7U+VILwLW5P4zm+/T+i66lSb0r51r/Yhq
	3qGnsb3O5Umy07JBJa+gcKFCJaz8tG9yR9puAV04V1JBt+fWLrx2N494kneioAnVCJSY
	7ifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=vmxrRz2nyCZob35bz2U0dpQE7+Uu/w9jFVUoBamzj60=;
	b=f2xIy9XOKkN/92jO26axg9Hek3RGE4w0X0LyQVyxVVP8eQvrd+jTAjASHD5zkZ4wcq
	xmi9oeFY1lfM3ZZJwG4X620qJNXXhdQClhNYeWXkBz1Id9r+SgZpfwxVUuMbLrdya/pF
	GrBrto2O4KzVTGQ2D7u+MB/IJalJoK4Qx66lojxlcS94S4ai9WC1UowS/q6YqixxXJKF
	wZ6Y1veTQ89MJe8mSodNS+joab5AcaRX8mk/ljbQ00qrAred+sFNnMiitq5oD3FqSbLj
	eF2zEhdmwmosgvJz0vGM+NAOZxniaManhyJChBNMFDi64kjT0k7WmTw63+841gqfM0Yi
	U9ew==
X-Gm-Message-State: ALyK8tJG6q00hLGAB1U8ULGH4RYrGOVrBRZUBhbsJLaKW/gAe0cabUS5UUAunAD2cdZ9YFCHIkg/DLIVxaAbog==
MIME-Version: 1.0
X-Received: by 10.202.196.136 with SMTP id u130mr1704675oif.116.1464178325690; 
	Wed, 25 May 2016 05:12:05 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Wed, 25 May 2016 05:12:05 -0700 (PDT)
In-Reply-To: <cover.1464145184.git.zhe.he@windriver.com>
References: <cover.1464145184.git.zhe.he@windriver.com>
Date: Wed, 25 May 2016 08:12:05 -0400
Message-ID: <CADkTA4N95b3-HCGzgq3bU4mSbDEQQiejR6Uy0Pth1_NE9AZSuA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/2] Yocto Bug #6945
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
X-List-Received-Date: Wed, 25 May 2016 12:12:08 -0000
Content-Type: multipart/alternative; boundary=001a113e26bcfd9f8b0533a99411

--001a113e26bcfd9f8b0533a99411
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 4:47 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> This has been reviewed several rounds and no more comments are provided so
> far.
> Here is the brief history. More details can be found in the previous
> threads.
> Hopefully this can be merged in v2.2 m1.
>
> v1 to v2:
>  - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
>  - Update related doc files
>  - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
>  - Link built vmlinuz to boot directory for reference
>
> v2 to v3:
>  - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order
> that users can still use the old variables.
>  - Run oe_rummake in a loop for every types so that we can add different
> configurations to them easily in the future.
>  - Warn, intead of die, users if one of the types are over the size limit.
>  - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
>  - Remove the doc parts. They will be submitted yocto-docs later.
>  - Change some grep usage to make it more clear.
>  - Correct a typo.
>
> v3 to v4:
>  - Adjust according to the latest code context
>


v4 looks ok to me.

There was another series posted: [kernel-multi: stage and package multiple
kernels], did
you have a look at that one? Do these two series work properly together ?

Bruce


> The following changes since commit
> c7e614c438706fb3ed7520b4990ebb3973366942:
>
>   useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)
>
> are available in the git repository at:
>
>   git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=zhe%2Fyocto-bug-6945
>
> for you to fetch changes up to 4cd0e844d4153f2eb2cc54fafbfd161341ef4539:
>
>   kernel: Make symbol link to vmlinuz in boot directory (2016-05-24
> 22:57:35 -0400)
>
> ----------------------------------------------------------------
> He Zhe (2):
>       kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>       kernel: Make symbol link to vmlinuz in boot directory
>
>  meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
>  meta/classes/kernel-grub.bbclass          |  44
> +++++++++++++++++++++-----------
>  meta/classes/kernel-uimage.bbclass        |  10 +++++---
>  meta/classes/kernel.bbclass               | 187
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
>  meta/conf/documentation.conf              |   3 ++-
>  meta/recipes-kernel/linux/linux-dtb.inc   |  49
> ++++++++++++++++++++++--------------
>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>  7 files changed, 212 insertions(+), 103 deletions(-)
>
> He Zhe (2):
>   kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>   kernel: Make symbol link to vmlinuz in boot directory
>
>  meta/classes/kernel-fitimage.bbclass      |  20 ++--
>  meta/classes/kernel-grub.bbclass          |  44 ++++---
>  meta/classes/kernel-uimage.bbclass        |  10 +-
>  meta/classes/kernel.bbclass               | 187
> +++++++++++++++++++++---------
>  meta/conf/documentation.conf              |   3 +-
>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>  7 files changed, 212 insertions(+), 103 deletions(-)
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e26bcfd9f8b0533a99411
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 25, 2016 at 4:47 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@wi=
ndriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
<br>
This has been reviewed several rounds and no more comments are provided so =
far.<br>
Here is the brief history. More details can be found in the previous thread=
s.<br>
Hopefully this can be merged in v2.2 m1.<br>
<br>
v1 to v2:<br>
=C2=A0- Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments<br>
=C2=A0- Update related doc files<br>
=C2=A0- Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES<br>
=C2=A0- Link built vmlinuz to boot directory for reference<br>
<br>
v2 to v3:<br>
=C2=A0- Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order=
 that users can still use the old variables.<br>
=C2=A0- Run oe_rummake in a loop for every types so that we can add differe=
nt configurations to them easily in the future.<br>
=C2=A0- Warn, intead of die, users if one of the types are over the size li=
mit.<br>
=C2=A0- Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.<br>
=C2=A0- Remove the doc parts. They will be submitted yocto-docs later.<br>
=C2=A0- Change some grep usage to make it more clear.<br>
=C2=A0- Correct a typo.<br>
<br>
v3 to v4:<br>
=C2=A0- Adjust according to the latest code context<br></blockquote><div><b=
r></div><div><br></div><div>v4 looks ok to me.</div><div><br></div><div>The=
re was another series posted: [kernel-multi: stage and package multiple ker=
nels], did</div><div>you have a look at that one? Do these two series work =
properly together ?</div><div><br></div><div>Bruce</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddi=
ng-left:1ex">
<br>
The following changes since commit c7e614c438706fb3ed7520b4990ebb3973366942=
:<br>
<br>
=C2=A0 useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"noreferr=
er" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> zhe/yocto-bug-6=
945<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=
=3Dzhe%2Fyocto-bug-6945" rel=3D"noreferrer" target=3D"_blank">http://git.yo=
ctoproject.org/cgit/cgit.cgi/poky-contrib/?h=3Dzhe%2Fyocto-bug-6945</a><br>
<br>
for you to fetch changes up to 4cd0e844d4153f2eb2cc54fafbfd161341ef4539:<br=
>
<br>
=C2=A0 kernel: Make symbol link to vmlinuz in boot directory (2016-05-24 22=
:57:35 -0400)<br>
<br>
----------------------------------------------------------------<br>
He Zhe (2):<br>
=C2=A0 =C2=A0 =C2=A0 kernel: Add KERNEL_IMAGETYPES to build multi types ker=
nel at one time<br>
=C2=A0 =C2=A0 =C2=A0 kernel: Make symbol link to vmlinuz in boot directory<=
br>
<br>
=C2=A0meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +=
+++++++-------<br>
=C2=A0meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 44 +++++++++++++++++++++-----------<br>
=C2=A0meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 10 +++++---<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++-----------------------------------=
----<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A03 ++-<br>
=C2=A0meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 49 ++++++=
++++++++++++++++--------------<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 =C2=A02 +-<br>
=C2=A07 files changed, 212 insertions(+), 103 deletions(-)<br>
<br>
He Zhe (2):<br>
=C2=A0 kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one tim=
e<br>
=C2=A0 kernel: Make symbol link to vmlinuz in boot directory<br>
<br>
=C2=A0meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +=
+--<br>
=C2=A0meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 44 ++++---<br>
=C2=A0meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 10 +-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 187 +++++++++++++++++++++---------<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 49 +++++-=
--<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 =C2=A02 +-<br>
=C2=A07 files changed, 212 insertions(+), 103 deletions(-)<br>
<span><font color=3D"#888888"><br>
--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div>&quot;Thou shalt not follow the NULL pointer, for chaos and madness =
await thee at its end&quot;</div>
</div></div>

--001a113e26bcfd9f8b0533a99411--
