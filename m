Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92546C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:02:51 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web09.7458.1637593370251578581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PoVS1UWz;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id t13so37087078uad.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=08DQBLdTm8bJTq9xon/8UiuRt53KhBIXKA1DqrHDACc=;
        b=PoVS1UWzlnR5bz0LhQTk48mC54WhZmDa+dKELT7NIzxWwH4tizH5OGGARDT6Qn4P66
         xp1Qz8Gyyv6pHNdf1S7zEgyc2pc+lPN3ZNdAEp/tfGDL/GVY5uJLMpbDh5/cFUBocmDt
         Yj4+391CQDxZbE8M5QULsmgQQwFu7s8x6oY7eB3t6tUaiGndzrTqdcw/IXfEGzGu06bd
         P6+WVQFd8dWgpPCwqap5CNrQXMbAU2N1pICu20hMu+iLIjr+F02OYf07gTG2q39LgCKJ
         AcZzZ8m2dgoX223GQ82st/1V6oX4NnmPJJmgCAv9JKzKC+H9yTcMPDz6pm3PGn4sL4pb
         cwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=08DQBLdTm8bJTq9xon/8UiuRt53KhBIXKA1DqrHDACc=;
        b=4TygVQQFQDWVgA80LrCzRpNguK/P1G1wo4rS79QCh7zguZPPDZg9bf5Vkel5+w+l4f
         rdMolTaeqYhm9jWzBp8CdBvzaxQ4EkAYqDTuTRSatqVlvMc4XxGmuk7EwhfDS7+XAfHO
         RcHqkTJ5pxKah4EOw8LsNFz8gfGYAduJT1R1wIRQe+OQJp7NBKKJDguq7VZC7dmZxbSU
         QIDuSRZ/KpJCVEhPjTjVxjBCV2o9Dc6iiCO/sj5urfOp4crbbZUjETG1tSzStPYgcpQk
         YE3XnF5/BItrJL+lMRumVS/l7Y4hhKbApUMgxLP4JbEG6EwJc4voLOlfeW1yIvyaVe5+
         tCOw==
X-Gm-Message-State: AOAM5304PlVqRwCyGcTuYbpSo//ntMsF5KuqlpbSECS3xpLR+wbeshQN
	vntCPlJ1KB84IAJm3fJUA3FdPceeWFwZSUoNoaPat0M2c1E=
X-Google-Smtp-Source: 
 ABdhPJwgp1gudYrkW1XKdQRczO4nMzWDCVwQRloT7JgSwBzpt9EJyKUjEiks/hJoWC9lTifICxCXCPURj9IeaUS47DI=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr134221701vsh.13.1637593369340;
 Mon, 22 Nov 2021 07:02:49 -0800 (PST)
MIME-Version: 1.0
References: <1637593174-99263-1-git-send-email-wangmy@fujitsu.com>
 <1637593174-99263-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1637593174-99263-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Nov 2021 16:02:38 +0100
Message-ID: 
 <CANNYZj9DaPCRkTnrss-s_z_bwHXUN2uhHuc4gy3B-fviHJuKOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemtap: upgrade 4.5 -> 4.6
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000010f61405d161eb36"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 15:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158578

--00000000000010f61405d161eb36
Content-Type: text/plain; charset="UTF-8"

Thank you Wang, glad you are able to find time to include the changelogs
into your upgrades - I'm something of a 'last resort' person for them, and
usually do not do it.

Alex

On Mon, 22 Nov 2021 at 16:00, wangmy <wangmy@fujitsu.com> wrote:

> support for 64-bit RISC-V architecture, liveness analysis for guru-mode
> write operations,
> bpf syscall_any and abort() tapsets, bpf foreach iteration of multi-key
> arrays,
> return of inter-cpu output ordering
>
> Changelog is as follows:
> = SystemTap frontend (stap) changes
> - stap-prep now tries to download the main kernel debuginfo file from
>   a debuginfod server, if configured.
>
> = SystemTap backend changes
> - SystemTap has added support for the 64-bit RISC-V architecture.
> - SystemTap now uses DynInst to perform a liveness analysis on
>   target variables and warn when a guru-mode modification to a variable
>   will have no effect. The liveness analysis is currently done on
>   x86_64, PowerPC, and AArch64.
> - The kernel-user relayfs transport again sorts messages into a total
>   time order across CPUs.  High output-volume scripts may need a
>   larger "-s BUF" parameter to reliably transfer.  "-b" bulk mode
>   is also available again as an alternative.
> - The bpf backend now supports foreach iteration in multi-key associative
> arrays.
>
> = SystemTap tapset changes
> - Updated syscall_any tapset mapping to include newer syscalls.
> - syscall_any tapset can be used by the bpf backend.
> - abort() tapset can be used by the bpf backend.
>
> = Known issues with this release
> - There are known issues on kernel 5.10+ after adapting to set_fs()
>   removal, with some memory accesses that previously returned valid data
>   instead returning -EFAULT (see PR26811).
> - An sdt probe cannot parse a parameter that uses a segment register.
>   (PR13429)
> - The presence of a line such as
>       *CFLAGS += $(call cc-option, -fno-var-tracking-assignments)
>   in older linux kernel Makefile unnecessarily reduces debuginfo quality,
>   consider removing that line if you build kernels.  Linux 5.10+ fixes
> this.
>
> = Bugs fixed for this release <https://sourceware.org/PR#####>
> 6562     $SYSTEMTAP_DEBUGINFO_PATH does not work
> 15724     stapdyn looking for libdyninstAPI_RT.a
> 26839     Systemtap build failures with clang
> 27820     abort() tapset not implemented in the bpf mode
> 27829     support for floating point values passed through sdt.h markers
> 27864     loc2stap.cxx assertion failure on loc_unavailable type location,
> rawhide
> 27881     failed to extend vma mapped entry when the address is adjacent
> 27903     handle f33 glibc $$parms
> 27932     List Python as a prerequisite in README
> 27933     Use of unitialized functioncall synthetic field in
> 27934     failure to attach statement
> 27940     The /* pc=0x... */ is no longer printed by "stap -v -L
> 'kernel.function("*")'
> 27942     testsuite/systemtap.base/perf.sh drop bashism
> 27984     stap skipping partially-inlined instance, but it is not inline
> function actually
> 28070     extend vma end address to the different module
> 28079     adapt to kernel 5.14 task_struct.__state change
> 28084     autoconf-x86-uniregs.c compile failled with -Werror cause
> STAPCONF_X86_UNIREGS missing
> 28140     kernel panic on tracepoint activation in stap module
> 28184     task_fd_lookup failed on linux 5.11
> 28244     linux objtool imposes symbol length limits on generated function
> names
> 28384     finish nfs_proc tapset port 4.3 string server_ip
> 28443     Provide syscall_any tapset for bpf
> 28449     loss of cross-cpu output ordering
> 28544     procfs_bpf.exp regression due to string handling error
> 28557     module kprobe insertion on modern kernels
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
> b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 25546f7cb2..22b07f1516 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRCREV = "7f6992539fb22c93c21ac30c94508bf655d496a7"
> -PV = "4.5"
> +SRCREV = "2e9f2f6967e44ce2bf8f34932b5bdd738ece2161"
> +PV = "4.6"
>
>  SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
>
> file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158577):
> https://lists.openembedded.org/g/openembedded-core/message/158577
> Mute This Topic: https://lists.openembedded.org/mt/87236592/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000010f61405d161eb36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you Wang, glad you are able to find time to inc=
lude the changelogs into your upgrades - I&#39;m something of a &#39;last r=
esort&#39; person for them, and usually do not do it.</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, 22 Nov 2021 at 16:00, wangmy &lt;<a href=3D"mailt=
o:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">support for 64-bit RISC-V architect=
ure, liveness analysis for guru-mode write operations,<br>
bpf syscall_any and abort() tapsets, bpf foreach iteration of multi-key arr=
ays,<br>
return of inter-cpu output ordering<br>
<br>
Changelog is as follows:<br>
=3D SystemTap frontend (stap) changes<br>
- stap-prep now tries to download the main kernel debuginfo file from<br>
=C2=A0 a debuginfod server, if configured.<br>
<br>
=3D SystemTap backend changes<br>
- SystemTap has added support for the 64-bit RISC-V architecture.<br>
- SystemTap now uses DynInst to perform a liveness analysis on<br>
=C2=A0 target variables and warn when a guru-mode modification to a variabl=
e<br>
=C2=A0 will have no effect. The liveness analysis is currently done on<br>
=C2=A0 x86_64, PowerPC, and AArch64.<br>
- The kernel-user relayfs transport again sorts messages into a total<br>
=C2=A0 time order across CPUs.=C2=A0 High output-volume scripts may need a<=
br>
=C2=A0 larger &quot;-s BUF&quot; parameter to reliably transfer.=C2=A0 &quo=
t;-b&quot; bulk mode<br>
=C2=A0 is also available again as an alternative.<br>
- The bpf backend now supports foreach iteration in multi-key associative a=
rrays.<br>
<br>
=3D SystemTap tapset changes<br>
- Updated syscall_any tapset mapping to include newer syscalls.<br>
- syscall_any tapset can be used by the bpf backend.<br>
- abort() tapset can be used by the bpf backend.<br>
<br>
=3D Known issues with this release<br>
- There are known issues on kernel 5.10+ after adapting to set_fs()<br>
=C2=A0 removal, with some memory accesses that previously returned valid da=
ta<br>
=C2=A0 instead returning -EFAULT (see PR26811).<br>
- An sdt probe cannot parse a parameter that uses a segment register.<br>
=C2=A0 (PR13429)<br>
- The presence of a line such as<br>
=C2=A0 =C2=A0 =C2=A0 *CFLAGS +=3D $(call cc-option, -fno-var-tracking-assig=
nments)<br>
=C2=A0 in older linux kernel Makefile unnecessarily reduces debuginfo quali=
ty,<br>
=C2=A0 consider removing that line if you build kernels.=C2=A0 Linux 5.10+ =
fixes this.<br>
<br>
=3D Bugs fixed for this release &lt;<a href=3D"https://sourceware.org/PR#%2=
3%23%23%23" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/PR#=
####</a>&gt;<br>
6562=C2=A0 =C2=A0 =C2=A0$SYSTEMTAP_DEBUGINFO_PATH does not work<br>
15724=C2=A0 =C2=A0 =C2=A0stapdyn looking for libdyninstAPI_RT.a<br>
26839=C2=A0 =C2=A0 =C2=A0Systemtap build failures with clang<br>
27820=C2=A0 =C2=A0 =C2=A0abort() tapset not implemented in the bpf mode<br>
27829=C2=A0 =C2=A0 =C2=A0support for floating point values passed through s=
dt.h markers<br>
27864=C2=A0 =C2=A0 =C2=A0loc2stap.cxx assertion failure on loc_unavailable =
type location, rawhide<br>
27881=C2=A0 =C2=A0 =C2=A0failed to extend vma mapped entry when the address=
 is adjacent<br>
27903=C2=A0 =C2=A0 =C2=A0handle f33 glibc $$parms<br>
27932=C2=A0 =C2=A0 =C2=A0List Python as a prerequisite in README<br>
27933=C2=A0 =C2=A0 =C2=A0Use of unitialized functioncall synthetic field in=
<br>
27934=C2=A0 =C2=A0 =C2=A0failure to attach statement<br>
27940=C2=A0 =C2=A0 =C2=A0The /* pc=3D0x... */ is no longer printed by &quot=
;stap -v -L &#39;kernel.function(&quot;*&quot;)&#39;<br>
27942=C2=A0 =C2=A0 =C2=A0testsuite/systemtap.base/perf.sh drop bashism<br>
27984=C2=A0 =C2=A0 =C2=A0stap skipping partially-inlined instance, but it i=
s not inline function actually<br>
28070=C2=A0 =C2=A0 =C2=A0extend vma end address to the different module<br>
28079=C2=A0 =C2=A0 =C2=A0adapt to kernel 5.14 task_struct.__state change<br=
>
28084=C2=A0 =C2=A0 =C2=A0autoconf-x86-uniregs.c compile failled with -Werro=
r cause STAPCONF_X86_UNIREGS missing<br>
28140=C2=A0 =C2=A0 =C2=A0kernel panic on tracepoint activation in stap modu=
le<br>
28184=C2=A0 =C2=A0 =C2=A0task_fd_lookup failed on linux 5.11<br>
28244=C2=A0 =C2=A0 =C2=A0linux objtool imposes symbol length limits on gene=
rated function names<br>
28384=C2=A0 =C2=A0 =C2=A0finish nfs_proc tapset port 4.3 string server_ip<b=
r>
28443=C2=A0 =C2=A0 =C2=A0Provide syscall_any tapset for bpf<br>
28449=C2=A0 =C2=A0 =C2=A0loss of cross-cpu output ordering<br>
28544=C2=A0 =C2=A0 =C2=A0procfs_bpf.exp regression due to string handling e=
rror<br>
28557=C2=A0 =C2=A0 =C2=A0module kprobe insertion on modern kernels<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc<br>
index 25546f7cb2..22b07f1516 100644<br>
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
-SRCREV =3D &quot;7f6992539fb22c93c21ac30c94508bf655d496a7&quot;<br>
-PV =3D &quot;4.5&quot;<br>
+SRCREV =3D &quot;2e9f2f6967e44ce2bf8f34932b5bdd738ece2161&quot;<br>
+PV =3D &quot;4.6&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/systemta=
p.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">sourceware.org/=
git/systemtap.git;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-let-configure-=
write-a-python-location-into-th.patch \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158577): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158577" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158577</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87236592/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87236592/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000010f61405d161eb36--

