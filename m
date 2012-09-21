Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TF0VN-0001tI-2w
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 12:30:41 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TF0J5-0001W4-KF>; Fri, 21 Sep 2012 12:17:59 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TF0J5-002Gwo-Ip>; Fri, 21 Sep 2012 12:17:59 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal Exim
	4.72) id 1TF0J4-0002dy-Bu
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 12:17:58 +0200
Date: Fri, 21 Sep 2012 12:17:58 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120921101758.GA8327@mail.familie-heinold.de>
References: <1348138979-15898-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1348138979-15898-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH] xcursor-transparent-theme: switch SRC_URI as matchbox-project is dead
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
X-List-Received-Date: Fri, 21 Sep 2012 10:30:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 20, 2012 at 01:02:59PM +0200, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb     |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> index 824c295..fecc8ea 100644
> --- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  SECTION = "x11/base"
>  PR = "r4"
>  
> -SRC_URI = "http://matchbox-project.org/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
> +SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/utils/xcursor-transparent-theme-${PV}.tar.gz \
>  	   file://use-relative-symlinks.patch \
>  	   file://fix_watch_cursor.patch"

Do we really need this theme anymore. I thought there is now an option in xserver which can disable the cursor.

Bye Henning


