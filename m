Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5Izr-0001p1-QH for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:46:20 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CGaBER004382; Tue, 12 Feb 2013 16:36:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MlOoLlBsmzNg; Tue, 12 Feb 2013 16:36:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CGa3Yo004226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Feb 2013 16:36:06 GMT
Message-ID: <1360686604.30425.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 12 Feb 2013 16:30:04 +0000
In-Reply-To: <1360679147-24511-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360679147-24511-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tclibc-eglibc: use glibc-thread-db as eglibc-thread-db does not exist(?)
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
X-List-Received-Date: Tue, 12 Feb 2013 16:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 15:25 +0100, Marcin Juszkiewicz wrote:
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-standalone-hhvm-sdk-target:
> |  *    eglibc-thread-db *
> 
> eglibc-thread-db is listed in LIBC_DEPENDENCIES and used by SDK. Package
> ends as "libthread-db1" and provides glibc-thread-db.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/conf/distro/include/tclibc-eglibc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Package renaming should take care of this. If it doesn't happen, that is
a bug in the package renaming. This just hacks around it.

How do we reproduce this?

Cheers,

Richard

> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
> index 15f5ee5..88bfd40 100644
> --- a/meta/conf/distro/include/tclibc-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -23,7 +23,7 @@ LIBC_DEPENDENCIES = "libsegfault \
>  		     eglibc-dbg \
>  		     eglibc-dev \
>  		     eglibc-utils \
> -		     eglibc-thread-db \
> +		     glibc-thread-db \
>  		     ${@get_libc_locales_dependencies(d)}"
>  
>  LIBC_LOCALE_DEPENDENCIES = "\




