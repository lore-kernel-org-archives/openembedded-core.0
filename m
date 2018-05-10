Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B642B75231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 18:21:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q22-v6so1458944pff.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=goo61Pe/ArZb7GVyk9zvaO9Dp2CjfbKDXLMaj0XuroI=;
	b=Ne3jHxV9GskrknWFG7jU3nwrynuunIVpngtUrt9P8hrU2zDzMctAUWmTeX9UrHi4t3
	Yw1mhniJNzl8xNkW2hemTzYtSSMNs3GYXPXTy1QWlq8sGFUmr1Gn6Bhou9im3SGxr+mW
	uFeqQcdbCdqUnYCRG43gVsa5h23FdEtbpUbNv0Ngq10A5dhDgbhx3ref6ZVZAY1LoThZ
	vJ8ZjtT3oPz5rUJBCXDBeHY9XafzOrsF4HyQDB/pvoY3xvmkHtQ6FeTl2kvAxb6AUTHb
	b/iPcLWuXrkQucdtmrFqLaYfDoMSc0cGq3iDuE6ltfmblQSL6js/9EzZUMWzGxbCexk1
	G4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=goo61Pe/ArZb7GVyk9zvaO9Dp2CjfbKDXLMaj0XuroI=;
	b=EzSbP4plznLsKqOg5HOs3Zt2oBoMmVAjV/44gb8x/Cry23VQwXEGIo8lHoRD1ZYCr0
	m0fE4STkGHpy/1fa1HImoyB1HA+2qhYUHyTh5Axp/I1B77XIdMXnewAx6F9cxw+pa2XR
	3LLoVx/A3h8AlINFL8gP0zDFcCt10ClVcGr3Hu4A5vxboPGWG5NkulTJo4dTfiKm2NtG
	0RMHtX1+NSrhTkdVv32FmyN2ocLfxTJe4KqBz9KluCTskiXBgXeFtn9lvfRviJjmWKLI
	iq+d572N2ii8+u79Z+64JR6GX8BR2eDUzVab3yExpXJd4h7PAW4/HnBlyRNtU6cpnxGB
	nM8g==
X-Gm-Message-State: ALKqPwcRpyMRZrToVhr95X390hEcJkUg1QaFmAXH3bv8OjPyDrlPVjKY
	mEQmKULt7pkmM2KRwytAPnHHqxi6
X-Google-Smtp-Source: AB8JxZrrfP4B/85s6Bhvo6zB8xc109uE/NVCskepwknzN+mqV0kQj3I5w7krNOSycx3/pC+56y/06Q==
X-Received: by 2002:a65:6414:: with SMTP id
	a20-v6mr1952175pgv.226.1525976480039; 
	Thu, 10 May 2018 11:21:20 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:49fa:9382:bcbc:28ae])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm2804822pfn.80.2018.05.10.11.21.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 11:21:19 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
	<CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
Date: Thu, 10 May 2018 11:21:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc
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
X-List-Received-Date: Thu, 10 May 2018 18:21:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/18 6:01 AM, Burton, Ross wrote:
> Fails to build here:
> 
>   coreutils/lib.a(mktemp.o): In function `mktemp_main':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/coreutils/mktemp.c:105:
> warning: the use of `mktemp' is dangerous, better use `mkstemp' or
> `mkdtemp'
> | util-linux/lib.a(mount.o): In function `xdr_fhstatus':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1057:
> undefined reference to `xdr_u_int'
> | util-linux/lib.a(mount.o): In function `xdr_fhandle':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1052:
> undefined reference to `xdr_opaque'
> | util-linux/lib.a(mount.o): In function `xdr_mountstat3':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1089:
> undefined reference to `xdr_enum'
> | util-linux/lib.a(mount.o): In function `xdr_fhandle3':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1071:
> undefined reference to `xdr_bytes'
> | util-linux/lib.a(mount.o): In function `xdr_mountres3_ok':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1080:
> undefined reference to `xdr_int'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1080:
> undefined reference to `xdr_array'
> | util-linux/lib.a(mount.o): In function `xdr_dirpath':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1066:
> undefined reference to `xdr_string'
> | util-linux/lib.a(mount.o): In function `get_mountport':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1145:
> undefined reference to `pmap_getmaps'
> | util-linux/lib.a(mount.o): In function `nfsmount':
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1662:
> undefined reference to `clnttcp_create'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1677:
> undefined reference to `authunix_create_default'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1652:
> undefined reference to `clntudp_create'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1672:
> undefined reference to `clnt_spcreateerror'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1702:
> undefined reference to `clnt_sperror'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1707:
> undefined reference to `clnt_sperror'
> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1788:
> undefined reference to `pmap_getport'
> 

We need to specify

CONFIG_EXTRA_LDLIBS="tirpc"

along with

CONFIG_FEATURE_MOUNT_NFS=y

secondly in v2 please delete

# CONFIG_FEATURE_MOUNT_NFS is not set

from meta/recipes-core/busybox/busybox/musl.cfg as well

> Ross
> 
> On 10 May 2018 at 13:20, Martin Jansa <martin.jansa@gmail.com> wrote:
>> * We dropped in-tree obsoleted rpc from glibc and now busybox builds
>>    which had CONFIG_FEATURE_MOUNT_NFS enabled were failing with:
>>    | util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or directory
>>    |  # include <rpc/rpc.h>
>>    |            ^~~~~~~~~~~
>>    | compilation terminated.
>>    | make[1]: *** [util-linux/mount.o] Error 1
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-core/busybox/busybox.inc       | 6 +++---
>>   meta/recipes-core/busybox/busybox/defconfig | 2 +-
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>> index d1675c37aa..2db19ed317 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -3,7 +3,7 @@ DESCRIPTION = "BusyBox combines tiny versions of many common UNIX utilities into
>>   HOMEPAGE = "http://www.busybox.net"
>>   BUGTRACKER = "https://bugs.busybox.net/"
>>
>> -DEPENDS += "kern-tools-native"
>> +DEPENDS += "kern-tools-native libtirpc"
>>
>>   # bzip2 applet in busybox is based on lightly-modified bzip2 source
>>   # the GPL is version 2 only
>> @@ -15,8 +15,8 @@ SECTION = "base"
>>   # Whether to split the suid apps into a seperate binary
>>   BUSYBOX_SPLIT_SUID ?= "1"
>>
>> -export EXTRA_CFLAGS = "${CFLAGS}"
>> -export EXTRA_LDFLAGS = "${LDFLAGS}"
>> +export EXTRA_CFLAGS = "${CFLAGS} -I${STAGING_INCDIR}/tirpc"
>> +export EXTRA_LDFLAGS = "${LDFLAGS} -ltirpc"
>>
>>   EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
>>
>> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
>> index fbb5fd852c..816555fc21 100644
>> --- a/meta/recipes-core/busybox/busybox/defconfig
>> +++ b/meta/recipes-core/busybox/busybox/defconfig
>> @@ -638,7 +638,7 @@ CONFIG_MOUNT=y
>>   # CONFIG_FEATURE_MOUNT_VERBOSE is not set
>>   # CONFIG_FEATURE_MOUNT_HELPERS is not set
>>   # CONFIG_FEATURE_MOUNT_LABEL is not set
>> -# CONFIG_FEATURE_MOUNT_NFS is not set
>> +CONFIG_FEATURE_MOUNT_NFS=y
>>   # CONFIG_FEATURE_MOUNT_CIFS is not set
>>   CONFIG_FEATURE_MOUNT_FLAGS=y
>>   CONFIG_FEATURE_MOUNT_FSTAB=y
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

