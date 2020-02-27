Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76A2961893
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:33:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2020 14:33:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="232024069"
Received: from anmitta2-mobl.gar.corp.intel.com (HELO [10.255.173.208])
	([10.255.173.208])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	27 Feb 2020 14:33:36 -0800
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200227205608.26788-1-akuster808@gmail.com>
	<20200227205608.26788-2-akuster808@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <7c57c85f-d26b-0a10-f4fe-f6b7e68056b9@intel.com>
Date: Fri, 28 Feb 2020 06:33:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227205608.26788-2-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 1/2] libuv: needed by bind 9.16
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
X-List-Received-Date: Thu, 27 Feb 2020 22:33:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 28-Feb-20 04:56 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> move from meta-oe to core
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   .../libuv/libuv_1.34.0.bb                     | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.0.bb

This will need an entry in maintainers.inc as well.

Thanks,

Anuj

> 
> diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.0.bb b/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
> new file mode 100644
> index 0000000000..b842bbda7a
> --- /dev/null
> +++ b/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
> +HOMEPAGE = "https://github.com/libuv/libuv"
> +BUGTRACKER = "https://github.com/libuv/libuv/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
> +
> +SRCREV = "15ae750151ac9341e5945eb38f8982d59fb99201"
> +SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> +    oe_runconf
> +}
> +
> +BBCLASSEXTEND = "native"
> 

