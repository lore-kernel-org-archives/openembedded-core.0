Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9OVK-0004lr-KJ for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 00:55:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85Mh2qr031155;
	Wed, 5 Sep 2012 23:43:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30798-03; Wed,  5 Sep 2012 23:42:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85MgqSk031148
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 23:42:53 +0100
Message-ID: <1346884973.21985.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 05 Sep 2012 23:42:53 +0100
In-Reply-To: <CABcZANk+N+3Gg3kASaQ_19DYd_AtyDoWsS-hfv=mFZe0Jaz6Qg@mail.gmail.com>
References: <1346855269.21985.57.camel@ted>
	<CABcZANk+N+3Gg3kASaQ_19DYd_AtyDoWsS-hfv=mFZe0Jaz6Qg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Move back to running at ConfigParsed time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 22:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 15:21 -0700, Chris Larson wrote:
> On Wed, Sep 5, 2012 at 7:27 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > If we don't do this, users can get extremely confused errors since the sanity tests
> > happen too late (after parsing) and don't see the warnings.
> 
> Can you elaborate on this? This commit message is extremely unclear.
> If there's an open bug in bugzilla or something that could be referred
> to here, that'd be helpful.

Sorry, I should have elaborated.

Set an invalid MACHINE, try and build and you set all kinds of nasty
warnings and no sensible message about what is wrong.

Change LCONF_VERSION and you don't get the warning unless parsing
completes which it may or may not depending on the kind of change.

and so on.

The sanity.bbclass code is meant to be helpful in these scenarios and
when its most needed, it wasn't working.

FWIW, I think we do need to fix the way sanity is being triggered and
improve this (massively). Unfortunately I didn't have time to do that
right this second but lets file an enhancement request in the bugzilla
and lets see if we can improve things soon?

Cheers,

Richard




