Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXCJN-0004lG-UN
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 16:13:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2012 07:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170377679"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2012 07:03:01 -0700
Message-ID: <4FBCEE15.5050008@linux.intel.com>
Date: Wed, 23 May 2012 07:03:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
	<4FBC8DC0.706@dresearch-fe.de>
In-Reply-To: <4FBC8DC0.706@dresearch-fe.de>
Subject: Re: [PATCH] dropbear: fix include dependent PR generation
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
X-List-Received-Date: Wed, 23 May 2012 14:13:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 12:12 AM, Steffen Sledz wrote:
> On 22.05.2012 16:16, Steffen Sledz wrote:
>> Signed-off-by: Steffen Sledz<sledz@dresearch-fe.de>
>> ---
>>   meta/recipes-core/dropbear/dropbear.inc        |    2 ++
>>   meta/recipes-core/dropbear/dropbear_2012.55.bb |    2 +-
>>   2 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
>> index 2d6aeb2..2de442c 100644
>> --- a/meta/recipes-core/dropbear/dropbear.inc
>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>> @@ -2,6 +2,8 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
>>   HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
>>   SECTION = "console/network"
>>
>> +INC_PR = "r0"
>> +
>>   # some files are from other projects and have others license terms:
>>   #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
>>   LICENSE = "MIT"
>> diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
>> index 4f0ef80..8323a33 100644
>> --- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
>> +++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
>> @@ -3,4 +3,4 @@ require dropbear.inc
>>   SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
>>   SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
>>
>> -PR = "r0"
>> +PR = "${INC_PR}.0"
>
> Did this message made it to the ML?
>
I guess not, please resend as a proper patch.

Thanks

Sau!
> I could not find it in Patchwork OpenEmbedded Core?. :(
>
> Steffen
>


