Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2BDD471470
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 16:07:52 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s84G7mnn013217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 18:07:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1409846871;
	bh=oFnwwLKmIC+ejsuREYIA8wHYyrIBJcrElinn3D++sus=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Ey1Miy6hu1TBP66a3BiVdOKblq4y0H914Nrci2ojeYb0do3myaXYpFUAGRlZrsuRX
	5NALZqvEN8QhliKP1nHw8LXb8uRxZUQEeyEcax4JOnllDrWo4hU5RgidUv9MoOxAqA
	2xLHsTSl0NF1MTpr6G/sM7d2Bw9/ESsSxX8/L6sY=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s84G7ciV005073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 18:07:40 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XPZZS-000237-Bo
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Sep 2014 18:07:38 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 04 Sep 2014 18:07:38 +0200
In-Reply-To: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	(Ross Burton's message of "Thu, 4 Sep 2014 15:12:02 +0100")
Message-ID: <lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Thu, 04 Sep 2014 16:08:01 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> Quick question of style for the community to bikeshed on: in the
> general case should recipes be split into foo_1.2.bb and foo.inc, or
> should they only split to bb/inc if there are multiple versions and
> generally there should just be foo_1.2.bb.
>
> Specifically I'm looking at the libunwind patch for oe-core (moving
> from meta-oe) which adds libunwind_1.1.bb and libunwind.inc.
> Personally I feel that splitting them up complicates packaging and
> should only be done if there's actually multiple versions being used.

.inc files make sense with current packaging because they are revision
control friendly.  E.g. you can put the logic into .inc and follow its
history with 'git log' which is not possible when there are only the
versioned .bb files.

Of course, the versioned .bb files do not make much sense nowadays.
They were useful in old OE times were multiple versions of a package
were kept in parallel.



Enrico

