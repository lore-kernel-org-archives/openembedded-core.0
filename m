Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9727265E23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 21:14:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41LEslf016404; Thu, 1 May 2014 22:14:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oO5dOe9pKMaD; Thu,  1 May 2014 22:14:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41LEpUC016395
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 1 May 2014 22:14:53 +0100
Message-ID: <1398978886.12731.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 01 May 2014 22:14:46 +0100
In-Reply-To: <1398973084-16849-1-git-send-email-otavio@ossystems.com.br>
References: <1398973084-16849-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Bump BitBake minimal version to 1.23.0
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
X-List-Received-Date: Thu, 01 May 2014 21:15:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-05-01 at 16:38 -0300, Otavio Salvador wrote:
> The metadata started using the bb.utils.contains_any which has been
> add in the BitBake 1.23.0 release, set this as the minimal version to
> ensure parsing compatibility.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/conf/sanity.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Technically its not quite this simple since versions of bitbake exist
where the contains_any() function is missing yet the version is 1.23.0.
We therefore should bump bitbake, then bump the version here to do this
correctly.

Cheers,

Richard

> diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
> index 940db33..b028026 100644
> --- a/meta/conf/sanity.conf
> +++ b/meta/conf/sanity.conf
> @@ -3,7 +3,7 @@
>  # See sanity.bbclass
>  #
>  # Expert users can confirm their sanity with "touch conf/sanity.conf"
> -BB_MIN_VERSION = "1.21.1"
> +BB_MIN_VERSION = "1.23.0"
>  
>  SANITY_ABIFILE = "${TMPDIR}/abi_version"
>  
> -- 
> 2.0.0.rc0
> 



