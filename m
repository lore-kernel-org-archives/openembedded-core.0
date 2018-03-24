Return-Path: <kamensky@cisco.com>
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id 7537A787F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 20:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4370; q=dns/txt; s=iport;
	t=1521922376; x=1523131976;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=WlkZoko6FMj+0wPF3moRKyGqhDg7y3N1y3D7TEN3P1U=;
	b=MQQaDwZ8hD2UhWS+FjXN2P1R/VWcNnnwqofal1rbCG7Y1OBeGP+HLZiL
	QEKOlP/00AFyLT8ig4j+J06L9niiJvR1w0DebyZzJENTUZxxpuZAMP68O
	K+0coqsDElbO07onE6gofI53bShFbb/loZv9EHOh3Xxc7Hhb11g1ehn4x E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CKAwCUsLZa/5pdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNBYXAojDuMLoFTIYERhmCNdwsYC4QWTAKDcCE3FQECAQEBAQE?=
	=?us-ascii?q?BAmsohSUBAQEDAQEBNgIzAQsFCwsYLiEGAS8GE4R2Aw0ID6w/hwYNgSyCGoU+g?=
	=?us-ascii?q?hqCFIELL4JZglFCAQSHMAOMV4o6LgiFUoUFXoRlilCJEzuGAQIECwITAYElMiK?=
	=?us-ascii?q?BUk0jFTqCQwmCGBiONx8wkG4BAQ?=
X-IronPort-AV: E=Sophos;i="5.48,356,1517875200"; d="scan'208";a="88901213"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2018 20:12:55 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w2OKCsBs017851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 24 Mar 2018 20:12:54 GMT
Date: Sat, 24 Mar 2018 13:12:54 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Seebs <seebs@seebs.net>
In-Reply-To: <20180324145044.168f7e3f@seebsdell>
Message-ID: <alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 20:12:54 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Here is another crazy idea how to deal with it, just
brainstorming what options are on the table: disable
renameat2 with help of seccomp and force coreutils to
use other calls. Something along the lines that were
suggested with intercept of syscall function call, but
let kernel to do interception work.

Here is tiny example based on my todays learning or
seccomp and eBPF, it shows how on my FC27 filtering out
renameat2 forces coreutils mv do use other calls to do the job.

[kamensky@coreos-lnx2 bpf]$ cat filterout_renameat2.c
#include <stddef.h>
#include <linux/unistd.h>
#include <linux/seccomp.h>
#include <linux/filter.h>
#include <sys/prctl.h>
#include <errno.h>

#define syscall_nr (offsetof(struct seccomp_data, nr))

struct sock_filter filterout_renameat2[] = {
     BPF_STMT(BPF_LD+BPF_W+BPF_ABS, syscall_nr),
     BPF_JUMP(BPF_JMP+BPF_JEQ+BPF_K, __NR_renameat2, 0, 1),
     BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_ERRNO + ENOSYS),
     BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_ALLOW)
};

struct sock_fprog filterout_renameat2_prog = {
     .len = (unsigned short)(sizeof(filterout_renameat2) /
                             sizeof(filterout_renameat2[0])),
     .filter = filterout_renameat2,
};

int disable_renameat2_syscall (void)
{
     int err;
     err = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
     if (!err) {
         err = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER,
 		    &filterout_renameat2_prog);
     }

     return err;
}
[kamensky@coreos-lnx2 bpf]$ cat norenameat2.c
#include <unistd.h>
#include <stdio.h>

int disable_renameat2_syscall (void);

int main(int argc, char **argv)
{
     int err = 0;

     err = disable_renameat2_syscall();
     if(err) {
         perror("disable_renameat2_syscall");
     }

     execvp (argv[1], &argv[1]);
     return 0;
}
[kamensky@coreos-lnx2 bpf]$ gcc -o norenameat2 norenameat2.c filterout_renameat2.c 
[kamensky@coreos-lnx2 bpf]$ mkdir foo
[kamensky@coreos-lnx2 bpf]$ strace -o ./trace.mv.txt -f mv foo bar
[kamensky@coreos-lnx2 bpf]$ grep rename ./trace.mv.txt
2218  renameat2(AT_FDCWD, "foo", AT_FDCWD, "bar", 0) = 0
[kamensky@coreos-lnx2 bpf]$ rm -r -f bar
[kamensky@coreos-lnx2 bpf]$ mkdir foo
[kamensky@coreos-lnx2 bpf]$ strace -o ./trace.norenameat2.mv.txt -f ./norenameat2 mv foo bar
[kamensky@coreos-lnx2 bpf]$ grep rename ./trace.norenameat2.mv.txt
2228  execve("./norenameat2", ["./norenameat2", "mv", "foo", "bar"], 0x7ffd16d930e0 /* 37 vars */) = 0
2228  renameat2(AT_FDCWD, "foo", AT_FDCWD, "bar", 0) = -1 ENOSYS (Function not implemented)
2228  renameat(AT_FDCWD, "foo", AT_FDCWD, "bar") = 0
[kamensky@coreos-lnx2 bpf]$

Thanks,
Victor

On Sat, 24 Mar 2018, Seebs wrote:

> On Sat, 24 Mar 2018 12:42:45 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Right. The musl example is to show how it's possible to transparently
>> intercept and pass on any call to the syscall() ABI without
>> interpreting anything.
>
> Yes, if you don't need to interpret things, and aren't making
> additional other unrelated system calls after doing so.
>
>> Those details are all taken care of within the libc implementation of
>> syscall(). It's not something we need to care about at all in a
>> wrapper for it.
>
> I don't think that's correct.
>
> musl's call sequence:
> 	real_syscall() // sets a3
> 	return
>
> pseudo's call sequence:
> 	various_setup()
> 	real_syscall() // sets a3
> 	other system calls // also set a3
> 	return
>
> In the case where pseudo is actually *disabled*, we just return
> right away after the real call. In every other case, we're making
> other calls some of which imply system calls, and those system calls
> could potentially overwrite things that the libc implementation of
> syscall took care of. (Mutex and signal mask operations.)
>
> So for that to work, I would in principle have to stash the value
> stored in, for instance, "a3", wait until after the other system calls,
> and then restore it. Unless *only* syscall() itself actually sets
> that register, and other system calls don't, and nothing else is
> using it either.
>
> -s
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

