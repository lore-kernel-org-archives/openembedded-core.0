Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE3671472
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 18:36:39 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s84Iab74007140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 20:36:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1409855800;
	bh=RqC7kkrJX1w+o7ViSHMlL48UCPQkw/HsZ1oIDCDsneY=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Sender;
	b=F1tw+5ACTQldd2jborPIwPUBgy73UzxLfaxneGGqfhw1qbSbIvY92BpEHXO9dCzB2
	p4+dmoZmxDinHBB1fBDBeDYiZ7Au2bi0AzN7CTf2xlpLp8XguD8IvuFEfstsLZqrp0
	qt5s8i8+GJceRL2tSLZsKjMEXUv1VuYLpbWv/Oag=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s84IaXII000884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 20:36:34 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XPbtZ-0003PH-6G
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Sep 2014 20:36:33 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
	<540896F8.9040805@pabigot.com>
	<lyiol3uxra.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CALbNGRRTcV8bst1tQYNZ-z6w7_aSXT3=pVMVLRQncDw4TwQEow@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 04 Sep 2014 20:36:31 +0200
In-Reply-To: <CALbNGRRTcV8bst1tQYNZ-z6w7_aSXT3=pVMVLRQncDw4TwQEow@mail.gmail.com>
	("Andreas =?utf-8?Q?M=C3=BCller=22's?= message of "Thu,
	4 Sep 2014 19:38:03 +0200")
Message-ID: <lyha0nb5cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 18:36:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas M=C3=BCller <schnitzeltony-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
writes:

>> it's not only 'git log'; it is 'git blame' too and because git does not
>> support renaming of files natively, the 'git log --follow' method is
>> error prone and might compare the wrong files resp. fail completely when
>> there are too much changes.
>>
> Did you ever use 'git blame' for few lines most recipes have?

In other projects (e.g. linux kernel) I am using C-x v g in emacs very
often to see when/why a certain line was added.  In some OE recipes I
would like to do the same...


Enrico

