Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D300A6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:41:21 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7M9fG58025389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 11:41:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1471858877;
	bh=9PAfAsNZ8VTr+xwvvizLPI01binKpqi7uRHEwwMDtAk=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=NMcgyEdxk8gO0HKJs79hKw2XaFlxK2+koA1rZ5InjMgZp+eP1PiAAHtBDCG0C4erD
	nI7TKhHJK7KO4ESwNONA0aYqaeHrsWZ3Xpe3IkQBnUdfMpXBBeaWwJmb3EUKuLOCgn
	KA9SrTHxpGBqsm+wLNzjNzQMaaLa1s3i9jAiSxq8=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7M9f0HP012638 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 22 Aug 2016 11:41:01 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 71F33ED3CB8;
	Mon, 22 Aug 2016 11:40:52 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7M9exE3012635
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Mon, 22 Aug 2016 11:40:59 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>) id 1bblj1-00045q-Ba
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2016 11:40:59 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1471246474.git.hongxu.jia@windriver.com>
	<f2d0736dd176c21c4ef1d539a7e82dbfd1367f2a.1471246475.git.hongxu.jia@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 22 Aug 2016 11:40:59 +0200
In-Reply-To: <f2d0736dd176c21c4ef1d539a7e82dbfd1367f2a.1471246475.git.hongxu.jia@windriver.com>
	(Hongxu Jia's message of "Mon, 15 Aug 2016 03:35:59 -0400")
Message-ID: <ly1t1hjg44.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -1.9
X-Spam-Level: -
X-Spam-Tests: AWL, BAYES_50, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.78
Subject: Re: [PATCH 3/3] ncurses: upgrade to 6.0+20160625
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
X-List-Received-Date: Mon, 22 Aug 2016 09:41:23 -0000
Content-Type: text/plain

Hongxu Jia <hongxu.jia-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

>  "
>  # commit id corresponds to the revision in package version
> -SRCREV = "05af40f7d3af1e43144ed5315e31c7044c122fab"
> +SRCREV = "63dd558cb8e888d6fab5f00bbf7842736a2356b9"

This breaks the build with OE because it tries to split our $CC.
E.g. with

| CC = ccache arm-linux-gnueabi-gcc -march=armv7ve ... --sysroot=...

configure will warn

| your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options

and messes up CFLAGS completely so that 'arm-linux-gnuebi-gcc' becomes
part of it :(


See CF_CC_ENV_FLAGS in various aclocal.m4 files.



Enrico

