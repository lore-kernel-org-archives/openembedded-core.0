Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwI6F-0004RS-4o for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 20:22:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7OII5ji022147
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 19:18:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21444-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 19:18:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7OIHsuk022141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 19:17:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
Date: Wed, 24 Aug 2011 11:17:49 -0700
Message-ID: <1314209869.5939.101.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 0/6] Bugfixes for M4
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
X-List-Received-Date: Wed, 24 Aug 2011 18:22:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 08:50 -0700, Saul Wold wrote:
> Richard,
> 
> This is a set of bugfixes and cleanups for M4, please take a closer look
> at Dongxiao's procps change, which you commented on in the past.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 13e14763f14b5b84051ecb158404dcef937cc4e0:
> 
>   image.bbclass, kernel.bbclass: remove non-standard -n option from cp command (2011-08-23 18:32:24 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Dongxiao Xu (1):
>   procps: Fix lib path to support multilib
> 
> Jingdong Lu (1):
>   initrdscripts: fix init-live.sh for hddimg and livecd
> 
> Joshua Lock (1):
>   libtasn1: update SRC_URI
> 
> Phil Blundell (1):
>   mips32: add mips32el tuning
> 
> Wenzong Fan (2):
>   cronie: Updates to cronie
>   libpam: Setting suid bit for unix_chkpwd

Merged to master, thanks.

Richard



