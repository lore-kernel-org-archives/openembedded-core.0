Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id C1EE361883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 12:34:46 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6ACYk06031710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:34:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1373459686;
	bh=hc3lqFaUUCg7sEcVWPsiP71RstPK+g/URCksSq491qo=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=WSqfkycWMlkt2yvwY0aZfo7WHjFN6xozbUlVuiZHjtxe3n4ce0VkB+4Kv3Kpuuvm4
	r88pvTpysdkzvh8j5DL2HUBIuSDtMr42W8nAESVBIjAZyA5+NLCi4JW4Xm8oWTwNOV
	77fodmbpvVOh71SgVo5sKA7MqR5OKM2/NcpiP0tU=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6ACYhpn012512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:34:44 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1UwtbX-0000Oa-10
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2013 14:34:43 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 10 Jul 2013 14:34:43 +0200
In-Reply-To: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de> (Enrico
	Scholz's message of "Wed, 10 Jul 2013 13:36:46 +0200")
Message-ID: <ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Wed, 10 Jul 2013 12:34:47 -0000
Content-Type: text/plain

Enrico Scholz
<enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
writes:

> is it expected that recent gcc 4.8[1] compiles the kernel correctly?
> Kernels for ARMv5 platforms (PXA168 -> 3.4.52, MX28 -> 3.8.13) fail here
> 100% at early boot with

Applying two upstream kernel commits
455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
memset-related crashes caused by recent GCC (4.7.2) optimizations) and
418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
fix) seem to fix the problem for me.



Enrico

