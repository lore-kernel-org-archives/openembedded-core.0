Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqHU-0001zp-9d
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 18:59:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2012 09:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221129531"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:46:24 -0700
Message-ID: <5050BC60.5060703@linux.intel.com>
Date: Wed, 12 Sep 2012 09:46:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1347181988.4396.256.camel@x121e.pbcl.net>
In-Reply-To: <1347181988.4396.256.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl-native: PROVIDE libmodule-build-perl-native for consistency with non-native perl
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
X-List-Received-Date: Wed, 12 Sep 2012 16:59:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2012 02:13 AM, Phil Blundell wrote:
> This module is, apparently, included in the standard perl distribution
> since 5.10.1 or so.  The regular perl recipe has had this PROVIDES for a
> while but it seems to have been overlooked in the native version.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-devtools/perl/perl-native_5.14.2.bb |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> index df8f058..9f6a077 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
> @@ -9,6 +9,9 @@ PR = "r1"
>   LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>                       file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>
> +# 5.10.1 has Module::Build built-in
> +PROVIDES += "libmodule-build-perl-native"
> +
>   SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>              file://Configure-multilib.patch \
>              file://perl-configpm-switch.patch \
>

This along with the 2 shadow patches were merged into OE-Core

Thanks
	Sau!



