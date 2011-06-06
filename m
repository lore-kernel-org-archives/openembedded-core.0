Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTdKH-0004El-QA
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:10:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jun 2011 09:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,327,1304319600"; d="scan'208";a="12560474"
Received: from unknown (HELO [10.255.13.99]) ([10.255.13.99])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2011 09:50:35 -0700
Message-ID: <4DED055A.8010200@linux.intel.com>
Date: Mon, 06 Jun 2011 09:50:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307342214.git.sgw@linux.intel.com>	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
	<1307357430.7672.7.camel@rex>
In-Reply-To: <1307357430.7672.7.camel@rex>
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
X-List-Received-Date: Mon, 06 Jun 2011 17:10:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2011 03:50 AM, Richard Purdie wrote:
> On Mon, 2011-06-06 at 07:55 +0100, Phil Blundell wrote:
>> On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
>>>   SECTION_${PN}-dev = "devel"
>>>   ALLOW_EMPTY_${PN}-dev = "1"
>>>   RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>>>
>>> +FILES_${PN}-staticlibs = "${libdir}/*.a ${base_libdir}/*.a"
>>> +SECTION_${PN}-staticlibs = "devel"
>>> +RDEPENDS_${PN}-staticlibs = "${PN}-dev (= ${EXTENDPV})"
>>
>> This should be ${EXTENDPKGV}, right?
>
> It should.
>
> I'm also not 100% convinced I like "-staticlibs" vs "-staticdev" as it
> doesn't feel consistent.
>
> The user gets exposed to these at the package manager level and will
> "xxx install xxx-staticX". The end result they'll get will be the
> installation of everything they need for static development (i.e. the
> -dev packages will get pulled in for the headers). This means they don't
> just result in the static libs as there are dependencies there. From the
> user perspective they are therefore packages for static development, not
> just the static libraries...
>
Richard,

I agree that they are for development and that by their nature they have 
a dependency on the Development packages, but they contain libs only, 
not all the development headers or tools, I think its therefore 
mis-leading to call the package staticdev since they do not contain all 
the development bits (they might depend on all the bits).  It's a subtle 
but important distinction.

As was pointed out earlier Fedora packages static libraries in a 
"-static" package, but this had other implications for OE due to -static 
already being in use (for busybox and mplayer), I am not sure that this 
is not a problem for OE-Core, I would need to investigate.  Meego also 
seems to use the Fedora standard with "-static".

I still believe that -staticlibs is a better identifier for these packages.

Sau!

> Cheers,
>
> Richard
>
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


