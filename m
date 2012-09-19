Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TEL0E-0001Wb-O6
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 16:11:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Sep 2012 06:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="146735850"
Received: from costin-desktop (HELO [10.237.105.66]) ([10.237.105.66])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Sep 2012 06:58:51 -0700
Message-ID: <5059C2CE.4050109@intel.com>
Date: Wed, 19 Sep 2012 16:04:14 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
	<CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
In-Reply-To: <CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Wed, 19 Sep 2012 14:11:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 04:23 PM, Khem Raj wrote:
>> >--- a/meta/recipes-devtools/intltool/intltool.inc
>> >+++ b/meta/recipes-devtools/intltool/intltool.inc
>> >@@ -7,11 +7,18 @@ SRC_URI ="http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
>> >  S = "${WORKDIR}/intltool-${PV}"
>> >
>> >  DEPENDS = "libxml-parser-perl-native"
>> >+RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
> creating a runtime dependency on a dev package seems troublesome to me.
> Can you explain why is this being done ?
>
>> >  DEPENDS_virtclass-native = "libxml-parser-perl-native"
>> >-#RDEPENDS_${PN} = "libxml-parser-perl"
>> >+# gettext is assumed to exist on the host
>> >+RDEPENDS_${PN}_virtclass-native = "libxml-parser-perl-native"
>> >  RRECOMMENDS_${PN} = "perl-modules"
Ross suggested to use these RDEPENDS after having issues with some 
packages on a image due to intltool.

Constantin


