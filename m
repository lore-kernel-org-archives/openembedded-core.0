Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 814746C76F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 04:06:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Jan 2014 20:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,727,1384329600"; d="scan'208";a="472873521"
Received: from unknown (HELO [10.255.13.56]) ([10.255.13.56])
	by orsmga002.jf.intel.com with ESMTP; 26 Jan 2014 20:05:46 -0800
Message-ID: <52E5DB19.3050802@linux.intel.com>
Date: Sun, 26 Jan 2014 20:05:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Yue Tao <Yue.Tao@windriver.com>, openembedded-core@lists.openembedded.org
References: <1390715859-31491-1-git-send-email-Yue.Tao@windriver.com>
In-Reply-To: <1390715859-31491-1-git-send-email-Yue.Tao@windriver.com>
Subject: Re: [PATCH] setserial: package depends on groff-native to build
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
X-List-Received-Date: Mon, 27 Jan 2014 04:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2014 09:57 PM, Yue Tao wrote:
> Signed-off-by: Jonas Zetterberg <jonas.zetterberg@windriver.com>
> Signed-off-by: Yue Tao <yue.tao@windriver.com>
> ---
>   meta/recipes-bsp/setserial/setserial_2.17.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
> index 8f112ed..505f63c 100644
> --- a/meta/recipes-bsp/setserial/setserial_2.17.bb
> +++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
> @@ -6,7 +6,9 @@ SECTION = "console/utils"
>
>   LICENSE = "GPLv2.0"
>   LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
> -PR = "r3"
> +PR = "r4"
> +
No PR Bump need, please resend.

Thanks
	Sau!

> +DEPENDS += "groff-native"
>
>   inherit autotools
>
>

