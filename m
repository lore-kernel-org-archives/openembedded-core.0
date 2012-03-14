Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7c8t-0006ZA-SP
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:32:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77184449"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:23:54 -0700
Message-ID: <4F5FE519.8070206@linux.intel.com>
Date: Tue, 13 Mar 2012 17:23:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
	<1b3db3597c2b644e61394014886082eb212eef1a.1328226197.git.sgw@linux.intel.com>
	<4F5F6F13.9000805@windriver.com>
In-Reply-To: <4F5F6F13.9000805@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] xinit: Update to 1.3.2 -- Typo fix.
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
X-List-Received-Date: Wed, 14 Mar 2012 00:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 09:00 AM, Randy MacLeod wrote:
> On 12-02-02 06:47 PM, Saul Wold wrote:
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> .../xorg-app/{xinit_1.3.1.bb => xinit_1.3.2.bb} | 6 +++---
>> 1 files changed, 3 insertions(+), 3 deletions(-)
>> rename meta/recipes-graphics/xorg-app/{xinit_1.3.1.bb =>
>> xinit_1.3.2.bb} (79%)
>>
>> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>> b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
>> similarity index 79%
>> rename from meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>> rename to meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
>> index 2ddebe6..e029a03 100644
>> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
>> @@ -10,11 +10,11 @@ then terminate."
>>
>> LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
>>
>> -PR = "r2"
>> +PR = "r0"
>> PE = "1"
>>
>> -SRC_URI[md5sum] = "ee234056d8a3dbf37b61b4bcb35b88e4"
>> -SRC_URI[sha256sum] =
>> "c7468dfae94bdb42785d79623c27156dc4bf379d8372992830482cb04d8439b0"
>> +RC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
>> +SRC_URI[sha256sum] =
>> "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e690e0235"
>>
>> EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>>
> Fix this warning:
> WARNING: Missing md5 SRC_URI checksum for
> /.../downloads/xinit-1.3.2.tar.bz2, consider adding to the recipe:
> SRC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
>
>
> $ git diff meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> index e029a03..cb3e028 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
> PR = "r0"
> PE = "1"
>
> -RC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
> +SRC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
> SRC_URI[sha256sum] =
> "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e690e0235"
>
> EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

Merged into OE-Core

Thanks for catching this one, even wall all the build we do, it got 
messed up!

Sau!


