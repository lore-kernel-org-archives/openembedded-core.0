Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVNlk-0006h3-9k for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 17:07:34 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVNUd-0004Hj-0S; Thu, 25 Apr 2013 16:49:51 +0200
Message-ID: <1366901390.14512.93.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Apr 2013 15:49:50 +0100
In-Reply-To: <1366212538.25282.49.camel@ted>
References: <1366212538.25282.49.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: Use pkg-config instead of hardcoded udev paths
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
X-List-Received-Date: Thu, 25 Apr 2013 15:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-17 at 16:28 +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
> index cf8acc4..d566d94 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
> @@ -5,7 +5,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                      file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
> -DEPENDS = "alsa-lib ncurses libsamplerate0"
> +DEPENDS = "alsa-lib ncurses libsamplerate0 udev"

This means that udev is now needed to build alsa-utils, which it wasn't
previously.  Can this be made conditional on some or other
DISTRO_FEATURE?

p.




