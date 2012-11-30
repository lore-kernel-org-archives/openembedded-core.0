Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TeJd2-00051I-7E
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 06:59:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAU5iu6W016748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 21:44:56 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 29 Nov 2012 21:44:54 -0800
Message-ID: <50B847D7.6080004@windriver.com>
Date: Fri, 30 Nov 2012 13:44:55 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
References: <3487> <1354254131-28004-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1354254131-28004-1-git-send-email-yanjun.zhu@windriver.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libproxy: Fix for CVE-2012-4504
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
X-List-Received-Date: Fri, 30 Nov 2012 05:59:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry. Please ignore this mail.

Thanks a lot.
Zhu Yanjun

On 11/30/2012 01:42 PM, yanjun.zhu wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> Reference:https://code.google.com/p/libproxy/source/detail?r=853
>
> Stack-based buffer overflow in the url::get_pac function in url.cpp
> in libproxy 0.4.x before 0.4.9 allows remote servers to have an
> unspecified impact via a large proxy.pac file.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504
>
> [YOCTO #3487]
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>   .../libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch       | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
> index 323a571..cc1d508 100644
> --- a/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
> +++ b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
> @@ -1,3 +1,13 @@
> +Reference:https://code.google.com/p/libproxy/source/detail?r=853
> +
> +Stack-based buffer overflow in the url::get_pac function in url.cpp
> +in libproxy 0.4.x before 0.4.9 allows remote servers to have an
> +unspecified impact via a large proxy.pac file.
> +
> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504
> +
> +Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> +
>   diff -urpN a/libproxy/url.cpp b/libproxy/url.cpp
>   --- a/libproxy/url.cpp	2012-11-26 10:08:47.000000000 +0800
>   +++ b/libproxy/url.cpp	2012-11-26 10:05:54.000000000 +0800



