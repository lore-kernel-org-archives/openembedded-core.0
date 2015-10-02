Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EE707770A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 12:48:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 02 Oct 2015 05:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,623,1437462000"; d="scan'208";a="802149626"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2015 05:48:00 -0700
Message-ID: <560E7D13.3010604@linux.intel.com>
Date: Fri, 02 Oct 2015 15:48:19 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
In-Reply-To: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Fri, 02 Oct 2015 12:48:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2015 03:41 PM, Jussi Kukkonen wrote:
> Automatic dependency tracking does not notice this (understandable
> with the dlopen trickery epoxy does).

Maybe it's better to explain this in a comment in the recipe itself?

> --- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> @@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
>   inherit autotools pkgconfig
>
>   DEPENDS = "util-macros virtual/egl"
> +RDEPENDS_${PN} = "libgl"




Alex

