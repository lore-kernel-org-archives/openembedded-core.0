Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzXcT-0006pz-Vm for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 19:33:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82HSbqs027990
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 18:28:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27972-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 18:28:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82HSSCm027984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 18:28:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ff51425aa7ce3a4fd4f9329ff1df5e47774f56e0.1314876902.git.paul.eggleton@linux.intel.com>
References: <cover.1314876902.git.paul.eggleton@linux.intel.com>
	<ff51425aa7ce3a4fd4f9329ff1df5e47774f56e0.1314876902.git.paul.eggleton@linux.intel.com>
Date: Fri, 02 Sep 2011 18:28:10 +0100
Message-ID: <1314984490.5939.627.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS
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
X-List-Received-Date: Fri, 02 Sep 2011 17:33:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 12:36 +0100, Paul Eggleton wrote:
> This variable should be split with \n sequences and these need to be
> specified literally in the string. A corrected version of the example
> given in the original commit (OE-core rev
> 75e3875341ddc8940e9ee2ccbbb2ec18194a68e6):
> 
> SANITY_TESTED_DISTROS = " \
>         Ubuntu 11.04 \n \
>         Fedora release 14 (Laughlin) \n \
>         "
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



