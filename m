Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPtQY-0007qg-82 for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 11:33:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPtNb-00063I-Mk
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 11:30:51 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306486477.27470.253.camel@rex>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
	<FD9AE248-A10D-4079-B66F-8F4AB94B94F7@dominion.thruhere.net>
	<1306486477.27470.253.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 27 May 2011 10:30:50 +0100
Message-ID: <1306488650.2525.396.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Fri, 27 May 2011 09:33:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 09:54 +0100, Richard Purdie wrote:
> Good question. I guess you're just changing the gcc version but using
> the rest of that file?
> 
> This is a tricky problem as we do want to include that for anyone using
> gcc 4.6 as otherwise things break but as you say, can't impact someone
> using that file but changing its values.
> 
> I guess the solution will be to turn it into anonymous python checking
> if we're:
> 
> * using gcc 4.6
> * building for arm
> * using armv7 optimisations
> * building mesa-xlib
> 

Can we not just patch gcc to fix the ice?  That seems like it would be
the best answer.

If that's difficult for some reason, and downgrading gcc isn't an option
either for whatever reason, then it seems like the right thing is going
to be to get mesa-xlib's do_configure() to sort it out.

I'm not sure that anonymous python is going to work since there is no
particularly good and reliable method of determining ahead of time what
version of gcc is going to end up being used for the build.

p.




