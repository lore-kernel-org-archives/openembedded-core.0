Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Pytdg-0000or-5M
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Mar 2011 23:19:52 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id D94F1166026B; Sun, 13 Mar 2011 16:18:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2D4551660264;
	Sun, 13 Mar 2011 16:18:09 -0600 (MDT)
Message-ID: <4D7D42A1.80106@mlbassoc.com>
Date: Sun, 13 Mar 2011 16:18:09 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <cover.1299940883.git.raj.khem@gmail.com>
	<4D7CE94A.5080706@mlbassoc.com>
	<CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
	<4D7CF827.60904@mlbassoc.com>
	<AANLkTikQ-kF5u6AAKmWojmuP3xGZB4EPR0RkhhSsWAns@mail.gmail.com>
In-Reply-To: <AANLkTikQ-kF5u6AAKmWojmuP3xGZB4EPR0RkhhSsWAns@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Sun, 13 Mar 2011 22:19:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2011 12:50 PM, Chris Larson wrote:
> On Sun, Mar 13, 2011 at 10:00 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> Ask Richard?  I was just pointing out that Poky/Yocto already has a
>> mechanism;
>> perhaps the OE one is better, who knows.
>
> There seems to be some confusion here.  PREMIRRORS isn't a
> "poky/yocto" mechanism.  It started in OE, and stills works just fine
> there (it's implemented in bitbake).  own-mirrors is simply a
> convenience to make premirrors manipulation easier for the user.  If
> convenience and usability isn't a priority for poky/yocto, I'd be
> curious to hear the reasoning.

Fair enough; I was merely commenting on how I had been told to handle this
in Poky/Yocto.  If OE has a better way, perhaps it makes sense for it to
be available in both OE-CORE and Poky/Yocto.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


