Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1QdlMi-0001wA-KF
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 17:47:16 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id 79B8013003B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2011 16:43:30 +0100 (BST)
Message-ID: <4E11DFA1.70608@slimlogic.co.uk>
Date: Mon, 04 Jul 2011 16:43:29 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1309780493.20200.17.camel@desktop.home>
In-Reply-To: <1309780493.20200.17.camel@desktop.home>
Subject: Re: [PROPOSAL] Package feature switches, redux.
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
X-List-Received-Date: Mon, 04 Jul 2011 15:47:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/04/2011 12:54 PM, Chris Elston wrote:
> Since responses to my previous mail were generally positive, I've
> reworked the package feature switches so that the interface is as RP
> suggested.
>
> In the recipe for foo you would have a set of features defined like
> this:
>
> PACKAGE_CONFIG[bar] = "--enable-bar, --disable-bar, libbar"
> PACKAGE_CONFIG[baz] = "--enable-baz, --disable-baz, libbaz"
>
> The default set of features for the package would be defined with:
>
> PACKAGE_FEATURES ?= "bar baz" 
>
> Perhaps this set of features could go into a metadata field in the .ipk
> - would this be helpful for feed users?
>
> The package features can then be tailored in a config/layer with
> something like:
>
> PACKAGE_FEATURES_pn-foo = "baz pop"
>
> If a layer requests a feature not supported by the recipe, you get a
> warning (should help distro maintainers detect bitrot in their layer):
>
Hi, with my Angstrom cap on I like this syntax and I think it will be
really useful.

A second level concern I have is about conflicting features, its not
something we will come across probably in DISTRO land as we are sensible
enough not to select them. But users could select them in local.conf.

Graeme



