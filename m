Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVlrp-0004sB-Kq; Wed, 30 Nov 2011 16:14:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUF7vp1000658;
	Wed, 30 Nov 2011 15:07:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32587-05; Wed, 30 Nov 2011 15:07:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUF7m5r000651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 15:07:49 GMT
Message-ID: <1322665677.12609.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 15:07:57 +0000
In-Reply-To: <a9afa90f134542ef604a459363c49da76024d031.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
	<a9afa90f134542ef604a459363c49da76024d031.1322619553.git.lei.mei@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 1/3] iproute2: Upgrade from 3.0.0 to 3.1.0
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
X-List-Received-Date: Wed, 30 Nov 2011 15:14:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 13:57 +0800, Mei Lei wrote:
> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
>  .../configure-cross.patch                          |    0
>  .../{iproute2_3.0.0.bb => iproute2_3.1.0.bb}       |    4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2-3.0.0 => iproute2-3.1.0}/configure-cross.patch (100%)
>  rename meta/recipes-connectivity/iproute2/{iproute2_3.0.0.bb => iproute2_3.1.0.bb} (72%)

I merged this to master, thanks. Koen has feedback on the dropbear
changes which aren't acceptable.

Cheers,

Richard



