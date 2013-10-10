Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 738A76CC4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:29:52 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VUDVB-0001Ws-DX; Thu, 10 Oct 2013 12:29:53 +0200
Message-ID: <1381400992.11000.60.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Oct 2013 11:29:52 +0100
In-Reply-To: <1381395612.29912.74.camel@ted>
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com> <1380958620.30971.9.camel@ted>
	<87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
	<1381234763.29912.39.camel@ted>
	<87txgr64et.fsf@weregild.amer.corp.natinst.com>
	<1381395612.29912.74.camel@ted>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: gratian.crisan@ni.com, ken.sharp@ni.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2013 10:29:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-10 at 10:00 +0100, Richard Purdie wrote:
> On Tue, 2013-10-08 at 12:47 -0500, Richard Tollerton wrote:
> > The biggest thing I can think of is gcc-native. My understanding of gcc
> > documentation is that it's recommended to build a cross-compiler with a
> > bootstrap, or at least the same version of compiler, and we're not doing
> > that. (Right?)
> 
> We don't build a gcc-native, no. Equally, we've not run in many issues
> due to that so its not been something we've thought necessary.

I think there might be some difficulty with building a Java-enabled
cross compiler if you don't have a matching host copy of ecj.jar on
hand, but we currently force Java off by default anyway and as far as I
know nobody is using it.  If we did want to start supporting Java as a
first class cross compiler target then it might be necessary to build
some host-side gcc bits.

Other than that, you're right, there is no particularly
rational/compelling reason to build a native gcc before compiling the
cross compiler.  In theory it would be a good thing for folks who are
building on systems where the installed native compiler is especially
old or lame (because your cross compiler would run faster if you built a
decent native compiler first and then used that to build the cross one)
but, in practice, it would be impossible to run OE on such a system
anyway without manually upgrading a bunch of tools and anybody who has
gone to that trouble would almost certainly have installed gcc already.

p.



