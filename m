Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 18E426072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6B8cNQc018037; Mon, 11 Jul 2016 09:38:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u2ItnVnP038m; Mon, 11 Jul 2016 09:38:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6B8cHrs018034
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jul 2016 09:38:19 +0100
Message-ID: <1468226297.28829.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Derek Straka <derek@asterius.io>, openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 09:38:17 +0100
In-Reply-To: <1468075833-13999-1-git-send-email-derek@asterius.io>
References: <1468075833-13999-1-git-send-email-derek@asterius.io>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] python3: update manifest RDEPENDS for importlib and compression packages
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
X-List-Received-Date: Mon, 11 Jul 2016 08:38:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-07-09 at 10:50 -0400, Derek Straka wrote:
>     * zipfile has dependencies on threading and importlib
>     * importlib has a dependency on operator via types import
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
>  scripts/contrib/python/generate-manifest-3.5.py      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
> b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index 335c3ff..846e2a9 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile="${PN}-core"
>  FILES_${PN}-compile="${libdir}/python3.5/py_compile.*
> ${libdir}/python3.5/compileall.* "
>  
>  SUMMARY_${PN}-compression="Python high-level compression support"
> -RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
> +RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib
> ${PN}-threading"
>  FILES_${PN}-compression="${libdir}/python3.5/gzip.*
> ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.*
> ${libdir}/python3.5/lib-dynload/bz2.*.so "
>  
>  SUMMARY_${PN}-core="Python interpreter and core modules"
> @@ -106,7 +106,7 @@ RDEPENDS_${PN}-image="${PN}-core"
>  FILES_${PN}-image="${libdir}/python3.5/colorsys.*
> ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib
> -dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so "
>  
>  SUMMARY_${PN}-importlib="Python import implementation library"
> -RDEPENDS_${PN}-importlib="${PN}-core"
> +RDEPENDS_${PN}-importlib="${PN}-core ${PN}-misc"
>  FILES_${PN}-importlib="${libdir}/python3.5/importlib "

I suspect this means we need to split something off from -misc since
that package is quite large and we likely don't want to pull in all of
it here.

Cheers,

Richard

