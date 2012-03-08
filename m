Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5jqT-0006v0-34 for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 21:21:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KDEe6030262;
	Thu, 8 Mar 2012 20:13:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29725-08; Thu,  8 Mar 2012 20:13:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KD3fA030256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Mar 2012 20:13:05 GMT
Message-ID: <1331237581.3006.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 12:13:01 -0800
In-Reply-To: <1331153332-3782-1-git-send-email-Chase.Maupin@ti.com>
References: <1331153332-3782-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCHv3] bluez4: add dependency on libcheck to enable test modules
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
X-List-Received-Date: Thu, 08 Mar 2012 20:21:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-07 at 14:48 -0600, Chase Maupin wrote:
> * The later versions of bluez such as 4.98 require libcheck
>   in order to build the test packages as enabled by the
>   --enable-test option passed in EXTRA_OECONF.
> * Failure to have the libcheck package available results in the
>   configure script ignoring the --enable-test option and not
>   building the test modules.
> * Adding libcheck, which is greater than the minimum required
>   version of the check library of 0.9.6 allows building the
>   test modules.
> * Build tested for am335x-evm MACHINE type and run time tested
>   by back porting this fix to the oe-classic and arago setup
>   and booting on am335x-evm.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> * Updated in version 2:
>     * Bumped the PR of the bluez4_4.98 recipe.  I assume this is the
>       way to handle changes to the .inc file since there is no INC_PR
> * Updated in version 3:
>     * Fixed typo in commit message
> ---
>  meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
>  meta/recipes-connectivity/bluez/bluez4_4.98.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
> index 9158687..fbbe0bf 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                      file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
>                      file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
> -DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0"
> +DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
>  RDEPENDS_${PN}-dev = "bluez-hcidump"
>  
>  ASNEEDED = ""

Merged to master, thanks.

Richard



