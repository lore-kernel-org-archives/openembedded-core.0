Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGMCX-0000iC-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:48:17 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 18 Oct 2011 19:42:25 -0700
Received: by eyg5 with SMTP id 5so1220055eyg.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:42:22 -0700 (PDT)
Received: by 10.223.77.6 with SMTP id e6mr7990646fak.32.1318992141963;
	Tue, 18 Oct 2011 19:42:21 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id u6sm7013097fan.17.2011.10.18.19.42.19
	(version=SSLv3 cipher=OTHER); Tue, 18 Oct 2011 19:42:21 -0700 (PDT)
Message-ID: <4E9E3909.40904@intel.com>
Date: Tue, 18 Oct 2011 19:42:17 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318989087.git.kai.kang@windriver.com>
	<65c7a1fd4cc82c9e2366247cdaa0af1e1320f865.1318989087.git.kai.kang@windriver.com>
In-Reply-To: <65c7a1fd4cc82c9e2366247cdaa0af1e1320f865.1318989087.git.kai.kang@windriver.com>
Subject: Re: [PATCH 2/4] xdg-utils: update to 1.1.0 rc1
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
X-List-Received-Date: Wed, 19 Oct 2011 02:48:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 07:00 PM, Kang Kai wrote:
> Update xdg-utils to 1.1.0 rc1, set variable "S".
>
Why are we updating to an RC1, if you are tracking this upstream then 
should we not wait just a little longer for the actual 1.1 release?

> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> ---
>   .../{xdg-utils_1.0.2.bb =>  xdg-utils_1.1.0rc1.bb}  |   20 +++++++++++---------
>   1 files changed, 11 insertions(+), 9 deletions(-)
>   rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =>  xdg-utils_1.1.0rc1.bb} (57%)
>
> diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
> similarity index 57%
> rename from meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
> rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
> index f54d591..d7e4e47 100644
> --- a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
> +++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
> @@ -4,13 +4,13 @@ DESCRIPTION = "The xdg-utils package is a set of simple scripts that provide bas
>   desktop integration functions for any Free Desktop, such as Linux. \
>   They are intended to provide a set of defacto standards. \
>   The following scripts are provided at this time: \
> -xdg-desktop-icon \
> -xdg-desktop-menu \
> -xdg-email \
> +xdg-desktop-icon \
> +xdg-desktop-menu \
> +xdg-email \
>   xdg-icon-resource \
> -xdg-mime \
> -xdg-open \
> -xdg-screensaver \
> +xdg-mime \
> +xdg-open \
> +xdg-screensaver \
>   "
White space changes?

Sau!

>
>   PR="r0"
> @@ -18,9 +18,11 @@ PR="r0"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
>
> -SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tgz"
> +SRC_URI = "http://portland.freedesktop.org/download/${BPN}-1.1.0-rc1.tar.gz"
> +
> +S = "${WORKDIR}/${PN}-1.1.0-rc1"
>
>   inherit autotools
>
> -SRC_URI[md5sum] = "348a5b91dc66426505022c74a64b2940"
> -SRC_URI[sha256sum] = "21aeb7d16b2529b8d3975118f59eec09953e09f9a68d718159e98c90474b01ac"
> +SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
> +SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"



