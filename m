Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 31A0F71A75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 15:23:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 07:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,161,1484035200"; d="scan'208";a="65654942"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2017 07:22:49 -0800
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1487080669-10136-1-git-send-email-armccurdy@gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <adcf4051-3269-986c-3d04-8850f30c270c@linux.intel.com>
Date: Tue, 14 Feb 2017 09:30:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1487080669-10136-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] weston: fix LIC_FILES_CHKSUM endline and md5sum for src/compositor.c
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
X-List-Received-Date: Tue, 14 Feb 2017 15:23:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/14/2017 07:57 AM, Andre McCurdy wrote:
> The license text in Weston sources was changed from "MIT X11" to "MIT
> Expat" in the 1.9.0 release. The new text is 3 lines longer than the
> previous version, so endline and md5 hash have been incorrect for the
> oe-core weston recipes from 1.9.0 onwards.

If this is the case, why the build system did not complain on >= 1.9 
recipes?


>    https://cgit.freedesktop.org/wayland/weston/diff/src/compositor.c?id=a0bbfea64b04d3cf12327d8b488b9949a4cddc99
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/recipes-graphics/wayland/weston_1.11.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb b/meta/recipes-graphics/wayland/weston_1.11.1.bb
> index 2736cc1..cdfac70 100644
> --- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.11.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
>   HOMEPAGE = "http://wayland.freedesktop.org"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
> -                    file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
> +                    file://src/compositor.c;endline=26;md5=e342df749174a8ee11065583157c7a38"
>   
>   SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>              file://weston.png \


