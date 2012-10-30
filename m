Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TTB0N-0007XU-La
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 13:33:15 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TTAnF-0001fg-VD; Tue, 30 Oct 2012 13:19:42 +0100
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Oct 2012 12:19:39 +0000
In-Reply-To: <1351584642.2828.58.camel@ted>
References: <1351534455.13864.25.camel@phil-desktop>
	<1351584642.2828.58.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351599582.13864.52.camel@phil-desktop>
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools: Attempt to clean build directory when rerunning configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 12:33:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-30 at 08:10 +0000, Richard Purdie wrote:
> How extensively has this been tested? I have a suspicion that we might
> run into a number of issues doing this throughout the tree :(

I've had this in my tree for a few weeks and the only package I've found
so far that went wrong was polkit, see separate patch for that.  (There
a few other packages for which "make clean" fails in a harmless manner.)
But it's true that I haven't built the whole of world this way yet.

>I'm wondering how many recipes will suffer from issues with "make
>clean" verses how many recipes would struggle if we defaulted 
>${B} != ${S}?

My guess is that "make clean" is slightly more likely to work (or, at
least, not break anything) on average.  But defaulting ${B} != ${S}
would definitely be a desirable thing in the longer term and I would
certainly be in favour of moving in that direction.

p.




