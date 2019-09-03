Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 651127F331
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:09:33 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m3so9281493pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YoskFbucUD1BvCT8cONGpjxz8wJAG8SHMTFFxhVQsws=;
	b=euMk8QaI5LnlhLVRXpetZlooS0D7UTjYGdl7DtREZsSQ/DTWt+tKlPBmcYv1OS20d+
	kxv3lFm2iOZBkj5o/Iw1JJresySeqtV3uZIAEsDf5x58w/WhBAnPMxkeYRYyPZyxOmbM
	9Tvsm2oG1Z8cRXUW8aD/umvsbnyYc8AiDKyLUj9dXskPoln2FCNhbI7jQHcxcVNfCsJY
	fWXQwifPaERPlXrSXYdrIgnaPYZhq9FHECLJVHav//wrGSxdkFPgfBNJu9PdeNs+/CTN
	B798kFWRd1rOwgKTcbubZfs/7V5D4yvYLteLWpgs8KzKFxQBBdoTU6uN2T1DDy/kn7by
	nXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=YoskFbucUD1BvCT8cONGpjxz8wJAG8SHMTFFxhVQsws=;
	b=heAD3naDVqCzwYx3960oQwdyzG9JDXQbN+yS5yVhXzrP4FyDj1bCo6NC9OmQpkqyQF
	iFwrUNflV7Ig0VRYnYseVlbgZkTuWznS13HSa3UO3nfjjuhuMPBDD0ipwwj0H29Ed6Vm
	vGu2jAkxf0xQtIO0Yg8Gr8OC4o9FuvvOFiZ968NUfcVv9FVGOoEVtB76xLO2JXZXYgnn
	RSDzwvvLk98Nc2NNxdxzab/cMbeip//qJlhrmhiarF9VqlTigigc+N6gGOpqJQDq+tkW
	WcLvGyuQdVxmFno83nkg5twKUnqaGOHmmlKo2/Fd6UIny+0dLvk+/UfgKZdYsgiytpry
	4W2A==
X-Gm-Message-State: APjAAAXP/2jbWLQxyP7xtJKofsbKICEQ1xr72CbXoQFhzzrfn+zCoe0i
	+uN3SFxLVuNt+enOA1nGnc2OfGBC
X-Google-Smtp-Source: APXvYqxZymZxs5Ltsb2kl1OxyJOolKK+k13X72eY+Gxu/FNdrmNr5/6aae+2rdUdvk4FJHXxXulrSg==
X-Received: by 2002:a17:90a:2243:: with SMTP id
	c61mr502492pje.39.1567523373745; 
	Tue, 03 Sep 2019 08:09:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7901:9fbe:6d35:e8ad?
	([2601:202:4180:c33:7901:9fbe:6d35:e8ad])
	by smtp.gmail.com with ESMTPSA id
	h9sm15938855pgh.51.2019.09.03.08.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 08:09:32 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5f601d9d33b2868c3962194eb23ccf5e23722110.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <537223ac-6a63-d502-5491-026d99df6323@gmail.com>
Date: Tue, 3 Sep 2019 08:09:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5f601d9d33b2868c3962194eb23ccf5e23722110.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 03 Sep 2019 15:09:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/3/19 1:10 AM, Richard Purdie wrote:
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
>   Central error: [    1.689184] kprobes: failed to populate blacklist: -22
>   [happens 5.2 kernel only]
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
>   Central error: [    1.816386] kprobes: failed to populate blacklist: -22
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

there are about 3  5.2 kernel patches sitting on systemtap master.

I will give it a shot
- armin
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
> /usr/share/systemtap/runtime/linux/access_process_vm.h: In function '__access_process_vm_':
> /usr/share/systemtap/runtime/linux/access_process_vm.h:28:8: error: implicit declaration of function 'get_task_mm'; did you mean 'get_task_comm'? [-Werror=implicit-function-declaration]
>    28 |   mm = get_task_mm (tsk);
>       |        ^~~~~~~~~~~
>       |        get_task_comm
> /usr/share/systemtap/runtime/linux/access_process_vm.h:28:6: error: assignment to 'struct mm_struct *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>    28 |   mm = get_task_mm (tsk);
>       |      ^
> /usr/share/systemtap/runtime/linux/access_process_vm.h:51:61: error: passing argument 6 of 'get_user_pages_remote' makes pointer from integer without a cast [-Werror=int-conversion]
>    51 |       ret = get_user_pages_remote (tsk, mm, addr, 1, write, 1, &page, &vma);
>       |                                                             ^
>       |                                                             |
>       |                                                             int
> In file included from ./include/linux/kallsyms.h:12,
>                  from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:29,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:21,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/mm.h:1592:46: note: expected 'struct page **' but argument is of type 'int'
>  1592 |        unsigned int gup_flags, struct page **pages,
>       |                                ~~~~~~~~~~~~~~^~~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h:51:64: error: passing argument 7 of 'get_user_pages_remote' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    51 |       ret = get_user_pages_remote (tsk, mm, addr, 1, write, 1, &page, &vma);
>       |                                                                ^~~~~
>       |                                                                |
>       |                                                                struct page **
> In file included from ./include/linux/kallsyms.h:12,
>                  from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:29,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:21,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/mm.h:1593:32: note: expected 'struct vm_area_struct **' but argument is of type 'struct page **'
>  1593 |        struct vm_area_struct **vmas, int *locked);
>       |        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h:51:71: error: passing argument 8 of 'get_user_pages_remote' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    51 |       ret = get_user_pages_remote (tsk, mm, addr, 1, write, 1, &page, &vma);
>       |                                                                       ^~~~
>       |                                                                       |
>       |                                                                       struct vm_area_struct **
> In file included from ./include/linux/kallsyms.h:12,
>                  from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:29,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:21,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./include/linux/mm.h:1593:43: note: expected 'int *' but argument is of type 'struct vm_area_struct **'
>  1593 |        struct vm_area_struct **vmas, int *locked);
>       |                                      ~~~~~^~~~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:214,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/access_process_vm.h:88:3: error: implicit declaration of function 'mmput' [-Werror=implicit-function-declaration]
>    88 |   mmput (mm);
>       |   ^~~~~
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:217,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/alloc.c: In function '_stp_alloc_percpu':
> /usr/share/systemtap/runtime/linux/alloc.c:456:8: error: too few arguments to function '__alloc_percpu'
>   456 |  ret = __alloc_percpu(size);
>       |        ^~~~~~~~~~~~~~
> In file included from ./include/linux/topology.h:34,
>                  from ./include/linux/gfp.h:9,
>                  from /usr/share/systemtap/runtime/linux/runtime_defines.h:20,
>                  from /usr/share/systemtap/runtime/runtime_defines.h:8,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> ./include/linux/percpu.h:135:23: note: declared here
>   135 | extern void __percpu *__alloc_percpu(size_t size, size_t align);
>       |                       ^~~~~~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/linux/../regs.c:20,
>                  from /usr/share/systemtap/runtime/linux/runtime.h:222,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/../linux/regs.c: In function '_stp_print_regs':
> /usr/share/systemtap/runtime/linux/../linux/regs.c:261:15: error: implicit declaration of function 'get_ds'; did you mean 'get_fs'? [-Werror=implicit-function-declaration]
>   261 |   get_fs() == get_ds() ? "kernel" : "user");
>       |               ^~~~~~
>       |               get_fs
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:244,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/addr-map.c: In function 'lookup_bad_addr':
> /usr/share/systemtap/runtime/linux/addr-map.c:63:63: error: macro "access_ok" passed 3 arguments, but takes just 2
>    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, size))
>       |                                                               ^
> In file included from ./include/linux/uaccess.h:11,
>                  from /usr/share/systemtap/runtime/addr-map.h:17,
>                  from /usr/share/systemtap/runtime/runtime.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> ./arch/arm/include/asm/uaccess.h:280: note: macro "access_ok" defined here
>   280 | #define access_ok(addr, size) (__range_ok(addr, size) == 0)
>       | 
> In file included from /usr/share/systemtap/runtime/linux/runtime.h:244,
>                  from /usr/share/systemtap/runtime/runtime.h:26,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:26:
> /usr/share/systemtap/runtime/linux/addr-map.c:41:30: error: 'access_ok' undeclared (first use in this function)
>    41 | #define stp_access_ok(x,y,z) access_ok(x,y,z)
>       |                              ^~~~~~~~~
> /usr/share/systemtap/runtime/linux/addr-map.c:63:25: note: in expansion of macro 'stp_access_ok'
>    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, size))
>       |                         ^~~~~~~~~~~~~
> /usr/share/systemtap/runtime/linux/addr-map.c:41:30: note: each undeclared identifier is reported only once for each function it appears in
>    41 | #define stp_access_ok(x,y,z) access_ok(x,y,z)
>       |                              ^~~~~~~~~
> /usr/share/systemtap/runtime/linux/addr-map.c:63:25: note: in expansion of macro 'stp_access_ok'
>    63 |       || (in_task() && !stp_access_ok(type, (void *)addr, size))
>       |                         ^~~~~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/transport/transport.c:23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h: At top level:
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16: error: "KUIDT_INIT" redefined [-Werror]
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
> ./include/linux/uidgid.h:30: note: this is the location of the previous definition
>    30 | #define KUIDT_INIT(value) (kuid_t){ value }
>       | 
> In file included from /usr/share/systemtap/runtime/transport/transport.c:23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17: error: "KGIDT_INIT" redefined [-Werror]
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
> ./include/linux/uidgid.h:31: note: this is the location of the previous definition
>    31 | #define KGIDT_INIT(value) (kgid_t){ value }
>       | 
> In file included from /usr/share/systemtap/runtime/transport/transport.c:23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/relay_v2.c: In function '__stp_relay_create_buf_file_callback':
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16:27: error: incompatible types when assigning to type 'kuid_t' {aka 'struct <anonymous>'} from type 'unsigned int'
>    16 | #define KUIDT_INIT(value) ((uid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/relay_v2.c:249:26: note: in expansion of macro 'KUIDT_INIT'
>   249 |   file->d_inode->i_uid = KUIDT_INIT(_stp_uid);
>       |                          ^~~~~~~~~~
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17:27: error: incompatible types when assigning to type 'kgid_t' {aka 'struct <anonymous>'} from type 'unsigned int'
>    17 | #define KGIDT_INIT(value) ((gid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/relay_v2.c:250:26: note: in expansion of macro 'KGIDT_INIT'
>   250 |   file->d_inode->i_gid = KGIDT_INIT(_stp_gid);
>       |                          ^~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/transport/transport.c:65,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/relay_v2.c: At top level:
> /usr/share/systemtap/runtime/transport/relay_v2.c:257:21: error: initialization of 'struct dentry * (*)(const char *, struct dentry *, umode_t,  struct rchan_buf *, int *)' {aka 'struct dentry * (*)(const char *, struct dentry *, short unsigned int,  struct rchan_buf *, int *)'} from incompatible pointer type 'struct dentry * (*)(const char *, struct dentry *, int,  struct rchan_buf *, int *)' [-Werror=incompatible-pointer-types]
>   257 |  .create_buf_file = __stp_relay_create_buf_file_callback,
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /usr/share/systemtap/runtime/transport/relay_v2.c:257:21: note: (near initialization for '__stp_relay_callbacks.create_buf_file')
> In file included from /usr/share/systemtap/runtime/transport/transport.c:23,
>                  from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/debugfs.c: In function '_stp_register_ctl_channel_fs':
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:16:27: error: incompatible types when assigning to type 'kuid_t' {aka 'struct <anonymous>'} from type 'unsigned int'
>    16 | #define KUIDT_INIT(value) ((uid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/debugfs.c:52:34: note: in expansion of macro 'KUIDT_INIT'
>    52 |  _stp_cmd_file->d_inode->i_uid = KUIDT_INIT(_stp_uid);
>       |                                  ^~~~~~~~~~
> /usr/share/systemtap/runtime/transport/../uidgid_compatibility.h:17:27: error: incompatible types when assigning to type 'kgid_t' {aka 'struct <anonymous>'} from type 'unsigned int'
>    17 | #define KGIDT_INIT(value) ((gid_t) value)
>       |                           ^
> /usr/share/systemtap/runtime/transport/debugfs.c:53:34: note: in expansion of macro 'KGIDT_INIT'
>    53 |  _stp_cmd_file->d_inode->i_gid = KGIDT_INIT(_stp_gid);
>       |                                  ^~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/linux/print.c:17,
>                  from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/transport/transport.c: In function '_stp_lock_inode':
> /usr/share/systemtap/runtime/transport/transport.c:507:19: error: 'struct inode' has no member named 'i_mutex'
>   507 |  mutex_lock(&inode->i_mutex);
>       |                   ^~
> /usr/share/systemtap/runtime/transport/transport.c: In function '_stp_unlock_inode':
> /usr/share/systemtap/runtime/transport/transport.c:520:21: error: 'struct inode' has no member named 'i_mutex'
>   520 |  mutex_unlock(&inode->i_mutex);
>       |                     ^~
> In file included from ./include/asm-generic/bug.h:18,
>                  from ./arch/arm/include/asm/bug.h:60,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/gfp.h:5,
>                  from /usr/share/systemtap/runtime/linux/runtime_defines.h:20,
>                  from /usr/share/systemtap/runtime/runtime_defines.h:8,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> /usr/share/systemtap/runtime/transport/transport.c: In function '_stp_get_root_dir':
> /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'struct hlist_head' has no member named 'next'
>   603 |   sb = list_entry(fs->fs_supers.next, struct super_block,
>       |                                ^
> ./include/linux/kernel.h:970:26: note: in definition of macro 'container_of'
>   970 |  void *__mptr = (void *)(ptr);     \
>       |                          ^~~
> /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in expansion of macro 'list_entry'
>   603 |   sb = list_entry(fs->fs_supers.next, struct super_block,
>       |        ^~~~~~~~~~
> In file included from ./include/uapi/linux/swab.h:6,
>                  from ./include/linux/swab.h:5,
>                  from ./arch/arm/include/asm/opcodes.h:86,
>                  from ./arch/arm/include/asm/bug.h:7,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/gfp.h:5,
>                  from /usr/share/systemtap/runtime/linux/runtime_defines.h:20,
>                  from /usr/share/systemtap/runtime/runtime_defines.h:8,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:11:
> /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'struct hlist_head' has no member named 'next'
>   603 |   sb = list_entry(fs->fs_supers.next, struct super_block,
>       |                                ^
> ./include/linux/compiler.h:325:9: note: in definition of macro '__compiletime_assert'
>   325 |   if (!(condition))     \
>       |         ^~~~~~~~~
> ./include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
>   345 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>       |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:971:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>       |  ^~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:971:20: note: in expansion of macro '__same_type'
>   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>       |                    ^~~~~~~~~~~
> ./include/linux/list.h:465:2: note: in expansion of macro 'container_of'
>   465 |  container_of(ptr, type, member)
>       |  ^~~~~~~~~~~~
> /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in expansion of macro 'list_entry'
>   603 |   sb = list_entry(fs->fs_supers.next, struct super_block,
>       |        ^~~~~~~~~~
> /usr/share/systemtap/runtime/transport/transport.c:603:32: error: 'struct hlist_head' has no member named 'next'
>   603 |   sb = list_entry(fs->fs_supers.next, struct super_block,
>       |                                ^
> ./include/linux/compiler.h:325:9: note: in definition of macro '__compiletime_assert'
>   325 |   if (!(condition))     \
>       |         ^~~~~~~~~
> ./include/linux/compiler.h:345:2: note: in expansion of macro '_compiletime_assert'
>   345 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>       |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:971:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>   971 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>       |  ^~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:972:6: note: in expansion of macro '__same_type'
>   972 |     !__same_type(*(ptr), void),   \
>       |      ^~~~~~~~~~~
> ./include/linux/list.h:465:2: note: in expansion of macro 'container_of'
>   465 |  container_of(ptr, type, member)
>       |  ^~~~~~~~~~~~
> /usr/share/systemtap/runtime/transport/transport.c:603:8: note: in expansion of macro 'list_entry'
>   603 |   sb = list_entry(fs->fs_supers.next, struct super_block,
>       |        ^~~~~~~~~~
> In file included from /usr/share/systemtap/runtime/print.c:17,
>                  from /usr/share/systemtap/runtime/runtime_context.h:22,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:56:
> /usr/share/systemtap/runtime/linux/print.c: In function '_stp_print_kernel_info':
> /usr/share/systemtap/runtime/linux/print.c:215:20: error: 'struct module' has no member named 'module_core'
>   215 |         THIS_MODULE->module_core,
>       |                    ^~
> /usr/share/systemtap/runtime/linux/print.c:216:37: error: 'struct module' has no member named 'core_size'
>   216 |         (unsigned long) (THIS_MODULE->core_size - THIS_MODULE->core_text_size)/1024,
>       |                                     ^~
> /usr/share/systemtap/runtime/linux/print.c:216:62: error: 'struct module' has no member named 'core_text_size'
>   216 |         (unsigned long) (THIS_MODULE->core_size - THIS_MODULE->core_text_size)/1024,
>       |                                                              ^~
> /usr/share/systemtap/runtime/linux/print.c:217:44: error: 'struct module' has no member named 'core_text_size'
>   217 |                (unsigned long) (THIS_MODULE->core_text_size)/1024,
>       |                                            ^~
> In file included from /usr/share/systemtap/runtime/timer.h:17,
>                  from /tmp/stapgYOLtD/stap_19208_src.c:70:
> /tmp/stapgYOLtD/stap_19208_src.c: In function 'module_refresh_timer_cb':
> /usr/share/systemtap/runtime/linux/timer.h:41:56: error: 'struct hrtimer' has no member named 'expires'
>    41 | #define hrtimer_set_expires(timer, time) (void)((timer)->expires = (time))
>       |                                                        ^~
> /tmp/stapgYOLtD/stap_19208_src.c:78:3: note: in expansion of macro 'hrtimer_set_expires'
>    78 |   hrtimer_set_expires(timer,
>       |   ^~~~~~~~~~~~~~~~~~~
> /usr/share/systemtap/runtime/linux/timer.h:40:44: error: 'struct hrtimer' has no member named 'expires'
>    40 | #define hrtimer_get_expires(timer) ((timer)->expires)
>       |                                            ^~
> /usr/share/systemtap/runtime/linux/timer.h:41:69: note: in definition of macro 'hrtimer_set_expires'
>    41 | #define hrtimer_set_expires(timer, time) (void)((timer)->expires = (time))
>       |                                                                     ^~~~
> /tmp/stapgYOLtD/stap_19208_src.c:79:5: note: in expansion of macro 'ktime_add'
>    79 |     ktime_add(hrtimer_get_expires(timer),
>       |     ^~~~~~~~~
> /tmp/stapgYOLtD/stap_19208_src.c:79:15: note: in expansion of macro 'hrtimer_get_expires'
>    79 |     ktime_add(hrtimer_get_expires(timer),
>       |               ^~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[1]: *** [scripts/Makefile.build:278: /tmp/stapgYOLtD/stap_19208_src.o] Error 1
> make: *** [Makefile:1597: _module_/tmp/stapgYOLtD] Error 2
> WARNING: kbuild exited with status: 2
> Pass 4: compilation failed.  [man error::pass4]
>


