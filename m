Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RRPXn-0002jx-3J for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:35:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIETR7t030552
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:29:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30490-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:29:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIETJUV030546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:29:20 GMT
Message-ID: <1321626565.15352.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:29:25 +0000
In-Reply-To: <CABcZAN=BW7pRGFfQ5RgeX=rwWWFdWo3iJk2Z4zD1oOapTrpdFQ@mail.gmail.com>
References: <CABcZAN=BW7pRGFfQ5RgeX=rwWWFdWo3iJk2Z4zD1oOapTrpdFQ@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] bitbake.conf: add a couple explicit vardeps
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
X-List-Received-Date: Fri, 18 Nov 2011 14:35:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 14:17 -0700, Chris Larson wrote:
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0d6b3b8..c158c61 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -506,6 +506,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
>  FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
>  DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>  SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION',
> 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD', 1) == '1'], d, 1)}"
> +SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
>  BUILD_OPTIMIZATION = "-O2 -pipe"
> 
>  ##################################################################
> @@ -717,6 +718,7 @@ COMBINED_FEATURES = "\
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES",
> "usbgadget", d)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES",
> "usbhost", d)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
> +COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
> 
> 
>  # Make sure MACHINE isn't exported

I merged this to master but your patch was line wrapped so I had to
unmangle it...

Cheers,

Richard




