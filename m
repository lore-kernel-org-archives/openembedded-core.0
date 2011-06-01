Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRotm-0003Uy-FX
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:08:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jun 2011 10:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,304,1304319600"; d="scan'208";a="10439217"
Received: from unknown (HELO [10.255.13.41]) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2011 10:04:49 -0700
Message-ID: <4DE67130.5040700@linux.intel.com>
Date: Wed, 01 Jun 2011 10:04:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306909184.git.sgw@linux.intel.com>	<937ab8072370293ac6caba070bb2be1e3d5f1039.1306909184.git.sgw@linux.intel.com>
	<4DE5DC18.3060405@gmail.com>
In-Reply-To: <4DE5DC18.3060405@gmail.com>
Subject: Re: [CONSOLIDATED PULL 12/32] libiconv: update to 1.13.1
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
X-List-Received-Date: Wed, 01 Jun 2011 17:08:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 11:28 PM, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05/31/2011 11:21 PM, Saul Wold wrote:
>> Add Upstream-Status tags to patches
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../autoconf.patch                                 |    2 ++
>>   .../shared_preloadable_libiconv_linux.patch        |    2 ++
>>   .../{libiconv_1.11.1.bb =>  libiconv_1.13.1.bb}     |    0
>>   3 files changed, 4 insertions(+), 0 deletions(-)
>>   rename meta/recipes-support/libiconv/{libiconv-1.11.1 =>  libiconv-1.13.1}/autoconf.patch (98%)
>>   rename meta/recipes-support/libiconv/{libiconv-1.11.1 =>  libiconv-1.13.1}/shared_preloadable_libiconv_linux.patch (98%)
>>   rename meta/recipes-support/libiconv/{libiconv_1.11.1.bb =>  libiconv_1.13.1.bb} (100%)
>>
Richard,

Please drop this patch from the series, there more wrong with it, I got 
caught with a "virtual/libiconv", I thought it built, but it did not.

Sorry about this one.
	
Sau!

>> diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
>> similarity index 98%
>> rename from meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
>> rename to meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
>> index 2b24894..3cbf549 100644
>> --- a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
>> +++ b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
>> @@ -2,6 +2,8 @@ It adds the variables that are needed
>>   for autoconf 2.65 to reconfigure libiconv and defines the m4 macros
>>   directory. Its imported from OE.
>>
>> +Upstream-Status: Pending
>> +
>>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>
>>   Index: libiconv-1.11.1/configure.ac
>> diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
>> similarity index 98%
>> rename from meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
>> rename to meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
>> index a913dad..fb07f73 100644
>> --- a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
>> +++ b/meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
>> @@ -4,6 +4,8 @@ Its more enforced by libtool 2.4. I have not checked it with older libtool
>>   libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
>>   was released these kind of problem are more likely
>>
>> +Upstream-Status: Pending
>> +
>>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>
>>   Index: libiconv-1.11.1/lib/Makefile.in
>> diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
>> similarity index 100%
>> rename from meta/recipes-support/libiconv/libiconv_1.11.1.bb
>> rename to meta/recipes-support/libiconv/libiconv_1.13.1.bb
>
> FWIW 1.11.1 was last GPLv2 release. So I think you can add 1.13.1 but do
> not replace 1.11.1 with it.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk3l3BcACgkQuwUzVZGdMxS/0QCaAkbu4wuI/ZJ72mK7zlD3lP8F
> vlMAniBrJK4jCDvDlqgQtXzUwFVQju/R
> =ZlZ3
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


