Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4DF6FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 16:26:20 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RGQKFa022932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 18:26:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1522167980;
	bh=zjMi/21vFQE9tO3CeEvM4AD/H+AS6mSnscpKEt6fNwo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=IW+C+ZVbMwP79+1R6dSaOvKYDktdOVczqBdR6DkV8ianluk8qCUSy6iH5qJe98w0f
	3yKLIhYDbswpXh/Fdg8Fvt+5qhPVBia+qjYG/QLwQ+7OFYmA+F7CNxmsOrtTosGa+M
	M372H+Hv0gEBEYzEGVl6lCpj9pgglOPnq8uar4Nc=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RGQD4F032013 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 27 Mar 2018 18:26:14 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 90A6D855A82;
	Tue, 27 Mar 2018 18:16:43 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RGQ5O8032005
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Mar 2018 18:26:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1f0rQD-0004dp-3J; Tue, 27 Mar 2018 18:26:05 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Seebs <seebs@seebs.net>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<ly370lpt0f.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327105028.188e6bdc@seebsdell>
Date: Tue, 27 Mar 2018 18:26:05 +0200
In-Reply-To: <20180327105028.188e6bdc@seebsdell> (seebs@seebs.net's message of
	"Tue, 27 Mar 2018 10:50:28 -0500")
Message-ID: <lyr2o5o57m.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Mar 2018 16:26:22 -0000
Content-Type: text/plain

Seebs <seebs@seebs.net> writes:

>> >> Since the man page gave the ia64 example, I went and checked, and
>> >> it is indeed the case that calls other than syscall(2) will
>> >> clobber r10 after system calls,
>> 
>> I think you are misinterpreting the man-page.  In "Architecture
>> calling conventions" it documents the calling convention into the
>> kernel.  syscall(2) itself is an ordinary function which has to
>> follow the userspace ABI; after jumping into the kernel and setting
>> 'errno' in error case, it restores registers as needed.
>
> I don't think this is what it's talking about.

Perhaps we have different man pages but e.g. [1] mentions only registers
in the context of the kernel interface but not when entering/leaving
syscall(2) itself.


>> Some ABIs allow functions to clobber registers (they are not restored
>> after leaving the function and do not carry a return value); e.g. on
>> ARM, these are r0-r3 and r12.  That's probably the case for r10 in
>> ia64 too.
>
> Maybe you missed the previous message where I pointed out that this
> behavior is, at least on MIPS, an explicit step taken by glibc's
> syscall implementation (and many other system calls).

When, then this is completely undocumented and a glibc-only thing.
Other implementations[2] follow the behavior described in the man page
and do not set some magic registers on return.

I did not found the glibc syscall implementation for MIPS atm.



Enrico

Footnotes: 
[1]  http://man7.org/linux/man-pages/man2/syscall.2.html

[2]  https://android.googlesource.com/platform/bionic/+/ae5c3dd73844e6a9e1a14dbf893eab5142902f18/libc/arch-mips/syscalls/syscall.S
     https://github.com/ops-class/os161/blob/master/userland/lib/libc/arch/mips/syscalls-mips.S
     https://github.com/m-labs/uclibc-lm32/blob/master/libc/sysdeps/linux/mips/syscall.S

