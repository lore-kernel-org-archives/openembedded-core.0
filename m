Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.89])
 by mx.groups.io with SMTP id smtpd.web11.60.1592583908113664204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H0c5IZz+;
 spf=pass (domain: windriver.com, ip: 40.107.94.89, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPQrw2Aw4bihcS4v4W1zh+YZlc0KqdoO/7Dru89DZtii8NnNau8eXfC1i11e6GgIUmQK091pUCyHfl8aEOe2gfO/0rZG/Ki8EVFHRuV+RcJiiNinW1hfQ6apOedFvBBtmqSaWp+YGyrNgOwI22x+5zbUbJC9VR5GHyj06nF/FotsHl4yW5nX+71ffeC+FRQjGfHr+yIQxmEl0xPak5xXTZFDO/9pPvm29h9RjWhGPtU+dv0em38SFQLQmCOKJm1Amje0urzmdWYLM7wNRTWbGFMRnIniAIrkNnzVWgfMGYJb73D5MbpUNRbuXu8HLGQXO3eSVp6hcrI98g2g0pmVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndY0dDGFdXt+nJe7U165JuXC2phLU6bAitvTuDvvGRw=;
 b=ZZ+ds+hDpmYQ8zBSXbcbTdYawk3/6TUHRVRyIyJlrBwNEs4Hd0Gwa8I5QtaJqK+SXzBC2abx1cEQ++zV8XbnrT4B0OuQKP9NItdmePuukN8HWIbBNWV3YJautdKpabh6C3J7hR9w6mAu4MPy5wkUtgn7rXiFB4UnJCqkgsDCXvhRjDqVuYtBtk3g7iKPVA+drAziHchXZilqm0BSFolgR9ysLrsaxlB9MV1dVjGm9Cuz6ePQJ1qO1OXIIFL7hNyLoRK4mFWLTQQEOAeK0ZCbHncm2TM1Icj0RU6LDQS6wU2HvX3mnOHzuHswBfhYCiycfYw/icF0IPJ4asjrlJhiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndY0dDGFdXt+nJe7U165JuXC2phLU6bAitvTuDvvGRw=;
 b=H0c5IZz+aSokJFzb6DCRopBw6hDU053kjfL7GaZjONkVIxwI1jjwZqhzANxjDTcVZDnPoqeGYaqFax6rZdywgIOEsCiKKkDped4CZM6A0pBMtYFOQXxhOjHokg4YdNNVPDLzFnw37qS9XxLKLSm4/Dejx7YMvhiLrDXZYeyMVJ8=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN8PR11MB3843.namprd11.prod.outlook.com (2603:10b6:408:88::29)
 by BN6PR11MB1795.namprd11.prod.outlook.com (2603:10b6:404:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 16:25:04 +0000
Received: from BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::4d84:7c50:21dc:4a85]) by BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::4d84:7c50:21dc:4a85%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:25:04 +0000
Subject: Re: [OE-core] [PATCH] qemu: uprev v4.2.0 -> v5.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Joe Slater <joe.slater@windriver.com>
References: <20200619145656.11158-1-sakib.sajal@windriver.com>
 <CANNYZj_Y08o5WKeStd8ayk768nYUAVSi8gSqrpWe5ktPnNN0xQ@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <1e027ebb-0d8c-6b8a-d8a3-1c797d296b34@windriver.com>
Date: Fri, 19 Jun 2020 12:25:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CANNYZj_Y08o5WKeStd8ayk768nYUAVSi8gSqrpWe5ktPnNN0xQ@mail.gmail.com>
X-ClientProxiedBy: YQBPR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::11) To BN8PR11MB3843.namprd11.prod.outlook.com
 (2603:10b6:408:88::29)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (64.229.138.221) by YQBPR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:25:04 +0000
X-Originating-IP: [64.229.138.221]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf4446e-ab08-4bb7-412e-08d8146d52d6
X-MS-TrafficTypeDiagnostic: BN6PR11MB1795:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB17951FFF887B2A2EA2F3C385F2980@BN6PR11MB1795.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dgTvSrPI4YyabXSetvEaaU3lf1/3te12iI7ay3AzOAAYvct4/Qw1WNGElimUIdKD+QxE/R9Owv7fzchMtXCAfTwofFFCONIyH9J+DWT0vGTr6A47dxmwWI50AnjThuWZbYPKLjgsaQxWYczycuqu/Il4iD2RV7KW/sLKmPOAeHp+3UYCZ9e1e4Bsq9wVbNZD1+hdwbulM7aqz+sKuWkw+i4+SaTVwLCCuPwJAGGe+QkfUbI/Ogtqe/dfVz3rUnLv71mqpan2v3h24oEQU1N5+cqu8bnN8/imMqVAB9/iUKsPkUMKTFYC4IRh3m+3Z0WeoqNAqRKT5iXV6CkeR9lw8duzpkKznlafJ+3qnvMM0SCJ200gvOOa+5FUcacNYoaWXmK7iRqWNXaYCqBq2fOwrKl3xQvdz2y6aimcfHOo8iufhyYoGLv0QF7cWKjXaDLElhElabyxB8ZlXC2CsZph0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3843.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(366004)(346002)(39850400004)(136003)(396003)(107886003)(5660300002)(316002)(31686004)(86362001)(30864003)(54906003)(186003)(4326008)(16526019)(31696002)(16576012)(26005)(66946007)(6916009)(8676002)(2616005)(966005)(44832011)(6486002)(956004)(478600001)(36756003)(66476007)(66556008)(83380400001)(53546011)(52116002)(8936002)(2906002)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Fa90OIC2b4jTTXFG7OLEOa2iLkdiJhVpA7zY5bP1OL3JlK+2HpyRaSICXnDgVx1DRnsJz0UWCt1E/zU4SnMDeOQnszaPq1j7fEM7vP1tOAYGwNxVrs7SNr11ANKH43Ly+qsNmb/0FczSKleAnGwbmO9HjvngPibhjZa/PS+o5nC0Z+n67SOZazPK7+8gZR1m66wqjcLYEBW1FfQJ25nseMhlSd8Gq+doXyAYb/x27t4DEaJTZ95Dr+vogBN2Xy/lltklrNZkPBmK0A8AVk9jQ6MEtvXqWH9Z9p/fo/t1Dz81Gz7MPbBtmWJoqddB26LheMHk4Q4jAxK/NythYGCqmm4JcULKlIgYjAE7w4160fOx0E48FAxtMmBu1NPzBEnpZJZ/y0M1RvGBL68zfme8QVDVMJ+GQXGWnOvT8yYFAiVLoQ7U+ZfbxUnzQ3w1tN+0VYkPfF/sx1UIsERKEA2DgPXRt93KhuUMMjmRAkeOxoE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf4446e-ab08-4bb7-412e-08d8146d52d6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:25:04.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsO2NrFPU1c1zXznwO7yrFGECoHkKA+BgBUEYIXGsmZ35UKmIMO8C1CdpFY38U86SeOiIwNtqVhLiUPwS+tRPl4iuL+Mh92ovD+7B8WP9qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1795
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2020-06-19 11:59 a.m., Alexander Kanavin wrote:
> On Fri, 19 Jun 2020 at 16:59, Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>> Ran qemu-ptest on x86-64 and arm64 with identical results:
>> PASS: 1166
>> SKIP:    0
>> FAIL:    0
>>
> Please add qemu-ptest to conf/distro/include/ptest-packagelists.inc if it
> is now passing :)
>
>
>> --- a/meta/classes/qemuboot.bbclass
>> +++ b/meta/classes/qemuboot.bbclass
>> @@ -77,7 +77,7 @@ QB_MEM ?= "-m 256"
>>   QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
>>   QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
>>   QB_DEFAULT_FSTYPE ?= "ext4"
>> -QB_OPT_APPEND ?= "-show-cursor"
>> +QB_OPT_APPEND ?= "-display sdl,show-cursor=on"
>>
> This is not correct as it enforces the SDL frontend even in non-graphical
> environments, or when people want to use gtk instead. Please adjust
> scripts/runqemu instead to add the option everywhere where -display is used.
>
> The rest looks fine, thanks for working on this :)
>
> Alex
>
Thanks for the feedback, I'll send out a v2.

Sakib

>
>
>> --- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
>> +++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
>> @@ -1,21 +1,24 @@
>> -From a471cf4e4c73350e090eb2cd87ec959d138012e5 Mon Sep 17 00:00:00 2001
>> +From b921e5204030845dc7c9d16d5f66d965e8d05367 Mon Sep 17 00:00:00 2001
>>   From: Jeremy Puhlman <jpuhlman@mvista.com>
>>   Date: Thu, 19 Mar 2020 11:54:26 -0700
>>   Subject: [PATCH] Add enable/disable libudev
>>
>>   Upstream-Status: Pending
>>   Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> +
>> +[update patch context]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    configure | 4 ++++
>>    1 file changed, 4 insertions(+)
>>
>>   diff --git a/configure b/configure
>> -index cac271c..bd116eb 100755
>> +index 36646e7b..48912a94 100755
>>   --- a/configure
>>   +++ b/configure
>> -@@ -1539,6 +1539,10 @@ for opt do
>> +@@ -1601,6 +1601,10 @@ for opt do
>>      ;;
>> -   --disable-plugins) plugins="no"
>> +   --gdb=*) gdb_bin="$optarg"
>>      ;;
>>   +  --enable-libudev) libudev="yes"
>>   +  ;;
>> @@ -25,5 +28,5 @@ index cac271c..bd116eb 100755
>>          echo "ERROR: unknown option $opt"
>>          echo "Try '$0 --help' for more information"
>>   --
>> -1.8.3.1
>> +2.24.0
>>
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
>> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
>> index 66ff996508..ae89ae09dd 100644
>> ---
>> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
>> +++
>> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
>> @@ -1,4 +1,4 @@
>> -From 526cb7e26f6dd96c9ee2ffa05ce0a358d3bfbfb3 Mon Sep 17 00:00:00 2001
>> +From 883feb43129dc39b491e492c7ccfe89aefe53c44 Mon Sep 17 00:00:00 2001
>>   From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>   Date: Thu, 27 Nov 2014 14:04:29 +0000
>>   Subject: [PATCH] qemu: Add missing wacom HID descriptor
>> @@ -14,6 +14,8 @@ Signed-off-by: Richard Purdie <
>> richard.purdie@linuxfoundation.org>
>>   Upstream-Status: Submitted
>>   2014/11/27
>>
>> +[update patch context]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
>>    1 file changed, 93 insertions(+), 1 deletion(-)
>> @@ -137,3 +139,6 @@ index 8ed57b3b..1502928b 100644
>>        case WACOM_SET_REPORT:
>>            if (s->mouse_grabbed) {
>>                qemu_remove_mouse_event_handler(s->eh_entry);
>> +--
>> +2.24.0
>> +
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
>> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
>> index eccac0509c..6e38d814cd 100644
>> ---
>> a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
>> +++
>> b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
>> @@ -1,4 +1,4 @@
>> -From 98c2da129db19ee63d7e21b77a0ef70822c95069 Mon Sep 17 00:00:00 2001
>> +From 34247f83095f8cdcdc1f9d7f0c6ffbd46b25d979 Mon Sep 17 00:00:00 2001
>>   From: Oleksiy Obitotskyy <oobitots@cisco.com>
>>   Date: Wed, 25 Mar 2020 21:21:35 +0200
>>   Subject: [PATCH] qemu: Do not include file if not exists
>> @@ -8,24 +8,27 @@ if_alg.h still included.
>>
>>   Upstream-status: Submitted [
>> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07188.html]
>>   Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>> +
>> +[update patch context]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    linux-user/syscall.c | 2 ++
>>    1 file changed, 2 insertions(+)
>>
>>   diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> -index fc18f244..68d62666 100644
>> +index d6f8cc97..a61420e7 100644
>>   --- a/linux-user/syscall.c
>>   +++ b/linux-user/syscall.c
>> -@@ -106,7 +106,9 @@
>> +@@ -109,7 +109,9 @@
>>    #include <linux/blkpg.h>
>>    #include <netpacket/packet.h>
>>    #include <linux/netlink.h>
>>   +#if defined(CONFIG_AF_ALG)
>>    #include <linux/if_alg.h>
>>   +#endif
>> + #include <linux/rtc.h>
>> + #include <sound/asound.h>
>>    #include "linux_loop.h"
>> - #include "uname.h"
>> -
>>   --
>> -2.20.1
>> +2.24.0
>>
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
>> b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
>> index 7f7da51006..3d268870fc 100644
>> ---
>> a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
>> +++
>> b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
>> @@ -1,4 +1,4 @@
>> -From 8ee6281516bd9210e75e91d705da8916bab3bf51 Mon Sep 17 00:00:00 2001
>> +From 5da6cef7761157a003e7ebde74fb3cf90ab396d9 Mon Sep 17 00:00:00 2001
>>   From: Juro Bystricky <juro.bystricky@intel.com>
>>   Date: Thu, 31 Aug 2017 11:06:56 -0700
>>   Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
>> @@ -10,17 +10,19 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>
>>   Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>
>> +[update patch context]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    tests/Makefile.include | 8 ++++++++
>>    1 file changed, 8 insertions(+)
>>
>>   diff --git a/tests/Makefile.include b/tests/Makefile.include
>> -index 8566f5f1..52d0320b 100644
>> +index 51de6762..1ea4d322 100644
>>   --- a/tests/Makefile.include
>>   +++ b/tests/Makefile.include
>> -@@ -1210,4 +1210,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
>> - -include $(wildcard tests/*.d)
>> - -include $(wildcard tests/libqos/*.d)
>> +@@ -941,4 +941,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
>> + -include $(wildcard tests/qtest/*.d)
>> + -include $(wildcard tests/qtest/libqos/*.d)
>>
>>   +buildtest-TESTS: $(check-unit-y)
>>   +
>> @@ -31,3 +33,6 @@ index 8566f5f1..52d0320b 100644
>>   +      done
>>   +
>>    endif
>> +--
>> +2.24.0
>> +
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
>> b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
>> index ec303371b0..2c5b241e41 100644
>> ---
>> a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
>> +++
>> b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
>> @@ -1,22 +1,24 @@
>> -From 6cdf82af2eba312b9b8da86dda28b98d3d51f4d4 Mon Sep 17 00:00:00 2001
>> +From 230fe5804099bdca0c9e4cae7280c9fc513cb7f5 Mon Sep 17 00:00:00 2001
>>   From: Stephen Arnold <sarnold@vctlabs.com>
>>   Date: Sun, 12 Jun 2016 18:09:56 -0700
>>   Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some
>> environment
>>
>>   Upstream-Status: Pending
>>
>> +[update patch context]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    configure | 4 ----
>>    1 file changed, 4 deletions(-)
>>
>>   diff --git a/configure b/configure
>> -index a766017b..72f11aca 100755
>> +index 83c65439..6bdf488c 100755
>>   --- a/configure
>>   +++ b/configure
>> -@@ -6085,10 +6085,6 @@ write_c_skeleton
>> +@@ -6251,10 +6251,6 @@ write_c_skeleton
>>    if test "$gcov" = "yes" ; then
>> -   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
>> -   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
>> +   QEMU_CFLAGS="-fprofile-arcs -ftest-coverage -g $QEMU_CFLAGS"
>> +   QEMU_LDFLAGS="-fprofile-arcs -ftest-coverage $QEMU_LDFLAGS"
>>   -elif test "$fortify_source" = "yes" ; then
>>   -  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>>   -elif test "$debug" = "no"; then
>> @@ -24,3 +26,6 @@ index a766017b..72f11aca 100755
>>    fi
>>
>>    if test "$have_asan" = "yes"; then
>> +--
>> +2.24.0
>> +
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
>> b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
>> index 7e273eeced..eef3f3f97f 100644
>> --- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
>> +++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
>> @@ -1,4 +1,4 @@
>> -From 613166007e3b852c99caf2cd34a972e2c8460737 Mon Sep 17 00:00:00 2001
>> +From 815c97ba0de02da9dace3fcfcbdf9b20e029f0d7 Mon Sep 17 00:00:00 2001
>>   From: Martin Jansa <martin.jansa@lge.com>
>>   Date: Fri, 1 Jun 2018 08:41:07 +0000
>>   Subject: [PATCH] Fix webkitgtk builds
>> @@ -19,6 +19,8 @@ This reverts commit
>> ebf9a3630c911d0cfc9c20f7cafe9ba4f88cf583.
>>   Upstream-Status: Pending
>>   Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> +[update patch context]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    include/exec/cpu-all.h  |  6 +-----
>>    include/exec/cpu_ldst.h |  5 ++++-
>> @@ -27,7 +29,7 @@ Signed-off-by: Alistair Francis <
>> alistair.francis@wdc.com>
>>    4 files changed, 10 insertions(+), 23 deletions(-)
>>
>>   diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
>> -index e96781a4..a369f81a 100644
>> +index 49384bb6..93b12519 100644
>>   --- a/include/exec/cpu-all.h
>>   +++ b/include/exec/cpu-all.h
>>   @@ -162,12 +162,8 @@ extern unsigned long guest_base;
>> @@ -45,10 +47,10 @@ index e96781a4..a369f81a 100644
>>
>>    #include "exec/hwaddr.h"
>>   diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
>> -index fd499f7e..30575f60 100644
>> +index 53de1975..cf19ed2e 100644
>>   --- a/include/exec/cpu_ldst.h
>>   +++ b/include/exec/cpu_ldst.h
>> -@@ -65,7 +65,10 @@ typedef uint64_t abi_ptr;
>> +@@ -70,7 +70,10 @@ typedef uint64_t abi_ptr;
>>    #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
>>    #define guest_addr_valid(x) (1)
>>    #else
>> @@ -61,10 +63,10 @@ index fd499f7e..30575f60 100644
>>    #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
>>
>>   diff --git a/linux-user/mmap.c b/linux-user/mmap.c
>> -index 46a6e3a7..77354654 100644
>> +index e3780337..1d4aba95 100644
>>   --- a/linux-user/mmap.c
>>   +++ b/linux-user/mmap.c
>> -@@ -78,7 +78,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int
>> prot)
>> +@@ -71,7 +71,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int
>> prot)
>>            return -TARGET_EINVAL;
>>        len = TARGET_PAGE_ALIGN(len);
>>        end = start + len;
>> @@ -73,7 +75,7 @@ index 46a6e3a7..77354654 100644
>>            return -TARGET_ENOMEM;
>>        }
>>        prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
>> -@@ -495,8 +495,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
>> int prot,
>> +@@ -467,8 +467,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
>> int prot,
>>             * It can fail only on 64-bit host with 32-bit target.
>>             * On any other target/host host mmap() handles this error
>> correctly.
>>             */
>> @@ -84,7 +86,7 @@ index 46a6e3a7..77354654 100644
>>                goto fail;
>>            }
>>
>> -@@ -636,10 +636,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
>> +@@ -604,10 +604,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
>>        if (start & ~TARGET_PAGE_MASK)
>>            return -TARGET_EINVAL;
>>        len = TARGET_PAGE_ALIGN(len);
>> @@ -96,7 +98,7 @@ index 46a6e3a7..77354654 100644
>>        mmap_lock();
>>        end = start + len;
>>        real_start = start & qemu_host_page_mask;
>> -@@ -694,13 +692,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong
>> old_size,
>> +@@ -662,13 +660,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong
>> old_size,
>>        int prot;
>>        void *host_addr;
>>
>> @@ -111,10 +113,10 @@ index 46a6e3a7..77354654 100644
>>
>>        if (flags & MREMAP_FIXED) {
>>   diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> -index 171c0cae..fc18f244 100644
>> +index 05f03919..d6f8cc97 100644
>>   --- a/linux-user/syscall.c
>>   +++ b/linux-user/syscall.c
>> -@@ -4138,9 +4138,6 @@ static inline abi_ulong do_shmat(CPUArchState
>> *cpu_env,
>> +@@ -4287,9 +4287,6 @@ static inline abi_ulong do_shmat(CPUArchState
>> *cpu_env,
>>                return -TARGET_EINVAL;
>>            }
>>        }
>> @@ -124,12 +126,15 @@ index 171c0cae..fc18f244 100644
>>
>>        mmap_lock();
>>
>> -@@ -6990,7 +6987,7 @@ static int open_self_maps(void *cpu_env, int fd)
>> -         }
>> -         if (h2g_valid(min)) {
>> -             int flags = page_get_flags(h2g(min));
>> --            max = h2g_valid(max - 1) ? max :
>> (uintptr_t)g2h(GUEST_ADDR_MAX) + 1;
>> -+            max = h2g_valid(max - 1) ? max :
>> (uintptr_t)g2h(GUEST_ADDR_MAX);
>> +@@ -7247,7 +7244,7 @@ static int open_self_maps(void *cpu_env, int fd)
>> +             const char *path;
>> +
>> +             max = h2g_valid(max - 1) ?
>> +-                max : (uintptr_t) g2h(GUEST_ADDR_MAX) + 1;
>> ++                max : (uintptr_t) g2h(GUEST_ADDR_MAX);
>> +
>>                if (page_check_range(h2g(min), max - min, flags) == -1) {
>>                    continue;
>> -             }
>> +--
>> +2.24.0
>> +
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
>> b/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
>> deleted file mode 100644
>> index 2fe0850a33..0000000000
>> ---
>> a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -From a88c40f02ace88f09b2a85a64831b277b2ebc88c Mon Sep 17 00:00:00 2001
>> -From: Peter Wu <peter@lekensteyn.nl>
>> -Date: Sat, 21 Dec 2019 17:21:24 +0100
>> -Subject: [PATCH] hw/i386/pc: fix regression in parsing vga cmdline
>> parameter
>> -
>> -When the 'vga=' parameter is succeeded by another parameter, QEMU 4.2.0
>> -would refuse to start with a rather cryptic message:
>> -
>> -    $ qemu-system-x86_64 -kernel /boot/vmlinuz-linux -append 'vga=792
>> quiet'
>> -    qemu: can't parse 'vga' parameter: Invalid argument
>> -
>> -It was not clear whether this applied to the '-vga std' parameter or the
>> -'-append' one. Fix the parsing regression and clarify the error.
>> -
>> -Fixes: 133ef074bd ("hw/i386/pc: replace use of strtol with qemu_strtoui
>> in x86_load_linux()")
>> -Cc: Sergio Lopez <slp@redhat.com>
>> -Signed-off-by: Peter Wu <peter@lekensteyn.nl>
>> -Message-Id: <20191221162124.1159291-1-peter@lekensteyn.nl>
>> -Cc: qemu-stable@nongnu.org
>> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> -Upstream-Status: Backport [
>> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a88c40f02ace88f09b2a85a64831b277b2ebc88c
>> ]
>> ----
>> - hw/i386/x86.c | 8 ++++----
>> - 1 file changed, 4 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> -index d8bb5c2a96..9b9a4d5837 100644
>> ---- a/hw/i386/x86.c
>> -+++ b/hw/i386/x86.c
>> -@@ -612,6 +612,7 @@ void x86_load_linux(X86MachineState *x86ms,
>> -     vmode = strstr(kernel_cmdline, "vga=");
>> -     if (vmode) {
>> -         unsigned int video_mode;
>> -+        const char *end;
>> -         int ret;
>> -         /* skip "vga=" */
>> -         vmode += 4;
>> -@@ -622,10 +623,9 @@ void x86_load_linux(X86MachineState *x86ms,
>> -         } else if (!strncmp(vmode, "ask", 3)) {
>> -             video_mode = 0xfffd;
>> -         } else {
>> --            ret = qemu_strtoui(vmode, NULL, 0, &video_mode);
>> --            if (ret != 0) {
>> --                fprintf(stderr, "qemu: can't parse 'vga' parameter:
>> %s\n",
>> --                        strerror(-ret));
>> -+            ret = qemu_strtoui(vmode, &end, 0, &video_mode);
>> -+            if (ret != 0 || (*end && *end != ' ')) {
>> -+                fprintf(stderr, "qemu: invalid 'vga=' kernel
>> parameter.\n");
>> -                 exit(1);
>> -             }
>> -         }
>> ---
>> -2.25.0
>> -
>> diff --git
>> a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
>> b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
>> deleted file mode 100644
>> index 3a7d7bbd33..0000000000
>> ---
>> a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
>> +++ /dev/null
>> @@ -1,86 +0,0 @@
>> -From 9125afb733d8c96416bb83c5adad39bb8d0803a1 Mon Sep 17 00:00:00 2001
>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>> -Date: Tue, 12 Mar 2013 09:54:06 +0800
>> -Subject: [PATCH] fix libcap header issue on some distro
>> -
>> -1, When build qemu-native on SLED 11.2, there is an error:
>> -...
>> -| In file included from /usr/include/bits/sigcontext.h:28,
>> -|  from /usr/include/signal.h:339,
>> -|  from /buildarea2/tmp/work/i686-linux/qemu-native/1.4.0-r0/
>> -qemu-1.4.0/include/qemu-common.h:42,
>> -|  from fsdev/virtfs-proxy-helper.c:23:
>> -|  /usr/include/asm/sigcontext.h:28: error: expected specifier-
>> -qualifier-list before '__u64'
>> -|  /usr/include/asm/sigcontext.h:191: error: expected specifier-
>> -qualifier-list before '__u64'
>> -...
>> -
>> -2, The virtfs-proxy-helper.c includes <sys/capability.h> and
>> -qemu-common.h in sequence. The header include map is:
>> -(`-->' presents `include')
>> -...
>> -"virtfs-proxy-helper.c" --> <sys/capability.h>
>> -...
>> -"virtfs-proxy-helper.c" --> "qemu-common.h" --> <signal.h> -->
>> -<bits/sigcontext.h> --> <asm/sigcontext.h> --> <linux/types.h> -->
>> -<asm/types.h> --> <asm-generic/types.h> --> <asm-generic/int-ll64.h>
>> -...
>> -
>> -3, The bug is found on SLED 11.2 x86. In libcap header file
>> -/usr/include/sys/capability.h, it does evil stuff like this:
>> -...
>> -  25 /*
>> -  26  * Make sure we can be included from userland by preventing
>> -  27  * capability.h from including other kernel headers
>> -  28  */
>> -  29 #define _LINUX_TYPES_H
>> -  30 #define _LINUX_FS_H
>> -  31 #define __LINUX_COMPILER_H
>> -  32 #define __user
>> -  33
>> -  34 typedef unsigned int __u32;
>> -  35 typedef __u32 __le32;
>> -...
>> -This completely prevents including /usr/include/linux/types.h.
>> -The above `<asm/sigcontext.h> --> <linux/types.h>' is prevented,
>> -and '__u64' is defined in <asm-generic/int-ll64.h>.
>> -
>> -4, Modify virtfs-proxy-helper.c to include <sys/capability.h>
>> -last to workaround the issue.
>> -
>> -http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
>> -http://patchwork.linuxtv.org/patch/12748/
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> -
>> ----
>> - fsdev/virtfs-proxy-helper.c | 7 +++++--
>> - 1 file changed, 5 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>> -index 6f132c5f..8329950c 100644
>> ---- a/fsdev/virtfs-proxy-helper.c
>> -+++ b/fsdev/virtfs-proxy-helper.c
>> -@@ -13,7 +13,6 @@
>> - #include <sys/resource.h>
>> - #include <getopt.h>
>> - #include <syslog.h>
>> --#include <sys/capability.h>
>> - #include <sys/fsuid.h>
>> - #include <sys/vfs.h>
>> - #include <sys/ioctl.h>
>> -@@ -27,7 +26,11 @@
>> - #include "9p-iov-marshal.h"
>> - #include "hw/9pfs/9p-proxy.h"
>> - #include "fsdev/9p-iov-marshal.h"
>> --
>> -+/*
>> -+ * Include this one last due to some versions of it being buggy:
>> -+ * http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
>> -+ */
>> -+#include <sys/capability.h>
>> - #define PROGNAME "virtfs-proxy-helper"
>> -
>> - #ifndef XFS_SUPER_MAGIC
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
>> deleted file mode 100644
>> index 1d89431be6..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
>> +++ /dev/null
>> @@ -1,48 +0,0 @@
>> -From 4fc0d23e8f6d795c679623d2ed2cbe6a7a17b9c7 Mon Sep 17 00:00:00 2001
>> -From: Li Zhou <li.zhou@windriver.com>
>> -Date: Tue, 10 Sep 2019 20:02:15 -0700
>> -Subject: [PATCH] ip_reass: Fix use after free
>> -
>> -Using ip_deq after m_free might read pointers from an allocation reuse.
>> -
>> -This would be difficult to exploit, but that is still related with
>> -CVE-2019-14378 which generates fragmented IP packets that would trigger
>> this
>> -issue and at least produce a DoS.
>> -
>> -Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>> -
>> -Upstream-Status: Backport
>> -CVE: CVE-2019-15890
>> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ----
>> - slirp/src/ip_input.c | 6 ++++--
>> - 1 file changed, 4 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/slirp/src/ip_input.c b/slirp/src/ip_input.c
>> -index 8c75d914..c07d7d40 100644
>> ---- a/slirp/src/ip_input.c
>> -+++ b/slirp/src/ip_input.c
>> -@@ -292,6 +292,7 @@ static struct ip *ip_reass(Slirp *slirp, struct ip
>> *ip, struct ipq *fp)
>> -      */
>> -     while (q != (struct ipasfrag *)&fp->frag_link &&
>> -            ip->ip_off + ip->ip_len > q->ipf_off) {
>> -+        struct ipasfrag *prev;
>> -         i = (ip->ip_off + ip->ip_len) - q->ipf_off;
>> -         if (i < q->ipf_len) {
>> -             q->ipf_len -= i;
>> -@@ -299,9 +300,10 @@ static struct ip *ip_reass(Slirp *slirp, struct ip
>> *ip, struct ipq *fp)
>> -             m_adj(dtom(slirp, q), i);
>> -             break;
>> -         }
>> -+        prev = q;
>> -         q = q->ipf_next;
>> --        m_free(dtom(slirp, q->ipf_prev));
>> --        ip_deq(q->ipf_prev);
>> -+        ip_deq(prev);
>> -+        m_free(dtom(slirp, prev));
>> -     }
>> -
>> - insert:
>> ---
>> -2.23.0
>> -
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
>> deleted file mode 100644
>> index e8f3e1dbdb..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
>> +++ /dev/null
>> @@ -1,148 +0,0 @@
>> -From 8ffb7265af64ec81748335ec8f20e7ab542c3850 Mon Sep 17 00:00:00 2001
>> -From: Prasad J Pandit <pjp@fedoraproject.org>
>> -Date: Tue, 24 Mar 2020 22:57:22 +0530
>> -Subject: [PATCH] net: tulip: check frame size and r/w data length
>> -
>> -Tulip network driver while copying tx/rx buffers does not check
>> -frame size against r/w data length. This may lead to OOB buffer
>> -access. Add check to avoid it.
>> -
>> -Limit iterations over descriptors to avoid potential infinite
>> -loop issue in tulip_xmit_list_update.
>> -
>> -Reported-by: Li Qiang <pangpei.lq@antfin.com>
>> -Reported-by: Ziming Zhang <ezrakiez@gmail.com>
>> -Reported-by: Jason Wang <jasowang@redhat.com>
>> -Tested-by: Li Qiang <liq3ea@gmail.com>
>> -Reviewed-by: Li Qiang <liq3ea@gmail.com>
>> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> -Signed-off-by: Jason Wang <jasowang@redhat.com>
>> -
>> -Upstream-Status: Backport [
>> https://git.qemu.org/?p=qemu.git;a=commit;h=8ffb7265af64ec81748335ec8f20e7ab542c3850
>> ]
>> -CVE: CVE-2020-11102
>> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
>> ----
>> - hw/net/tulip.c | 36 +++++++++++++++++++++++++++---------
>> - 1 file changed, 27 insertions(+), 9 deletions(-)
>> -
>> -diff --git a/hw/net/tulip.c b/hw/net/tulip.c
>> -index cfac271..1295f51 100644
>> ---- a/hw/net/tulip.c
>> -+++ b/hw/net/tulip.c
>> -@@ -170,6 +170,10 @@ static void tulip_copy_rx_bytes(TULIPState *s,
>> struct tulip_descriptor *desc)
>> -         } else {
>> -             len = s->rx_frame_len;
>> -         }
>> -+
>> -+        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
>> -+            return;
>> -+        }
>> -         pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
>> -             (s->rx_frame_size - s->rx_frame_len), len);
>> -         s->rx_frame_len -= len;
>> -@@ -181,6 +185,10 @@ static void tulip_copy_rx_bytes(TULIPState *s,
>> struct tulip_descriptor *desc)
>> -         } else {
>> -             len = s->rx_frame_len;
>> -         }
>> -+
>> -+        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
>> -+            return;
>> -+        }
>> -         pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
>> -             (s->rx_frame_size - s->rx_frame_len), len);
>> -         s->rx_frame_len -= len;
>> -@@ -227,7 +235,8 @@ static ssize_t tulip_receive(TULIPState *s, const
>> uint8_t *buf, size_t size)
>> -
>> -     trace_tulip_receive(buf, size);
>> -
>> --    if (size < 14 || size > 2048 || s->rx_frame_len ||
>> tulip_rx_stopped(s)) {
>> -+    if (size < 14 || size > sizeof(s->rx_frame) - 4
>> -+        || s->rx_frame_len || tulip_rx_stopped(s)) {
>> -         return 0;
>> -     }
>> -
>> -@@ -275,7 +284,6 @@ static ssize_t tulip_receive_nc(NetClientState *nc,
>> -     return tulip_receive(qemu_get_nic_opaque(nc), buf, size);
>> - }
>> -
>> --
>> - static NetClientInfo net_tulip_info = {
>> -     .type = NET_CLIENT_DRIVER_NIC,
>> -     .size = sizeof(NICState),
>> -@@ -558,7 +566,7 @@ static void tulip_tx(TULIPState *s, struct
>> tulip_descriptor *desc)
>> -         if ((s->csr[6] >> CSR6_OM_SHIFT) & CSR6_OM_MASK) {
>> -             /* Internal or external Loopback */
>> -             tulip_receive(s, s->tx_frame, s->tx_frame_len);
>> --        } else {
>> -+        } else if (s->tx_frame_len <= sizeof(s->tx_frame)) {
>> -             qemu_send_packet(qemu_get_queue(s->nic),
>> -                 s->tx_frame, s->tx_frame_len);
>> -         }
>> -@@ -570,23 +578,31 @@ static void tulip_tx(TULIPState *s, struct
>> tulip_descriptor *desc)
>> -     }
>> - }
>> -
>> --static void tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor
>> *desc)
>> -+static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor
>> *desc)
>> - {
>> -     int len1 = (desc->control >> TDES1_BUF1_SIZE_SHIFT) &
>> TDES1_BUF1_SIZE_MASK;
>> -     int len2 = (desc->control >> TDES1_BUF2_SIZE_SHIFT) &
>> TDES1_BUF2_SIZE_MASK;
>> -
>> -+    if (s->tx_frame_len + len1 > sizeof(s->tx_frame)) {
>> -+        return -1;
>> -+    }
>> -     if (len1) {
>> -         pci_dma_read(&s->dev, desc->buf_addr1,
>> -             s->tx_frame + s->tx_frame_len, len1);
>> -         s->tx_frame_len += len1;
>> -     }
>> -
>> -+    if (s->tx_frame_len + len2 > sizeof(s->tx_frame)) {
>> -+        return -1;
>> -+    }
>> -     if (len2) {
>> -         pci_dma_read(&s->dev, desc->buf_addr2,
>> -             s->tx_frame + s->tx_frame_len, len2);
>> -         s->tx_frame_len += len2;
>> -     }
>> -     desc->status = (len1 + len2) ? 0 : 0x7fffffff;
>> -+
>> -+    return 0;
>> - }
>> -
>> - static void tulip_setup_filter_addr(TULIPState *s, uint8_t *buf, int n)
>> -@@ -651,13 +667,15 @@ static uint32_t tulip_ts(TULIPState *s)
>> -
>> - static void tulip_xmit_list_update(TULIPState *s)
>> - {
>> -+#define TULIP_DESC_MAX 128
>> -+    uint8_t i = 0;
>> -     struct tulip_descriptor desc;
>> -
>> -     if (tulip_ts(s) != CSR5_TS_SUSPENDED) {
>> -         return;
>> -     }
>> -
>> --    for (;;) {
>> -+    for (i = 0; i < TULIP_DESC_MAX; i++) {
>> -         tulip_desc_read(s, s->current_tx_desc, &desc);
>> -         tulip_dump_tx_descriptor(s, &desc);
>> -
>> -@@ -675,10 +693,10 @@ static void tulip_xmit_list_update(TULIPState *s)
>> -                 s->tx_frame_len = 0;
>> -             }
>> -
>> --            tulip_copy_tx_buffers(s, &desc);
>> --
>> --            if (desc.control & TDES1_LS) {
>> --                tulip_tx(s, &desc);
>> -+            if (!tulip_copy_tx_buffers(s, &desc)) {
>> -+                if (desc.control & TDES1_LS) {
>> -+                    tulip_tx(s, &desc);
>> -+                }
>> -             }
>> -         }
>> -         tulip_desc_write(s, s->current_tx_desc, &desc);
>> ---
>> -1.8.3.1
>> -
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
>> deleted file mode 100644
>> index ca7ffed934..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
>> +++ /dev/null
>> @@ -1,97 +0,0 @@
>> -From ac2071c3791b67fc7af78b8ceb320c01ca1b5df7 Mon Sep 17 00:00:00 2001
>> -From: BALATON Zoltan <balaton@eik.bme.hu>
>> -Date: Mon, 6 Apr 2020 22:34:26 +0200
>> -Subject: [PATCH] ati-vga: Fix checks in ati_2d_blt() to avoid crash
>> -
>> -In some corner cases (that never happen during normal operation but a
>> -malicious guest could program wrong values) pixman functions were
>> -called with parameters that result in a crash. Fix this and add more
>> -checks to disallow such cases.
>> -
>> -Reported-by: Ziming Zhang <ezrakiez@gmail.com>
>> -Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> -Message-id: 20200406204029.19559747D5D@zero.eik.bme.hu
>> -Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> -
>> -Upstream-Status: Backport [
>> https://git.qemu.org/?p=qemu.git;a=commit;h=ac2071c3791b67fc7af78b8ceb320c01ca1b5df7
>> ]
>> -CVE: CVE-2020-11869
>> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
>> ----
>> - hw/display/ati_2d.c | 37 ++++++++++++++++++++++++++-----------
>> - 1 file changed, 26 insertions(+), 11 deletions(-)
>> -
>> -diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
>> -index 42e8231..23a8ae0 100644
>> ---- a/hw/display/ati_2d.c
>> -+++ b/hw/display/ati_2d.c
>> -@@ -53,12 +53,20 @@ void ati_2d_blt(ATIVGAState *s)
>> -             s->vga.vbe_start_addr, surface_data(ds), surface_stride(ds),
>> -             surface_bits_per_pixel(ds),
>> -             (s->regs.dp_mix & GMC_ROP3_MASK) >> 16);
>> --    int dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
>> --                 s->regs.dst_x : s->regs.dst_x + 1 - s->regs.dst_width);
>> --    int dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
>> --                 s->regs.dst_y : s->regs.dst_y + 1 - s->regs.dst_height);
>> -+    unsigned dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
>> -+                      s->regs.dst_x : s->regs.dst_x + 1 -
>> s->regs.dst_width);
>> -+    unsigned dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
>> -+                      s->regs.dst_y : s->regs.dst_y + 1 -
>> s->regs.dst_height);
>> -     int bpp = ati_bpp_from_datatype(s);
>> -+    if (!bpp) {
>> -+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid bpp\n");
>> -+        return;
>> -+    }
>> -     int dst_stride = DEFAULT_CNTL ? s->regs.dst_pitch :
>> s->regs.default_pitch;
>> -+    if (!dst_stride) {
>> -+        qemu_log_mask(LOG_GUEST_ERROR, "Zero dest pitch\n");
>> -+        return;
>> -+    }
>> -     uint8_t *dst_bits = s->vga.vram_ptr + (DEFAULT_CNTL ?
>> -                         s->regs.dst_offset : s->regs.default_offset);
>> -
>> -@@ -82,12 +90,16 @@ void ati_2d_blt(ATIVGAState *s)
>> -     switch (s->regs.dp_mix & GMC_ROP3_MASK) {
>> -     case ROP3_SRCCOPY:
>> -     {
>> --        int src_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
>> --                     s->regs.src_x : s->regs.src_x + 1 -
>> s->regs.dst_width);
>> --        int src_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
>> --                     s->regs.src_y : s->regs.src_y + 1 -
>> s->regs.dst_height);
>> -+        unsigned src_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
>> -+                       s->regs.src_x : s->regs.src_x + 1 -
>> s->regs.dst_width);
>> -+        unsigned src_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
>> -+                       s->regs.src_y : s->regs.src_y + 1 -
>> s->regs.dst_height);
>> -         int src_stride = DEFAULT_CNTL ?
>> -                          s->regs.src_pitch : s->regs.default_pitch;
>> -+        if (!src_stride) {
>> -+            qemu_log_mask(LOG_GUEST_ERROR, "Zero source pitch\n");
>> -+            return;
>> -+        }
>> -         uint8_t *src_bits = s->vga.vram_ptr + (DEFAULT_CNTL ?
>> -                             s->regs.src_offset : s->regs.default_offset);
>> -
>> -@@ -137,8 +149,10 @@ void ati_2d_blt(ATIVGAState *s)
>> -                                     dst_y * surface_stride(ds),
>> -                                     s->regs.dst_height *
>> surface_stride(ds));
>> -         }
>> --        s->regs.dst_x += s->regs.dst_width;
>> --        s->regs.dst_y += s->regs.dst_height;
>> -+        s->regs.dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
>> -+                         dst_x + s->regs.dst_width : dst_x);
>> -+        s->regs.dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
>> -+                         dst_y + s->regs.dst_height : dst_y);
>> -         break;
>> -     }
>> -     case ROP3_PATCOPY:
>> -@@ -179,7 +193,8 @@ void ati_2d_blt(ATIVGAState *s)
>> -                                     dst_y * surface_stride(ds),
>> -                                     s->regs.dst_height *
>> surface_stride(ds));
>> -         }
>> --        s->regs.dst_y += s->regs.dst_height;
>> -+        s->regs.dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
>> -+                         dst_y + s->regs.dst_height : dst_y);
>> -         break;
>> -     }
>> -     default:
>> ---
>> -1.8.3.1
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
>> deleted file mode 100644
>> index aa7bc82329..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -From 693fd2acdf14dd86c0bf852610f1c2cca80a74dc Mon Sep 17 00:00:00 2001
>> -From: Felipe Franciosi <felipe@nutanix.com>
>> -Date: Thu, 23 Jan 2020 12:44:59 +0000
>> -Subject: [PATCH] iscsi: Cap block count from GET LBA STATUS
>> (CVE-2020-1711)
>> -
>> -When querying an iSCSI server for the provisioning status of blocks (via
>> -GET LBA STATUS), Qemu only validates that the response descriptor zero's
>> -LBA matches the one requested. Given the SCSI spec allows servers to
>> -respond with the status of blocks beyond the end of the LUN, Qemu may
>> -have its heap corrupted by clearing/setting too many bits at the end of
>> -its allocmap for the LUN.
>> -
>> -A malicious guest in control of the iSCSI server could carefully program
>> -Qemu's heap (by selectively setting the bitmap) and then smash it.
>> -
>> -This limits the number of bits that iscsi_co_block_status() will try to
>> -update in the allocmap so it can't overflow the bitmap.
>> -
>> -Upstream-Status: Backport [
>> https://git.qemu.org/?p=qemu.git;a=patch;h=693fd2acdf14dd86c0bf852610f1c2cca80a74dc
>> ]
>> -CVE: CVE-2020-1711
>> -
>> -Fixes: CVE-2020-1711
>> -Cc: qemu-stable@nongnu.org
>> -Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
>> -Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
>> -Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>> -Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
>> ----
>> - block/iscsi.c | 5 +++--
>> - 1 file changed, 3 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/block/iscsi.c b/block/iscsi.c
>> -index 2aea7e3..cbd5729 100644
>> ---- a/block/iscsi.c
>> -+++ b/block/iscsi.c
>> -@@ -701,7 +701,7 @@ static int coroutine_fn
>> iscsi_co_block_status(BlockDriverState *bs,
>> -     struct scsi_get_lba_status *lbas = NULL;
>> -     struct scsi_lba_status_descriptor *lbasd = NULL;
>> -     struct IscsiTask iTask;
>> --    uint64_t lba;
>> -+    uint64_t lba, max_bytes;
>> -     int ret;
>> -
>> -     iscsi_co_init_iscsitask(iscsilun, &iTask);
>> -@@ -721,6 +721,7 @@ static int coroutine_fn
>> iscsi_co_block_status(BlockDriverState *bs,
>> -     }
>> -
>> -     lba = offset / iscsilun->block_size;
>> -+    max_bytes = (iscsilun->num_blocks - lba) * iscsilun->block_size;
>> -
>> -     qemu_mutex_lock(&iscsilun->mutex);
>> - retry:
>> -@@ -764,7 +765,7 @@ retry:
>> -         goto out_unlock;
>> -     }
>> -
>> --    *pnum = (int64_t) lbasd->num_blocks * iscsilun->block_size;
>> -+    *pnum = MIN((int64_t) lbasd->num_blocks * iscsilun->block_size,
>> max_bytes);
>> -
>> -     if (lbasd->provisioning == SCSI_PROVISIONING_TYPE_DEALLOCATED ||
>> -         lbasd->provisioning == SCSI_PROVISIONING_TYPE_ANCHORED) {
>> ---
>> -1.8.3.1
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
>> deleted file mode 100644
>> index df6bca6db6..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From b2663d527a1992ba98c0266458b21ada3b9d0d2e Mon Sep 17 00:00:00 2001
>> -From: Changqing Li <changqing.li@windriver.com>
>> -Date: Thu, 27 Feb 2020 12:07:35 +0800
>> -Subject: [PATCH] tcp_emu: Fix oob access
>> -
>> -The main loop only checks for one available byte, while we sometimes
>> -need two bytes.
>> -
>> -CVE: CVE-2020-7039
>> -Upstream-Status: Backport
>> -[
>> https://gitlab.freedesktop.org/slirp/libslirp/commit/2655fffed7a9e765bcb4701dd876e9dab975f289
>> ]
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ----
>> - slirp/src/tcp_subr.c | 6 ++++++
>> - 1 file changed, 6 insertions(+)
>> -
>> -diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
>> -index d6dd133..4bea2d4 100644
>> ---- a/slirp/src/tcp_subr.c
>> -+++ b/slirp/src/tcp_subr.c
>> -@@ -886,6 +886,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -                 break;
>> -
>> -             case 5:
>> -+                if (bptr == m->m_data + m->m_len - 1)
>> -+                        return 1; /* We need two bytes */
>> -                 /*
>> -                  * The difference between versions 1.0 and
>> -                  * 2.0 is here. For future versions of
>> -@@ -901,6 +903,10 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -                 /* This is the field containing the port
>> -                  * number that RA-player is listening to.
>> -                  */
>> -+
>> -+                if (bptr == m->m_data + m->m_len - 1)
>> -+                        return 1; /* We need two bytes */
>> -+
>> -                 lport = (((uint8_t *)bptr)[0] << 8) + ((uint8_t
>> *)bptr)[1];
>> -                 if (lport < 6970)
>> -                     lport += 256; /* don't know why */
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
>> deleted file mode 100644
>> index 4a00fa2afd..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
>> +++ /dev/null
>> @@ -1,59 +0,0 @@
>> -From 8f67e76e4148e37f3d8d2bcbdee7417fdedb7669 Mon Sep 17 00:00:00 2001
>> -From: Changqing Li <changqing.li@windriver.com>
>> -Date: Thu, 27 Feb 2020 12:10:34 +0800
>> -Subject: [PATCH] slirp: use correct size while emulating commands
>> -
>> -While emulating services in tcp_emu(), it uses 'mbuf' size
>> -'m->m_size' to write commands via snprintf(3). Use M_FREEROOM(m)
>> -size to avoid possible OOB access.
>> -Signed-off-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
>> -Signed-off-by: Samuel Thibault's avatarSamuel Thibault
>> -<samuel.thibault@ens-lyon.org>
>> -Message-Id: <20200109094228.79764-3-ppandit@redhat.com>
>> -
>> -CVE: CVE-2020-7039
>> -Upstream-Status: Backport
>> -[
>> https://gitlab.freedesktop.org/slirp/libslirp/commit/82ebe9c370a0e2970fb5695aa19aa5214a6a1c80
>> ]
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ----
>> - slirp/src/tcp_subr.c | 9 ++++-----
>> - 1 file changed, 4 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
>> -index 4bea2d4..e8ed4ef 100644
>> ---- a/slirp/src/tcp_subr.c
>> -+++ b/slirp/src/tcp_subr.c
>> -@@ -696,7 +696,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -             n4 = (laddr & 0xff);
>> -
>> -             m->m_len = bptr - m->m_data; /* Adjust length */
>> --            m->m_len += snprintf(bptr, m->m_size - m->m_len,
>> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
>> -                                  "ORT %d,%d,%d,%d,%d,%d\r\n%s", n1, n2,
>> n3, n4,
>> -                                  n5, n6, x == 7 ? buff : "");
>> -             return 1;
>> -@@ -731,8 +731,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -             n4 = (laddr & 0xff);
>> -
>> -             m->m_len = bptr - m->m_data; /* Adjust length */
>> --            m->m_len +=
>> --                snprintf(bptr, m->m_size - m->m_len,
>> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
>> -                          "27 Entering Passive Mode
>> (%d,%d,%d,%d,%d,%d)\r\n%s",
>> -                          n1, n2, n3, n4, n5, n6, x == 7 ? buff : "");
>> -
>> -@@ -758,8 +757,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -         if (m->m_data[m->m_len - 1] == '\0' && lport != 0 &&
>> -             (so = tcp_listen(slirp, INADDR_ANY, 0, so->so_laddr.s_addr,
>> -                              htons(lport), SS_FACCEPTONCE)) != NULL)
>> --            m->m_len =
>> --                snprintf(m->m_data, m->m_size, "%d",
>> ntohs(so->so_fport)) + 1;
>> -+            m->m_len = snprintf(m->m_data, M_ROOM(m),
>> -+                                "%d", ntohs(so->so_fport)) + 1;
>> -         return 1;
>> -
>> -     case EMU_IRC:
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
>> deleted file mode 100644
>> index 70ce480d80..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -From 0b03959b72036afce151783720d9e54988cf76ef Mon Sep 17 00:00:00 2001
>> -From: Changqing Li <changqing.li@windriver.com>
>> -Date: Thu, 27 Feb 2020 12:15:04 +0800
>> -Subject: [PATCH] slirp: use correct size while emulating IRC commands
>> -
>> -While emulating IRC DCC commands, tcp_emu() uses 'mbuf' size
>> -'m->m_size' to write DCC commands via snprintf(3). This may
>> -lead to OOB write access, because 'bptr' points somewhere in
>> -the middle of 'mbuf' buffer, not at the start. Use M_FREEROOM(m)
>> -size to avoid OOB access.
>> -Reported-by: default avatarVishnu Dev TJ <vishnudevtj@gmail.com>
>> -Signed-off-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
>> -Reviewed-by: Samuel Thibault's avatarSamuel Thibault
>> -<samuel.thibault@ens-lyon.org>
>> -Message-Id: <20200109094228.79764-2-ppandit@redhat.com>
>> -
>> -CVE: CVE-2020-7039
>> -Upstream-Status: Backport
>> -[
>> https://gitlab.freedesktop.org/slirp/libslirp/commit/ce131029d6d4a405cb7d3ac6716d03e58fb4a5d9
>> ]
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ----
>> - slirp/src/tcp_subr.c | 11 ++++++-----
>> - 1 file changed, 6 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
>> -index e8ed4ef..3a4a8ee 100644
>> ---- a/slirp/src/tcp_subr.c
>> -+++ b/slirp/src/tcp_subr.c
>> -@@ -777,7 +777,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -                 return 1;
>> -             }
>> -             m->m_len = bptr - m->m_data; /* Adjust length */
>> --            m->m_len += snprintf(bptr, m->m_size, "DCC CHAT chat %lu
>> %u%c\n",
>> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
>> -+                                 "DCC CHAT chat %lu %u%c\n",
>> -                                  (unsigned
>> long)ntohl(so->so_faddr.s_addr),
>> -                                  ntohs(so->so_fport), 1);
>> -         } else if (sscanf(bptr, "DCC SEND %256s %u %u %u", buff, &laddr,
>> &lport,
>> -@@ -787,8 +788,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -                 return 1;
>> -             }
>> -             m->m_len = bptr - m->m_data; /* Adjust length */
>> --            m->m_len +=
>> --                snprintf(bptr, m->m_size, "DCC SEND %s %lu %u %u%c\n",
>> buff,
>> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
>> -+                         "DCC SEND %s %lu %u %u%c\n", buff,
>> -                          (unsigned long)ntohl(so->so_faddr.s_addr),
>> -                          ntohs(so->so_fport), n1, 1);
>> -         } else if (sscanf(bptr, "DCC MOVE %256s %u %u %u", buff, &laddr,
>> &lport,
>> -@@ -798,8 +799,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
>> -                 return 1;
>> -             }
>> -             m->m_len = bptr - m->m_data; /* Adjust length */
>> --            m->m_len +=
>> --                snprintf(bptr, m->m_size, "DCC MOVE %s %lu %u %u%c\n",
>> buff,
>> -+            m->m_len += snprintf(bptr, M_FREEROOM(m),
>> -+                         "DCC MOVE %s %lu %u %u%c\n", buff,
>> -                          (unsigned long)ntohl(so->so_faddr.s_addr),
>> -                          ntohs(so->so_fport), n1, 1);
>> -         }
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
>> deleted file mode 100644
>> index 11be4c92e7..0000000000
>> --- a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
>> +++ /dev/null
>> @@ -1,46 +0,0 @@
>> -From 14ec36e107a8c9af7d0a80c3571fe39b291ff1d4 Mon Sep 17 00:00:00 2001
>> -From: Prasad J Pandit <pjp@fedoraproject.org>
>> -Date: Mon, 13 Jan 2020 17:44:31 +0530
>> -Subject: [PATCH] slirp: tftp: restrict relative path access
>> -
>> -tftp restricts relative or directory path access on Linux systems.
>> -Apply same restrictions on Windows systems too. It helps to avoid
>> -directory traversal issue.
>> -
>> -Fixes: https://bugs.launchpad.net/qemu/+bug/1812451
>> -Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> -Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>> -Message-Id: <20200113121431.156708-1-ppandit@redhat.com>
>> -
>> -Upstream-Status: Backport [
>> https://gitlab.freedesktop.org/slirp/libslirp/-/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4.patch
>> ]
>> -CVE: CVE-2020-7211
>> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
>> -
>> ----
>> - slirp/src/tftp.c | 9 +++++++--
>> - 1 file changed, 7 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
>> -index 093c2e0..e52e71b 100644
>> ---- a/slirp/src/tftp.c
>> -+++ b/slirp/src/tftp.c
>> -@@ -344,8 +344,13 @@ static void tftp_handle_rrq(Slirp *slirp, struct
>> sockaddr_storage *srcsas,
>> -     k += 6; /* skipping octet */
>> -
>> -     /* do sanity checks on the filename */
>> --    if (!strncmp(req_fname, "../", 3) ||
>> --        req_fname[strlen(req_fname) - 1] == '/' || strstr(req_fname,
>> "/../")) {
>> -+    if (
>> -+#ifdef G_OS_WIN32
>> -+        strstr(req_fname, "..\\") ||
>> -+        req_fname[strlen(req_fname) - 1] == '\\' ||
>> -+#endif
>> -+        strstr(req_fname, "../") ||
>> -+        req_fname[strlen(req_fname) - 1] == '/') {
>> -         tftp_send_error(spt, 2, "Access violation", tp);
>> -         return;
>> -     }
>> ---
>> -2.24.1
>> -
>> diff --git a/meta/recipes-devtools/qemu/qemu/find_datadir.patch
>> b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
>> new file mode 100644
>> index 0000000000..74e9ba56ce
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
>> @@ -0,0 +1,37 @@
>> +qemu: search for datadir as in version 4.2
>> +
>> +os_find_datadir() was changed after the 4.2 release.  We need to check for
>> +../share/qemu relative to the executable because that is where the runqemu
>> +configuration assumes it will be.
>> +
>> +Upstream-Status: Submitted [qemu-devel@nongnu.org]
>> +
>> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> +
>> +
>> +--- a/os-posix.c
>> ++++ b/os-posix.c
>> +@@ -82,8 +82,9 @@ void os_setup_signal_handling(void)
>> +
>> + /*
>> +  * Find a likely location for support files using the location of the
>> binary.
>> ++ * Typically, this would be "$bindir/../share/qemu".
>> +  * When running from the build tree this will be "$bindir/../pc-bios".
>> +- * Otherwise, this is CONFIG_QEMU_DATADIR.
>> ++ * Otherwise, this is CONFIG_QEMU_DATADIR as constructed by configure.
>> +  */
>> + char *os_find_datadir(void)
>> + {
>> +@@ -93,6 +94,12 @@ char *os_find_datadir(void)
>> +     exec_dir = qemu_get_exec_dir();
>> +     g_return_val_if_fail(exec_dir != NULL, NULL);
>> +
>> ++    dir = g_build_filename(exec_dir, "..", "share", "qemu", NULL);
>> ++    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
>> ++        return g_steal_pointer(&dir);
>> ++    }
>> ++    g_free(dir);  /* no autofree this time */
>> ++
>> +     dir = g_build_filename(exec_dir, "..", "pc-bios", NULL);
>> +     if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
>> +         return g_steal_pointer(&dir);
>> diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
>> b/meta/recipes-devtools/qemu/qemu_5.0.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/qemu/qemu_4.2.0.bb
>> rename to meta/recipes-devtools/qemu/qemu_5.0.0.bb
>> --
>> 2.27.0
>>
>> 
>>
