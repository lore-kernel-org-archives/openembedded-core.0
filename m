Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id B45F171A72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:22:41 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u9B9MbIb023904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:22:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1476177759;
	bh=8Xcww1ywZlt4DuDnYTSWDkQ0tr/C67lRuGClY7ZhgFA=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=eZYKg9p46ynUpdikZJPwIHmsuvQqYyYps4N5k2fo1BIoDU9LMc+mUHubNzw5kQRi0
	UMp02bkRsqFBTTRLFd4lUj1yG1kDuYt+weUQP0p6dLpWdtELnW+slFc2f4pcdcLoKY
	iEVy81awi4y3mSemrDf2TxpxuIDUZoh1SLHUgims=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u9B9MTbp019632 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 11 Oct 2016 11:22:29 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 42A6EF7D83E;
	Tue, 11 Oct 2016 11:10:00 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u9B9MR5W019629
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Tue, 11 Oct 2016 11:22:27 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>) id 1bttGV-0001kw-Id
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2016 11:22:27 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 11 Oct 2016 11:22:27 +0200
In-Reply-To: <39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com> (Mark
	Hatle's message of "Tue, 11 Oct 2016 10:37:52 +0200")
Message-ID: <lyd1j7s0j0.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.4
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.78
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 09:22:43 -0000
Content-Type: text/plain

Mark Hatle <mark.hatle-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> My understanding of the issue is that the extraction of the plural.c and
> plural.y files happens so quickly that it is unclear to make if one is older
> then the other -- so it sometimes uses bison to rebuild the plural.c.

When this is really the case, this can apply to the workaround too.  So,
there should be added a 'sleep 1' before the 'touch' or (better?) remove
plural.c to enforce a rebuild.

>> +do_unpack_workaround() {
>> +	touch ${S}/intl/plural.c
>> +}


Enrico

