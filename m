Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RoHVQ-0003dy-MF for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 17:40:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KGWKeH020035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 16:32:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19776-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 16:32:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KGWAuS020027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 16:32:11 GMT
Message-ID: <1327077129.4268.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jan 2012 16:32:09 +0000
In-Reply-To: <1ec175b060ec79949989bbe4df546eff5a942e70.1327043851.git.zumeng.chen@windriver.com>
References: <cover.1327043851.git.zumeng.chen@windriver.com>
	<1ec175b060ec79949989bbe4df546eff5a942e70.1327043851.git.zumeng.chen@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] rspro-conf: remove usbgadget from routerstationpro
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
X-List-Received-Date: Fri, 20 Jan 2012 16:40:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 15:21 +0800, Zumeng Chen wrote:
> Since the target doesn't have the related requirement
> to use USB slave hardware supporting usb gadget, so
> remove it from MACHINE_FEATURES.
> 
> Signed-off-by: Zumeng.chen@windriver.com>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta-yocto/conf/machine/routerstationpro.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)


Merged to poky thanks. meta-yocto specific patches should really be on
the yocto list.

Cheers,

Richard



