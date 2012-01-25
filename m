Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rq4mg-00056u-Px for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 16:29:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PFLQOd011313;
	Wed, 25 Jan 2012 15:21:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10855-03; Wed, 25 Jan 2012 15:21:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PFLFV8011307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 Jan 2012 15:21:16 GMT
Message-ID: <1327504877.19643.250.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 15:21:17 +0000
In-Reply-To: <68ac20e3e44f7da9e9732c1dc38448c07708475e.1327468756.git.dvhart@linux.intel.com>
References: <cover.1327468756.git.dvhart@linux.intel.com>
	<68ac20e3e44f7da9e9732c1dc38448c07708475e.1327468756.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] bootimg: Fix a math thinko in the block count calculation
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
X-List-Received-Date: Wed, 25 Jan 2012 15:29:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 21:20 -0800, Darren Hart wrote:
> Fixes [YOCTO #1852] ... again.
> 
> The conversion from sectors to blocks was multiplying by 2 instead
> of dividing by 2. Blocks are 1024 bytes, sectors are 512 bytes. The
> result was images being much larger than intended.
> 
> Reported-by: Tom Zanussi <tom.zanussi@intel.com>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/bootimg.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



