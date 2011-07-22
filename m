Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkDXH-0005h1-Tj for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 13:04:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MB0hpi027685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 12:00:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27374-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 12:00:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MB0dAJ027679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 12:00:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E28BF59.20907@mentor.com>
References: <1311287411-31634-1-git-send-email-galak@kernel.crashing.org>
	<1311287411-31634-2-git-send-email-galak@kernel.crashing.org>
	<1311287411-31634-3-git-send-email-galak@kernel.crashing.org>
	<1311287411-31634-4-git-send-email-galak@kernel.crashing.org>
	<4E28BF59.20907@mentor.com>
Date: Fri, 22 Jul 2011 12:00:36 +0100
Message-ID: <1311332436.2344.136.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH 4/4] site/powerpc*-linux: refactor needed options that are common
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
X-List-Received-Date: Fri, 22 Jul 2011 11:04:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 17:07 -0700, Tom Rini wrote:
> On 07/21/2011 03:30 PM, Kumar Gala wrote:
> > Pulled common options that are needed for powerpc64-linux to build
> > out of powerpc32-linux and put them into powerpc-linux.
> > 
> > Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> 
> NAK.  Almost all of the stuff going into powerpc-linux really belongs in
> common-linux or common-glibc.  Some other tasks held me up here but I
> plan to post the series moving these bits over and dropping them from
> the arch files tomorrow.  Rest of the series looks good tho

Sorry, my email reading order wasn't good here and I missed this
comment. I wanted to get the series in since I know this and the stuff
Tom is looking at will likely conflict a bit. Kumar's work improves the
situation so I've merged it. Obviously there is still other improvements
we can have.

Cheers,

Richard




