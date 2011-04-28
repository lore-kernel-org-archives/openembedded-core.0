Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QFNMI-0007IA-Nf for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:18:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S9FRlT016283;
	Thu, 28 Apr 2011 10:15:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16094-05; Thu, 28 Apr 2011 10:15:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S9FEaV016268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Apr 2011 10:15:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DB85F2D.3010505@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<451b67c736a7b67baf6b0bda5fee38b44b4a24cd.1303889119.git.sgw@linux.intel.com>
	<20110427101712.bd2c2d0f.ospite@studenti.unina.it>
	<4DB85F2D.3010505@linux.intel.com>
Date: Thu, 28 Apr 2011 10:14:43 +0100
Message-ID: <1303982083.21461.46.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>,
	Antonio Ospite <ospite@studenti.unina.it>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 03/52] gcc: Add recipes for 4.6.0
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
X-List-Received-Date: Thu, 28 Apr 2011 09:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-27 at 11:23 -0700, Saul Wold wrote:
> On 04/27/2011 01:17 AM, Antonio Ospite wrote:
> > On Wed, 27 Apr 2011  0:29:21 -0700
> > Saul Wold<sgw@linux.intel.com>  wrote:
> >
> >> From: Khem Raj<raj.khem@gmail.com>
> >>
> >> Hi
> >>
> >> This is initial set of patches for testing them out
> >> The patches need documentation is pending
> >> Some patches especially uclibc related are not
> >> needed they must be dropped.
> >>
> >> This is not the final version yet. But I would like
> >> folks to help trying them out and report issues
> >>
> >
> > If these changes turned to be the final ones then the commit message
> > should be updated, shouldn't it?
> >
> Not final yet, I am pushing it now so people can set their local 
> GCCVERSION and SDKGCCVERSION to test if they would like.

Independently, I also thought the commit messaged should have been
tweaked, see the other emails ;-).

The original message read like a request for testing but it wasn't ready
for merging into the repo. Now its being submitted, it either is ready
or it was a mistake and it could easily look like the latter.

Cheers,

Richard



