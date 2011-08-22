Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qvd7X-000093-2e
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:37:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 15:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40752258"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 15:32:40 -0700
Message-ID: <4E52D907.7000606@linux.intel.com>
Date: Mon, 22 Aug 2011 15:32:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313164659.6733.163.camel@phil-desktop>
In-Reply-To: <1313164659.6733.163.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2011 22:37:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 08:57 AM, Phil Blundell wrote:
> This stops (most) x11 packages leaking into a non-x11 distro by mistake.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-graphics/xorg-lib/libx11.inc |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
> index c156ce6..455753f 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -42,3 +42,8 @@ do_compile() {
>   # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
>   # A world build should only build the correct version, not all of them.
>   EXCLUDE_FROM_WORLD = "1"
> +
> +python () {
> +       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
> +       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
> +}

This has been merged, sorry for the response delay

Thanks

Sau!


