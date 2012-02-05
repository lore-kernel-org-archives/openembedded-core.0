Received: from belief.htu.tuwien.ac.at ([128.131.95.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jin@mediatomb.cc>) id 1Ru6MM-0005ec-1L
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 18:58:42 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id A596B83089; Sun,  5 Feb 2012 18:50:41 +0100 (CET)
Date: Sun, 5 Feb 2012 18:50:41 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120205175041.GA29994@deadlock.dhs.org>
References: <1328282644-4459-1-git-send-email-andrei@gherzan.ro>
	<4F2C860C.3020006@linux.intel.com>
	<CAK18fxGND2uPFFmYaGV1o6zeQJUQXg9pFBUUrqb-z4-1gfTcgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxGND2uPFFmYaGV1o6zeQJUQXg9pFBUUrqb-z4-1gfTcgA@mail.gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: [PATCH] js: Update to v1.8.5
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
X-List-Received-Date: Sun, 05 Feb 2012 17:58:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Feb 05, 2012 at 06:41:54PM +0200, Andrei Gherzan wrote:
> About DEPENDS, I couldn't find any dependencies. In order to check this i baked
> js in a new build without having anything in DEPENDS and the package succeeded

just as a hint: if you compile js with the threadsafe option you might need
nspr too. It ships some sort of nspr with it, but I could never get it to
compile, in the end I rolled my own nspr package and told JS configure to use
it.

I know, i know, I'm guilty of not submitting a patch :( Still too swamped to
dig through all my changes and prepare patches...

Here is the nspr stuff if you think that you need it:
https://gitorious.digitalstrom.org/dss-oe/dss-oe/trees/master/dS/meta-dss11-devel/recipes-support/nspr

Kind regards,
Jin



