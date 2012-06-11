Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SeD1U-0002sr-EK
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 00:23:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jun 2012 15:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151582288"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2012 15:13:09 -0700
Message-ID: <4FD66D75.1080901@linux.intel.com>
Date: Mon, 11 Jun 2012 15:13:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1339117150-15442-1-git-send-email-sgw@linux.intel.com>
	<0DCEDF44-AD19-4718-92F2-4801F8268190@dominion.thruhere.net>
	<4FD605CE.6060203@linux.intel.com>
	<2405D501-576B-4710-9FE4-4CBED50F7FA8@dominion.thruhere.net>
In-Reply-To: <2405D501-576B-4710-9FE4-4CBED50F7FA8@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: enable ssl support
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
X-List-Received-Date: Mon, 11 Jun 2012 22:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2012 08:19 AM, Koen Kooi wrote:
>
> Op 11 jun. 2012, om 09:50 heeft Saul Wold het volgende geschreven:
>
>> On 06/08/2012 12:39 AM, Koen Kooi wrote:
>>>
>>> Op 8 jun. 2012, om 02:59 heeft Saul Wold het volgende geschreven:
>>>
>>>> This patch enables ssl support for curl to allow git to clone from
>>>> https / ssl sites.
>>>>
>>>> [YOCTO #2532]
>>>>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>> meta/recipes-support/curl/curl_7.24.0.bb |    6 +++---
>>>> 1 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
>>>> index 12e95c9..f0ae7f1 100644
>>>> --- a/meta/recipes-support/curl/curl_7.24.0.bb
>>>> +++ b/meta/recipes-support/curl/curl_7.24.0.bb
>>>> @@ -5,10 +5,10 @@ SECTION = "console/network"
>>>> LICENSE = "MIT"
>>>> LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
>>>>
>>>> -DEPENDS = "zlib gnutls"
>>>> +DEPENDS = "zlib gnutls openssl"
>>>> DEPENDS_virtclass-native = "zlib-native"
>>>> DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
>>>> -PR = "r0"
>>>> +PR = "r1"
>>>>
>>>> SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>>>             file://noldlibpath.patch \
>>>> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01
>>>> inherit autotools pkgconfig binconfig
>>>>
>>>> EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
>>>> -                --without-ssl \
>>>> +		--with-ssl \
>>>>                  --without-libssh2 \
>>>> 		--with-random=/dev/urandom \
>>>> 		--without-libidn \
>>>
>>> I haven't looked at the complete recipe, but what is the ssl behaviour for the -native and -nativesdk versions?
>>>
>> Actually it's the -native that needs the ssl behavior, and this adds it for all 3 correctly, tested on target as well as -native (I did not actually test the -nativesdk, but I will now).
>
> In that case you need to change all the DEPENDS, including the virtclass ones.
>
Yes, of course, I missed those and it worked since I already had the 
OpenSSL-native package on my system.

Thanks
	Sau!

> regards,
>
> Koen
>
>
>


