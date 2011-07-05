Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe6VR-0006dx-QF for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 16:21:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65EHnAH032093
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 15:17:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31539-10 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 15:17:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65EHeMV032087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 15:17:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5A258184-4045-4BAE-AE15-F5ADDBD62B77@dominion.thruhere.net>
References: <cover.1307895912.git.koen@dominion.thruhere.net>
	<1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
	<29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
	<4E0D0211.5040102@linux.intel.com>
	<5A258184-4045-4BAE-AE15-F5ADDBD62B77@dominion.thruhere.net>
Date: Tue, 05 Jul 2011 15:17:09 +0100
Message-ID: <1309875430.20015.717.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
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
X-List-Received-Date: Tue, 05 Jul 2011 14:21:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 08:50 +0200, Koen Kooi wrote:
> Op 1 jul 2011, om 01:09 heeft Saul Wold het volgende geschreven:
> 
> > On 06/30/2011 03:33 PM, Koen Kooi wrote:
> > I believe that this has been discussed elsewhere.
> 
> Let's post the outcome here then, since I still want this patch to go in.
>
> >> Op 12 jun 2011, om 18:26 heeft Koen Kooi het volgende geschreven:
> >> 
> >>> The ext3 format is pretty much mandatory for qemu usage, so always create it.
> >>> 
> >>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> >>> ---
> >>> meta/conf/machine/include/qemu.inc |    2 +-
> >>> 1 files changed, 1 insertions(+), 1 deletions(-)
> >>> 
> >>> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> >>> index 9ef242f..e908f69 100644
> >>> --- a/meta/conf/machine/include/qemu.inc
> >>> +++ b/meta/conf/machine/include/qemu.inc
> >>> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
> >>> 
> >>> MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
> >>> 
> >>> -IMAGE_FSTYPES ?= "tar.bz2 ext3"
> >>> +IMAGE_FSTYPES += "tar.bz2 ext3"
> >>> 
> >>> ROOT_FLASH_SIZE = "280"
> >>> 

Well, I've mentioned this once in a reply but for the record if we start
using += in machine files this makes the values much harder to change
and for anyone to exclude either tar.bz2 or ext3 from the variable.

I'm therefore concerned this change makes things less usable.

Cheers,

Richard




