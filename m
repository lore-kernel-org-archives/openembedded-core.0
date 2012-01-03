Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Ri8me-0008Ba-7k
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:08:24 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Ri8fZ-00019k-Sc
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:01:05 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2012 18:01:05 +0000
In-Reply-To: <20120103174717.GH3958@jama.jama.net>
References: <1325612376.28005.14.camel@phil-desktop>
	<20120103174717.GH3958@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325613665.28005.25.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] python-native: correct prefix handling for oe-core sysroot layout
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
X-List-Received-Date: Tue, 03 Jan 2012 18:08:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-03 at 18:47 +0100, Martin Jansa wrote:
> Where did you get python-native_2.6.6?
> 
> That was removed with 2.7.2 upgrade in
> commit b284e9a512860b8a8380be80f96cebce6b92ff80
> Author: Nitin A Kamble <nitin.a.kamble@intel.com>
> Date:   Fri Oct 14 07:06:13 2011 +0000
> 
> Cheers,

Ah yes, sorry, I made the patch against the wrong repository.  2.7.2
still seems to be broken in the same way, though.  I'll rebase the patch
tomorrow and send a new one.

p.




