Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9IvL-00071T-Li for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 17:53:24 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TFsItd005954 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:54:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JdYx61J3hhnC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:54:18 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TFsEOr005950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:54:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 16:47:49 +0100
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317311276.12332.97.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Thu, 29 Sep 2011 15:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 23:20 -0500, Matthew McClintock wrote:
> From: Tom Rini <tom_rini@mentor.com>
> 
> At issue is that route/pktloc.c (not generated) depends on
> route/pktloc_syntax.h (generated).
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  .../libnl/fix-pktloc_syntax_h-race.patch           |   23 ++++++++++++++++++++
>  meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
>  2 files changed, 25 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> 
> diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> new file mode 100644
> index 0000000..d396f96
> --- /dev/null
> +++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> @@ -0,0 +1,23 @@
> +---

Missing patch header...

Cheers,

Richard



