Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R6qsX-0002rN-F9
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 23:32:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2011 14:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="54351516"
Received: from scimitar.jf.intel.com (HELO [10.7.199.86]) ([10.7.199.86])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2011 14:26:52 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 22 Sep 2011 14:26:53 -0700
In-Reply-To: <e4dd377c38d0df65adb41959e5b720e5b539a47d.1316725800.git.dvhart@linux.intel.com>
References: <cover.1316725800.git.dvhart@linux.intel.com>
	<e4dd377c38d0df65adb41959e5b720e5b539a47d.1316725800.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316726813.2126.2.camel@scimitar>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] intltool: add libxml-parser-perl-native dependency to -native version
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
X-List-Received-Date: Thu, 22 Sep 2011 21:32:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 14:14 -0700, Darren Hart wrote:
> Fixes [YOCTO #1514]
> 
> Without a native dependency on libxml-parser-perl-native,
> shared-mime-info-native can fail its do_configure task.
> 
> checking for XML::Parser... configure: error: XML::Parser perl module is
> required for intltool
> 
> Testing: Successfully built shared-mime-info and shared-mime-info-native for
> qemuppc.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Joshua Lock <josh@linux.intel.com>

> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> CC: Koen Kooi <koen@dominion.thruhere.net>
> CC: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/intltool/intltool.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
> index 8d4bec5..23a1ee9 100644
> --- a/meta/recipes-devtools/intltool/intltool.inc
> +++ b/meta/recipes-devtools/intltool/intltool.inc
> @@ -7,6 +7,7 @@ SRC_URI = "${GNOME_MIRROR}/intltool/${URLV}/intltool-${PV}.tar.bz2"
>  S = "${WORKDIR}/intltool-${PV}"
>  
>  DEPENDS = "libxml-parser-perl-native"
> +DEPENDS_virtclass-native = "libxml-parser-perl-native"
>  #RDEPENDS_${PN} = "libxml-parser-perl"
>  RRECOMMENDS_${PN} = "perl-modules"
>  RRECOMMENDS_${PN}_virtclass-native = ""

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



