Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tykas-0000p0-91 for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:49:26 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PEc27d031848; Fri, 25 Jan 2013 14:38:02 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cw6S10nXIjSl; Fri, 25 Jan 2013 14:38:02 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PEbw9x031842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 14:38:00 GMT
Message-ID: <1359124417.13917.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 25 Jan 2013 14:33:37 +0000
In-Reply-To: <1359124075-3504-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1359124075-3504-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix evacuate_scripts for external toolchains
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
X-List-Received-Date: Fri, 25 Jan 2013 14:49:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-25 at 15:27 +0100, Marcin Juszkiewicz wrote:
> Not every external toolchain has mtrace/sotruss/xtrace scripts so check
> their existance first.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 79c43f1..4a4e54a 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -113,7 +113,9 @@ do_evacuate_scripts () {
>  	target=${D}${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}
>  	mkdir -p $target
>  	for i in ${bashscripts}; do
> -		cp ${D}${bindir}/$i $target/
> +	    if [ -f ${D}${bindir}/$i ]; then
> +		    cp ${D}${bindir}/$i $target/
> +		fi
>  	done
>  }

At least lets try and indent it consistently :)

Cheers,

Richard





