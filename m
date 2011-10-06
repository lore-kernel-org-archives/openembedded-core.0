Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBpT6-0007Dn-LP for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 17:02:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96F3ZIf014043 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 16:03:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LIuTuynPmmuN
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 16:03:35 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96F3WNX014032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 16:03:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:56:55 +0100
In-Reply-To: <20111006142426.GA3485@jama.jama.net>
References: <1317910715.6398.84.camel@ted>
	<20111006142426.GA3485@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317913023.6398.114.camel@ted>
Mime-Version: 1.0
Subject: Re: base.bbclass: Implement PACKAGECONFIG
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
X-List-Received-Date: Thu, 06 Oct 2011 15:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-06 at 16:24 +0200, Martin Jansa wrote:
> On Thu, Oct 06, 2011 at 03:18:27PM +0100, Richard Purdie wrote:
> > These enabled options to be specified in the form:
> > 
> > PACKAGECONFIG ?? = "<default options>"
> > PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
> > 
> > So that DEPENDS, RDEPENDS_${PN} and EXTRA_OECONF can be automatically
> > built from specific options. Those options can easily be customised
> > by the distro config or the user.
> > 
> > Based on some ideas from Chris Elston <celston@katalix.com> but with
> > an improved easier to use one line interface.
> 
> 1) How can user check on target if his package was built with foo enabled?
>    - is there some plan to keep this in ipk/deb metadata?

No plan. I'll state very clearly here for the record:

THESE OPTIONS SHOULD ONLY BE USED WITH ONE SETTING FOR A GIVEN DISTRO

(otherwise the package feeds would be inconsistent).

There is no realistic way we can do anything else. We're giving users a
smoking gun here, if they chose to shoot themselves with it, that is
their own problem.

There are a lot of good reasons people may want to configure things, I
don't think it acceptable to make it difficult but it does mean people
need to take a certain about of responsibility.

> 2) Is it possible to force some PACKAGECONFIG enable/disabled from
>    DEPENDS/RDEPENDS, ie bar_1.0.bb with foo enabled, depends not only on
>    abc recipe but needs abc also with foo enabled.

No. Distros (or the user) are going to be responsible for setting up a
consistent set of PACKAGECONFIG options.

Cheers,

Richard




