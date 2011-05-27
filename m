Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQ1At-00035q-Ku for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 19:54:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RHBmEp004465
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:11:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04351-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:11:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RHBip0004459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 18:11:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306488650.2525.396.camel@phil-desktop>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
	<FD9AE248-A10D-4079-B66F-8F4AB94B94F7@dominion.thruhere.net>
	<1306486477.27470.253.camel@rex>
	<1306488650.2525.396.camel@phil-desktop>
Date: Fri, 27 May 2011 18:11:38 +0100
Message-ID: <1306516298.27470.289.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 17:54:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 10:30 +0100, Phil Blundell wrote:
> On Fri, 2011-05-27 at 09:54 +0100, Richard Purdie wrote:
> > Good question. I guess you're just changing the gcc version but using
> > the rest of that file?
> > 
> > This is a tricky problem as we do want to include that for anyone using
> > gcc 4.6 as otherwise things break but as you say, can't impact someone
> > using that file but changing its values.
> > 
> > I guess the solution will be to turn it into anonymous python checking
> > if we're:
> > 
> > * using gcc 4.6
> > * building for arm
> > * using armv7 optimisations
> > * building mesa-xlib
> > 
> 
> Can we not just patch gcc to fix the ice?  That seems like it would be
> the best answer.
> 
> If that's difficult for some reason, and downgrading gcc isn't an option
> either for whatever reason, then it seems like the right thing is going
> to be to get mesa-xlib's do_configure() to sort it out.
> 
> I'm not sure that anonymous python is going to work since there is no
> particularly good and reliable method of determining ahead of time what
> version of gcc is going to end up being used for the build.

I was thinking of the GCCVERSION variable which is used in that same
file and is probably a valid thing to do in this specific case.

Anyhow, it looks like we have a fix for the ICE (Nitin confirmed it
builds) which is much perferred and I'm going to wait for that,
thanks :)

Richard





