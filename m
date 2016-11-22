Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 35F0571A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 12:17:08 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMCH6kU000934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 13:17:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1479817028;
	bh=ThmF9LpceZiIFypZOIfbycN/lGJbjO22mntibxTorOc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Sfzc1ETnniCn/YQx8rFAiJyMrIV+bxlPfnbiNIbTerrOeRhCTUa15x6WffhMqXdSv
	RUG/xb6y255XTwrQlCWgLpAgUQRqI+IlmkA0w9NaZJ6l98lpCkQBHM+z8BbHMP4W0A
	znFfZnlnynw+wtXKiBUEVJY4dGSDwEMWYMfcAkbU=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMCGxKC020339 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 22 Nov 2016 13:17:00 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 69D1A5659F7;
	Tue, 22 Nov 2016 13:16:57 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMCGvT8020336
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Nov 2016 13:16:57 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1c9A0P-0001jo-Nn; Tue, 22 Nov 2016 13:16:57 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
	<CAJTo0Lb9cJk5Qos0CLkvvrW0QCecVY-0io9rnp1rkHfCZpQrdg@mail.gmail.com>
	<lyoa17n2ot.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYMQP__k=as6kbPtuU=JK8ZeJ4ucOdTw8NDoefO-+upPw@mail.gmail.com>
Date: Tue, 22 Nov 2016 13:16:57 +0100
In-Reply-To: <CAJTo0LYMQP__k=as6kbPtuU=JK8ZeJ4ucOdTw8NDoefO-+upPw@mail.gmail.com>
	(Ross Burton's message of "Tue, 22 Nov 2016 12:11:26 +0000")
Message-ID: <lyk2bvn1za.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -2.8
X-Spam-Level: --
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 12:17:10 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> Is this check really so useful? gcc + g++ are elementary tools which can
>> be expected.
>
> But they're not if BUILD_CC is overridden.  For example if the host gcc is
> actually too old/new for OE to work and BUILD_CC has been set to point at a
> different compiler.

then, you will see a '<your-gcc>: command not found' very early in the
build and every developer knows that '<your-gcc>' could not be found.

When a misconfiguration is difficulty to detect or causes hidden breakage,
sanity checks are important.

But in this case, the check causes much more harm than it tries to solve
(it will trigger e.g. for 'gcc -m32' too).


Enrico

