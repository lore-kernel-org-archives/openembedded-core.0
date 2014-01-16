Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD346D899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 21:39:11 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.4])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W3ued-0003zM-7i; Thu, 16 Jan 2014 22:39:11 +0100
Message-ID: <1389908340.2467.11.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Thu, 16 Jan 2014 21:39:00 +0000
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2014-01-16 at 14:58 +0100,
	Peter Kjellerstedt wrote: > So,
	here I am now. I do not know who else use the > do_make_scripts()
	function from module-base.bbclass and in what > way,
	and whether restructuring the
	functionality into the new > kernel-scripts.bbclass without maintaining
	backwards
	> compatibility would be a problem. If you know anything about > this,
	please let me know. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Maintain backwards compatibility or not for module-base.bbclass
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
X-List-Received-Date: Thu, 16 Jan 2014 21:39:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-16 at 14:58 +0100, Peter Kjellerstedt wrote:
> So, here I am now. I do not know who else use the 
> do_make_scripts() function from module-base.bbclass and in what 
> way, and whether restructuring the functionality into the new 
> kernel-scripts.bbclass without maintaining backwards 
> compatibility would be a problem. If you know anything about 
> this, please let me know.

I'm not entirely clear why you couldn't maintain compatibility by moving
the task in question to a new class but keeping its name the same (i.e.
refrain from renaming "do_make_scripts" to "do_kernel_scripts") and
having module-base.bbclass simply inherit the newly-added class.  That
seems like it ought to be fairly straightforward and uncontroversial.

That said, though, I don't think there is any pressing need to maintain
backwards compatibility around module-base.bbclass.  In fact, I think it
would probably be fine for module-base.bbclass to simply go away
altogether and have its functionality subsumed into module.bbclass; the
split between those two classes is mostly a relic of yesteryear and I
can't think of any good purpose that it serves nowadays.  So I would be
happy enough to see that (and the tangly mess that is the kernel classes
in general) cleaned up irrespective of what happens with
do_make_scripts.

p.



