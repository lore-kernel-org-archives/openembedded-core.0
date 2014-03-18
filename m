Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 229156C6EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:48:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2014 06:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,678,1389772800"; d="scan'208";a="502288027"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.153])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2014 06:48:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 18 Mar 2014 13:48:06 +0000
Message-ID: <1667020.PzS0jxAa6O@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1394849186-25396-1-git-send-email-kergoth@gmail.com>
References: <1394849186-25396-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe: turn oe into a namespace package
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
X-List-Received-Date: Tue, 18 Mar 2014 13:48:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 14 March 2014 19:06:26 Christopher Larson wrote:
> This will let folks extend the oe package with modules from other layers.
> Given openembedded consists of more than just oe-core, I think this makes
> sense, and adds some useful flexibility.
> 
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/lib/oe/__init__.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
> index e69de29..3ad9513 100644
> --- a/meta/lib/oe/__init__.py
> +++ b/meta/lib/oe/__init__.py
> @@ -0,0 +1,2 @@
> +from pkgutil import extend_path
> +__path__ = extend_path(__path__, __name__)

FWIW, this broke builds on my CentOS build machine that uses a slightly older 
buildtools install from 1.4. I hope we have pkgutil in our more current 
buildtools - if not could you please send a fix for that as well?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

