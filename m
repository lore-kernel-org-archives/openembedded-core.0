Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QWV2i-0005cZ-Hu
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 16:56:37 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id 4B6AAA62043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 15:53:11 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <19457E2B-45A3-4A02-8BDB-58A538B6A1F6@dominion.thruhere.net>
References: <1308060644.12359.41.camel@desktop.home>
	<19457E2B-45A3-4A02-8BDB-58A538B6A1F6@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 15:53:10 +0100
Message-Id: <1308063190.12359.43.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: Re: [PATCH] Recipe for util-linux-2.19.1
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
X-List-Received-Date: Tue, 14 Jun 2011 14:56:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> Chris, Saul updated to 2.19.1 two weeks ago:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=596e6807826c34a4f93d7cb26052d1bd7a985201
> 
> It doesn't seem to have the vercmp change you mentioned, could you try to rebase your changes against that?

Thanks for pointing me at that.

I guess it's not required because that change doesn't maintain
compatibility with prior versions of util-linux, so no need to check the
versions.

Cheers,

Chris.




