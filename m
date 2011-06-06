Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTbKF-0001pk-5u
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 17:02:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2011 07:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,326,1304319600"; 
   d="scan'208";a="9691473"
Received: from unknown (HELO [10.255.13.99]) ([10.255.13.99])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2011 07:59:25 -0700
Message-ID: <4DECEB4D.4060308@linux.intel.com>
Date: Mon, 06 Jun 2011 07:59:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307342214.git.sgw@linux.intel.com>	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1307343323.3131.1.camel@lenovo.internal.reciva.com>
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
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
X-List-Received-Date: Mon, 06 Jun 2011 15:02:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2011 11:55 PM, Phil Blundell wrote:
> On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
>>   SECTION_${PN}-dev = "devel"
>>   ALLOW_EMPTY_${PN}-dev = "1"
>>   RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>>
>> +FILES_${PN}-staticlibs = "${libdir}/*.a ${base_libdir}/*.a"
>> +SECTION_${PN}-staticlibs = "devel"
>> +RDEPENDS_${PN}-staticlibs = "${PN}-dev (= ${EXTENDPV})"
>
> This should be ${EXTENDPKGV}, right?
>
Fixed and pushed an update to the sgw/stage.

Must have done a cut and paste on an older version.

There are still a number of recipes that name manual adjustment.

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


