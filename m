Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22B3979B47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 01:38:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C1cBnF022360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 18:38:11 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 11 Oct 2018 18:38:10 -0700
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20181011134411.11760-1-otavio@ossystems.com.br>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <69d7b416-9f9d-a2bb-bb76-94fe7fb6914f@windriver.com>
Date: Fri, 12 Oct 2018 09:43:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181011134411.11760-1-otavio@ossystems.com.br>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] util-linux: Fix unshare alternative package
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
X-List-Received-Date: Fri, 12 Oct 2018 01:38:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I sent a similar patch which, in addition to changes in this patch, also 
removes 'unshare' from ALTERNATIVE_${PN}.
The title is "util-linux: fix alternatives setting for unshare".

Best Regards,
Chen Qi

On 10/11/2018 09:44 PM, Otavio Salvador wrote:
> The link was not being generated for the
> sub-package (util-linux-unshare).
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>   meta/recipes-core/util-linux/util-linux.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 45e2203a64..c694bf013f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -220,7 +220,6 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
>   ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>   ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
>   ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> -ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>   ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
>   ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
>   ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
> @@ -292,6 +291,9 @@ ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
>   ALTERNATIVE_util-linux-mountpoint = "mountpoint"
>   ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
>   
> +ALTERNATIVE_util-linux-unshare = "unshare"
> +ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
> +
>   BBCLASSEXTEND = "native nativesdk"
>   
>   python do_package_prepend () {



