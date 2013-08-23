Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3310060896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:09:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NFLBYA021597; Fri, 23 Aug 2013 16:21:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tzxs81Se4kmU; Fri, 23 Aug 2013 16:21:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NFL6fm021593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 23 Aug 2013 16:21:08 +0100
Message-ID: <1377270540.6762.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Fri, 23 Aug 2013 16:09:00 +0100
In-Reply-To: <0f4ed0a174f9463cbd3fdea5f4e9d4b1b275ee6c.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
	<0f4ed0a174f9463cbd3fdea5f4e9d4b1b275ee6c.1377264698.git.cristian.iorga@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/4] xdg-utils: add runtime dependency on xprop
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 15:09:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-23 at 16:42 +0300, Cristian Iorga wrote:
> xprop is called by xdg-utils scripts.
> 
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
> index d5c7aa3..22247f7 100644
> --- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
> +++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
> @@ -23,3 +23,4 @@ SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209
>  
>  inherit autotools
>  
> +RDEPENDS_${PN} = "xprop"

Usually best to do += with these. I've tweaked it when applying.

Cheers,

Richard


