Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsDTB-0005yF-9k for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:14:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DxIql005015;
	Mon, 7 Jan 2013 13:59:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04100-05; Mon,  7 Jan 2013 13:59:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DxCsR005009
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 13:59:13 GMT
Message-ID: <1357567154.25855.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Mon, 07 Jan 2013 13:59:14 +0000
In-Reply-To: <1357566682-7595-1-git-send-email-cristian.iorga@intel.com>
References: <1357566682-7595-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtelepathy: python-native is used during build
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
X-List-Received-Date: Mon, 07 Jan 2013 14:14:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 15:51 +0200, Cristian Iorga wrote:
> python-native was not used during the build.
> This could lead to problems.

What kind of "problems"? Yes, I could go and look at the bugzilla but
commit messages should be self supporting, at least with a summary.

Cheers,

Richard


> Fixes [YOCTO #3679]
> 
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
> index ee131ee..7d0ef79 100644
> --- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
> +++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
> @@ -17,7 +17,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-$
>  SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
>  SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig pythonnative
>  
>  FILES_${PN} += "${datadir}/telepathy \
>  		${datadir}/dbus-1"




