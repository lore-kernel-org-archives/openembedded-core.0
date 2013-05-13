Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UbxUt-0003vP-3Z
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 May 2013 20:29:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2013 11:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,663,1363158000"; d="scan'208";a="240895645"
Received: from unknown (HELO [10.255.12.109]) ([10.255.12.109])
	by AZSMGA002.ch.intel.com with ESMTP; 13 May 2013 11:10:49 -0700
Message-ID: <51912CA6.2030209@linux.intel.com>
Date: Mon, 13 May 2013 21:10:46 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Radu, IonutX" <ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
	<1368024119-4149-7-git-send-email-ionutx.radu@intel.com>,
	<5190A265.2040009@linux.intel.com>
	<958794DC787AD345A1A41BCD3015B65030FF25@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <958794DC787AD345A1A41BCD3015B65030FF25@IRSMSX102.ger.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: Re: [PATCH 6/9] qemu: Updated from 1.4.0 to 1.4.1
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
X-List-Received-Date: Mon, 13 May 2013 18:29:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2013 05:23 PM, Radu, IonutX wrote:
>
> ________________________________________
> From: Saul Wold [sgw@linux.intel.com]
> Sent: Monday, May 13, 2013 11:20 AM
> To: Radu, IonutX
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 6/9] qemu: Updated from 1.4.0 to 1.4.1
>
> On 05/08/2013 05:41 PM, Ionut Radu wrote:
>> 0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch and 3f08ffb4a4741d147634761dc053ed386243a0de.patch were backported in 1.4.1
>>
>
> What kind of testing did you do with qemu?  Qemu even minor updates can
> lead to issues since it such a core part of OE-Core development and test.
>
> Thanks
>          Sau!
>
> I have built core-image-sato and core-image-minimal on all architectures (x86, x86-64, arm, ppc, mips),
> run qemu-$ARCH -version where ARCH is i386/x86_64/arm/ppc/mips and checked if the correct version is
> displayed.
>
Did you boot test and verify graphics look correct for all 
core-image-sato images of the 5 ARCHS?

Thanks
	Sau!

>> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
>> ---
>>    meta/recipes-devtools/qemu/qemu.inc                         |    1 -
>>    meta/recipes-devtools/qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb} |    8 +++-----
>>    2 files changed, 3 insertions(+), 6 deletions(-)
>>    rename meta/recipes-devtools/qemu/{qemu_1.4.0.bb => qemu_1.4.1.bb} (49%)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index bd7890d..0a7dc4e 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -26,7 +26,6 @@ SRC_URI = "\
>>        file://larger_default_ram_size.patch \
>>        file://arm-bgr.patch \
>>        file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
>> -    file://0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch \
>>        file://0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch \
>>        "
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu_1.4.0.bb b/meta/recipes-devtools/qemu/qemu_1.4.1.bb
>> similarity index 49%
>> rename from meta/recipes-devtools/qemu/qemu_1.4.0.bb
>> rename to meta/recipes-devtools/qemu/qemu_1.4.1.bb
>> index d968782..f59d28a 100644
>> --- a/meta/recipes-devtools/qemu/qemu_1.4.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_1.4.1.bb
>> @@ -3,10 +3,8 @@ require qemu.inc
>>    LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>>                        file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>>
>> -SRC_URI += "file://3f08ffb4a4741d147634761dc053ed386243a0de.patch \
>> -            file://fdt_header.patch \
>> -           "
>> +SRC_URI += "file://fdt_header.patch"
>>
>>    SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
>> -SRC_URI[md5sum] = "78f13b774814b6b7ebcaf4f9b9204318"
>> -SRC_URI[sha256sum] = "066297ed77408fb7588889c271a85cf3c259ad55c939315988e6062d7708eda8"
>> +SRC_URI[md5sum] = "eb2d696956324722b5ecfa46e41f9a75"
>> +SRC_URI[sha256sum] = "75063a9326221607de3599e89fb5af80f2d8080ddc55ca253fff113843432df1"
>>
>
>


