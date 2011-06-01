Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRoIa-0002Yt-5N for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:29:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51GQRCH009722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 17:26:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09435-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2011 17:26:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51GQHY6009716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 17:26:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306940803.2529.101.camel@phil-desktop>
References: <4DE56B0D.4020209@intel.com>
	<1306940803.2529.101.camel@phil-desktop>
Date: Wed, 01 Jun 2011 17:25:58 +0100
Message-ID: <1306945558.27470.435.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Wed, 01 Jun 2011 16:29:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 16:06 +0100, Phil Blundell wrote:
> On Tue, 2011-05-31 at 15:26 -0700, Scott Garman wrote:
> > I'd like to collect some feedback on error messages while building that 
> > you find confusing/annoying/unhelpful. I'm going to be working on trying 
> > to improve the situation and would like to hear from you about what 
> > could be more helpful.
> 
> Funnily enough we were just having a discussion about this on irc.  My
> personal top two least favourite diagnostics are:
> 
> a) "bitbake -b nonexistent-file" gives ten lines of so of python
> exception traceback and then prints "MultipleMatches".
> 
> b) "bitbake -b recipe.bb", with a recipe that skips (due to an
> inCOMPATIBLE_MACHINE or whatever) gives the traditional ten lines of
> traceback spew and then prints "TypeError: 'NoneType' object is not
> iterable".
> 
> This is with bitbake 1.13.0.

Agreed, these are issues.

I'd like to highlight that there is an underlying design issue in
bitbake which make these hard issues to fix. Its very hard for bitbake
to work out when it needs to show the traceback and when it doesn't.

If the user has been given an explanation of the problem we shouldn't
show the traceback but its hard to know that is the case.

Somehow we therefore need to improve the error infrastructure in bitbake
to be able to tell the difference between an unexpected error where a
traceback is useful and a known error which has been explained to the
user and no traceback is required.

Cheers,

Richard



