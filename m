Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE8F160043
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 04:59:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7F4xRCP021636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Aug 2015 21:59:27 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 14 Aug 2015 21:59:26 -0700
Message-ID: <55CEC72D.4060702@windriver.com>
Date: Sat, 15 Aug 2015 00:59:25 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Wenzong Fan
	<wenzong.fan@windriver.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 21/22] midori: remove the recipe and replace references to midori with epiphany
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
X-List-Received-Date: Sat, 15 Aug 2015 04:59:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-08-14 06:55 AM, Alexander Kanavin wrote:
> -# midori depends on webkit-gtk which could not build for mips64
> -MIDORI = "midori"
> -MIDORI_mips64 = ""
> -MIDORI_mips64n32 = ""
> +# epiphany depends on webkitgtk which could not build for mips64
> +EPIPHANY = "epiphany"
> +EPIPHANY_mips64 = ""
> +EPIPHANY_mips64n32 = ""

Mips64 support using the newer webkitgtk may be better.
Wenzong please check on that once this code is in master-next
and reply here.

Thanks,

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

