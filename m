Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qy1f3-00018z-9K for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:13:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD95lB003116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:09:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22015-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:09:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD8wUK003109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:08:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314369233-22081-1-git-send-email-galak@kernel.crashing.org>
References: <1314369233-22081-1-git-send-email-galak@kernel.crashing.org>
Date: Mon, 29 Aug 2011 14:08:50 +0100
Message-ID: <1314623330.5939.291.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix patch
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
X-List-Received-Date: Mon, 29 Aug 2011 13:13:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 09:33 -0500, Kumar Gala wrote:
> The gcc-poison-parameters was added specifically to deal with an issue
> on ppc targets and a bug when we build with -Os -frename-registers.
> 
> This bug below reports the issue and is fixed in gcc-4.6.x/mainline:
> 
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44618
> 
> Backport patch to gcc 4.5.1.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    4 +-
>  .../gcc/gcc-4.5.1/gcc-poison-parameters.patch      |   85 ------
>  meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch  |  314 ++++++++++++++++++++
>  3 files changed, 316 insertions(+), 87 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/gcc-poison-parameters.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch

Merged to master, thanks.

Richard



