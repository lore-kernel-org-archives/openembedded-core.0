Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 93D1B78072
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 08:59:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 01:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="988110057"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 03 Jul 2017 01:59:10 -0700
Date: Mon, 3 Jul 2017 11:59:35 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20170703085935.GA17530@mbabyjoh-desk.ger.corp.intel.com>
References: <20170703080331.5973-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170703080331.5973-1-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: naresh.kamboju@linaro.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Mon, 03 Jul 2017 08:59:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jul 03, 2017 at 11:03:31AM +0300, Fathi Boudra wrote:
> * Use a list and re-order alphabetically to make it easier to read and
>   update.
> * Add missing runtime dependencies:
>   - acl (getfacl/setfacl commands are required)
>   - attr (getfattr/setfattr commands are required)
>   - curl (curl command is required)
>   - util-linux (ipcs command is required)
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta/recipes-extended/ltp/ltp_20170516.bb | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
> index f537d60c15..564fdcf8c2 100644
> --- a/meta/recipes-extended/ltp/ltp_20170516.bb
> +++ b/meta/recipes-extended/ltp/ltp_20170516.bb
> @@ -95,7 +95,27 @@ do_install(){
>      cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>  }
>  
> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd unzip gzip cpio cronie logrotate which at"
> +RDEPENDS_${PN} = "
> +    acl \
> +    at \
> +    attr \
> +    bash \
> +    cpio \
> +    cronie \
> +    curl \
> +    e2fsprogs-mke2fs \
> +    expect \
> +    gawk \
> +    gzip \
> +    ldd \
> +    libaio \
> +    logrotate \
> +    perl \
> +    python-core \
> +    unzip \
> +    util-linux \
> +    which \
> +"

These changes look good. However, this patch is causing a parser error:
ERROR: ParseError at /home/maxin/poky/meta/recipes-extended/ltp/ltp_20170516.bb:98: unparsed line: 'RDEPENDS_${PN} = "

Please fix it.

>  FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a /opt/ltp/testcases/data/nm01/lib.a"
>  
> @@ -106,4 +126,3 @@ INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  # However, test_arch_stripped is already stripped, so...
>  INSANE_SKIP_${PN} += "already-stripped"

Best Regards,
Maxin

