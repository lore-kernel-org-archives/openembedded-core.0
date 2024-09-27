Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E432CEBF89
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 08:52:03 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.64825.1727427116708511178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 01:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cjw2OL3z;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-49bc7387371so758805137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 01:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727427116; x=1728031916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/g3izF9XPD2V5VW1SFKDfHSFikqmnhebN1hzkaLHEno=;
        b=Cjw2OL3z9a6AQlib7F8luPtXYlMxZtaJDQjSRAu2ePpjtFzKpp22lp6KVz85AyJ8D8
         8zPjiPJXRgUNqDkqaE1cQ/V8pqi7UUHcvH7YoITai/XkYdUf7h1YJDGTaTq8xw02nZSs
         gFTZty52BBMF5CkZ+gsDujr6e0Q6bnibcqAvbs+/x6nkPMYuCbIwbU8g/Fo3LhnzjleJ
         3aAG9ArypWj3N2P7+/ZG8C5BT5qIiSLy6amIeoeDx/fAs/mODeTRtb3V+wXM3833lT/D
         2CK3IDegRgxRnmpMGxgn2G72dk+5v6A5aFmvZteffH4VallsPCjRonhgjWxUEy6Vw8Hs
         pYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727427116; x=1728031916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g3izF9XPD2V5VW1SFKDfHSFikqmnhebN1hzkaLHEno=;
        b=nbuddevNAuklRUZCYnQpjWoSYzHJP4dUM2fy01KjX15Co1YR8dWiaSXn7rBZ1+8wt7
         8cisuPHbdvU694Lx8EdPSpS10byhdwTr+YT14+hDvJER4ZCzUUyST+LRylzjyicA3NQ8
         LhkKx5kYxcgswHYNPROxVzfhJh05DhUdmg6IqEmfVz8aEwOwqKmLeQuF5cRDSTozY/9+
         uVIQi6Ra+/Y/eCgTLL+CFTdjwJE4z1J425DtmFc+IvxTs+Tkx5nNEpvr1Kt/zW0JbLQw
         azGiMQvIEWILktEXUr1mn63Yv4UP3VmoNnl0j7+q2giVdcsoly3qaJSbywPLb+SID3Co
         ajXA==
X-Gm-Message-State: AOJu0YxzHCf+c4qb3Htz5emdTSVsLO8MWpRiBrCbITJHsX8fjhMeei/B
	ay/KOOcs9N/EMUynwbycnESoyykwrcNg5RpwkqZ6+kfP/+3VC88C0k9R0KnkiJhtp/VFvw0arfH
	XDXsLwYr6smd70Aq2+Yotntrtxn4tPpi5+OA=
X-Google-Smtp-Source: AGHT+IFCQjgIfFuFr2ApY5+RzqrVI8U5zqWGKhMte6y5l0Zs29/GcpvDDzc/3sCK3nnLp5ImNML8Y5YpXWbUyvCSInU=
X-Received: by 2002:a05:6102:6c9:b0:48f:380a:ca90 with SMTP id
 ada2fe7eead31-4a2d7ffd989mr2845741137.18.1727427115432; Fri, 27 Sep 2024
 01:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <918f936e-68b2-449d-9521-3507c25f0a8b@electromag.com.au>
In-Reply-To: <918f936e-68b2-449d-9521-3507c25f0a8b@electromag.com.au>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 27 Sep 2024 09:51:36 +0100
Message-ID: <CANPvuRmnake=1PpTVhmuJBV0euZSCfPy1vS=Q7t4cCgo91qTsQ@mail.gmail.com>
Subject: Re: [OE-core] scarthgap: kernel build failure
To: preid@electromag.com.au
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009743c0062315f70b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205009

--0000000000009743c0062315f70b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Phil Reid via lists.openembedded.org <preid=3D
electromag.com.au@lists.openembedded.org> escreveu (sexta, 27/09/2024 =C3=
=A0(s)
01:59):

> G'day All,
>
>
> Just started migrating our layer to scarthgap and ran into an issue
> building the kernel.
> We maintian a local git repo with a custom branch with all our patches an=
d
> build from that.
> So no KMETA layer. In addition we're building a couple of kernels and
> packaging them into the image.
> We're using linux-dummy kernel for the image and then building the kernel
> using bitbake.
> Possibly the problem is we're doing something the wrong(tm) way.
>
>
> Anyway after migrating we get the following when building a kernel.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> NOTE: Executing Tasks
> ERROR: linux-tst-6.6.52+git-r0 do_kernel_configme: A KBUILD_DEFCONFIG
> 'socfpga_defconfig' was specified, but not present in the source tree
> (/home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linu=
x-tst/6.6.52+git/kernel-source/arch/arm/configs/)
> ERROR: linux-tst-6.6.52+git-r0 do_kernel_configme:
> ExecutionError('/home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-lin=
ux-gnueabi/linux-tst/6.6.52+git/temp/run.do_kernel_configme.8888',
> 1, None, None)
> ERROR: Logfile of failure stored in:
> /home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linux=
-tst/6.6.52+git/temp/log.do_kernel_configme.8888
> ERROR: Task
> (/home/preid/dev/v2024.09/layers/meta-emit/recipes/emit-linux/linux-tst_6=
.6.bb:do_kernel_configme)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 989 tasks of which 973 didn't need to be
> rerun and 1 failed.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
>
> Summary: 1 task failed:
>
>  /home/preid/dev/v2024.09/layers/meta-emit/recipes/emit-linux/linux-tst_6=
.6.bb:
> do_kernel_configme
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> I've managed to trace the change in behaviour to a change in
> archiver.bbclass.
> Reverting the change to is_work_shared and everything is happy.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 9d286224d6..9bac870449 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -472,9 +472,10 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
>           os.chdir(cwd)
>
>   def is_work_shared(d):
> -    sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), 'work-shared')
> -    sourcedir =3D os.path.realpath(d.getVar('S'))
> -    return sourcedir.startswith(sharedworkdir)
> +    pn =3D d.getVar('PN')
> +    return pn.startswith('gcc-source') or \
> +        bb.data.inherits_class('kernel', d) or \
> +        (bb.data.inherits_class('kernelsrc', d) and
> d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
>

Looks like the issue comes from the archiver.bbclass but you may be misled
by that very fact.
Can you try to build the kernel without the archiver?

INHERIT:remove =3D "archiver"

This just confirms if there are no more problems.
If everything is fine, the problem is really with the archiver.bbclass.
However, I use the archiver.bbclass daily with several bsp in my distro and
I have no problems.

Jose



>
>   # Run do_unpack and do_patch
>   python do_unpack_and_patch() {
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
>
> And here's a small reproducer kernel bb.
> I've tested this with cyclone5 machine.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> KBRANCH ?=3D "v6.6/standard/base"
>
> require recipes-kernel/linux/linux-yocto.inc
>
> # CVE exclusions
> include recipes-kernel/linux/cve-exclusion.inc
> include recipes-kernel/linux/cve-exclusion_6.6.inc
>
> # board specific branches
> SRCREV_machine ?=3D "561bbd55f91a8e94576ca3fbf35a0c99ff70d4b2"
>
> SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRANCH};p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRANCH%7D;protocol=3Dhttps>
> "
>
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e=
46"
> LINUX_VERSION ?=3D "6.6.52"
>
> PV =3D "${LINUX_VERSION}+git"
>
> KCONF_BSP_AUDIT_LEVEL =3D "1"
>
> COMPATIBLE_MACHINE =3D "^(qemux86-64|cyclone5)$"
>
> # Functionality flags
> KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
>
> KERNEL_PACKAGE_NAME          =3D "kernel-tst"
>
> KBUILD_DEFCONFIG:qemux86-64  =3D "x86_64_defconfig"
> KCONFIG_MODE:qemux86-64      =3D "--alldefconfig"
>
> KBUILD_DEFCONFIG:cyclone5    =3D "socfpga_defconfig"
> KCONFIG_MODE:cyclone5        =3D "--alldefconfig"
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
>
> The key trigger here I think is:
> - PREFERRED_PROVIDER_virtual/kernel is not equal to the kernel package.
> - KERNEL_PACKAGE_NAME is not equal to kernel
>
> And therefore the source doesn't end up in work-shared.
> But something somewhere expects the kernel-source folder to be in
> work-shared
> and ends up deleting the kernel-source folder
>
> After do_patch the kernel-source still contains the source files.
> The git checkout folder has gone by this step.
>
> Then during do_unpack_and_patch the kernel-source folder is cleaned of al=
l
> files.
> They've been moved to archiver-work/git
>
> And after that kernel-source is empty.
>
>
> So is the method we're using to build the kernel still supported?
> Or are we doing something wrong...
>
>
>
> --
> Regards
> Phil Reid
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205001):
> https://lists.openembedded.org/g/openembedded-core/message/205001
> Mute This Topic: https://lists.openembedded.org/mt/108679274/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009743c0062315f70b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Phil Reid via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;preid=3D<a href=3D"mailto=
:electromag.com.au@lists.openembedded.org">electromag.com.au@lists.openembe=
dded.org</a>&gt; escreveu (sexta, 27/09/2024 =C3=A0(s) 01:59):<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">G&#39;day All,<br>
<br>
<br>
Just started migrating our layer to scarthgap and ran into an issue buildin=
g the kernel.<br>
We maintian a local git repo with a custom branch with all our patches and =
build from that.<br>
So no KMETA layer. In addition we&#39;re building a couple of kernels and p=
ackaging them into the image.<br>
We&#39;re using linux-dummy kernel for the image and then building the kern=
el using bitbake.<br>
Possibly the problem is we&#39;re doing something the wrong(tm) way.<br>
<br>
<br>
Anyway after migrating we get the following when building a kernel.<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
NOTE: Executing Tasks<br>
ERROR: linux-tst-6.6.52+git-r0 do_kernel_configme: A KBUILD_DEFCONFIG &#39;=
socfpga_defconfig&#39; was specified, but not present in the source tree (/=
home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linux-ts=
t/6.6.52+git/kernel-source/arch/arm/configs/)<br>
ERROR: linux-tst-6.6.52+git-r0 do_kernel_configme: ExecutionError(&#39;/hom=
e/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linux-tst/6=
.6.52+git/temp/run.do_kernel_configme.8888&#39;, 1, None, None)<br>
ERROR: Logfile of failure stored in: /home/preid/dev/v2024.09/tmp-glibc/wor=
k/cyclone5-emit-linux-gnueabi/linux-tst/6.6.52+git/temp/log.do_kernel_confi=
gme.8888<br>
ERROR: Task (/home/preid/dev/v2024.09/layers/meta-emit/recipes/emit-linux/l=
inux-tst_6.6.bb:do_kernel_configme) failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 989 tasks of which 973 didn&#39;t need to be=
 rerun and 1 failed.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
<br>
Summary: 1 task failed:<br>
=C2=A0 =C2=A0/home/preid/dev/v2024.09/layers/meta-emit/recipes/emit-linux/l=
inux-tst_6.6.bb:do_kernel_configme<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<br>
I&#39;ve managed to trace the change in behaviour to a change in archiver.b=
bclass.<br>
Reverting the change to is_work_shared and everything is happy.<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass<=
br>
index 9d286224d6..9bac870449 100644<br>
--- a/meta/classes/archiver.bbclass<br>
+++ b/meta/classes/archiver.bbclass<br>
@@ -472,9 +472,10 @@ def create_diff_gz(d, src_orig, src, ar_outdir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(cwd)<br>
<br>
=C2=A0 def is_work_shared(d):<br>
-=C2=A0 =C2=A0 sharedworkdir =3D os.path.join(d.getVar(&#39;TMPDIR&#39;), &=
#39;work-shared&#39;)<br>
-=C2=A0 =C2=A0 sourcedir =3D os.path.realpath(d.getVar(&#39;S&#39;))<br>
-=C2=A0 =C2=A0 return sourcedir.startswith(sharedworkdir)<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+=C2=A0 =C2=A0 return pn.startswith(&#39;gcc-source&#39;) or \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.inherits_class(&#39;kernel&#39;, d) or=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (bb.data.inherits_class(&#39;kernelsrc&#39;, d=
) and d.expand(&quot;${TMPDIR}/work-shared&quot;) in d.getVar(&#39;S&#39;))=
<br></blockquote><div><br></div><div>Looks like the issue comes from the ar=
chiver.bbclass=C2=A0but you may be misled by that very fact.</div><div>Can =
you try to build the kernel without=C2=A0the archiver?<br><br>INHERIT:remov=
e =3D &quot;archiver&quot;<br><br>This just confirms=C2=A0if there are no m=
ore problems.</div><div>If everything is fine, the problem is really with t=
he archiver.bbclass.</div><div>However, I use the archiver.bbclass daily wi=
th several bsp in my distro and I have no problems.<br><br>Jose</div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
=C2=A0 # Run do_unpack and do_patch<br>
=C2=A0 python do_unpack_and_patch() {<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<br>
<br>
<br>
And here&#39;s a small reproducer kernel bb.<br>
I&#39;ve tested this with cyclone5 machine.<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
KBRANCH ?=3D &quot;v6.6/standard/base&quot;<br>
<br>
require recipes-kernel/linux/linux-yocto.inc<br>
<br>
# CVE exclusions<br>
include recipes-kernel/linux/cve-exclusion.inc<br>
include recipes-kernel/linux/cve-exclusion_6.6.inc<br>
<br>
# board specific branches<br>
SRCREV_machine ?=3D &quot;561bbd55f91a8e94576ca3fbf35a0c99ff70d4b2&quot;<br=
>
<br>
SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto.=
git;name=3Dmachine;branch=3D$%7BKBRANCH%7D;protocol=3Dhttps" rel=3D"norefer=
rer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;=
branch=3D${KBRANCH};protocol=3Dhttps</a>&quot;<br>
<br>
LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46&quot;<br>
LINUX_VERSION ?=3D &quot;6.6.52&quot;<br>
<br>
PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
KCONF_BSP_AUDIT_LEVEL =3D &quot;1&quot;<br>
<br>
COMPATIBLE_MACHINE =3D &quot;^(qemux86-64|cyclone5)$&quot;<br>
<br>
# Functionality flags<br>
KERNEL_FEATURES:append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
<br>
KERNEL_PACKAGE_NAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;kernel-tst&=
quot;<br>
<br>
KBUILD_DEFCONFIG:qemux86-64=C2=A0 =3D &quot;x86_64_defconfig&quot;<br>
KCONFIG_MODE:qemux86-64=C2=A0 =C2=A0 =C2=A0 =3D &quot;--alldefconfig&quot;<=
br>
<br>
KBUILD_DEFCONFIG:cyclone5=C2=A0 =C2=A0 =3D &quot;socfpga_defconfig&quot;<br=
>
KCONFIG_MODE:cyclone5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--alldefconfig&q=
uot;<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
<br>
<br>
The key trigger here I think is:<br>
- PREFERRED_PROVIDER_virtual/kernel is not equal to the kernel package.<br>
- KERNEL_PACKAGE_NAME is not equal to kernel<br>
<br>
And therefore the source doesn&#39;t end up in work-shared.<br>
But something somewhere expects the kernel-source folder to be in work-shar=
ed<br>
and ends up deleting the kernel-source folder<br>
<br>
After do_patch the kernel-source still contains the source files.<br>
The git checkout folder has gone by this step.<br>
<br>
Then during do_unpack_and_patch the kernel-source folder is cleaned of all =
files.<br>
They&#39;ve been moved to archiver-work/git<br>
<br>
And after that kernel-source is empty.<br>
<br>
<br>
So is the method we&#39;re using to build the kernel still supported?<br>
Or are we doing something wrong...<br>
<br>
<br>
<br>
-- <br>
Regards<br>
Phil Reid<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205001): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205001" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205001</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108679274/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108679274/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000009743c0062315f70b--

