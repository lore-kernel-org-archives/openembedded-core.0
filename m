Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 84D526C37E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 12:40:01 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y23so4756195lje.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=y0UjUQOzV3NZ2Eji/UqdwtOvbKO1bP1p+n43E2zF3qM=;
	b=KZ1Nh54WlkRy8SR42EH2Rn8w57z84Fd3z3XTcY75Lxl0bgXLvIq9tYRDC5Quo/DqBd
	f2K/GETNv+gB0eJsqUCvS3gYIIKZnZuu6Q9vIEwIM24UMn0uvUfbzqMJn0SJIITfp6Ia
	1UJhF3kq3lus2mdKsY6gGE7QaSznAk+7nV5QJr9fV/l1tbhjNBMD6NqDgz10IY1yEfV7
	WIn0UHO7wrvzyaAYEU2YIXBeaBIQu1BNyemkwWJEslq7LyEUygN/FH2OEAUoYH3X97BL
	rU12fFVtJJNfWmaSs0HFk91SiXeCb/F+ivlRshCU9ljl/9ZkqBnZlptc5WuR4ig0SlY1
	w7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y0UjUQOzV3NZ2Eji/UqdwtOvbKO1bP1p+n43E2zF3qM=;
	b=m7MQZ/ie/cAvFYHgf+WAQInoiiZUWQ0T23SmcuwqpwBewUDpsW7J5klYdhN3suZSJU
	Ol9UIIKMJo+YfMKNG1R1F7DAvjzhTNM5hX5bDYDOzWtZIFWRAE6U8TiUSWmoTBkvFOef
	Ve0wLYU60Kec6G6BLE/3f2MstV6CEL5XdsVCLjhWe7fhK0yBJO+scKeGILbC4EQU8lc5
	xEjG5sREpcOY/dm/dtwzE3ABza+kBiyRKsw2imyD6yUwXNySBmJQkcZvS9/ZCHjlQD1u
	eszAtUvhN9QQwHp8VgKSWm5AM8KFdsCcRtluJGFSJ/jIdk8pm1vyZR5rolln0UissJF6
	dUnw==
X-Gm-Message-State: APjAAAWWkwQ5pQ9Sf/8mQxTH058vp+c0EXXhX2BFwR+ZGkmoKCesX8sH
	BXUaooPFR+Dfva8OhCClKGaz2b3mYVg8UeJhivEqE+kH
X-Google-Smtp-Source: APXvYqxSSgM/TfG2g1RO0Z0YssyM1KMQxSPkeEDCaG05ckPJ/AAGDZwuODAAPwm2MqBF9GLTEGsJR0smkglg2GybQOY=
X-Received: by 2002:a2e:96d3:: with SMTP id d19mr796514ljj.185.1567514401559; 
	Tue, 03 Sep 2019 05:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <5f601d9d33b2868c3962194eb23ccf5e23722110.camel@linuxfoundation.org>
In-Reply-To: <5f601d9d33b2868c3962194eb23ccf5e23722110.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 08:39:49 -0400
Message-ID: <CADkTA4P8bJsJWweh_3JfKs-R=D-Jbp=Mc1mz3f6Gm7pGdFXZbQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Summary of M3 status
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
X-List-Received-Date: Tue, 03 Sep 2019 12:40:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2019 at 4:10 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I'm going to summarise the current state as it will help people see the
> set of issues we have. We have three issues blocking the current patch
> queue and kernel uprev, spread over four machines and five autobuilder
> targets:
>
> qemumips64:
>
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/987
>
>   RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED (1.97s)
>
>   Central error: [    1.689184] kprobes: failed to populate blacklist: -2=
2
>   [happens 5.2 kernel only]

I'll have a look at the kprobes log. Could just be something we need
to whitelist, but I'll root cause it.

>
> qemumips:
>
>   qemu machine locks up:
>
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/982
>
>   (happens with 5.0 and 5.2 kernels and qemu 4.0 and 4.1 and is in
>    master. Not sure of the original cause)
>
> qemuarm64:
>
>   Central error: [    1.816386] kprobes: failed to populate blacklist: -2=
2
>
>   RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED (1.11s)
>
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/329
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/985
>   [happens 5.2 kernel only]
>
> qemuarm:
>
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/990
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/989
>
>   See compile failure for stap.StapTest.test_stap below.
>   [happens 5.2 kernel only]

And I can look at this one as well.

If anyone gets to them first, let me know!

Bruce

>
> The qemumips issue is of particular concern.
>
> Also needed to sort out M3 are:
>
>  * toolchain tests nrossi is working on
>  * resolution to the hashserv scaling problem
>  * bug fixing for the hash equiv code
>
> Cheers,
>
> Richard
>
> stap.StapTest.test_stap failure:
>
>
> WARNING: Kernel function symbol table missing [man warning::symbols]
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h: In function '__ac=
cess_process_vm_':
> /usr/share/systemtap/runtime/linux/access_process_vm.h:28:8: error: impli=
cit declaration of function 'get_task_mm'; did you mean 'get_task_comm'? [-=
Werror=3Dimplicit-function-declaration]
>    28 |   mm =3D get_task_mm (tsk);
>       |        ^~~~~~~~~~~
>       |        get_task_comm
> /usr/share/systemtap/runtime/linux/access_process_vm.h:28:6: error: assig=
nment to 'struct mm_struct *' from 'int' makes pointer from integer without=
 a cast [-Werror=3Dint-conversion]
>    28 |   mm =3D get_task_mm (tsk);
>       |      ^
> /usr/share/systemtap/runtime/linux/access_process_vm.h:51:61: error: pass=
ing argument 6 of 'get_user_pages_remote' makes pointer from integer withou=
t a cast [-Werror=3Dint-conversion]
>    51 |       ret =3D get_user_pages_remote (tsk, mm, addr, 1, write, 1, =
&page, &vma);
>       |                                                             ^
>       |                                                             |
>       |                                                             int
> In file included from ./include/linux/kallsyms.h:12,
>                  from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:29,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:21,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/mm.h:1592:46: note: expected 'struct page **' but argumen=
t is of type 'int'
>  1592 |        unsigned int gup_flags, struct page **pages,
>       |                                ~~~~~~~~~~~~~~^~~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h:51:64: error: pass=
ing argument 7 of 'get_user_pages_remote' from incompatible pointer type [-=
Werror=3Dincompatible-pointer-types]
>    51 |       ret =3D get_user_pages_remote (tsk, mm, addr, 1, write, 1, =
&page, &vma);
>       |                                                                ^~=
~~~
>       |                                                                |
>       |                                                                st=
ruct page **
> In file included from ./include/linux/kallsyms.h:12,
>                  from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:29,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:21,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/mm.h:1593:32: note: expected 'struct vm_area_struct **' b=
ut argument is of type 'struct page **'
>  1593 |        struct vm_area_struct **vmas, int *locked);
>       |        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h:51:71: error: pass=
ing argument 8 of 'get_user_pages_remote' from incompatible pointer type [-=
Werror=3Dincompatible-pointer-types]
>    51 |       ret =3D get_user_pages_remote (tsk, mm, addr, 1, write, 1, =
&page, &vma);
>       |                                                                  =
     ^~~~
>       |                                                                  =
     |
>       |                                                                  =
     struct vm_area_struct **
> In file included from ./include/linux/kallsyms.h:12,
>                  from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:29,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:21,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/mm.h:1593:43: note: expected 'int *' but argument is of t=
ype 'struct vm_area_struct **'
>  1593 |        struct vm_area_struct **vmas, int *locked);
>       |                                      ~~~~~^~~~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h:88:3: error: impli=
cit declaration of function 'mmput' [-Werror=3Dimplicit-function-declaratio=
n]
>    88 |   mmput (mm);
>       |   ^~~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:217,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/alloc.c: In function '_stp_alloc_percp=
u':
> /usr/share/systemtap/runtime/linux/alloc.c:456:8: error: too few argument=
s to function '__alloc_percpu'
>   456 |  ret =3D __alloc_percpu(size);
>       |        ^~~~~~~~~~~~~~
> In file included from ./include/linux/topology.h:34,
>                  from ./include/linux/gfp.h:9,
>                  from /usr/share/systemtap/runtime/linux/runtime_defines.=
h:20,
>                  from /usr/share/systemtap/runtime/runtime_defines.h:8,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> ./include/linux/percpu.h:135:23: note: declared here
>   135 | extern void __percpu *__alloc_percpu(size_t size, size_t align);
>       |                       ^~~~~~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/linux/../regs.c:20,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:222,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/../linux/regs.c: In function '_stp_pri=
nt_regs':
> /usr/share/systemtap/runtime/linux/../linux/regs.c:261:15: error: implici=
t declaration of function 'get_ds'; did you mean 'get_fs'? [-Werror=3Dimpli=
cit-function-declaration]
>   261 |   get_fs() =3D=3D get_ds() ? "kernel" : "user");
>       |               ^~~~~~
>       |               get_fs
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:244,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/addr-map.c: In function 'lookup_bad_ad=
dr':
> /usr/share/systemtap/runtime/linux/addr-map.c:63:63: error: macro "access=
_ok" passed 3 arguments, but takes just 2
>    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, size))
>       |                                                               ^
> In file included from ./include/linux/uaccess.h:11,
>                  from /usr/share/systemtap/runtime/addr-map.h:17,
>                  from /usr/share/systemtap/runtime/runtime.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./arch/arm/include/asm/uaccess.h:280: note: macro "access_ok" defined her=
e
>   280 | #define access_ok(addr, size) (__range_ok(addr, size) =3D=3D 0)
>       |
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:244,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/addr-map.c:41:30: error: 'access_ok' u=
ndeclared (first use in this function)
>    41 | #define stp_access_ok(x,y,z) access_ok(x,y,z)
>       |                              ^~~~~~~~~
> /usr/share/systemtap/runtime/linux/addr-map.c:63:25: note: in expansion o=
f macro 'stp_access_ok'
>    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, size))
>       |                         ^~~~~~~~~~~~~
> /usr/share/systemtap/runtime/linux/addr-map.c:41:30: note: each undeclare=
d identifier is reported only once for each function it appears in
>    41 | #define stp_access_ok(x,y,z) access_ok(x,y,z)
>       |                              ^~~~~~~~~
> /usr/share/systemtap/runtime/linux/addr-map.c:63:25: note: in expansion o=
f macro 'stp_access_ok'
>    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, size))
>       |                         ^~~~~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/transport/transport.c:=
23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h: At top =
level:
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16: erro=
r: "KUIDT_INIT" redefined [-Werror]
>    16 | #define KUIDT_INIT(value) ((uid_t) value)
>       |
> In file included from ./include/linux/ipc.h:6,
>                  from ./include/uapi/linux/sem.h:5,
>                  from ./include/linux/sem.h:5,
>                  from ./include/linux/sched.h:15,
>                  from ./include/linux/uaccess.h:5,
>                  from /usr/share/systemtap/runtime/addr-map.h:17,
>                  from /usr/share/systemtap/runtime/runtime.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/uidgid.h:30: note: this is the location of the previous d=
efinition
>    30 | #define KUIDT_INIT(value) (kuid_t){ value }
>       |
> In file included from /usr/share/systemtap/runtime/transport/transport.c:=
23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17: erro=
r: "KGIDT_INIT" redefined [-Werror]
>    17 | #define KGIDT_INIT(value) ((gid_t) value)
>       |
> In file included from ./include/linux/ipc.h:6,
>                  from ./include/uapi/linux/sem.h:5,
>                  from ./include/linux/sem.h:5,
>                  from ./include/linux/sched.h:15,
>                  from ./include/linux/uaccess.h:5,
>                  from /usr/share/systemtap/runtime/addr-map.h:17,
>                  from /usr/share/systemtap/runtime/runtime.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/uidgid.h:31: note: this is the location of the previous d=
efinition
>    31 | #define KGIDT_INIT(value) (kgid_t){ value }
>       |
> In file included from /usr/share/systemtap/runtime/transport/transport.c:=
23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/relay_v2.c: In function '__stp_rel=
ay_create_buf_file_callback':
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16:27: e=
rror: incompatible types when assigning to type 'kuid_t' {aka 'struct <anon=
ymous>'} from type 'unsigned int'
>    16 | #define KUIDT_INIT(value) ((uid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/relay_v2.c:249:26: note: in expans=
ion of macro 'KUIDT_INIT'
>   249 |   file->d_inode->i_uid =3D KUIDT_INIT(_stp_uid);
>       |                          ^~~~~~~~~~
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17:27: e=
rror: incompatible types when assigning to type 'kgid_t' {aka 'struct <anon=
ymous>'} from type 'unsigned int'
>    17 | #define KGIDT_INIT(value) ((gid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/relay_v2.c:250:26: note: in expans=
ion of macro 'KGIDT_INIT'
>   250 |   file->d_inode->i_gid =3D KGIDT_INIT(_stp_gid);
>       |                          ^~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/transport/transport.c:=
65,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/relay_v2.c: At top level:
> /usr/share/systemtap/runtime/transport/relay_v2.c:257:21: error: initiali=
zation of 'struct dentry * (*)(const char *, struct dentry *, umode_t,  str=
uct rchan_buf *, int *)' {aka 'struct dentry * (*)(const char *, struct den=
try *, short unsigned int,  struct rchan_buf *, int *)'} from incompatible =
pointer type 'struct dentry * (*)(const char *, struct dentry *, int,  stru=
ct rchan_buf *, int *)' [-Werror=3Dincompatible-pointer-types]
>   257 |  .create_buf_file =3D __stp_relay_create_buf_file_callback,
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /usr/share/systemtap/runtime/transport/relay_v2.c:257:21: note: (near ini=
tialization for '__stp_relay_callbacks.create_buf_file')
> In file included from /usr/share/systemtap/runtime/transport/transport.c:=
23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/debugfs.c: In function '_stp_regis=
ter_ctl_channel_fs':
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16:27: e=
rror: incompatible types when assigning to type 'kuid_t' {aka 'struct <anon=
ymous>'} from type 'unsigned int'
>    16 | #define KUIDT_INIT(value) ((uid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/debugfs.c:52:34: note: in expansio=
n of macro 'KUIDT_INIT'
>    52 |  _stp_cmd_file->d_inode->i_uid =3D KUIDT_INIT(_stp_uid);
>       |                                  ^~~~~~~~~~
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17:27: e=
rror: incompatible types when assigning to type 'kgid_t' {aka 'struct <anon=
ymous>'} from type 'unsigned int'
>    17 | #define KGIDT_INIT(value) ((gid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/debugfs.c:53:34: note: in expansio=
n of macro 'KGIDT_INIT'
>    53 |  _stp_cmd_file->d_inode->i_gid =3D KGIDT_INIT(_stp_gid);
>       |                                  ^~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/transport.c: In function '_stp_loc=
k_inode':
> /usr/share/systemtap/runtime/transport/transport.c:507:19: error: 'struct=
 inode' has no member named 'i_mutex'
>   507 |  mutex_lock(&inode->i_mutex);
>       |                   ^~
> /usr/share/systemtap/runtime/transport/transport.c: In function '_stp_unl=
ock_inode':
> /usr/share/systemtap/runtime/transport/transport.c:520:21: error: 'struct=
 inode' has no member named 'i_mutex'
>   520 |  mutex_unlock(&inode->i_mutex);
>       |                     ^~
> In file included from ./include/asm-generic/bug.h:18,
>                  from ./arch/arm/include/asm/bug.h:60,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/gfp.h:5,
>                  from /usr/share/systemtap/runtime/linux/runtime_defines.=
h:20,
>                  from /usr/share/systemtap/runtime/runtime_defines.h:8,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> /usr/share/systemtap/runtime/transport/transport.c: In function '_stp_get=
_root_dir':
> /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'struct=
 hlist_head' has no member named 'next'
>   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
>       |                                ^
> ./include/linux/kernel.h:970:26: note: in definition of macro 'container_=
of'
>   970 |  void *__mptr =3D (void *)(ptr);     \
>       |                          ^~~
> /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in expans=
ion of macro 'list_entry'
>   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
>       |        ^~~~~~~~~~
> In file included from ./include/uapi/linux/swab.h:6,
>                  from ./include/linux/swab.h:5,
>                  from ./arch/arm/include/asm/opcodes.h:86,
>                  from ./arch/arm/include/asm/bug.h:7,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/gfp.h:5,
>                  from /usr/share/systemtap/runtime/linux/runtime_defines.=
h:20,
>                  from /usr/share/systemtap/runtime/runtime_defines.h:8,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'struct=
 hlist_head' has no member named 'next'
>   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
>       |                                ^
> ./include/linux/compiler.h:325:9: note: in definition of macro '__compile=
time_assert'
>   325 |   if (!(condition))     \
>       |         ^~~~~~~~~
> ./include/linux/compiler.h:345:2: note: in expansion of macro '_compileti=
me_assert'
>   345 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LIN=
E__)
>       |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compileti=
me_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), m=
sg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:971:2: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
>   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>       |  ^~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:971:20: note: in expansion of macro '__same_type=
'
>   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>       |                    ^~~~~~~~~~~
> ./include/linux/list.h:465:2: note: in expansion of macro 'container_of'
>   465 |  container_of(ptr, type, member)
>       |  ^~~~~~~~~~~~
> /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in expans=
ion of macro 'list_entry'
>   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
>       |        ^~~~~~~~~~
> /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'struct=
 hlist_head' has no member named 'next'
>   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
>       |                                ^
> ./include/linux/compiler.h:325:9: note: in definition of macro '__compile=
time_assert'
>   325 |   if (!(condition))     \
>       |         ^~~~~~~~~
> ./include/linux/compiler.h:345:2: note: in expansion of macro '_compileti=
me_assert'
>   345 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LIN=
E__)
>       |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compileti=
me_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), m=
sg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:971:2: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
>   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>       |  ^~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:972:6: note: in expansion of macro '__same_type'
>   972 |     !__same_type(*(ptr), void),   \
>       |      ^~~~~~~~~~~
> ./include/linux/list.h:465:2: note: in expansion of macro 'container_of'
>   465 |  container_of(ptr, type, member)
>       |  ^~~~~~~~~~~~
> /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in expans=
ion of macro 'list_entry'
>   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
>       |        ^~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/linux/print.c: In function '_stp_print_kerne=
l_info':
> /usr/share/systemtap/runtime/linux/print.c:215:20: error: 'struct module'=
 has no member named 'module_core'
>   215 |         THIS_MODULE->module_core,
>       |                    ^~
> /usr/share/systemtap/runtime/linux/print.c:216:37: error: 'struct module'=
 has no member named 'core_size'
>   216 |         (unsigned long) (THIS_MODULE->core_size - THIS_MODULE->co=
re_text_size)/1024,
>       |                                     ^~
> /usr/share/systemtap/runtime/linux/print.c:216:62: error: 'struct module'=
 has no member named 'core_text_size'
>   216 |         (unsigned long) (THIS_MODULE->core_size - THIS_MODULE->co=
re_text_size)/1024,
>       |                                                              ^~
> /usr/share/systemtap/runtime/linux/print.c:217:44: error: 'struct module'=
 has no member named 'core_text_size'
>   217 |                (unsigned long) (THIS_MODULE->core_text_size)/1024=
,
>       |                                            ^~
> In file included from /usr/share/systemtap/runtime/timer.h:17,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:70:
> /tmp/stapgYOLtD/stap_19208_src.c: In function 'module_refresh_timer_cb':
> /usr/share/systemtap/runtime/linux/timer.h:41:56: error: 'struct hrtimer'=
 has no member named 'expires'
>    41 | #define hrtimer_set_expires(timer, time) (void)((timer)->expires =
=3D (time))
>       |                                                        ^~
> /tmp/stapgYOLtD/stap_19208_src.c:78:3: note: in expansion of macro 'hrtim=
er_set_expires'
>    78 |   hrtimer_set_expires(timer,
>       |   ^~~~~~~~~~~~~~~~~~~
> /usr/share/systemtap/runtime/linux/timer.h:40:44: error: 'struct hrtimer'=
 has no member named 'expires'
>    40 | #define hrtimer_get_expires(timer) ((timer)->expires)
>       |                                            ^~
> /usr/share/systemtap/runtime/linux/timer.h:41:69: note: in definition of =
macro 'hrtimer_set_expires'
>    41 | #define hrtimer_set_expires(timer, time) (void)((timer)->expires =
=3D (time))
>       |                                                                  =
   ^~~~
> /tmp/stapgYOLtD/stap_19208_src.c:79:5: note: in expansion of macro 'ktime=
_add'
>    79 |     ktime_add(hrtimer_get_expires(timer),
>       |     ^~~~~~~~~
> /tmp/stapgYOLtD/stap_19208_src.c:79:15: note: in expansion of macro 'hrti=
mer_get_expires'
>    79 |     ktime_add(hrtimer_get_expires(timer),
>       |               ^~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[1]: *** [scripts/Makefile.build:278: /tmp/stapgYOLtD/stap_19208_src.=
o] Error 1
> make: *** [Makefile:1597: _module_/tmp/stapgYOLtD] Error 2
> WARNING: kbuild exited with status: 2
> Pass 4: compilation failed.  [man error::pass4]
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

