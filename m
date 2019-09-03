Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 055077F339
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:36:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g7so18033553wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pO5TBe+AoWHGC7ka4jn7n3UVF6Oa7yvJ3Xs8Jov1Bd4=;
	b=bNBUDAxa10lolxi/k6EsCqxY52oHU4LBY3hfQnaHjvH5meS1S+GDX6ZDttLS4nkzu2
	QIGz6/ckta8+0R3uAbiG9X3sJNB32KQVOWaA2X7/5bWMABhch6eOTaap9eRFl6vXykWx
	f7tmWd+NdJTUAxmjU1gc0gE1ZajNY6FPY6uGStXTsIfPoVbvGZ6kG7ZxFeYZxXmnP1r7
	/XIz7zJB1MZnLluXCSYRWVlUwX4DFYffZARZGnLOn6BJEJ2tDy/y67JKN4o1R9uVyans
	edP0meG9wgVniilk9T64rACWTyDS4X57V7WrPDHEO4MbCHqkyxCa5Q/7QDZUARPFK82G
	Yvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pO5TBe+AoWHGC7ka4jn7n3UVF6Oa7yvJ3Xs8Jov1Bd4=;
	b=g3iiJooBGOZSrI0/tAFR7tt5UPhwbsUJNe/HjhXbYyx+kDno/2w6tcdTs3OY5cTuK4
	vPRXlXMJug4BHy/dcGZ+/akf3aj+kP/tQ6OEaGnreSS0xQa7uH/ANG3OePLMAxukG59f
	IDPsd+/gVEVQAPeKDqbj9sREDBxXY5/+RmPL4b8K93bGrgWVFXrym8Ewl5DSixl9Eku+
	a5KXaC2jknfYZgTh3EpDrIL72T8NRuylM2XgT0Mw+C4Z8t6+Ymge9PGsPhMZMIHnSX75
	KI946Ps+X3iAqWIuwC5mouQt1RkVukJlyE5bmUlguqVpPFIdiv7Qqtg/8C/xYOh7eSRE
	o59A==
X-Gm-Message-State: APjAAAX/e+wk37sQylMNrOClQtn/iUGtaepndJfCpuKJmV1aJi0TkDS2
	kvoFSUkZbmgs5UL1EzWAwbF8lucOOWO9VkIbtZs=
X-Google-Smtp-Source: APXvYqwihGJURZU8NM4DvI90K95N22ADpLigKC44vk2PHXug4/u0RpK69tcTUcsBAzhuQftKbpKC8C4O6CEK4BSy9Wo=
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr7730650wrw.104.1567524988317; 
	Tue, 03 Sep 2019 08:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <5f601d9d33b2868c3962194eb23ccf5e23722110.camel@linuxfoundation.org>
	<537223ac-6a63-d502-5491-026d99df6323@gmail.com>
	<CADkTA4PBxODvdH=pnpTxrqJG_PcJnfpzgD7PhCU8kORUQskCHA@mail.gmail.com>
In-Reply-To: <CADkTA4PBxODvdH=pnpTxrqJG_PcJnfpzgD7PhCU8kORUQskCHA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 11:36:16 -0400
Message-ID: <CADkTA4NE070JrH-JQKsOJKD=Fj8VEUNiWQDKnO+Acvrp76muTg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Tue, 03 Sep 2019 15:36:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2019 at 11:15 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Tue, Sep 3, 2019 at 11:09 AM akuster808 <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 9/3/19 1:10 AM, Richard Purdie wrote:
> > > I'm going to summarise the current state as it will help people see t=
he
> > > set of issues we have. We have three issues blocking the current patc=
h
> > > queue and kernel uprev, spread over four machines and five autobuilde=
r
> > > targets:
> > >
> > > qemumips64:
> > >
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/9=
87
> > >
> > >   RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED (1.97s)
> > >
> > >   Central error: [    1.689184] kprobes: failed to populate blacklist=
: -22
> > >   [happens 5.2 kernel only]
> > >
> > > qemumips:
> > >
> > >   qemu machine locks up:
> > >
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9=
82
> > >
> > >   (happens with 5.0 and 5.2 kernels and qemu 4.0 and 4.1 and is in
> > >    master. Not sure of the original cause)
> > >
> > > qemuarm64:
> > >
> > >   Central error: [    1.816386] kprobes: failed to populate blacklist=
: -22
> > >
> > >   RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED (1.11s)
> > >
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3=
29
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9=
85
> > >   [happens 5.2 kernel only]
> > >
> > > qemuarm:
> > >
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/9=
90
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/9=
89
> > >
> > >   See compile failure for stap.StapTest.test_stap below.
> > >   [happens 5.2 kernel only]
> >
> > there are about 3  5.2 kernel patches sitting on systemtap master.
> >
> > I will give it a shot
>
> Sounds good.  If possible, can you send them to the linux-yocto
> mailing list as kernel patches (if they work) .. versus doing a
> linux-yocto_5.2 SRC_URI update with patches, since it is harder for me
> to integrate them to the tree itself if they are sent that way.

.. that is of course if they are kernel patches. I haven't had enough
coffee yet today.

Bruce

>
> Bruce
>
> > - armin
> > >
> > > The qemumips issue is of particular concern.
> > >
> > > Also needed to sort out M3 are:
> > >
> > >  * toolchain tests nrossi is working on
> > >  * resolution to the hashserv scaling problem
> > >  * bug fixing for the hash equiv code
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > > stap.StapTest.test_stap failure:
> > >
> > >
> > > WARNING: Kernel function symbol table missing [man warning::symbols]
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:21=
4,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h: In function '=
__access_process_vm_':
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h:28:8: error: i=
mplicit declaration of function 'get_task_mm'; did you mean 'get_task_comm'=
? [-Werror=3Dimplicit-function-declaration]
> > >    28 |   mm =3D get_task_mm (tsk);
> > >       |        ^~~~~~~~~~~
> > >       |        get_task_comm
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h:28:6: error: a=
ssignment to 'struct mm_struct *' from 'int' makes pointer from integer wit=
hout a cast [-Werror=3Dint-conversion]
> > >    28 |   mm =3D get_task_mm (tsk);
> > >       |      ^
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h:51:61: error: =
passing argument 6 of 'get_user_pages_remote' makes pointer from integer wi=
thout a cast [-Werror=3Dint-conversion]
> > >    51 |       ret =3D get_user_pages_remote (tsk, mm, addr, 1, write,=
 1, &page, &vma);
> > >       |                                                             ^
> > >       |                                                             |
> > >       |                                                             i=
nt
> > > In file included from ./include/linux/kallsyms.h:12,
> > >                  from ./include/linux/ftrace.h:11,
> > >                  from ./include/linux/kprobes.h:29,
> > >                  from /usr/share/systemtap/runtime/linux/runtime.h:21=
,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > ./include/linux/mm.h:1592:46: note: expected 'struct page **' but arg=
ument is of type 'int'
> > >  1592 |        unsigned int gup_flags, struct page **pages,
> > >       |                                ~~~~~~~~~~~~~~^~~~~
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:21=
4,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h:51:64: error: =
passing argument 7 of 'get_user_pages_remote' from incompatible pointer typ=
e [-Werror=3Dincompatible-pointer-types]
> > >    51 |       ret =3D get_user_pages_remote (tsk, mm, addr, 1, write,=
 1, &page, &vma);
> > >       |                                                              =
  ^~~~~
> > >       |                                                              =
  |
> > >       |                                                              =
  struct page **
> > > In file included from ./include/linux/kallsyms.h:12,
> > >                  from ./include/linux/ftrace.h:11,
> > >                  from ./include/linux/kprobes.h:29,
> > >                  from /usr/share/systemtap/runtime/linux/runtime.h:21=
,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > ./include/linux/mm.h:1593:32: note: expected 'struct vm_area_struct *=
*' but argument is of type 'struct page **'
> > >  1593 |        struct vm_area_struct **vmas, int *locked);
> > >       |        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:21=
4,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h:51:71: error: =
passing argument 8 of 'get_user_pages_remote' from incompatible pointer typ=
e [-Werror=3Dincompatible-pointer-types]
> > >    51 |       ret =3D get_user_pages_remote (tsk, mm, addr, 1, write,=
 1, &page, &vma);
> > >       |                                                              =
         ^~~~
> > >       |                                                              =
         |
> > >       |                                                              =
         struct vm_area_struct **
> > > In file included from ./include/linux/kallsyms.h:12,
> > >                  from ./include/linux/ftrace.h:11,
> > >                  from ./include/linux/kprobes.h:29,
> > >                  from /usr/share/systemtap/runtime/linux/runtime.h:21=
,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > ./include/linux/mm.h:1593:43: note: expected 'int *' but argument is =
of type 'struct vm_area_struct **'
> > >  1593 |        struct vm_area_struct **vmas, int *locked);
> > >       |                                      ~~~~~^~~~~~
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:21=
4,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/access_process_vm.h:88:3: error: i=
mplicit declaration of function 'mmput' [-Werror=3Dimplicit-function-declar=
ation]
> > >    88 |   mmput (mm);
> > >       |   ^~~~~
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:21=
7,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/alloc.c: In function '_stp_alloc_p=
ercpu':
> > > /usr/share/systemtap/runtime/linux/alloc.c:456:8: error: too few argu=
ments to function '__alloc_percpu'
> > >   456 |  ret =3D __alloc_percpu(size);
> > >       |        ^~~~~~~~~~~~~~
> > > In file included from ./include/linux/topology.h:34,
> > >                  from ./include/linux/gfp.h:9,
> > >                  from /usr/share/systemtap/runtime/linux/runtime_defi=
nes.h:20,
> > >                  from /usr/share/systemtap/runtime/runtime_defines.h:=
8,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> > > ./include/linux/percpu.h:135:23: note: declared here
> > >   135 | extern void __percpu *__alloc_percpu(size_t size, size_t alig=
n);
> > >       |                       ^~~~~~~~~~~~~~
> > > In file included from /usr/share/systemtap/runtime/linux/../regs.c:20=
,
> > >                  from /usr/share/systemtap/runtime/linux/runtime.h:22=
2,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/../linux/regs.c: In function '_stp=
_print_regs':
> > > /usr/share/systemtap/runtime/linux/../linux/regs.c:261:15: error: imp=
licit declaration of function 'get_ds'; did you mean 'get_fs'? [-Werror=3Di=
mplicit-function-declaration]
> > >   261 |   get_fs() =3D=3D get_ds() ? "kernel" : "user");
> > >       |               ^~~~~~
> > >       |               get_fs
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:24=
4,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/addr-map.c: In function 'lookup_ba=
d_addr':
> > > /usr/share/systemtap/runtime/linux/addr-map.c:63:63: error: macro "ac=
cess_ok" passed 3 arguments, but takes just 2
> > >    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, siz=
e))
> > >       |                                                              =
 ^
> > > In file included from ./include/linux/uaccess.h:11,
> > >                  from /usr/share/systemtap/runtime/addr-map.h:17,
> > >                  from /usr/share/systemtap/runtime/runtime.h:22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > ./arch/arm/include/asm/uaccess.h:280: note: macro "access_ok" defined=
 here
> > >   280 | #define access_ok(addr, size) (__range_ok(addr, size) =3D=3D =
0)
> > >       |
> > > In file included from /usr/share/systemtap/runtime/linux/runtime.h:24=
4,
> > >                  from /usr/share/systemtap/runtime/runtime.h:26,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > /usr/share/systemtap/runtime/linux/addr-map.c:41:30: error: 'access_o=
k' undeclared (first use in this function)
> > >    41 | #define stp_access_ok(x,y,z) access_ok(x,y,z)
> > >       |                              ^~~~~~~~~
> > > /usr/share/systemtap/runtime/linux/addr-map.c:63:25: note: in expansi=
on of macro 'stp_access_ok'
> > >    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, siz=
e))
> > >       |                         ^~~~~~~~~~~~~
> > > /usr/share/systemtap/runtime/linux/addr-map.c:41:30: note: each undec=
lared identifier is reported only once for each function it appears in
> > >    41 | #define stp_access_ok(x,y,z) access_ok(x,y,z)
> > >       |                              ^~~~~~~~~
> > > /usr/share/systemtap/runtime/linux/addr-map.c:63:25: note: in expansi=
on of macro 'stp_access_ok'
> > >    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, siz=
e))
> > >       |                         ^~~~~~~~~~~~~
> > > In file included from /usr/share/systemtap/runtime/transport/transpor=
t.c:23,
> > >                  from /usr/share/systemtap/runtime/linux/print.c:17,
> > >                  from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h: At =
top level:
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16: =
error: "KUIDT_INIT" redefined [-Werror]
> > >    16 | #define KUIDT_INIT(value) ((uid_t) value)
> > >       |
> > > In file included from ./include/linux/ipc.h:6,
> > >                  from ./include/uapi/linux/sem.h:5,
> > >                  from ./include/linux/sem.h:5,
> > >                  from ./include/linux/sched.h:15,
> > >                  from ./include/linux/uaccess.h:5,
> > >                  from /usr/share/systemtap/runtime/addr-map.h:17,
> > >                  from /usr/share/systemtap/runtime/runtime.h:22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > ./include/linux/uidgid.h:30: note: this is the location of the previo=
us definition
> > >    30 | #define KUIDT_INIT(value) (kuid_t){ value }
> > >       |
> > > In file included from /usr/share/systemtap/runtime/transport/transpor=
t.c:23,
> > >                  from /usr/share/systemtap/runtime/linux/print.c:17,
> > >                  from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17: =
error: "KGIDT_INIT" redefined [-Werror]
> > >    17 | #define KGIDT_INIT(value) ((gid_t) value)
> > >       |
> > > In file included from ./include/linux/ipc.h:6,
> > >                  from ./include/uapi/linux/sem.h:5,
> > >                  from ./include/linux/sem.h:5,
> > >                  from ./include/linux/sched.h:15,
> > >                  from ./include/linux/uaccess.h:5,
> > >                  from /usr/share/systemtap/runtime/addr-map.h:17,
> > >                  from /usr/share/systemtap/runtime/runtime.h:22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> > > ./include/linux/uidgid.h:31: note: this is the location of the previo=
us definition
> > >    31 | #define KGIDT_INIT(value) (kgid_t){ value }
> > >       |
> > > In file included from /usr/share/systemtap/runtime/transport/transpor=
t.c:23,
> > >                  from /usr/share/systemtap/runtime/linux/print.c:17,
> > >                  from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/transport/relay_v2.c: In function '__stp=
_relay_create_buf_file_callback':
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16:2=
7: error: incompatible types when assigning to type 'kuid_t' {aka 'struct <=
anonymous>'} from type 'unsigned int'
> > >    16 | #define KUIDT_INIT(value) ((uid_t) value)
> > >       |                           ^
> > > /usr/share/systemtap/runtime/transport/relay_v2.c:249:26: note: in ex=
pansion of macro 'KUIDT_INIT'
> > >   249 |   file->d_inode->i_uid =3D KUIDT_INIT(_stp_uid);
> > >       |                          ^~~~~~~~~~
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17:2=
7: error: incompatible types when assigning to type 'kgid_t' {aka 'struct <=
anonymous>'} from type 'unsigned int'
> > >    17 | #define KGIDT_INIT(value) ((gid_t) value)
> > >       |                           ^
> > > /usr/share/systemtap/runtime/transport/relay_v2.c:250:26: note: in ex=
pansion of macro 'KGIDT_INIT'
> > >   250 |   file->d_inode->i_gid =3D KGIDT_INIT(_stp_gid);
> > >       |                          ^~~~~~~~~~
> > > In file included from /usr/share/systemtap/runtime/transport/transpor=
t.c:65,
> > >                  from /usr/share/systemtap/runtime/linux/print.c:17,
> > >                  from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/transport/relay_v2.c: At top level:
> > > /usr/share/systemtap/runtime/transport/relay_v2.c:257:21: error: init=
ialization of 'struct dentry * (*)(const char *, struct dentry *, umode_t, =
 struct rchan_buf *, int *)' {aka 'struct dentry * (*)(const char *, struct=
 dentry *, short unsigned int,  struct rchan_buf *, int *)'} from incompati=
ble pointer type 'struct dentry * (*)(const char *, struct dentry *, int,  =
struct rchan_buf *, int *)' [-Werror=3Dincompatible-pointer-types]
> > >   257 |  .create_buf_file =3D __stp_relay_create_buf_file_callback,
> > >       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > /usr/share/systemtap/runtime/transport/relay_v2.c:257:21: note: (near=
 initialization for '__stp_relay_callbacks.create_buf_file')
> > > In file included from /usr/share/systemtap/runtime/transport/transpor=
t.c:23,
> > >                  from /usr/share/systemtap/runtime/linux/print.c:17,
> > >                  from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/transport/debugfs.c: In function '_stp_r=
egister_ctl_channel_fs':
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16:2=
7: error: incompatible types when assigning to type 'kuid_t' {aka 'struct <=
anonymous>'} from type 'unsigned int'
> > >    16 | #define KUIDT_INIT(value) ((uid_t) value)
> > >       |                           ^
> > > /usr/share/systemtap/runtime/transport/debugfs.c:52:34: note: in expa=
nsion of macro 'KUIDT_INIT'
> > >    52 |  _stp_cmd_file->d_inode->i_uid =3D KUIDT_INIT(_stp_uid);
> > >       |                                  ^~~~~~~~~~
> > > /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17:2=
7: error: incompatible types when assigning to type 'kgid_t' {aka 'struct <=
anonymous>'} from type 'unsigned int'
> > >    17 | #define KGIDT_INIT(value) ((gid_t) value)
> > >       |                           ^
> > > /usr/share/systemtap/runtime/transport/debugfs.c:53:34: note: in expa=
nsion of macro 'KGIDT_INIT'
> > >    53 |  _stp_cmd_file->d_inode->i_gid =3D KGIDT_INIT(_stp_gid);
> > >       |                                  ^~~~~~~~~~
> > > In file included from /usr/share/systemtap/runtime/linux/print.c:17,
> > >                  from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/transport/transport.c: In function '_stp=
_lock_inode':
> > > /usr/share/systemtap/runtime/transport/transport.c:507:19: error: 'st=
ruct inode' has no member named 'i_mutex'
> > >   507 |  mutex_lock(&inode->i_mutex);
> > >       |                   ^~
> > > /usr/share/systemtap/runtime/transport/transport.c: In function '_stp=
_unlock_inode':
> > > /usr/share/systemtap/runtime/transport/transport.c:520:21: error: 'st=
ruct inode' has no member named 'i_mutex'
> > >   520 |  mutex_unlock(&inode->i_mutex);
> > >       |                     ^~
> > > In file included from ./include/asm-generic/bug.h:18,
> > >                  from ./arch/arm/include/asm/bug.h:60,
> > >                  from ./include/linux/bug.h:5,
> > >                  from ./include/linux/mmdebug.h:5,
> > >                  from ./include/linux/gfp.h:5,
> > >                  from /usr/share/systemtap/runtime/linux/runtime_defi=
nes.h:20,
> > >                  from /usr/share/systemtap/runtime/runtime_defines.h:=
8,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> > > /usr/share/systemtap/runtime/transport/transport.c: In function '_stp=
_get_root_dir':
> > > /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'st=
ruct hlist_head' has no member named 'next'
> > >   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
> > >       |                                ^
> > > ./include/linux/kernel.h:970:26: note: in definition of macro 'contai=
ner_of'
> > >   970 |  void *__mptr =3D (void *)(ptr);     \
> > >       |                          ^~~
> > > /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in ex=
pansion of macro 'list_entry'
> > >   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
> > >       |        ^~~~~~~~~~
> > > In file included from ./include/uapi/linux/swab.h:6,
> > >                  from ./include/linux/swab.h:5,
> > >                  from ./arch/arm/include/asm/opcodes.h:86,
> > >                  from ./arch/arm/include/asm/bug.h:7,
> > >                  from ./include/linux/bug.h:5,
> > >                  from ./include/linux/mmdebug.h:5,
> > >                  from ./include/linux/gfp.h:5,
> > >                  from /usr/share/systemtap/runtime/linux/runtime_defi=
nes.h:20,
> > >                  from /usr/share/systemtap/runtime/runtime_defines.h:=
8,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> > > /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'st=
ruct hlist_head' has no member named 'next'
> > >   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
> > >       |                                ^
> > > ./include/linux/compiler.h:325:9: note: in definition of macro '__com=
piletime_assert'
> > >   325 |   if (!(condition))     \
> > >       |         ^~~~~~~~~
> > > ./include/linux/compiler.h:345:2: note: in expansion of macro '_compi=
letime_assert'
> > >   345 |  _compiletime_assert(condition, msg, __compiletime_assert_, _=
_LINE__)
> > >       |  ^~~~~~~~~~~~~~~~~~~
> > > ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compi=
letime_assert'
> > >    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond=
), msg)
> > >       |                                     ^~~~~~~~~~~~~~~~~~
> > > ./include/linux/kernel.h:971:2: note: in expansion of macro 'BUILD_BU=
G_ON_MSG'
> > >   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &=
& \
> > >       |  ^~~~~~~~~~~~~~~~
> > > ./include/linux/kernel.h:971:20: note: in expansion of macro '__same_=
type'
> > >   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &=
& \
> > >       |                    ^~~~~~~~~~~
> > > ./include/linux/list.h:465:2: note: in expansion of macro 'container_=
of'
> > >   465 |  container_of(ptr, type, member)
> > >       |  ^~~~~~~~~~~~
> > > /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in ex=
pansion of macro 'list_entry'
> > >   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
> > >       |        ^~~~~~~~~~
> > > /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'st=
ruct hlist_head' has no member named 'next'
> > >   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
> > >       |                                ^
> > > ./include/linux/compiler.h:325:9: note: in definition of macro '__com=
piletime_assert'
> > >   325 |   if (!(condition))     \
> > >       |         ^~~~~~~~~
> > > ./include/linux/compiler.h:345:2: note: in expansion of macro '_compi=
letime_assert'
> > >   345 |  _compiletime_assert(condition, msg, __compiletime_assert_, _=
_LINE__)
> > >       |  ^~~~~~~~~~~~~~~~~~~
> > > ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compi=
letime_assert'
> > >    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond=
), msg)
> > >       |                                     ^~~~~~~~~~~~~~~~~~
> > > ./include/linux/kernel.h:971:2: note: in expansion of macro 'BUILD_BU=
G_ON_MSG'
> > >   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &=
& \
> > >       |  ^~~~~~~~~~~~~~~~
> > > ./include/linux/kernel.h:972:6: note: in expansion of macro '__same_t=
ype'
> > >   972 |     !__same_type(*(ptr), void),   \
> > >       |      ^~~~~~~~~~~
> > > ./include/linux/list.h:465:2: note: in expansion of macro 'container_=
of'
> > >   465 |  container_of(ptr, type, member)
> > >       |  ^~~~~~~~~~~~
> > > /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in ex=
pansion of macro 'list_entry'
> > >   603 |   sb =3D list_entry(fs->fs_supers.next, struct super_block,
> > >       |        ^~~~~~~~~~
> > > In file included from /usr/share/systemtap/runtime/print.c:17,
> > >                  from /usr/share/systemtap/runtime/runtime_context.h:=
22,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> > > /usr/share/systemtap/runtime/linux/print.c: In function '_stp_print_k=
ernel_info':
> > > /usr/share/systemtap/runtime/linux/print.c:215:20: error: 'struct mod=
ule' has no member named 'module_core'
> > >   215 |         THIS_MODULE->module_core,
> > >       |                    ^~
> > > /usr/share/systemtap/runtime/linux/print.c:216:37: error: 'struct mod=
ule' has no member named 'core_size'
> > >   216 |         (unsigned long) (THIS_MODULE->core_size - THIS_MODULE=
->core_text_size)/1024,
> > >       |                                     ^~
> > > /usr/share/systemtap/runtime/linux/print.c:216:62: error: 'struct mod=
ule' has no member named 'core_text_size'
> > >   216 |         (unsigned long) (THIS_MODULE->core_size - THIS_MODULE=
->core_text_size)/1024,
> > >       |                                                              =
^~
> > > /usr/share/systemtap/runtime/linux/print.c:217:44: error: 'struct mod=
ule' has no member named 'core_text_size'
> > >   217 |                (unsigned long) (THIS_MODULE->core_text_size)/=
1024,
> > >       |                                            ^~
> > > In file included from /usr/share/systemtap/runtime/timer.h:17,
> > >                  from /tmp/stapgYOLtD/stap_19208_src.c:70:
> > > /tmp/stapgYOLtD/stap_19208_src.c: In function 'module_refresh_timer_c=
b':
> > > /usr/share/systemtap/runtime/linux/timer.h:41:56: error: 'struct hrti=
mer' has no member named 'expires'
> > >    41 | #define hrtimer_set_expires(timer, time) (void)((timer)->expi=
res =3D (time))
> > >       |                                                        ^~
> > > /tmp/stapgYOLtD/stap_19208_src.c:78:3: note: in expansion of macro 'h=
rtimer_set_expires'
> > >    78 |   hrtimer_set_expires(timer,
> > >       |   ^~~~~~~~~~~~~~~~~~~
> > > /usr/share/systemtap/runtime/linux/timer.h:40:44: error: 'struct hrti=
mer' has no member named 'expires'
> > >    40 | #define hrtimer_get_expires(timer) ((timer)->expires)
> > >       |                                            ^~
> > > /usr/share/systemtap/runtime/linux/timer.h:41:69: note: in definition=
 of macro 'hrtimer_set_expires'
> > >    41 | #define hrtimer_set_expires(timer, time) (void)((timer)->expi=
res =3D (time))
> > >       |                                                              =
       ^~~~
> > > /tmp/stapgYOLtD/stap_19208_src.c:79:5: note: in expansion of macro 'k=
time_add'
> > >    79 |     ktime_add(hrtimer_get_expires(timer),
> > >       |     ^~~~~~~~~
> > > /tmp/stapgYOLtD/stap_19208_src.c:79:15: note: in expansion of macro '=
hrtimer_get_expires'
> > >    79 |     ktime_add(hrtimer_get_expires(timer),
> > >       |               ^~~~~~~~~~~~~~~~~~~
> > > cc1: all warnings being treated as errors
> > > make[1]: *** [scripts/Makefile.build:278: /tmp/stapgYOLtD/stap_19208_=
src.o] Error 1
> > > make: *** [Makefile:1597: _module_/tmp/stapgYOLtD] Error 2
> > > WARNING: kbuild exited with status: 2
> > > Pass 4: compilation failed.  [man error::pass4]
> > >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

