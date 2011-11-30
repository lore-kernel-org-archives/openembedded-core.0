Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVtlP-0004J6-77 for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:40:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNXp99007803
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:33:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07331-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:33:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNXjvv007797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:33:46 GMT
Message-ID: <1322696033.17484.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 23:33:53 +0000
In-Reply-To: <6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
References: <cover.1322693708.git.Martin.Jansa@gmail.com>
	<6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][oe-core 1/3] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Wed, 30 Nov 2011 23:40:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 23:56 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc       |    6 +++++-
>  meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 2936f96..5e0f7af 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -22,7 +22,11 @@ do_install() {
>  }
>  
>  pkg_postinst_${PN} () {
> -        /etc/init.d/populate-volatile.sh update
> +        if [ "x$D" != "x" ]; then

Is that really what you mean?

> +                if [ -e /etc/init.d/populate-volatile.sh ]; then
> +                        /etc/init.d/populate-volatile.sh update
> +                fi
> +        fi
>  }
>  

Cheers,

Richard



