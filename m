Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCCTc-00076K-Lp for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 17:04:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JF25W5001843
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 16:02:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00502-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 16:02:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JF1thh001831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 16:01:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTini7EDvr-GoW1AP3aaQWjv6tYjOLQ@mail.gmail.com>
References: <BANLkTini7EDvr-GoW1AP3aaQWjv6tYjOLQ@mail.gmail.com>
Date: Tue, 19 Apr 2011 16:01:45 +0100
Message-ID: <1303225305.5518.219.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc 4.6 recipes naming
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
X-List-Received-Date: Tue, 19 Apr 2011 15:04:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

On Mon, 2011-04-18 at 12:18 -0700, Khem Raj wrote:
> I have gcc 4.6 under progress here. As we know the current release is
> 4.6.0. I have been calling the recipes
> to omit the minor release number so the recipes are called
> <recipes>_4.6.bb based on my experiences
> with gcc releases over the years.
> 
> Since the minor releases are bug fix releases and when next bug fix
> release happens the total diff
> of changes from 4.6.0 to 4.6.1 are also released as a single diff
> which can be applied on top of existing
> 4.6.0 tar file to reach 4.6.1
> 
> This makes the upgrade easier for minor releases. I decided not to
> track the release branch since
> that complicates the gcc download as in classic oe
> 
> So for upgrades we can either just take the diff from 4.6.0 to 4.6.1
> and apply on top of 4.6.0 or
> decide to use the new 4.6.1 tar both would be ok as we decide that later.

I think this is just going to confuse people to be honest. I'm happy to
stick to the 4.6.0 naming, then move to 4.6.1 and so forth over time.
People expect to see the .X number else they just get confused about
which patch revision we're at.

What I'm thinking we will do differently to OE is not to have every
point release available but try and stick to the latest. The exception
would be when there is a problem in the point release version which we
don't have a fix for.

Does that sound reasonable?

Cheers,

Richard



