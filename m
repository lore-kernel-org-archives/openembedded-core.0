Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 798916011B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 00:22:56 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2O0Mv6S017564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 01:22:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1521850977;
	bh=PVZtlmXMd+bDLcbVr6T1Osh5l+0dKTj8UjCaB9IAZzY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=LTvkzHDN+RSq87C0Kmaq1sWcYNRbO+erImyf6zJL8+T/7p97zBjrM+RrRMoIDPsSG
	ZoN7POUPThysNskFitl40VYVcrXQu137DoFh6NH624NLj9S+NypuVLe7PnhgkeVVhr
	h7qYmO+S0iM6hN6Y8oDW2fAZpl4NmOapBEZaYFVw=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2O0MoHl011471 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Sat, 24 Mar 2018 01:22:51 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 8691EB2114;
	Sat, 24 Mar 2018 01:13:21 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2O0MZrB011446
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 24 Mar 2018 01:22:35 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1ezWx9-0001Hr-Iu; Sat, 24 Mar 2018 01:22:35 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Seebs <seebs@seebs.net>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
Date: Sat, 24 Mar 2018 01:22:35 +0100
In-Reply-To: <20180323185655.51d96c05@seebsdell> (seebs@seebs.net's message of
	"Fri, 23 Mar 2018 18:56:55 -0500")
Message-ID: <ly1sgatj90.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.74
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 24 Mar 2018 00:22:59 -0000
Content-Type: text/plain

Seebs <seebs@seebs.net> writes:

>> > I... am really unsure whether it's possible to catch that, because
>> > I really, really, don't want to try to intercept raw syscall()
>> > calls. I don't think that ends well.
>
> Potentially. We rely pretty heavily on the assumption that an *actual*
> syscall can go through.

I think, this would end in implementing architecture dependening
assembly code.  E.g. for ARM you can write

----
syscall:
        cmp     r0, #__NR_renameat2
        beq     renameat2
        ldr     r12, _orig_syscall_addr
        mov     pc, [r9, r12]

_orig_syscall_addr: .word       orig_syscall_addr
----

(Untested; the last three lines are probably wrong and try to get the
address of the variable where the original syscall() address has been
stored into).


> Although... Actually, I don't even know if this is an actual syscall.
> This could be an actual glibc wrapper around the syscall interface,
> just like all the others, which is not the *actual* raw syscall or
> whatever, and... I have no idea how often that is or isn't hit.

'ltrace' catches it.



Enrico

