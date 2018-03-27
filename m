Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id CA8E37860F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 20:07:00 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RK70VI031397
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 22:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1522181221;
	bh=m9F47vumdWDti9HwXi2OwKL3mY39kLvRolNlEvDic20=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=WKlCGNxsh043GNUqpj1P5TlKMkyhFEYghhJe3DvWmtnqb5D6hnAXH/21w2BBHm1Uk
	Wgv2q/XUfADOrH04JCjyusstW1J3D324ab8rgwP5W1cZQj5lvUN2Adl7uWqDwjq6At
	1HgWWqlKNkyZLvJc9i90zoj/VtFuKpFUV3KCwNdY=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RK6sJH002939 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 27 Mar 2018 22:06:55 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id A46E1D677F;
	Tue, 27 Mar 2018 21:57:24 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RK6lEe002929
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Mar 2018 22:06:47 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1f0urm-0002Fn-V0; Tue, 27 Mar 2018 22:06:47 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Seebs <seebs@seebs.net>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327105539.224458a8@seebsdell>
	<lymuyto4rv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327114014.0f0cc48a@seebsdell>
	<lytvt1uxzb.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327142407.0669955b@seebsdell>
Date: Tue, 27 Mar 2018 22:06:46 +0200
In-Reply-To: <20180327142407.0669955b@seebsdell> (seebs@seebs.net's message of
	"Tue, 27 Mar 2018 14:24:07 -0500")
Message-ID: <lyk1txth9l.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.97
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
X-List-Received-Date: Tue, 27 Mar 2018 20:07:01 -0000
Content-Type: text/plain

Seebs <seebs@seebs.net> writes:

> On Tue, 27 Mar 2018 21:20:24 +0200
> Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
>
>> SYS_readahead is one of a few syscalls which pass 64 bit arguments on
>> 32 bit architectures.  Without the manual splitting, the ABI will
>> cause the compiler to insert a dummy argument so that registers are
>> aligned for 64 bit values.
>
> I'm now even more confused. This sounds like the compiler *would*
> insert the argument without being told to, because the ABI "will cause"
> that, in which case the manual splitting wouldn't be necessary?

For example, by ARM EABI function arguments are transmitted in r0, r1,
r2, r3.  But 64 bit values must be aligned to even registers.

So, assuming code like

| void foo(int a, unsigned long long b)
| {
| }
| 
| void bar(void)
| {
| 	foo(1, 2)
| }

The compiler generates

        mov     r2, #2
        mov     r3, #0
        mov     r0, #1
        bl      foo

e.g. it skips 'r1'.


When you use the variadic syscall(2) function, you pass an extra argument
at front (the syscall number)

  syscall(__NR_readahead, fd, offset_64bit, count);

  --> when doing the 'svc', fd goes into 'r0' and offset_64bit
      into 'r1' + 'r2'

In-kernel function does not have have the syscall-number and is

  sys_readahead(int fd, loff_t, count)

  --> 'fd' is expected in 'r0', offset in 'r2' + 'r3' due to the ABI


Enrico

