Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B72A8736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:27:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2015 05:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,275,1444719600"; d="scan'208";a="847885324"
Received: from bpgilles-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.193])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2015 05:27:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 13:27:25 +0000
Message-ID: <4611513.VyrzVSX4hN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <1447240308-2849-2-git-send-email-ross.burton@intel.com>
References: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
	<1447240308-2849-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] systemd: fix Upstream-Status tag
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
X-List-Received-Date: Wed, 11 Nov 2015 13:27:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 November 2015 11:11:48 Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../0022-Use-getenv-when-secure-versions-are-not-available.patch        | 2
> +- 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-ar
> e-not-available.patch
> b/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-ar
> e-not-available.patch index 30e3817..5af78d5 100644
> ---
> a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-ar
> e-not-available.patch +++
> b/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-ar
> e-not-available.patch @@ -7,8 +7,8 @@ musl doesnt implement secure version,
> so we default to it if configure does not detect a secure imeplementation
> 
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Denied
>  ---
> -Upstream-Status: Rejected
> 
>   src/basic/missing.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

FWIW, I'd always thought "Rejected" would have been a more accurate label to 
use... on the other hand perhaps it's a bit late to be changing that now 
though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

