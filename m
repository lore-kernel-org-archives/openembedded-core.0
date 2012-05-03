Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPxHG-0006O9-UI for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:45:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43EZLRT001326
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 15:35:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00637-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 15:35:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43EZEkw001320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 15:35:16 +0100
Message-ID: <1336055718.30113.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 15:35:18 +0100
In-Reply-To: <fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
	<fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] qemux86-64, qemux86: Override XSERVER variable
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
X-List-Received-Date: Thu, 03 May 2012 14:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-02 at 20:35 -0700, Khem Raj wrote:
> Now qemu.inc sets a weak definition which is
> not what we want for x86_64 and x86
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/qemux86-64.conf |    2 +-
>  meta/conf/machine/qemux86.conf    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

We probably want to keep the weak setting but do it by fixing the
ordering so this happens before the include of qemu.inc...

Cheers,

Richard


> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index 129fe9f..b381627 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
>  SERIAL_CONSOLE = "115200 ttyS0"
>  
>  # We bypass swrast but we need it to be present for X to load correctly
> -XSERVER ?= "xserver-xorg \
> +XSERVER = "xserver-xorg \
>             mesa-dri-driver-swrast \
>             xf86-input-vmmouse \
>             xf86-input-keyboard \
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index 246d5a0..5b25b2f 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
>  SERIAL_CONSOLE = "115200 ttyS0"
>  
>  # We bypass swrast but we need it to be present for X to load correctly
> -XSERVER ?= "xserver-xorg \
> +XSERVER = "xserver-xorg \
>             mesa-dri-driver-swrast \
>             xf86-input-vmmouse \
>             xf86-input-keyboard \




