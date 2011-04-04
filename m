Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6jMd-000509-Bw for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:58:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CuXl0016165
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:56:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15975-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:56:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CuRRW016159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:56:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1301665368.git.josh@linux.intel.com>
References: <cover.1301665368.git.josh@linux.intel.com>
Date: Mon, 04 Apr 2011 13:56:23 +0100
Message-ID: <1301921783.24596.360.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] Fedora 15 and GCC 4.6 compatability patches
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
X-List-Received-Date: Mon, 04 Apr 2011 12:58:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-01 at 14:51 +0100, Joshua Lock wrote:
> From: Joshua Lock <josh@linux.intel.com>
> 
> Folks,
> 
> Attached is a series of patches to ensure we can run oe-core builds on the
> soon to be released Fedora 15.
> 
> I don't think any of these should be too controversial and with the series
> applied I am able to build both minimal and sato images on my Fedora 15 box.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: josh/fedora15
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/fedora15
> 
> Thanks,
>     Joshua Lock <josh@linux.intel.com>
> ---
> 
> 
> Joshua Lock (7):
>   elfutils: fix builds with gcc 4.6
>   python-native: add missing SRC_URI hashes
>   libx11: add missing SRC_URI hashes
>   xorg-[lib-common|proto-common]: disable use of fop document
>     generation
>   libx11: disable building of specs
>   openjade: fix build with GCC 4.6
>   xserver-xf86: explicitly disable fop document generation

Merged to master, thanks!

Richard



