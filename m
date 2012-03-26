Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SCErL-0004LW-NO
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:41:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2QIWWa9015190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Mar 2012 11:32:33 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 26 Mar 2012 11:32:33 -0700
Message-ID: <4F70B63B.80400@windriver.com>
Date: Mon, 26 Mar 2012 14:32:27 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F70988B.4010403@windriver.com>
	<1332782988-18008-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1332782988-18008-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: touch .scmversion also in ${S}
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
X-List-Received-Date: Mon, 26 Mar 2012 18:41:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-03-26 01:29 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6633b85..3519e7c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -207,7 +207,7 @@ kernel_do_configure() {
>   	# $ scripts/setlocalversion . =>  +
>   	# $ make kernelversion =>  2.6.37
>   	# $ make kernelrelease =>  2.6.37+
> -	touch ${B}/.scmversion
> +	touch ${B}/.scmversion ${S}/.scmversion

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

I had the same patch here, and was about to send it. I blame my
slow builder :P

Cheers,

Bruce

>
>   	# Copy defconfig to .config if .config does not exist. This allows
>   	# recipes to manage the .config themselves in do_configure_prepend().



