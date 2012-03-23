Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SB4cz-0003Ng-FD
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:34:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2NDP0Fx004893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Mar 2012 06:25:00 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 23 Mar 2012 06:25:01 -0700
Message-ID: <4F6C79A8.30403@windriver.com>
Date: Fri, 23 Mar 2012 09:24:56 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 4/6] kernel.bbclass: fix extra + in kernelrelease
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
X-List-Received-Date: Fri, 23 Mar 2012 13:34:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-03-23 08:56 AM, Martin Jansa wrote:
> * see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014308.html

I was just looking at this in the past day or so and was
wondering where it had gone. Saved me the effort!

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5e4cdd4..736768e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -204,6 +204,12 @@ sysroot_stage_all_append() {
>   }
>
>   kernel_do_configure() {
> +	# fixes extra + in /lib/modules/2.6.37+
> +	# $ scripts/setlocalversion . =>  +
> +	# $ make kernelversion =>  2.6.37
> +	# $ make kernelrelease =>  2.6.37+
> +	touch ${B}/.scmversion
> +
>   	# Copy defconfig to .config if .config does not exist. This allows
>   	# recipes to manage the .config themselves in do_configure_prepend().
>   	if [ -f "${WORKDIR}/defconfig" ]&&  [ ! -f "${B}/.config" ]; then



