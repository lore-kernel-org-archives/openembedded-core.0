Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEM6p-0007Pe-Aa
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:22:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 08:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194562469"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 08:09:55 -0700
Message-ID: <5059E042.3050805@linux.intel.com>
Date: Wed, 19 Sep 2012 08:09:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
	<CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
	<5059C2CE.4050109@intel.com>
In-Reply-To: <5059C2CE.4050109@intel.com>
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
X-List-Received-Date: Wed, 19 Sep 2012 15:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 06:04 AM, Constantin Musca wrote:
> On 09/19/2012 04:23 PM, Khem Raj wrote:
>>> >--- a/meta/recipes-devtools/intltool/intltool.inc
>>> >+++ b/meta/recipes-devtools/intltool/intltool.inc
>>> >@@ -7,11 +7,18 @@ SRC_URI
>>> ="http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
>>> >  S = "${WORKDIR}/intltool-${PV}"
>>> >
>>> >  DEPENDS = "libxml-parser-perl-native"
>>> >+RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
>> creating a runtime dependency on a dev package seems troublesome to me.
>> Can you explain why is this being done ?
>>
The question here is why do we need the gettext-dev package for 
intltool?  What does intltool need from the -dev package?

Sau!

>>> >  DEPENDS_virtclass-native = "libxml-parser-perl-native"
>>> >-#RDEPENDS_${PN} = "libxml-parser-perl"
>>> >+# gettext is assumed to exist on the host
>>> >+RDEPENDS_${PN}_virtclass-native = "libxml-parser-perl-native"
>>> >  RRECOMMENDS_${PN} = "perl-modules"
> Ross suggested to use these RDEPENDS after having issues with some
> packages on a image due to intltool.
>
> Constantin
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


