Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFD060043
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 02:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t39206l7001607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Apr 2015 19:00:06 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 8 Apr 2015 19:00:05 -0700
Message-ID: <5525DD30.7060506@windriver.com>
Date: Thu, 9 Apr 2015 10:00:16 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Andreas Oberritter
	<obi@opendreambox.org>
References: <cover.1427274653.git.Qi.Chen@windriver.com>	<9a54a9260aede9cf1842db3cd1244a1d4c247310.1427274653.git.Qi.Chen@windriver.com>	<5523A770.6030201@opendreambox.org>
	<12211684.ST3S4rfOnv@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <12211684.ST3S4rfOnv@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [128.224.162.236]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] util-linux: split util-linux-sulogin
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
X-List-Received-Date: Thu, 09 Apr 2015 02:00:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2015 09:54 PM, Paul Eggleton wrote:
> On Tuesday 07 April 2015 11:46:24 Andreas Oberritter wrote:
>> Hello Chen Qi,
>>
>> On 25.03.2015 10:11, Chen Qi wrote:
>>> [YOCTO #6698]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>
>>>   meta/recipes-core/util-linux/util-linux.inc | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>>> b/meta/recipes-core/util-linux/util-linux.inc index 10b14b3..d93505c
>>> 100644
>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>> @@ -32,7 +32,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk
>>> util-linux-cfdisk util-linux-sfd>
>>>                util-linux-mkfs util-linux-mcookie util-linux-reset \
>>>                util-linux-mkfs.cramfs util-linux-fsck.cramfs
>>>                util-linux-fstrim \
>>>                util-linux-partx ${PN}-bash-completion util-linux-hwclock \
>>>
>>> -             util-linux-findfs util-linux-getopt"
>>> +             util-linux-findfs util-linux-getopt util-linux-sulogin"
>>>
>>>   PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
>>>   'util-linux-pylibmount', '', d)}"
>>>   
>>>   PACKAGES_DYNAMIC = "^util-linux-lib.*"
>>>
>>> @@ -96,6 +96,8 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
>>>
>>>   FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
>>>   FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
>>>
>>> +FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
>>> +
>>>
>>>   # Util-linux' blkid replaces the e2fsprogs one
>>>   FILES_util-linux-blkid = "${base_sbindir}/blkid*"
>>>   RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
>>>
>>> @@ -173,7 +175,7 @@ ALTERNATIVE_PRIORITY = "100"
>>>
>>>   ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
>>>   switch_root" ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg
>>>   renice wall">
>>> -ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject sulogin"
>>> +ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
>>>
>>>   ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>>>   ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
>>>
>>> @@ -184,7 +186,6 @@ ALTERNATIVE_LINK_NAME[pivot_root] =
>>> "${base_sbindir}/pivot_root">
>>>   ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
>>>   ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>>>   ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>>>
>>> -ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
>>>
>>>   ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8
>>>   utmpdump.1 reset.1">
>>> @@ -239,6 +240,9 @@ ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
>>>
>>>   ALTERNATIVE_util-linux-getopt = "getopt"
>>>   ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
>>>
>>> +ALTERNATIVE_util-linux-sulogin = "sulogin"
>>> +ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
>>> +
>>>
>>>   BBCLASSEXTEND = "native nativesdk"
>>>   
>>>   python do_package_prepend () {
>> I think you should add RDEPENDS_${PN} = "util-linux-sulogin". I didn't
>> check whether that was done for other split-out packages, but otherwise
>> people installing util-linux might miss sulogin in the future.
> Unless util-linux becomes just a meta-package that pulls in all of the split
> packages and itself contains nothing, that would seem to me to defeat the
> purpose of splitting out the package in the first place - you could never have
> util-linux installed without util-linux-sulogin.
>
> Cheers,
> Paul
>

Andreas and Paul,

Thank you for you comments. I'll send out V2.

Best Regards,
Chen Qi

