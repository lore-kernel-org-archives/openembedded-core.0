Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E02D16AC36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2QEFpVp018588; Thu, 26 Mar 2015 14:15:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o8M_g8X3OrfU; Thu, 26 Mar 2015 14:15:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2QEFaMU018579
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Mar 2015 14:15:48 GMT
Message-ID: <1427379336.14020.92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stephen Holstein <yocto@mashlibs.com>
Date: Thu, 26 Mar 2015 14:15:36 +0000
In-Reply-To: <1427350872-13209-1-git-send-email-yocto@mashlibs.com>
References: <1427350872-13209-1-git-send-email-yocto@mashlibs.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: redengin <sholstei@yahoo.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Signed-off-by: redengin <sholstei@yahoo.com>
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
X-List-Received-Date: Thu, 26 Mar 2015 14:15:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-03-26 at 02:21 -0400, Stephen Holstein wrote:
> From: redengin <sholstei@yahoo.com>
> 
> fix for fortran to remove libquadmath dependency
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc | 1 +
>  1 file changed, 1 insertion(+)

This says what it does but not why or what testing has been done to
verify this. Last time I checked some architectures require libquadmath
for fortran? The subject line is also incorrect and should be a shortlog
entry of the change, not a Signed-off-by line.

Cheers,

Richard

> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index c88a496..cec1862 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -99,6 +99,7 @@ EXTRA_OECONF_BASE = "\
>      --with-cloog=no \
>      --enable-checking=release \
>      --enable-cheaders=c_global \
> +    --disable-libquadmath-support \
>  "
>  
>  EXTRA_OECONF_INITIAL = "\
> -- 
> 1.9.1
> 



