Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T1fqK-0001tt-5Q
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 17:49:12 +0200
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id AB1B81EA32;
	Wed, 15 Aug 2012 08:37:16 -0700 (PDT)
Message-ID: <502BC22B.4020506@windriver.com>
Date: Wed, 15 Aug 2012 08:37:15 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
	<1345038674.538.19.camel@ted>
In-Reply-To: <1345038674.538.19.camel@ted>
Subject: Re: [PATCH] task-core-lsb: Don't pull in eglibc-pic via RDEPENDS
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
X-List-Received-Date: Wed, 15 Aug 2012 15:49:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2012 06:51 AM, Richard Purdie wrote:
> Are files in that package required in order to pass LSB tests?
>
> I'm fine with removing it if it isn't required but I would like that
> confirmation before we merge this.

I can't speak to the test suites, but these files are eglibc-specific, so
it's hard to imagine them being required by the LSB.

Doing some checking, it arrived in commit 472f89de ("task-poky-lsb:
Add packges needed by LSB Test Suite") along with a bunch of other
eglibc subpackages.  My guess, noting that the development packages
were *not* added, is it got added by mistake.  I'll dig around.

Andy




