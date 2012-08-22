Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4AoO-0000Bf-R0 for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 15:17:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MD5Naq003362;
	Wed, 22 Aug 2012 14:05:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03207-03; Wed, 22 Aug 2012 14:05:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MD5DaG003355
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 22 Aug 2012 14:05:14 +0100
Message-ID: <1345640714.3907.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 22 Aug 2012 14:05:14 +0100
In-Reply-To: <1345568909-10802-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1345568909-10802-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] conf/bitbake.conf: allow cache reuse between bitbake, bitbake-layers and hob
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 13:17:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-21 at 18:08 +0100, Paul Eggleton wrote:
> BB_ENV_EXTRAWHITE is set by the bitbake wrapper script but not by
> bitbake-layers, and thus it was affecting the data hash and thus
> invalidating the cache. Any variables passed through from the
> environment by being added to this variable should themselves
> influence the hash already if they are not already excluded from,
> the data hash, so BB_ENV_EXTRAWHITE can be excluded.
> 
> Similarly, DISABLE_SANITY_CHECKS is set by the hob script in order to
> have sanity checks run later, but not set by the bitbake wrapper script.
> It doesn't actually affect the build itself and so its value can also
> be excluded from the data hash.
> 
> These changes prevent unnecessary reparsing between executions of
> bitbake, bitbake-layers, and the initial pseudo build within the hob
> script.
> 
> Fixes [YOCTO #2680].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged to master, thanks.

Richard



