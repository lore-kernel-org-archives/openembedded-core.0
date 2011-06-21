Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZSXg-00034O-8F for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:52:48 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZSUF-0003WF-U4
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:49:16 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308693154.3083.89.camel@lenovo.internal.reciva.com>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
	<7E1967A9-8BDC-4B6D-85FB-0232590DD15A@dominion.thruhere.net>
	<4E010FF4.2070102@windriver.com>
	<1308693154.3083.89.camel@lenovo.internal.reciva.com>
Date: Tue, 21 Jun 2011 22:58:54 +0100
Message-ID: <1308693534.3083.91.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Wed, 22 Jun 2011 18:52:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 22:52 +0100, Phil Blundell wrote:
> On Tue, 2011-06-21 at 16:41 -0500, Mark Hatle wrote:
> > Unfortunately it won't work as the umask would only be set in the "mytask" -
> > task.  It needs to be set in all of the do_install and do_package tasks.
> > 
> > The only way to do this (from what Chris L told me) is to setup an event handler
> > and set the umask when we get into specific events.  I'm not sure if I could
> > correctly capture do_install and later.. plus if someone did what you are
> > mentioning, then it would no longer be in the umask 022.
> 
> I think you could probably fix do_install by wrapping it in a python
> method.  That is, something along the lines of:

Or, I guess, if you were prepared to countenance patching bitbake, just
set:

do_install[umask] = 022

and arrange for the right things to happen.  That might not be so awful.

p.




