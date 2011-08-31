Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qyq4m-0004BH-Sh for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 21:03:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIww6M010816
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:58:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10560-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:58:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIwphS010810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:58:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d241a9acdd1578fb711d6d7c113cc51eb1bea74c.1314691314.git.edwin.zhai@intel.com>
References: <cover.1314691314.git.edwin.zhai@intel.com>
	<d241a9acdd1578fb711d6d7c113cc51eb1bea74c.1314691314.git.edwin.zhai@intel.com>
Date: Wed, 31 Aug 2011 19:58:38 +0100
Message-ID: <1314817118.5939.479.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] shadow: Fix rpm failed dependencies when install
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
X-List-Received-Date: Wed, 31 Aug 2011 19:03:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-30 at 16:05 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> There are some links become invalid after rename, so that failed dependencies
> detected when install rpm package. This commit update links to resolve it.
> 
> [YOCTO #1158] got fixed.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



