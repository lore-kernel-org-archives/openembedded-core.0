Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdhZW-0005sS-Nb for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 13:44:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BePUx017003;
	Mon, 4 Jul 2011 12:40:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16924-02; Mon,  4 Jul 2011 12:40:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BeKoV016991
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 4 Jul 2011 12:40:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A200B1C93F@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A200B1C93F@shsmsx502.ccr.corp.intel.com>
Date: Mon, 04 Jul 2011 12:39:52 +0100
Message-ID: <1309779592.20015.661.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: The swap partition's size is too big for BSP?
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
X-List-Received-Date: Mon, 04 Jul 2011 11:44:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-04 at 13:35 +0800, Cui, Dexuan wrote:
> In meta/recipes-core/initrdscripts/files/init-install.sh, we have 
> 
> # 5% for the swap
> swap_ratio=5               # dexuan: this variable is not used at all!
> ...
> swap_size=$((disk_size*5/100)) 
> 
> This algorithm seems too wasty -- e.g., for a CrownBay box with a 160GB disk, we would create a 8GB swap partition while the box has only 1GB memory.
> 
> What's the proper swap size?
> This link http://www.cyberciti.biz/tips/linux-swap-space.html discussed this and I think the below algorithm seems suitable for us:
> 
> Systems with 2GB of ram or less require the same size of swap space
> Systems with 2GB to 4GB of ram require a minimum of 2GB of swap space 
> Systems with 4GB to 16GB of ram require a minimum of 4GB of swap space 
> Systems with 16GB to 64GB of ram require a minimum of 8GB of swap space 
> Systems with 64GB to 256GB of ram require a minimum of 16GB of swap space 
> 
> Any comment?

Looks like a much better idea to me, I'll take patches :)

For reference if you want to do suspend to disk (swap) you need a lot of
swap space btw. Still no where near that much though!

Cheers,

Richard



