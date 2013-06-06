Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F12886A877
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 03:17:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jun 2013 20:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,811,1363158000"; d="scan'208";a="348870843"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2013 20:17:07 -0700
Message-ID: <51AFFF33.9050009@linux.intel.com>
Date: Wed, 05 Jun 2013 20:17:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: nitin.a.kamble@intel.com
References: <cover.1370460463.git.nitin.a.kamble@intel.com>
	<9d0b35fe8c4d81bc9034d7ab3086ba9550e63591.1370460463.git.nitin.a.kamble@intel.com>
In-Reply-To: <9d0b35fe8c4d81bc9034d7ab3086ba9550e63591.1370460463.git.nitin.a.kamble@intel.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tools-testapps: add xserver in dependency
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
X-List-Received-Date: Thu, 06 Jun 2013 03:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2013 12:28 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This package group adds packages needing Xserver, These packages
> demand X drivers such as EMGD driver. And if the image does not
> include Xserver then it causes a build error about Xserver like
> this:
>     Error: no package provides xorg-abi-video-8
>
> Fix the issue by adding Xserver as one of the dependency.
>
> Fixes this bug:
> [YOCTO #4615]
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> index 343ae1c..6619a98 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> @@ -5,7 +5,7 @@
>   SUMMARY = "Testing tools/applications"
>   LICENSE = "MIT"
>
> -PR = "r2"
> +PR = "r3"
>
>   inherit packagegroup
>
> @@ -44,4 +44,5 @@ RDEPENDS_${PN} = "\
>       xvideo-tests \
>       ltp \
>       connman-client \
> +    xserver-xorg \
>
Nitin,

This seems like a stop-gap, what changed in the last few weeks that 
caused the -lsb bsps to stop working?  All the meta-yocto-bsp work 
correctly, so it's something to do with emgd.  Maybe there is a missing 
dependency in the emgd chain.

Sau!

     "
>

