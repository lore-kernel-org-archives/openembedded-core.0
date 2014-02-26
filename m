Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF0C36AE14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 14:42:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2014 06:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="462614587"
Received: from jgkenna-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.171])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2014 06:42:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 14:42:32 +0000
Message-ID: <2631264.Ll8XlRBBiZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <1393419467-6018-1-git-send-email-diego.sueiro@gmail.com>
References: <1393419467-6018-1-git-send-email-diego.sueiro@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 14:42:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Diego,

On Wednesday 26 February 2014 09:57:47 Diego Sueiro wrote:
> libQtUiTools.a and libQtUiToolsE.a needs to be installed on
> meta-toolchain-qt and meta-toolchain-qte respectively.
> Whitout this static library, compiling qt apps which needs uitools will
> fail.
> 
> qt4[-embedded]-staticdev is the package that contains this library and is
> the only file in it.
> 
> Since a static library is shipped, special attention regarding the lincese
> should be taken.
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> ---
>  meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc |    1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git
> a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc index
> fc1ccba..b040182 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> +++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> @@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
>          libqt${QTLIBPREFIX}xmlpatterns4-dev \
>          libsqlite3-dev \
>          expat-dev \
> +        qt4${QTLIBPREFIX}-staticdev \
>          "

I know there's already been a bit of discussion about this patch already, so I 
apologise if this has already been covered, but the commit message doesn't 
completely justify this addition. Most people don't statically link to Qt, 
which is why we haven't included any static libraries in the SDK (and as a 
rule we typically don't include any static libraries in our SDKs). Why is this 
individual library out of all of the libraries that Qt ships special?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

