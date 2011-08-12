Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qrv2U-0000TK-TS for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:56:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGqMMZ013811
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:52:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13071-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:52:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGqGDw013805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:52:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ffa3108cb68e977a91414eeff183275c92800461.1313167004.git.dvhart@linux.intel.com>
References: <cover.1313167004.git.dvhart@linux.intel.com>
	<ffa3108cb68e977a91414eeff183275c92800461.1313167004.git.dvhart@linux.intel.com>
Date: Fri, 12 Aug 2011 17:51:36 +0100
Message-ID: <1313167896.14274.515.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] rt-tests: use an explicit commit ID
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
X-List-Received-Date: Fri, 12 Aug 2011 16:56:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 09:42 -0700, Darren Hart wrote:
> Using a tag, like v0.73, forces network access to resolve a
> commit ID. Use the corresponding commit ID in the recipe.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests_0.73.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> index 6334bcd..a2cf6be 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> @@ -6,7 +6,8 @@ LICENSE = "GPLv2 & GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                      file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
>                      file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
> -SRCREV = v0.73
> +# Version v0.73
> +SRCREV = "81da016fb0f6ab0511fbec81fc8ba1a50398a20d"
>  PV = "git${SRCPV}"
>  PR = "r0"

Merged to master, thanks.

Richard




