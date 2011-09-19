Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1R5cpF-0002gB-8O
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 14:19:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8JCEbwH008220
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 13:14:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07416-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 13:14:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8JCEPc1008213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 13:14:28 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2011 13:14:23 +0100
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316434468.14488.7.camel@ted>
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Dependency fixes
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
X-List-Received-Date: Mon, 19 Sep 2011 12:19:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-19 at 11:58 +0100, Paul Eggleton wrote:
> Fix three issues due to missing dependency race conditions as shown up on
> the autobuilder.
> 
> The following changes since commit 7a0cbe6b0e5185aebabedc515b427994bc2a15dc:
> 
>   cooker.py: Fix key expansion issues in showVersions (2011-09-19 05:55:37 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib paule/dep-fixes
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/dep-fixes
> 
> Paul Eggleton (3):
>   libgcrypt: add libcap to DEPENDS
>   libgnome-keyring: add libgcrypt to DEPENDS
>   freetype: disable bzip2 compressed font support

Merged to master, thanks.

Richard



