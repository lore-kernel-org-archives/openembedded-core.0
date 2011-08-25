Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwbVb-0004ua-By for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:06:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PF1T6K031173;
	Thu, 25 Aug 2011 16:01:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30441-05; Thu, 25 Aug 2011 16:01:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PF1Lni031167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Aug 2011 16:01:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <d9e0d7d4811b8b70fb7f0c198f530b453a70da38.1314246387.git.bruce.ashfield@windriver.com>
References: <cover.1314246387.git.bruce.ashfield@windriver.com>
	<d9e0d7d4811b8b70fb7f0c198f530b453a70da38.1314246387.git.bruce.ashfield@windriver.com>
Date: Thu, 25 Aug 2011 08:01:18 -0700
Message-ID: <1314284478.5939.198.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-yocto: update meta SRCREV to sync version strings
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
X-List-Received-Date: Thu, 25 Aug 2011 15:06:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-25 at 00:36 -0400, Bruce Ashfield wrote:
> During the update of the bitbake recipe's string to 3.0.3 the internal
> version marker in the kernel stayed at v3.0. This meant that kernel
> configuration auditing the constructed file couldn't be found and audit
> warnings were thrown. This syncs all the recipes and get back to
> clean configurations.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



