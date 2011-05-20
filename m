Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNODa-0002qK-2G for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 13:50:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBlEaO024700;
	Fri, 20 May 2011 12:47:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24662-01; Fri, 20 May 2011 12:47:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBl4Dt024694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 20 May 2011 12:47:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4DD651A2.9050408@mlbassoc.com>
References: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>
	<1303126125.5518.118.camel@rex>
	<0E9C83CD-3E86-46B3-B749-6FAFB94E4BAF@dominion.thruhere.net>
	<4DAC2BC5.4020107@mlbassoc.com>  <4DD42244.60806@gravedo.de>
	<1305845617.3424.570.camel@rex>  <4DD651A2.9050408@mlbassoc.com>
Date: Fri, 20 May 2011 12:46:59 +0100
Message-ID: <1305892019.3424.593.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Is BBCLASSEXTEND in .bbappend supposed to work?
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
X-List-Received-Date: Fri, 20 May 2011 11:50:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 05:33 -0600, Gary Thomas wrote:
> On 05/19/2011 04:53 PM, Richard Purdie wrote:
> > On Wed, 2011-05-18 at 21:47 +0200, Simon Busch wrote:
> >>
> >> I discoverd the same behaviour today. Is there already something fix to
> >> get bitbake to evaluate the bbappend file after creation?
> >
> > Someone should file a bug about this so we don't forget about it. I
> > think bbappend files currently sometimes fall outside the cache logic
> > but they obviously shouldn't and we've found a corner case...
> 
> Done - bug #1091
> 
> Query: is there a command line way to force the cache to be rebuilt?
> I just use the "big hammer" approach - touch local.conf

I think that is the way everyone does it at the moment...

Cheers,

Richard




