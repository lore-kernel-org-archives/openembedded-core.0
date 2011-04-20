Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QCZai-000287-7y
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 17:45:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2011 08:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,247,1301900400"; d="scan'208";a="912285239"
Received: from unknown (HELO [10.255.13.58]) ([10.255.13.58])
	by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2011 08:42:55 -0700
Message-ID: <4DAEFEFF.4080102@linux.intel.com>
Date: Wed, 20 Apr 2011 08:42:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1303284287.git.dexuan.cui@intel.com>
	<0a4528e92190a055233b52e7d4e9bbfe0400e959.1303284287.git.dexuan.cui@intel.com>
In-Reply-To: <0a4528e92190a055233b52e7d4e9bbfe0400e959.1303284287.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 2/9] util-macros: upgrade from 1.11.0 to 1.13.0
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
X-List-Received-Date: Wed, 20 Apr 2011 15:45:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2011 12:30 AM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
> ---
>   ...util-macros_1.11.0.bb =>  util-macros_1.13.0.bb} |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/xorg-util/{util-macros_1.11.0.bb =>  util-macros_1.13.0.bb} (79%)
>
> diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> similarity index 79%
> rename from meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> rename to meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> index 765a577..a708ed0 100644
> --- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> +++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> @@ -20,5 +20,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI[md5sum] = "8580021f3a9e242ab09d23d62e475d53"
> -SRC_URI[sha256sum] = "212c3d14474d7cffdbc22437d4896211a5dce6b99b02b96229c9be7d963c90cf"
> +SRC_URI[md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
> +SRC_URI[sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"

I will pull this patch today, but you need to determine if the 
util-macros/xaw.patch is still needed and if not, please remove it from 
the tree.

Thanks
	Sau!


