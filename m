Received: from dd20036.kasserver.com ([85.13.140.69])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1SHbFb-0004nj-Rx
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 15:36:51 +0200
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd20036.kasserver.com (Postfix) with ESMTPSA id D19A3E0069
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 15:18:31 +0200 (CEST)
Message-ID: <4F843326.2@herbrechtsmeier.net>
Date: Tue, 10 Apr 2012 15:18:30 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1333622218-5230-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E6066.2080907@linux.intel.com>
	<9F60AC4C-D174-4A8C-930A-6397842763AF@dominion.thruhere.net>
In-Reply-To: <9F60AC4C-D174-4A8C-930A-6397842763AF@dominion.thruhere.net>
Subject: Re: [PATCH] linux-firmware: keep version string in libertas firmware
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
X-List-Received-Date: Tue, 10 Apr 2012 13:36:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 06.04.2012 15:31, schrieb Koen Kooi:
> Op 5 apr. 2012 om 20:17 heeft Saul Wold<sgw@linux.intel.com>  het volgende geschreven:
>> On 04/05/2012 03:36 AM, Stefan Herbrechtsmeier wrote:
>>> Recent Linux kernel tries to load the libertas firmware with the version
>>> string in its name first. This results in a delayed firmware load on
>>> system boot. Keep the default libertas firmware name and add a link for
>>> older driver versions.
>>>
>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>>> ---
>>>   .../linux-firmware/linux-firmware_git.bb           |   10 +++++++---
>>>   1 files changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> index 52929fa..3675978 100644
>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> @@ -38,8 +38,8 @@ do_install() {
>>>       cp -r * ${D}/lib/firmware/
>>>
>>>       # Libertas sd8686
>>> -    install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
>>> -    install -m 0644 libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
>>> +    ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
>>> +    ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
>>>
>>>       # Realtek rtl8192*
>>>       install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
>>> @@ -51,7 +51,11 @@ do_install() {
>>>   PACKAGES =+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
>>>
>>>   LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
>>> -FILES_${PN}-sd8686 = "/lib/firmware/sd8686* /lib/firmware/LICENCE.libertas"
>>> +FILES_${PN}-sd8686 = " \
>>> +  /lib/firmware/libertas/sd8686_v9* \
>>> +  /lib/firmware/sd8686* \
>>> +  /lib/firmware/LICENCE.libertas \
>>> +"
>>>
>>>   LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
>>>   FILES_${PN}-rtl8192cu = " \
>> Merged into OE-Core
> why? It's missing a PR bump. We're close to a release, can we please stop pushing broken commits, especially when a large part of the developers are travelling?
Should I send an additional patch for the PR bump?



