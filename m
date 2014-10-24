Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4853E65CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:24:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Oct 2014 08:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,780,1406617200"; d="scan'208";a="624718574"
Received: from nmcnulty-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.119])
	by orsmga002.jf.intel.com with ESMTP; 24 Oct 2014 08:24:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Oct 2014 16:24:11 +0100
Message-ID: <1459290.OulfKNcXUt@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.6-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1414162585.30118.28.camel@ted>
References: <1414162585.30118.28.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnu-config: Deal with "make clean" breakage
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
X-List-Received-Date: Fri, 24 Oct 2014 15:24:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Richard,

On Friday 24 October 2014 15:56:25 Richard Purdie wrote:
> gnu-config can't cope with a "make clean" so disable that
> newly enabled functionality.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
> b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb index
> d67466a..910b612 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
> @@ -17,6 +17,10 @@ SRC_URI =
> "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV
> SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
>  SRC_URI[sha256sum] =
> "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
> 
> +do_configure () {
> +	:
> +}
> +
>  do_compile() {
> 
>  }
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> b/meta/recipes-devtools/gnu-config/gnu-config_git.bb index 00fa759..ee1621f
> 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -17,6 +17,10 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
> 
>  S = "${WORKDIR}/git"
> 
> +do_configure () {
> +	:
> +}
> +
>  do_compile() {
> 
>  }

Would it be worth adding some comments here to explain why these functions are 
being nulled out?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

