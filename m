Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1Szofn-000079-VX
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 14:50:40 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 40275209F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 08:38:52 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 10 Aug 2012 08:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=CMdc+m1iO/vLwW7tL/kGB2
	A8a8Y=; b=mYqcvpfRPxSaQ1hpeFPrzO64Y/erscSR8YFaaKxYQGdatE1huXv7F/
	JHy+Iv/SdUf/vvOa9p3Qh8pJlF3E+CET8mL3+fN2i/uSQEIjkbDN3P1nGVivzpe6
	I1FG+883W8jIiOUTQGITSidnbP5igUsgqO0q4DoUBhR0iArxCN4cA=
X-Sasl-enc: xI1Aj2HGTFu1zcwSIZN2JdyT43THrqnLQSV4UKNI9Gkd 1344602331
Received: from [192.168.43.202] (unknown [166.248.4.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id E079A8E03C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 08:38:51 -0400 (EDT)
Message-ID: <1344602296.8427.21.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 08:38:16 -0400
In-Reply-To: <9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
Subject: Re: [PATCH 01/12] gcc: Switch SRC_URI to use svn
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 12:50:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-10 at 10:03 +0200, Koen Kooi wrote:
> Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het volgende geschreven:
> 
> > svn tar balls are 96M as compared to 1.3G git tars
> > its unnessary to suck in that much of data.
> 
> That's indeed a big difference and also expected, with svn you only get revision N and N-1, with git you get everything. But even so, I can fetch that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the wrong side of the ocean, but that gcc svn server is sloooooooooooooooooooooow.

Couldn't OE do the initial git clone with --depth=1?




