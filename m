Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0566D125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 10:58:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIAw1F4026608; Mon, 18 Nov 2013 10:58:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c4Xz5iDVDb7D; Mon, 18 Nov 2013 10:58:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIAvuoc026583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 10:57:57 GMT
Message-ID: <1384772273.6460.194.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Nov 2013 10:57:53 +0000
In-Reply-To: <1384696338-5390-4-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] linux-firmware: Drop allarch
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
X-List-Received-Date: Mon, 18 Nov 2013 10:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-11-17 at 14:52 +0100, Martin Jansa wrote:
> * the recipe itself is allarch, but update-alternatives adds dependency on
>   virtual/${MLPREFIX}update-alternatives which can be TUNE_PKGARCH opkg
>   causing linux-firmware signature to be different for different TUNE_PKGARCHs
>   Hash for dependent task opkg_svn.bb.do_populate_sysroot changed from 8d215059308161841a84542dd1dcbf3a to 80b280c741c392cf5b30dd67b61dd56e
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index e3a099a..ebb9c81 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -32,7 +32,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
>  
>  S = "${WORKDIR}/git"
>  
> -inherit allarch update-alternatives
> +inherit update-alternatives

I think this is one case where we should whitelist update-alternatives
as being ABI/API safe instead. There is no point in building the
firmware multiple times.

Cheers,

Richard


