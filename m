Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 81044713D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 17:00:28 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s84H0LGI023545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 4 Sep 2014 19:00:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1409850025;
	bh=Fa21I7205KqD4VpFekFpNEMquDYdDYCxW2Y/YNwrggg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=UBRvAwimZjD6nuougwFQF1Bt0xttlY5QLYm7qKuvsI/IkollhRd1D1nj7j7gCotmr
	3Wa9jmNvgB7P55GZCsmZ5reyPJzUpPYystDTW34BSbRYFnZXEpoK05yKX5ATFwPBgL
	eN/hwUDQ7FrLVv5Y4aKjFWLNpgv2dilczN3hQm44=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s84H0A3i011702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 4 Sep 2014 19:00:12 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1XPaOH-0001vA-Pi; Thu, 04 Sep 2014 19:00:10 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Peter A. Bigot" <pab@pabigot.com>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
	<540896F8.9040805@pabigot.com>
Date: Thu, 04 Sep 2014 19:00:09 +0200
In-Reply-To: <540896F8.9040805@pabigot.com> (Peter A. Bigot's message of "Thu, 
	04 Sep 2014 11:44:40 -0500")
Message-ID: <lyiol3uxra.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 04 Sep 2014 17:00:36 -0000
Content-Type: text/plain

"Peter A. Bigot" <pab@pabigot.com> writes:

>>> .inc files make sense with current packaging because they are revision
>>> control friendly.  E.g. you can put the logic into .inc and follow its
>>> history with 'git log' which is not possible when there are only the
>>> versioned .bb files.
>> You can follow changes to the .inc but not anything that went in and
>> out of the .bb, but I do concede that git not tracking the renames
>> directly does mean some histories are harder to track (although simple
>> to follow as the commit where the history stops will tell you where to
>> pick it up again).
>
> git log --follow foo_1.2.bb handles 90% of this:

it's not only 'git log'; it is 'git blame' too and because git does not
support renaming of files natively, the 'git log --follow' method is
error prone and might compare the wrong files resp. fail completely when
there are too much changes.


Enrico

