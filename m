Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoFBY-0001c0-WB for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:39:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72DYjKE015673
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 14:34:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14658-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 14:34:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72DYbwU015667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 14:34:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
Date: Tue, 02 Aug 2011 14:34:21 +0100
Message-ID: <1312292061.2344.591.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Fix the SDK generation
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
X-List-Received-Date: Tue, 02 Aug 2011 13:39:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 19:17 -0500, Mark Hatle wrote:
> This is an attempt to fix a number of issues with the SDK generation.  It has been
> tested using bitbake meta-toolchain-sdk.
> 
> Note, patches:
> 
>  4/5: package_ipk: SDK generation workaround
>  5/5: update-alternatives: Add alternatives as a runtime provide
> 
> 4/5 might be reasonable to implement immediately to resolve this issue.. However
> 5/5 is absolutely incorrect and that is noted within the patch header.  I'd
> like comments on the issue to understand how to fix the problem.

I've merged 1-4 to master, 4 on the grounds that it improves the
situation substantially.

For 5, I suspect we'll need to process the path using python, I can't
really see a way to avoid it. I assume / is an illegal character for deb
anywhere, not just at the start of the dependency name?

Cheers,

Richard





