Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E696780D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:21:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4ODLK3Y002806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 06:21:20 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 24 May 2017 06:21:20 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1495618375.git.kai.kang@windriver.com>
	<ea7b4a713a48b0b2533bbec7680355b852200ecc.1495618375.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <dea305d5-9575-12b5-c7e2-4b7e8f186a10@windriver.com>
Date: Wed, 24 May 2017 21:19:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <ea7b4a713a48b0b2533bbec7680355b852200ecc.1495618375.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] libpcap: add native package
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
X-List-Received-Date: Wed, 24 May 2017 13:21:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年05月24日 17:33, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Add package libcap-native required by recipe daq-native in layer
> meta-networking. And daq-native is added to fix snort start error.

I just realize that it only needs daq-native provide a shell script, so 
libpcap-native may not be needed. I'll figure it out.
Please ignore this patch for now.

Thanks,
Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-connectivity/libpcap/libpcap.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
> index 6635779..e57ea87 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -38,3 +38,5 @@ CXXFLAGS_prepend = "-I${S} "
>   do_configure_prepend () {
>       sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
>   }
> +
> +BBCLASSEXTEND = "native"


-- 
Regards,
Neil | Kai Kang


