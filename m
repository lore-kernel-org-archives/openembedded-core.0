Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qcbxb-0003Aj-OJ for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 13:32:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61BSq4X010099
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 12:28:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09646-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 12:28:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61BShRv010093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 12:28:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D2DB54E8-BE7A-4036-9F5A-587D90844875@dominion.thruhere.net>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<4E0D062C.5060302@linux.intel.com>
	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
	<1309507826.20015.509.camel@rex>
	<D2DB54E8-BE7A-4036-9F5A-587D90844875@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 12:28:21 +0100
Message-ID: <1309519701.20015.519.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: It's broken, please revert. Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Fri, 01 Jul 2011 11:32:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 11:08 +0200, Koen Kooi wrote:
> Op 1 jul 2011, om 10:10 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
> >> Op 1 jul 2011, om 01:26 heeft Saul Wold het volgende geschreven:
> > Testing patches is not the sole responsibility of myself and Saul. This
> > gcc patchset was on the mailing list for a considerable time and has
> > been tested in a variety of ways. Various breakage was identified found
> > and those breakages were fixed. The fact there looks to be some
> > incremental build issue with rm_work is unfortunate and likely easy to
> > fix so I think this request is a little out of proportion.
> > 
> > If someone had reported the problem before it merged it would have
> > waited until it was fixed before merging.
> 
> "They will therefore merge and I'm happy with them but it will be a few
> more days before that happens. "
> 
> I was under the impression that I still had a few more days to test
> them now that the eglibc problems have been solved. I don't think you
> can blame people for not testing gcc when eglibc was still blowing up
> in their faces.

I balanced a few different factors in the timing. Merging code like this
on a Friday with 4th July and the US going on holiday next week didn't
seem like a better time to do this so I went for something slightly
earlier. I was working on the assumption we had the eglibc issues
resolved.

> > I find it ironic you're one of the people asking to turn the autobuilder
> > red, make warnings fatal and break things for everyone as 'its the only
> > way to get people to look at and fix them; but on the other hand you're
> > unhappy if testing of patches doesn't happen on every single combination
> > of usages and something does break :/.
> 
> I was actually planning to test them today, now that eglibc works again.

Ok, sorry I wasn't aware of that.

Cheers,

Richard



