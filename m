Return-Path: <mark.hatle@kernel.crashing.org>
X-Greylist: delayed 791 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Sep 2019 16:08:05 UTC
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id D8DC07E601
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 16:08:05 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id x8PFssQB023977
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 10:54:55 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
Message-ID: <39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
Date: Wed, 25 Sep 2019 10:54:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925115259.26437-2-george.mccollister@gmail.com>
Subject: Re: [PATCH 1/1] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Wed, 25 Sep 2019 16:08:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/25/19 6:52 AM, George McCollister wrote:
> Set OPENSSL_ENGINES to the path where engines are actually installed.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> index 072f727e0b..8819e19ec4 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> @@ -148,7 +148,7 @@ do_install_append_class-native () {
>  	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
>  	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
>  	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> -	    OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> +	    OPENSSL_ENGINES=${libdir}/engines-1.1

Is this a bug in the openssl recipe (it's placing engines in the wrong place),
or a bug in the recipes providing acceleration engines and THEY are going into
the wrong place?

The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
that they are OpenSSL related.

--Mark

>  }
>  
>  do_install_append_class-nativesdk () {
> 


