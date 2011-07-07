Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qelty-0004Oj-EV for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:33:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67ATtXV026938
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 11:29:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26912-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 11:29:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67ATjI8026932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 11:29:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308148061.25285.1764.camel@phil-desktop>
References: <1308148061.25285.1764.camel@phil-desktop>
Date: Thu, 07 Jul 2011 11:29:09 +0100
Message-ID: <1310034549.20015.816.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tinylogin: use angstrom mirror for SRC_URI
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
X-List-Received-Date: Thu, 07 Jul 2011 10:33:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 15:27 +0100, Phil Blundell wrote:
> since busybox.net no longer seems to be hosting the tarball
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/tinylogin/tinylogin_1.4.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> index 0b51b25..b73b5b7 100644
> --- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> +++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM="file://LICENSE;md5=f1060fa3a366f098b5b1d8c2077ba269"
>  PR = "r6"
>  
> -SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \
> +SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/tinylogin-${PV}.tar.bz2 \
>  	file://cvs-20040608.patch;patch=1;pnum=1 \
>  	file://add-system.patch;patch=1;pnum=1 \
>  	file://adduser-empty_pwd.patch;patch=1 \

Merged to master, thanks.

Longer term, I wonder if we could make this recipe download and build
busybox but only build the getty/login parts and rename the resulting
static binary to be standalone from busybox itself?

That would likely address the concerns people (rightly IMO) have about
making busybox itself SUID...

Cheers,

Richard



