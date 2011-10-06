Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBqOF-0008Ef-Qo for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:01:44 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96G2cuq018155 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 17:02:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NFGv8GoRQFKo
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 17:02:38 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96G2XNG018147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 17:02:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 16:55:56 +0100
In-Reply-To: <96E549F9-7694-4C64-B055-6F9C45065886@dominion.thruhere.net>
References: <1317910715.6398.84.camel@ted>
	<96E549F9-7694-4C64-B055-6F9C45065886@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317916564.6398.119.camel@ted>
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
X-List-Received-Date: Thu, 06 Oct 2011 16:01:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-06 at 16:46 +0200, Koen Kooi wrote:
> Op 6 okt. 2011, om 16:18 heeft Richard Purdie het volgende geschreven:
> 
> > These enabled options to be specified in the form:
> > 
> > PACKAGECONFIG ?? = "<default options>"
> > PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
> > 
> > So that DEPENDS, RDEPENDS_${PN} and EXTRA_OECONF can be automatically
> > built from specific options. Those options can easily be customised
> > by the distro config or the user.
> 
> What if I want it in RDEPENDS_some-other-subpackage?

As yet to code doesn't support it but it could be extended to quite
easily.

There are several things in that function I don't like, I found at least
one bitbake bug (exposure of the defaultval flag) and I think bitbake
itself should have some kind of appendVar() function...

So consider that code a starting point, not a finished end result :)

Cheers,

Richard



