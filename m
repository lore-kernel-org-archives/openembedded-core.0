Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNSev-0002M5-J5 for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 18:34:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KGVev3027109
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 17:31:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26853-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 17:31:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KGVRJf027103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 17:31:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DD69167.1010703@opendreambox.org>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
	<1305873952.18415.249.camel@lenovo.internal.reciva.com>
	<1305903707.2525.29.camel@phil-desktop>
	<4DD69167.1010703@opendreambox.org>
Date: Fri, 20 May 2011 17:31:22 +0100
Message-ID: <1305909082.3424.659.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Fri, 20 May 2011 16:34:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 18:05 +0200, Andreas Oberritter wrote:
> On 05/20/2011 05:01 PM, Phil Blundell wrote:
> > On Fri, 2011-05-20 at 07:45 +0100, Phil Blundell wrote:
> >> On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
> >>> Some packages have uppercase letters in their names e.g.
> >>> efikamx kernel. We allow uppercase character with
> >>> uppercase-letters.patch
> >>
> >> This is not a good idea.  Uppercase characters have never been permitted
> >> in .deb/.ipk. 
> >>
> >> Isn't legitimize_package_name() crunching them to lower case for you?
> >> If not then I think it should be made to do that.
> > 
> > I just checked the code and it certainly looks like it should be doing
> > that:
> > 
> > 	# Remaining package name validity fixes
> > 	return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
> > 
> > So if that isn't working for you then I think it needs a bit of
> > debugging.
> 
> http://patches.openembedded.org/patch/2255/ should solve the problem. I
> was waiting for a second ack.
> 
> Khem, if this fixes the problem for you, please send an ack or push this
> patch.

I merged this to OE-Core since I happened to look at it :)

Cheers,

Richard



