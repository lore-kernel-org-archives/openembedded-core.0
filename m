Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgi8M-00015d-Ag
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:56:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 11:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="29494480"
Received: from unknown (HELO [10.255.14.40]) ([10.255.14.40])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2011 11:48:14 -0700
Message-ID: <4E1C96EE.9000008@linux.intel.com>
Date: Tue, 12 Jul 2011 11:48:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310425837.git.sgw@linux.intel.com>	<da30f3b2645703da5e7d49e245d379ca82789989.1310425837.git.sgw@linux.intel.com>
	<07DCE710-AD3A-411F-8EED-74F3723D534C@dominion.thruhere.net>
In-Reply-To: <07DCE710-AD3A-411F-8EED-74F3723D534C@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 13/26] js: Use bitbake default FILES for	packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 18:56:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 12:13 AM, Koen Kooi wrote:
>
> Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:
>
>> This will ensure correct -dev and -staticdev packging
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb |    3 +--
>> 1 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>> index a4423ab..d4e1e4d 100644
>> --- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>> +++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>> @@ -5,7 +5,7 @@ SECTION = "libs"
>> # the package is licensed under either of the following
>> LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
>> LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
>> -PR = "r2"
>> +PR = "r4"
>>
>> SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
>>             file://link_with_gcc.patch \
>> @@ -47,5 +47,4 @@ do_install() {
>> }
>>
>> FILES_${PN} = "${libdir}/lib*.so"
>
> Not .so.*?
>
Correct, seems js only builds out a .so with no versioning, so it needs 
to be special cased here.

Sau!

>> -FILES_${PN}-dev = "${includedir} ${libdir}/lib*.a"
>>
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


