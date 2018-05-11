Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5377524B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 05:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4B5a3fX016918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 May 2018 22:36:03 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 10 May 2018 22:36:01 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1526004301.git.Qi.Chen@windriver.com>
	<8a41a4e796d7a733d1cc17190e693bf865dcf6a7.1526004301.git.Qi.Chen@windriver.com>
	<CAJ86T=X1XhZyu5troKiVRN+xitCTq2jN8N+HFS9=hPOLn8VDaQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <3d3e7368-d415-7be4-ba59-12d29cc098fa@windriver.com>
Date: Fri, 11 May 2018 13:37:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=X1XhZyu5troKiVRN+xitCTq2jN8N+HFS9=hPOLn8VDaQ@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] sudo: upgrade to 1.8.23
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
X-List-Received-Date: Fri, 11 May 2018 05:36:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2018 01:22 PM, Andre McCurdy wrote:
> On Thu, May 10, 2018 at 7:20 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Upgrade sudo to 1.8.23.
>>
>> The license checksum changes but the actual license does not.
>>
>> The /var/run/sudo directory has changed to /run/sudo, change
>> do_install_append according to avoid error.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-extended/sudo/sudo.inc                           | 5 +++--
>>   meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} | 6 +++---
>>   2 files changed, 6 insertions(+), 5 deletions(-)
>>   rename meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} (86%)
>>
>> diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
>> index 362bd3a..6e57669 100644
>> --- a/meta/recipes-extended/sudo/sudo.inc
>> +++ b/meta/recipes-extended/sudo/sudo.inc
>> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
>>   BUGTRACKER = "http://www.sudo.ws/bugs/"
>>   SECTION = "admin"
>>   LICENSE = "ISC & BSD & Zlib"
>> -LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
>> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
>>                       file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
>>                       file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
>>                       file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
>> @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
>>                       file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
>>                       file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
>>                       file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
>> -                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
>> +                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
>> +                    "
>>
>>   inherit autotools
>>
>> diff --git a/meta/recipes-extended/sudo/sudo_1.8.22.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
>> similarity index 86%
>> rename from meta/recipes-extended/sudo/sudo_1.8.22.bb
>> rename to meta/recipes-extended/sudo/sudo_1.8.23.bb
>> index 9150178..75bc094 100644
>> --- a/meta/recipes-extended/sudo/sudo_1.8.22.bb
>> +++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
>> @@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
>>
>>   PAM_SRC_URI = "file://sudo.pam"
>>
>> -SRC_URI[md5sum] = "24abdea48db4c5abcd410167c801cc8c"
>> -SRC_URI[sha256sum] = "7256cb27c20883b14360eddbd17f98922073d104b214cf65aeacf1d9c9b9fd02"
>> +SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
>> +SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
>>
>>   DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>   RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
>> @@ -28,7 +28,7 @@ do_install_append () {
>>          chmod 0440 ${D}${sysconfdir}/sudoers
>>
>>          # Explicitly remove the ${localstatedir}/run directory to avoid QA error
> Comment needs updating to match the code change below.
>

Thanks for spotting this.
I've fixed it and updated the remote branch.

   git://git.pokylinux.org/poky-contrib ChenQi/PU-20180511
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU20180511



Best Regards,
Chen Qi

>> -       rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
>> +       rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
>>   }
>>
>>   FILES_${PN} += "${libdir}/tmpfiles.d"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



