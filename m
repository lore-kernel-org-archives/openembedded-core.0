Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvIN3-0001iZ-Qx for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 00:55:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NUBfb023500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 23:30:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23144-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2011 23:30:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NU5hv023488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 23:30:05 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1299170758.git.mark.hatle@windriver.com>
References: <cover.1299170758.git.mark.hatle@windriver.com>
Date: Thu, 03 Mar 2011 23:29:59 +0000
Message-ID: <1299194999.17567.192.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Two minor fixes for oe-core
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
X-List-Received-Date: Thu, 03 Mar 2011 23:55:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 10:47 -0600, Mark Hatle wrote:
> The first fix implementes the workaround I posted in the oe-core getting
> started.  Simply adding the BBFETCH2=True is all that is needed.
> 
> The second fixes the ELF qa loaders bit size identification.
> 
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: mhatle/oecore/fixes
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/oecore/fixes
> 
> Thanks,
>     Mark Hatle <mark.hatle@windriver.com>
> ---
> 
> 
> Mark Hatle (2):
>   poky-env-internal: Add FETCH2 enablement
>   qa.py: Fix a typo when evaluating bitsize
> 
>  meta/lib/oe/qa.py         |    4 ++--
>  scripts/poky-env-internal |    2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)

Merged into OE-Core master, thanks.

Richard




