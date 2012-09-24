Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5wD-0004Vx-My for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:30:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAI3K7027638;
	Mon, 24 Sep 2012 11:18:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26940-08; Mon, 24 Sep 2012 11:17:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAHsKg027632
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:17:55 +0100
Message-ID: <1348481875.4654.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 11:17:55 +0100
In-Reply-To: <1348330688.4444.217.camel@x121e.pbcl.net>
References: <1348330688.4444.217.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools: Remove special handling for autoconf* and automake*
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
X-List-Received-Date: Mon, 24 Sep 2012 10:30:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-22 at 17:18 +0100, Phil Blundell wrote:
> For reasons that are now shrouded in obscurity, autotools.bbclass
> has long contained a special heuristic to avoid attempting to run
> autoreconf when building autoconf or automake themselves.  However,
> the wildcard test against PN which is used there is problematic when
> trying to build another package whose name happens to start with
> "autoconf", and in any case it is silly to do this test at runtime
> for every package.  The individual recipes for autoconf and automake
> can just as easily suppress the behaviour that they don't want by
> providing a custom do_configure() method which just runs configure.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/classes/autotools.bbclass                    |  158 ++++++++++-----------
>  meta/recipes-devtools/autoconf/autoconf.inc       |    4 +
>  meta/recipes-devtools/autoconf/autoconf_2.69.bb   |    2 +-
>  meta/recipes-devtools/automake/automake.inc       |    4 +
>  meta/recipes-devtools/automake/automake_1.12.3.bb |    2 +-
>  5 files changed, 85 insertions(+), 85 deletions(-)

Merged to master, thanks.

Richard



