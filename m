Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDMxp-0001Ci-C6 for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:33:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLNwCG005584
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:23:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04773-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:23:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLNo1K005577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:23:51 +0100
Message-ID: <1333056228.18082.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 22:23:48 +0100
In-Reply-To: <1333003715-3872-1-git-send-email-noor_ahsan@mentor.com>
References: <1333003715-3872-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libc-packgae.bbclass: Add i686 support in locale_arch_options
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
X-List-Received-Date: Thu, 29 Mar 2012 21:33:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 11:48 +0500, Noor, Ahsan wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> * While building for i686 architectre an error was coming that
> locale_arch_options does not have support for i686. Add missing support.
> * Verified on intel architecture.
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta/classes/libc-package.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

I merged this to master with the typo fixed.

Cheers,

Richard



