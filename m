Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC6696DD15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 20:48:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2013 12:45:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="418168079"
Received: from unknown (HELO [10.255.15.171]) ([10.255.15.171])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 12:48:51 -0800
Message-ID: <529CF232.5060707@linux.intel.com>
Date: Mon, 02 Dec 2013 12:48:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: jackie.huang@windriver.com, openembedded-core@lists.openembedded.org
References: <1385461228-9326-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1385461228-9326-1-git-send-email-jackie.huang@windriver.com>
Cc: Yue.Tao@windriver.com
Subject: Re: [PATCH] tzcode-native: Replace fixed version with PV
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
X-List-Received-Date: Mon, 02 Dec 2013 20:48:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2013 02:20 AM, jackie.huang@windriver.com wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   meta/recipes-extended/tzcode/tzcode-native_2013h.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
> index 5cdc7ef..b51e303 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8
>   # note that we allow for us to use data later than our code version
>   #
>   SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
> -           ftp://ftp.iana.org/tz/releases/tzdata2013h.tar.gz;name=tzdata"
> +           ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata \
> +"
>
I am not sure it's correct to do this, I think there are times that the 
tzcode and tzdata are not updated at the same time.

Sau!

>   SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
>   SRC_URI[tzdata.sha256sum] = "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
>

