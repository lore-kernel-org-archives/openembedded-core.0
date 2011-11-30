Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVXoi-0007M3-Nz
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:14:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2011 16:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="42300324"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2011 16:07:47 -0800
Message-ID: <4ED573D3.4040408@linux.intel.com>
Date: Tue, 29 Nov 2011 16:07:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<63a8312e843e78942030e19786cc34ee752c851c.1322607016.git.sgw@linux.intel.com>
	<20111129230811.GN7441@jama.jama.net>
In-Reply-To: <20111129230811.GN7441@jama.jama.net>
Cc: openembedded-core@openembedded.org, Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 20/26] libiconv: Update to 1.14
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
X-List-Received-Date: Wed, 30 Nov 2011 00:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 03:08 PM, Martin Jansa wrote:
> On Tue, Nov 29, 2011 at 03:00:20PM -0800, Saul Wold wrote:
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../{libiconv_1.13.1.bb =>  libiconv_1.14.bb}       |    3 ---
>>   1 files changed, 0 insertions(+), 3 deletions(-)
>>   rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb =>  libiconv_1.14.bb} (88%)
>>
>> diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
>> similarity index 88%
>> rename from meta/recipes-support/libiconv/libiconv_1.13.1.bb
>> rename to meta/recipes-support/libiconv/libiconv_1.14.bb
>> index 6471e32..3b0196d 100644
>> --- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
>> +++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
>> @@ -13,9 +13,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>>              file://autoconf.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "7ab33ebd26687c744a37264a330bbe9a"
>> -SRC_URI[sha256sum] = "55a36168306089009d054ccdd9d013041bfc3ab26be7033d107821f1c4949a49"
>> -
>
> where are checksums now?
>
Vanished!

I did a fetch for all of these and did not see errors, will go back and 
fix these and the Xorg-server.

Thanks
	Sau!

> Cheers,
>
>>   S = "${WORKDIR}/libiconv-${PV}"
>>
>>   inherit autotools pkgconfig gettext
>> --
>> 1.7.6.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


