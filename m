Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoJUo-0000uD-8h for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 21:19:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69J8ZUe009980;
	Mon, 9 Jul 2012 20:08:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09244-04; Mon,  9 Jul 2012 20:08:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69J8OHx009974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Jul 2012 20:08:26 +0100
Message-ID: <1341860905.22321.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 20:08:25 +0100
In-Reply-To: <1341849720.20265.64.camel@phil-desktop>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
	<20120704150005.GD1817@windriver.com>
	<1341415765.20265.30.camel@phil-desktop>
	<20120705161402.GA2309@windriver.com>
	<1341849720.20265.64.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
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
X-List-Received-Date: Mon, 09 Jul 2012 19:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 17:01 +0100, Phil Blundell wrote:
> On Thu, 2012-07-05 at 12:14 -0400, Paul Gortmaker wrote:
> > > On Wed, 2012-07-04 at 11:00 -0400, Paul Gortmaker wrote:
> > > > > On a related note, is it possible to fix the mailing list so that it
> > > > > does not strip To/Cc information and Message-ID strings?  [I'd have to
> > > > > check -- maybe it is (also) inserting a needless Reply-To: header that
> > > > > messes things up.]
> > 
> > Your mail suffers the exact same problem.  My address is nowhere to be
> > seen on the To/Cc:  I only happened to see it since I told mutt to
> > show me all archived poky/oe mails with u-boot in the subject.
> > Otherwise your message would have been lost in the noise, perhaps seen
> > next week when I return from OOO.
> > 
> > And when I hit reply, it won't go to you unless I tell mutt to ignore
> > the broken Reply-To line.  It is the line right at the bottom:
> 
> Ah, I see.  So, just to be clear, the mailing list isn't stripping
> anything: the reason that your address doesn't appear in To/Cc is, as
> you suggest, purely because the Reply-to: header which mailman inserts
> tends to cause replies to be sent only to the list.
> 
> I tend to agree with you that the Reply-to header is a bad idea and it
> would be better off disabled, but this is a list policy decision and
> Richard, as the administrator, would need to decide whether he wants to
> disable it or not.

I'm fairly indifferent about this and happy to change it unless anyone
can think of a good reason why its list this. I would note that whilst
in theory I might admin the list, I don't have any of the list admin
password for this list or the tsc one for that matter, only that for
bitbake-devel. Phil, perhaps we could discuss this offline :)

Cheers,

Richard



