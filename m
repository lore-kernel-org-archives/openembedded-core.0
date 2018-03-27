Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id CC1AC784BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 16:35:40 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RGZeN4023246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 18:35:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1522168541;
	bh=CHdLffo4RDnUwZYBL8saweF+XTDRybHTVHkIRIIb5Jk=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=h6G2Mllk0rI/yvfgkBaIuYFmINs38vCPiwJ18W2hmCDRd9UtvKLM5NVI5nYzpr6BM
	bEi1pn5QgCzakJMp71EmZhXLskUkxqCR9kkznkZeu82erclPgMZrEEBPNpMEeWBsol
	bjRvvnmOJU5YMFbjYNTWuDVv7tWH8esGfBb4KC7E=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RGZXbX032184 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 27 Mar 2018 18:35:34 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1F880709A44;
	Tue, 27 Mar 2018 18:26:10 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2RGZWue032181
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Tue, 27 Mar 2018 18:35:32 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>) id 1f0rZM-0005x1-Pq
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2018 18:35:32 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327105539.224458a8@seebsdell>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 27 Mar 2018 18:35:32 +0200
In-Reply-To: <20180327105539.224458a8@seebsdell> (Seebs's message of "Tue, 27
	Mar 2018 10:55:39 -0500")
Message-ID: <lymuyto4rv.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 27 Mar 2018 16:35:41 -0000
Content-Type: text/plain

Seebs <seebs-59Mtl4G6ZbFeoWH0uzbU5w@public.gmane.org> writes:

> On Tue, 27 Mar 2018 16:42:03 +0200
> Enrico Scholz <enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org> wrote:
>
>> will work to wrap syscall(2).  Params for _renameat2_syscall() can be
>> extracted by va_args.
>
> Does anyone have access to an actual 64-bit EABI ARM system to verify
> the argument passing for renameat2 there?

Does this really matter here?  Because the caller has to set them
accordingly the ABI, you can extract the arguments by

	int olddirfd        = va_arg(ap, int);
	char const *oldpath = va_arg(ap, char consr *);
	int newdirfd        = va_arg(ap, int);
	char const *newpath = va_arg(ap, char consr *);
        unsigned int flags  = va_arg(ap, unsigned int);

There are no 64 bit arguments (on 32 bit platforms) which might require a
special treatment as described in [1] "Architecture-specific requirements".



Enrico

Footnotes: 
[1]  http://man7.org/linux/man-pages/man2/syscall.2.html

