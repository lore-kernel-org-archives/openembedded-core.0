Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7353371A38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 16:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9UGeX1O032473; Sun, 30 Oct 2016 16:40:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 18QATVlzFo7z; Sun, 30 Oct 2016 16:40:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9UGeTO2032468
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 30 Oct 2016 16:40:30 GMT
Message-ID: <1477845629.23123.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 30 Oct 2016 16:40:29 +0000
In-Reply-To: <20161029194615.19954-1-raj.khem@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Sun, 30 Oct 2016 16:40:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2016-10-29 at 12:46 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Why, what happened?

Cheers,

Richard


> ---
>  meta/recipes-support/boost/boost-1.62.0.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/boost/boost-1.62.0.inc
> b/meta/recipes-support/boost/boost-1.62.0.inc
> index a097ea1..1144ac9 100644
> --- a/meta/recipes-support/boost/boost-1.62.0.inc
> +++ b/meta/recipes-support/boost/boost-1.62.0.inc
> @@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
>  
> -SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
> -SRC_URI[sha256sum] =
> "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
> +SRC_URI[md5sum] = "21b799e5d35ba2beef75b225deaf199a"
> +SRC_URI[sha256sum] =
> "a715dc2adff2d451719352b1e863d78cbb100a03f7ed76097c89b9016c59091e"
>  
>  S = "${WORKDIR}/${BOOST_P}"
> -- 
> 2.10.1
> 

