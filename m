Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id BC6907850C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 19:20:45 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RJKjFo029869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 21:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1522178445;
	bh=ykYmPhbJSTWVdODzpO15s64D2RlM1i4xdbUET0sVR7Q=;
	h=From:To:Cc:Subject:References:Date:Message-ID:MIME-Version:
	Content-Type:Sender;
	b=jib288TgzTlJ8Q1a851lFDh98JoPttuwTmmgEH+Gc6B5wWQcDY3cfv9m4s2KXzkr/
	WQJua/z9lb8/mbhUmNOnIoHNzRyIoEQeAvf5bPcC+61SsR+fk5dbu0pJbOfcwB5eOe
	+8Nq5xu3C8rsdKP9hDa4ZrwffqKGy5K3rubLpfrw=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RJKcrx002073 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 27 Mar 2018 21:20:39 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 24CD098B6B8;
	Tue, 27 Mar 2018 21:11:02 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RJKOWX002065
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Mar 2018 21:20:24 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1f0u8u-00045h-33; Tue, 27 Mar 2018 21:20:24 +0200
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
Date: Tue, 27 Mar 2018 21:20:24 +0200
Message-ID: <lytvt1uxzb.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 27 Mar 2018 19:20:47 -0000
Content-Type: text/plain

Seebs <seebs@seebs.net> writes:

>> There are no 64 bit arguments (on 32 bit platforms) which might
>> require a special treatment as described in [1]
>> "Architecture-specific requirements".
>
> Okay, ignore the pointer case, and pretend it's the 64-bit value case,
> since we have specific-ish documentation for that.
>
> Look at the example for SYS_readahead, stating that the caller must
> pass an extra value.

SYS_readahead is one of a few syscalls which pass 64 bit arguments on 32
bit architectures.  Without the manual splitting, the ABI will cause the
compiler to insert a dummy argument so that registers are aligned for 64
bit values.

The caller of syscall(2) has to split such arguments. When the wrapper
does not handle the syscall itself, it just need to pass the arguments
as-is.


> At that point, if you have a series of va_arg calls corresponding to
> the values that would have been arguments had they not passed the extra
> value, I don't think you get the expected arguments. So far as I can
> tell, if the caller actually wrote
> 	varargsfunc(SYS_readahead, 0, uint64_t_value, ...)
> and the function did
> 	va_arg(ap, uint64_t);

That's true and must be checked when writing a wrapper for a syscall
which takes a 64 bit argument on a 32 bit architecture.

But for renameat2() it does not matter; every of its arguments fits into
a single register.



Enrico

