Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RYl8O-0007tQ-GP
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 22:04:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8KvDM9007164
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 12:57:13 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 8 Dec 2011 12:57:12 -0800
Message-ID: <4EE124A8.7060200@windriver.com>
Date: Thu, 8 Dec 2011 14:57:12 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1323360188.git.mark.hatle@windriver.com>
	<ed534a9d15bc3a952b9a4ca736e0c25c13b670af.1323360188.git.mark.hatle@windriver.com>
	<CAMKF1soxFdTkTQNVXLC=AVakA9MAiY31Npp4Rrjn-aDPKYG7og@mail.gmail.com>
In-Reply-To: <CAMKF1soxFdTkTQNVXLC=AVakA9MAiY31Npp4Rrjn-aDPKYG7og@mail.gmail.com>
Subject: Re: [PATCH 1/1] Rename leftover POKY references to OE in image variables
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
X-List-Received-Date: Thu, 08 Dec 2011 21:04:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/11 2:27 PM, Khem Raj wrote:
> On Thu, Dec 8, 2011 at 8:03 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> The names POKY_BASE_INSTALL and POKY_EXTRA_INSTALL have been renamed
>> to OE_BASE_INSTALL and OE_EXTRA_INSTALL.
>>
>
> How about calling it IMAGE_* instead ?

I don't have any objections to that.  (All I did was rename POKY to OE, as I 
believe that was originally intended...)

Richard, anyone else, have any comments before I make that change?

--Mark

>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>> ---
>>   meta/classes/core-image.bbclass                    |    8 ++++----
>>   meta/recipes-core/images/core-image-minimal.bb     |    2 +-
>>   meta/recipes-core/images/self-hosted-image.bb      |    2 +-
>>   meta/recipes-extended/images/core-image-basic.bb   |    2 +-
>>   meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
>>   meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
>>   meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
>>   meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
>>   meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
>>   9 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
>> index 8e83d4a..fd8d5d2 100644
>> --- a/meta/classes/core-image.bbclass
>> +++ b/meta/classes/core-image.bbclass
>> @@ -45,18 +45,18 @@ PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
>>   PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
>>   PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
>>
>> -POKY_BASE_INSTALL = '\
>> +OE_BASE_INSTALL = '\
>>      task-core-boot \
>>      task-base-extended \
>>      \
>>      ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
>>      \
>> -    ${POKY_EXTRA_INSTALL} \
>> +    ${OE_EXTRA_INSTALL} \
>>      '
>>
>> -POKY_EXTRA_INSTALL ?= ""
>> +OE_EXTRA_INSTALL ?= ""
>>
>> -IMAGE_INSTALL ?= "${POKY_BASE_INSTALL}"
>> +IMAGE_INSTALL ?= "${OE_BASE_INSTALL}"
>>
>>   X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
>>   ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
>> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
>> index 56fc20c..4837cd4 100644
>> --- a/meta/recipes-core/images/core-image-minimal.bb
>> +++ b/meta/recipes-core/images/core-image-minimal.bb
>> @@ -1,7 +1,7 @@
>>   #
>>   # Copyright (C) 2007 OpenedHand Ltd.
>>   #
>> -IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${POKY_EXTRA_INSTALL}"
>> +IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${OE_EXTRA_INSTALL}"
>>
>>   IMAGE_LINGUAS = " "
>>
>> diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
>> index 53bd989..255928f 100644
>> --- a/meta/recipes-core/images/self-hosted-image.bb
>> +++ b/meta/recipes-core/images/self-hosted-image.bb
>> @@ -1,6 +1,6 @@
>>   IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
>>
>> -POKY_EXTRA_INSTALL = "\
>> +OE_EXTRA_INSTALL = "\
>>      task-self-hosted \
>>      "
>>
>> diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
>> index ba71cd0..5543fe9 100644
>> --- a/meta/recipes-extended/images/core-image-basic.bb
>> +++ b/meta/recipes-extended/images/core-image-basic.bb
>> @@ -5,6 +5,6 @@ IMAGE_INSTALL = "\
>>      task-core-basic \
>>      "
>>
>> -#    ${POKY_BASE_INSTALL}
>> +#    ${OE_BASE_INSTALL}
>>
>>   inherit core-image
>> diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
>> index 9ef85ff..98ec5ae 100644
>> --- a/meta/recipes-extended/images/core-image-lsb-dev.bb
>> +++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
>> @@ -1,7 +1,7 @@
>>   IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
>>
>>   IMAGE_INSTALL = "\
>> -    ${POKY_BASE_INSTALL} \
>> +    ${OE_BASE_INSTALL} \
>>      task-core-basic \
>>      task-core-lsb \
>>      "
>> diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
>> index 5e0e7ae..94ab995 100644
>> --- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
>> +++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
>> @@ -3,7 +3,7 @@ EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
>>
>>
>>   IMAGE_INSTALL = "\
>> -    ${POKY_BASE_INSTALL} \
>> +    ${OE_BASE_INSTALL} \
>>      task-core-basic \
>>      task-core-lsb \
>>      "
>> diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
>> index 22eb7f4..7369c89 100644
>> --- a/meta/recipes-extended/images/core-image-lsb.bb
>> +++ b/meta/recipes-extended/images/core-image-lsb.bb
>> @@ -1,7 +1,7 @@
>>   IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
>>
>>   IMAGE_INSTALL = "\
>> -    ${POKY_BASE_INSTALL} \
>> +    ${OE_BASE_INSTALL} \
>>      task-core-basic \
>>      task-core-lsb \
>>      "
>> diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
>> index 7d50405..a4adc54 100644
>> --- a/meta/recipes-graphics/images/core-image-clutter.bb
>> +++ b/meta/recipes-graphics/images/core-image-clutter.bb
>> @@ -3,7 +3,7 @@ IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
>>   LICENSE = "MIT"
>>
>>   IMAGE_INSTALL = "\
>> -    ${POKY_BASE_INSTALL} \
>> +    ${OE_BASE_INSTALL} \
>>      task-core-clutter-core \
>>      task-core-clutter-tests \
>>      task-core-clutter-apps"
>> diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
>> index 6523379..5d0a992 100644
>> --- a/meta/recipes-qt/images/qt4e-demo-image.bb
>> +++ b/meta/recipes-qt/images/qt4e-demo-image.bb
>> @@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
>>         "
>>
>>   IMAGE_INSTALL += "\
>> -       ${POKY_BASE_INSTALL} \
>> +       ${OE_BASE_INSTALL} \
>>         module-init-tools \
>>         task-qt4e-base \
>>   "
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



