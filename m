Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnsU3-0001sC-K5 for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:24:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DKKsA007396
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:20:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07326-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 14:20:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71DKG24007390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:20:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 14:20:02 +0100
Message-ID: <1312204802.2344.445.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PATCH 00/22] Fixes Multi-Lib & M3
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
X-List-Received-Date: Mon, 01 Aug 2011 13:24:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:35 -0700, Saul Wold wrote:
> This set of patches are what have been pulled together for the
> M3 RC1 build.  They include patches to multi-lib and tuning changes
> put last week.
> 
> There are also 2 changes from Josh for bitbake, not included here,
> which are included in stage/master_under_test.
> 
> There are competing changes from Martin and Khem for the ARM fix, the 
> first change from Martin did not seem to solve (or there is a different
> issue that I have not evaluated).  I am building Khem's change, but it 
> also seems to fail in eglibc, so ARM is still an issue

I've sent some feedback on the patches in this series, I've taken about
half the patches, the others are going to need some further work I'm
afraid :(

Cheers,

Richard



