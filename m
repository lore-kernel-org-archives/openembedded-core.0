Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj8xb-0003wJ-29 for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:31:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06COR7s020254
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 12:24:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20193-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 12:24:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06COJ5A020248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 12:24:20 GMT
Message-ID: <1325852659.20759.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 12:24:19 +0000
In-Reply-To: <1325831602-1623-1-git-send-email-b19537@freescale.com>
References: <1325831602-1623-1-git-send-email-b19537@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH oe-core v2] valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in RRECOMMENDS-powerpc
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
X-List-Received-Date: Fri, 06 Jan 2012 12:31:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 14:33 +0800, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
> 
>     1. add powerpc/powerpc64 into the compatible host list
>     2. valgrind requires the non-stripped libraries of ${TCLIBC}, so add
>        ${TCLIBC}-dbg into RRECOMMENDS for powerpc
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)


Merged to master, thanks.

Richard



