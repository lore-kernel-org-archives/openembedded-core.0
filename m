Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1T3daQ-0003wQ-6K
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 03:48:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7L1an1k015858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2012 18:36:49 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 20 Aug 2012 18:36:49 -0700
Message-ID: <5032E5E7.8010208@windriver.com>
Date: Tue, 21 Aug 2012 09:35:35 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
	<1343959047-24613-2-git-send-email-sen.zhang@windriver.com>
	<5032A946.1000301@linux.intel.com>
In-Reply-To: <5032A946.1000301@linux.intel.com>
X-Originating-IP: [128.224.162.230]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxpm-native: add dependency on gettext-native
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
X-List-Received-Date: Tue, 21 Aug 2012 01:48:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

On 08/21/2012 05:16 AM, Saul Wold wrote:
> On 08/02/2012 06:57 PM, Jesse Zhang wrote:
>> libxpm needs xgettext to build po files. Add explicit dependency on
>> gettext-native.
>>
>> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
>> ---
>>   meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
>> index 9eaa212..6830216 100644
>> --- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
>> @@ -10,7 +10,8 @@ protocol."
>>   LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
>>   DEPENDS += "libxext libsm libxt"
>> -PR = "r0"
>> +DEPENDS_virtclass-native = "gettext-native"
> 
> Is there a reason you don't do an inherit gettext here to ensure other bits are set?

Actually I don't know what's the preferred way to do this. What is
required by libxpm is the xgettext command; using DEPENDS will be enough
to make it available, but I didn't know the other solution.

> Also for the native, you maybe able to use the gettext-minimal-native if there is reason you can't use the inherit.

gettext-minimal-native is already pulled in through the implicit
dependency chain. But clearly it doesn't provide xgettext?

jesse

> 
>> +PR = "r1"
>>   PE = "1"
>>
>>   XORG_PN = "libXpm"
>>
> 
> 


