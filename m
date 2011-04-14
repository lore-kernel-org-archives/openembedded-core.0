Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAU3f-0003ju-9H
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 23:26:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2011 14:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,213,1301900400"; d="scan'208";a="628797451"
Received: from unknown (HELO [10.255.12.232]) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2011 14:24:17 -0700
Message-ID: <4DA76601.40308@linux.intel.com>
Date: Thu, 14 Apr 2011 14:24:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302770941.git.dexuan.cui@intel.com>
	<dc2b7b09baaee3ef172e41edfb2eedfe065b0006.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <dc2b7b09baaee3ef172e41edfb2eedfe065b0006.1302770941.git.dexuan.cui@intel.com>
Subject: Re: [v2 12/12] gnu-config-native: add dependency on	perl-native
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
X-List-Received-Date: Thu, 14 Apr 2011 21:26:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2011 01:56 AM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> Fixes [YOCTO #968]
>
> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
> ---
>   .../gnu-config/gnu-config_20080123.bb              |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
> index e0a8155..2ad0834 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
> @@ -3,7 +3,9 @@ DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a direc
>   SECTION = "devel"
>   LICENSE = "GPLv1+"
>   LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a089987af4a25cb0419d1c2fd6d495e3"
> -DEPENDS = ""
> +
> +DEPENDS_virtclass-native = "perl-native"
> +
>   INHIBIT_DEFAULT_DEPS = "1"
>
>   FIXEDSRCDATE = "${@bb.data.getVar('FILE', d, 1).split('_')[-1].split('.')[0]}"
Looks like you forgot to bump PR for this.

Also, there is a patch associated with this recipe that needs the 
Upstream-Status tag


