Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1QdmJI-0005SC-JU
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:47:48 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id 52B2F13003B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2011 17:44:02 +0100 (BST)
Message-ID: <4E11EDD1.1000308@slimlogic.co.uk>
Date: Mon, 04 Jul 2011 17:44:01 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1309780493.20200.17.camel@desktop.home>	<4E11DFA1.70608@slimlogic.co.uk>
	<1309795942.20200.123.camel@desktop.home>
In-Reply-To: <1309795942.20200.123.camel@desktop.home>
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
X-List-Received-Date: Mon, 04 Jul 2011 16:47:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/04/2011 05:12 PM, Chris Elston wrote:
>> Hi, with my Angstrom cap on I like this syntax and I think it will be
>> really useful.
>>
>> A second level concern I have is about conflicting features, its not
>> something we will come across probably in DISTRO land as we are sensible
>> enough not to select them. But users could select them in local.conf.
>>
>> Graeme
> As a new developer, I've discovered that there are plenty of things that
> you can set in local.conf which break things :D
>
> Could you please give an example of conflicting features that could
> cause problems, I'm not experienced enough with OE to have encountered
> that problem yet.
>
>
Cant think of a solid one off the top of my head, but I mean the cases where

--enable-feature means that --disable-another-feature is done.

This is why I listed it as a secondary issue.

Graeme




