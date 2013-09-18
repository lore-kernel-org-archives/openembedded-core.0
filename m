Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2190A6023B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 15:44:41 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8IFie6M017428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 18 Sep 2013 17:44:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1379519083;
	bh=pHmTHVnjX2JnztyF/MR7pJt19EP0C5dowdcDNCuMIRQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=aWmAamXKZf1EXweucooTTfaVoJJFpe8SU6ghDLUbLfT8n2TIkXYFn36GyZ3HleyYc
	zoiF1sd9Jc7P5389jTlwiHXibu9fnQxHkUCnO6dQIXCX26nM+EPIP8lreSO9nS20ys
	E+kNBIH9mWk9f71FPWbIOJPWUWf3MjQfg3uzYQB8=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8IFiakG032173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Sep 2013 17:44:37 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VMJvf-0002YK-IN; Wed, 18 Sep 2013 17:44:35 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	<lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
Date: Wed, 18 Sep 2013 17:44:35 +0200
In-Reply-To: <CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
	(Otavio Salvador's message of "Wed, 18 Sep 2013 12:23:38 -0300")
Message-ID: <lyli2ut9r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 15:44:42 -0000
Content-Type: text/plain

Otavio Salvador <otavio@ossystems.com.br> writes:

> I don't agree on this. perf is tied to kernel and part of its code so
> I think same exception rule apply for it as well.

perf ships with the kernel but is a pure userspace program.  It does not
require any special setup ('make configure'), it links against complex
userspace gui frameworks and uses userspace headers.


Enrico

