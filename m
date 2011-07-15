Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qhkcb-0000xD-UJ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:48:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhkYk-0007K7-Tx
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:44:11 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 16:44:02 +0100
In-Reply-To: <1310744304.30326.8.camel@phil-desktop>
References: <4E1F9F59.5050305@mentor.com> <4E1FAC5A.2090308@windriver.com>
	<1310740753.2350.0.camel@scimitar> <4E2051FB.8080006@windriver.com>
	<4E2057F8.5090100@mentor.com> <1310743089.30326.6.camel@phil-desktop>
	<1310743401.20015.1251.camel@rex>
	<1310744304.30326.8.camel@phil-desktop>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310744650.30326.9.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 15:48:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-15 at 16:38 +0100, Phil Blundell wrote:
> On Fri, 2011-07-15 at 16:23 +0100, Richard Purdie wrote:
> > If we don't have chrpath present it means we need to disable sstate for
> > all its dependencies and the whole thing got really messy and nasty very
> > quickly :(.
> 
> Looking at the output of bitbake -e, the only dependencies for
> gettext-native are:

... irrelevant, of course, but the dependencies for chrpath-native
are...

>DEPENDS="autoconf-native automake-native libtool-native
>gnu-config-native"

p.




