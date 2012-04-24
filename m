Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMiq2-0007iD-Pw for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 18:43:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OGY4x8010242
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 17:34:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09503-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 17:34:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OGXv51010236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 17:33:59 +0100
Message-ID: <1335285237.21409.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 17:33:57 +0100
In-Reply-To: <1335264491.27021.66.camel@phil-desktop>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
	<1335260575.27021.64.camel@phil-desktop>
	<1335264349.12692.120.camel@ted>
	<1335264491.27021.66.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: is the virtual package <locale>-tanslation correct?
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
X-List-Received-Date: Tue, 24 Apr 2012 16:43:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 11:48 +0100, Phil Blundell wrote:
> On Tue, 2012-04-24 at 11:45 +0100, Richard Purdie wrote:
> > On Tue, 2012-04-24 at 10:42 +0100, Phil Blundell wrote:
> > > Yes, that is the intended behaviour.  This is necessary to support
> > > dynamically installed language packs.
> > 
> > What uses this out of interest?
> 
> I'm not entirely sure to be honest.  We used to use it quite heavily in
> Familiar but I have no idea whether Angstrom does the same.  The systems
> I'm working on nowadays don't tend to require language packs so I
> haven't personally used that mechanism for a while.

How did the system use this? I can imagine querying the list of
installed packages and then attempting installing xx-locale as a resuilt
but I'm not sure how this other provider helps?

As far as I know, opkg doesn't directly support anything like this?

Cheers,

Richard



