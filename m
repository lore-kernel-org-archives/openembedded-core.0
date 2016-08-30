Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0D083605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:24:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 30 Aug 2016 05:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1033125746"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.182.37])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2016 05:24:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Date: Wed, 31 Aug 2016 00:24:25 +1200
Message-ID: <2362757.E7EAftXMYC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <81a35da5b46204d44e1d94346255b38590d49d9b.1472225461.git.joshua.g.lock@intel.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<81a35da5b46204d44e1d94346255b38590d49d9b.1472225461.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] buildtools-tarball: add tar
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
X-List-Received-Date: Tue, 30 Aug 2016 12:24:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 26 Aug 2016 16:43:05 Joshua Lock wrote:
> We'd like to make use of features which aren't available in tar
> versions prior to 1.27, therefore add tar to the buildtools-tarball
> so that older distributions can still perform builds.
> 
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
> b/meta/recipes-core/meta/buildtools-tarball.bb index 34df531..f28a8c3
> 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -24,6 +24,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-ca-certificates \
>      nativesdk-texinfo \
>      nativesdk-locale-base-en-us \
> +    nativesdk-tar \
>      "
> 
>  SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"

Er, tar is already in buildtools-tarball... right?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

