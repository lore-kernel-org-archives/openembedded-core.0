Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TE1B8-0006Ht-Oi
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 19:01:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Sep 2012 09:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="194448814"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2012 09:49:01 -0700
Message-ID: <5058A5FC.9020308@linux.intel.com>
Date: Tue, 18 Sep 2012 09:49:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1347975238-6208-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1347975238-6208-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] intltool: include intltool.m4 and add missing rdepends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 17:01:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 06:33 AM, Constantin Musca wrote:
> - include /usr/share/aclocal/intltool.m4 into the intltool
> package (the files from intltool-dev must be included into the
> main package, as intltool is a development tool)
> - add missing rdepends: gettext-dev, libxml-parser-perl
>
> [YOCTO #2597]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/recipes-devtools/intltool/intltool_0.50.0.bb |    9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> index d1ee31d..52de5df 100644
> --- a/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> +++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> @@ -1,7 +1,7 @@
>   require intltool.inc
>   LICENSE="GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI += "file://intltool-nowarn-0.50.0.patch \
>              ${NATIVEPATCHES} \
> @@ -17,3 +17,10 @@ NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
>
>   SRC_URI[md5sum] = "0da9847a60391ca653df35123b1f7cc0"
>   SRC_URI[sha256sum] = "dccfb0b7dd35a170130e8934bfd30c29da6ae73bcd3ca4ba71317c977b2893d6"
> +
> +RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
> +
I am not sure that this is the right thing to do here, this might cause 
some problems if you try to build the native variation of intltool??

Sau!

> +FILES_${PN}-dev = ""
> +FILES_${PN} += "${datadir}/aclocal"
> +
> +INSANE_SKIP_${PN} += "dev-deps"
>


