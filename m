Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 04E7F72304
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 16:40:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2014 08:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,522,1413270000"; d="scan'208";a="643063654"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2014 08:39:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 05 Dec 2014 16:39:51 +0000
Message-ID: <4637432.pLcK1YbDyK@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <c3538b9cc6a1e53955164e4f22482b7ac609bc75.1417793506.git.paul.eggleton@linux.intel.com>
References: <cover.1417793506.git.paul.eggleton@linux.intel.com>
	<c3538b9cc6a1e53955164e4f22482b7ac609bc75.1417793506.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Fri, 05 Dec 2014 16:40:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 05 December 2014 15:32:42 Paul Eggleton wrote:
> Since the split out of git-perltools, some git tools (such as "git am",
> "git send-email" and "git-submodule") have no longer been part of the
> buildtools. We need these, so add them back in.
> 
> Fixes [YOCTO #7033].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
> b/meta/recipes-core/meta/buildtools-tarball.bb index 58e0ffa..822f4dc
> 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -16,6 +16,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-chrpath \
>      nativesdk-tar \
>      nativesdk-git \
> +    nativesdk-git-perltools \
>      nativesdk-pigz \
>      nativesdk-make \
>      nativesdk-wget \

Oh, if only it were that simple. This drags perl into buildtools, which we do 
not want. I'd probably better fix that first, so ignore this for now... :/

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

