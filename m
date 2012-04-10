Received: from dd20036.kasserver.com ([85.13.140.69])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1SHc3T-000557-Mu
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 16:28:23 +0200
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd20036.kasserver.com (Postfix) with ESMTPSA id 1DB42E006A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 16:19:08 +0200 (CEST)
Message-ID: <4F84415A.20104@herbrechtsmeier.net>
Date: Tue, 10 Apr 2012 16:19:06 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
	<1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
	<1334065279.10826.14.camel@ted>
	<519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
In-Reply-To: <519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Tue, 10 Apr 2012 14:28:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.04.2012 15:56, schrieb Koen Kooi:
> Op 10 apr. 2012, om 15:41 heeft Richard Purdie het volgende geschreven:
>
>> On Fri, 2012-04-06 at 06:29 -0700, Koen Kooi wrote:
>>> Op 5 apr. 2012 om 20:18 heeft Saul Wold<sgw@linux.intel.com>  het volgende geschreven:
>>>
>>>> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
>>>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>>>>> ---
>>>>> meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
>>>>> meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
>>>>> meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
>>>>> 3 files changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
>>>>> index 700d5d3..0445c34 100644
>>>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>>>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?= "all"
>>>>> # deploy directory.  For those versions they can set the following variables
>>>>> # to allow packaging the SPL.
>>>>> SPL_BINARY ?= ""
>>>>> -SPL_IMAGE ?= "${SPL_BINARY}-${PV}-${PR}"
>>>>> +SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>>>>> SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
>>>>>
>>>>> do_compile () {
>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>> index 1ebdbea..e99bc2c 100644
>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>> @@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>>> SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
>>>>>
>>>>> PV = "v2011.03+git${SRCPV}"
>>>>> -PR = "r5"
>>>>> +PR = "r6"
>>>>>
>>>>> SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>>>>
>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>> index 8ebdbff..680401f 100644
>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>> @@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>>> SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
>>>>>
>>>>> PV = "v2011.06+git${SRCPV}"
>>>>> -PR = "r0"
>>>>> +PR = "r1"
>>>>>
>>>>> SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>>>>
>>>> Merged into OE-Core
>>> wait a minute, why was this merged?
>> In retrospect it shouldn't.
> Can we back it out? It breaks a ton of buildscripts. SPL_SYMLINK already has the machine.
But this means that your SPL_SYMLINK can point to a wrong SPL_IMAGE if 
you don't use machine in the tmpdir path and build more than one machine.



