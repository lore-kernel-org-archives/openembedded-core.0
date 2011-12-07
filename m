Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYKeV-0002wm-Ai; Wed, 07 Dec 2011 17:47:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7GedKL016797;
	Wed, 7 Dec 2011 16:40:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16346-05; Wed,  7 Dec 2011 16:40:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7GeVGk016791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 7 Dec 2011 16:40:32 GMT
Message-ID: <1323276042.30601.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 16:40:42 +0000
In-Reply-To: <1323273568-31152-1-git-send-email-philip@balister.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 1/2] boost : Add icu to DEPENDS to fix a build failure.
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
X-List-Received-Date: Wed, 07 Dec 2011 16:47:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 10:59 -0500, Philip Balister wrote:
> Part of boost needs libraries from icu. Without this, either the build or
> image construction fails. (I forget exactly which)

That is a fairly heavy dependency to add and we're not seeing builds or
images fail due to this being missing as far as I can tell. Do you have
any further information on this?

Cheers,

Richard

> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/recipes-support/boost/boost.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index fecdb97..a1499f6 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -6,7 +6,7 @@
>  DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
>  HOMEPAGE = "http://www.boost.org/"
>  SECTION = "libs"
> -DEPENDS = "boost-native zlib"
> +DEPENDS = "boost-native zlib icu"
>  DEPENDS_virtclass-native = ""
>  LICENSE = "Boost"
>  




