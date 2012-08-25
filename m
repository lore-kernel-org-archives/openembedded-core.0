Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5B5d-0003px-13 for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 09:47:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7P7ZIrq019797;
	Sat, 25 Aug 2012 08:35:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16836-07; Sat, 25 Aug 2012 08:35:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7P7Z7bq019791
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 25 Aug 2012 08:35:09 +0100
Message-ID: <1345880109.14369.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.zanussi@intel.com
Date: Sat, 25 Aug 2012 08:35:09 +0100
In-Reply-To: <65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Sat, 25 Aug 2012 07:47:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 23:34 -0500, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> This is the ia32-base.inc moved over from meta-intel.  See meta-intel
> for the complete history of contributions to this file.
> 
> Here's the initial commit text that explains the purpose of this file:
> 
>   The meta-intel BSPs currently have a number of machine settings common
>   to all - factor these out into a common include file.
> 
>   Also add several new intel-specific XSERVER variables for building
>   XSERVER variables in BSPs.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/conf/machine/include/ia32-base.inc | 58 +++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 meta/conf/machine/include/ia32-base.inc

I'd add that there are several reasons for this. Things like atom-pc
from meta-yocto could do with accessing this file's content for example
so its useful beyond just meta-intel. In the same way we have various
core "tune" files in OE-Core, this one has become something similar for
IA32. There were recently sstate reuse bugs where the lack of a common
include were causing this to get rebuild depending on which machine was
selected.

It also allows the yocto-bsp tools to work with OE-Core where they'd
currently have failures due to recommending this file.

Cheers,

Richard




