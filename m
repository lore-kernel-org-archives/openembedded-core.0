Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qeldy-00040d-8x for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:17:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67ADN70026782
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 11:13:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26283-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 11:13:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67ADHUL026776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 11:13:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107060841.29809.anders@chargestorm.se>
References: <cover.1309877488.git.anders@chargestorm.se>
	<201107060841.29809.anders@chargestorm.se>
Date: Thu, 07 Jul 2011 11:12:42 +0100
Message-ID: <1310033562.20015.813.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Remove exported KERNEL_SOURCE
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
X-List-Received-Date: Thu, 07 Jul 2011 10:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 08:41 +0200, Anders Darander wrote:
> * Anders Darander Anders Darander <anders@chargestorm.se> [07/05/11 04:52 PM]:
> > Remove KERNEL-SOURCE as an exported variable.
> > When building an external module the
> > STAGING_KERNEL_DIR variable can justbas well be used in
> > the module recipe.
> 
> There is an alternative solution, which is to instead of removing the line
>  export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-
> source')}"
> replace it with something like:
> export KERNEL_SOURCE = "${STAGING_KERNEL_DIR}"
> 
> The only benefit from that solution is to prevent breaking of recipes when 
> moving from oe.dev to oe-core. However, I prefer the original solution as we 
> otherwise would have more redundant variables.

Since the directory in question doesn't exist, we can likely remove this
as anyone using it should have complained by now...

We can add it back with the corrected version if anyone does turn out to
need it.

Cheers,

Richard





