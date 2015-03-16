Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA226AC3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 15:43:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 16 Mar 2015 08:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="692839936"
Received: from rhannah-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.105.230])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2015 08:43:45 -0700
Message-ID: <5506FA30.9000002@linux.intel.com>
Date: Mon, 16 Mar 2015 09:43:44 -0600
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1426485217-18563-1-git-send-email-sgw@linux.intel.com>
	<55067537.1060108@windriver.com>
In-Reply-To: <55067537.1060108@windriver.com>
Subject: Re: [PATCH] openssl: fix libssl.pc to Require libcrypto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Mar 2015 15:43:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2015 12:16 AM, Robert Yang wrote:
>
> I'm afraid that it doesn't work, the error is the same as before
> for openflow.
>
Hmm, I tested it here, will try again, I can change the Libs: entry, I 
know that works for sure.

Also I realized I sent it late and forgot to add the patch 
Upstream-Status info and SOB

Sau!

> // Robert
>
> On 03/16/2015 01:53 PM, Saul Wold wrote:
>> The 1.0.2 version of libssl requires that libcrypto be linked so don't
>> keep it private anymore.
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   .../openssl/openssl/fix_Makefile_creation_of_libssl.patch   | 13
>> +++++++++++++
>>   meta/recipes-connectivity/openssl/openssl_1.0.2.bb          |  1 +
>>   2 files changed, 14 insertions(+)
>>   create mode 100644
>> meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>>
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>> b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>>
>> new file mode 100644
>> index 0000000..dbf1f3c
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>>
>> @@ -0,0 +1,13 @@
>> +Index: openssl-1.0.2/Makefile
>> +===================================================================
>> +--- openssl-1.0.2.orig/Makefile
>> ++++ openssl-1.0.2/Makefile
>> +@@ -381,7 +381,7 @@ libssl.pc: Makefile
>> +         echo 'Name: OpenSSL-libssl'; \
>> +         echo 'Description: Secure Sockets Layer and cryptography
>> libraries'; \
>> +         echo 'Version: '$(VERSION); \
>> +-        echo 'Requires.private: libcrypto'; \
>> ++        echo 'Requires: libcrypto'; \
>> +         echo 'Libs: -L$${libdir} -lssl'; \
>> +         echo 'Libs.private: $(EX_LIBS)'; \
>> +         echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> index 79537f9..a980855 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> @@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
>>               file://Makefiles-ptest.patch \
>>               file://ptest-deps.patch \
>>               file://run-ptest \
>> +            file://fix_Makefile_creation_of_libssl.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "38373013fc85c790aabf8837969c5eba"
>>
>
>

