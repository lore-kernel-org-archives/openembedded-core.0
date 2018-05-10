Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A932B74908
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 18:24:03 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i194-v6so1317495pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 11:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z3oR/OI5ixzQ23vVKhpCKq7nef1Wo3+pSWqkxmQERPQ=;
	b=Cs5B5kMb+uzXM8rPrtR1z5WkHB2lNDriPM8TEpgn1CgejUA0ReSk1yKNQA2A6H4qEL
	BLkreKZlWrmzLM91NpbxvYdH63iICilcL1oDlMQBUYTPJCNBt4HqyYz5Jeh5nuClIEG2
	nJMbUXKBz2g+ZOEeaoB5lzn/jUtwaS8ybRVFW0SdMJG83bcNyCw3G2+duUcMDhC5ex2C
	G3bl35YzsO7X/gImtvSxJW04Un09KkH9sXH8jxaTi5t3sj+fDEVEoQeRVOOvSA4EZAI1
	G0PdVVQ0X7Zboq3zb2ZwYYC/yq+DGEbLTHl4OYSWzEzuxZWJxUHr9kI4n42p3Fsyc6aN
	7DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=z3oR/OI5ixzQ23vVKhpCKq7nef1Wo3+pSWqkxmQERPQ=;
	b=e6XQ6lW8D8afBa4ccwppyRqp9W1E2f6hZ1VXVexzXp+zEwkjd41ofyzO+AAyWN6tx1
	/qTqpgbXYoHZjRfKdjjIc/fW6YF5ChOMjV+oNZlV00YBNd3BRwjwNIGvatwernWjz+Lc
	firi9Q6eXDMfl6rA45GqBjeYlzJ/MNYEUfxeqnpV/56kf6KsehBx5aIb5zncPiBEud0f
	N+uJ70yuMtJZ59UrtPyoInZbWlcNKfr7vK35sXQmzAW5Qo7HB3yIvqrRYrYBbXWQSgyw
	i5BhzhE6baB4J0bRgu3WN0McRUqvMH5IDXUD6tVzDdAWwSL+rTSsufvP02tEI9w6gKea
	cV4A==
X-Gm-Message-State: ALKqPwf2/W8O9W9Tuxh89PW82AAIL5yxat5x2lhZ7XmdR+UA/tZgNlMB
	j16bWS/oq9NyYCoyQhbG5OpTixzH
X-Google-Smtp-Source: AB8JxZpswr19l481uP5tIwD7oBk6RPRoaw/isYh8lAjKVZAXgZqIgbeKOpejWVXvOdUOEMO/5cjDhg==
X-Received: by 2002:a63:9c01:: with SMTP id
	f1-v6mr1134492pge.223.1525976644176; 
	Thu, 10 May 2018 11:24:04 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:49fa:9382:bcbc:28ae])
	by smtp.gmail.com with ESMTPSA id
	e87-v6sm6050165pfl.65.2018.05.10.11.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 11:24:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
	<CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
	<84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8df86d81-5e7f-46fa-0d25-ecb902d70d8c@gmail.com>
Date: Thu, 10 May 2018 11:24:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
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
X-List-Received-Date: Thu, 10 May 2018 18:24:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/10/18 11:21 AM, Khem Raj wrote:
> 
> 
> On 5/10/18 6:01 AM, Burton, Ross wrote:
>> Fails to build here:
>>
>>   coreutils/lib.a(mktemp.o): In function `mktemp_main':
>> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/coreutils/mktemp.c:105:
>> warning: the use of `mktemp' is dangerous, better use `mkstemp' or
>> `mkdtemp'
>> | util-linux/lib.a(mount.o): In function `xdr_fhstatus':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1057:
>> undefined reference to `xdr_u_int'
>> | util-linux/lib.a(mount.o): In function `xdr_fhandle':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1052:
>> undefined reference to `xdr_opaque'
>> | util-linux/lib.a(mount.o): In function `xdr_mountstat3':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1089:
>> undefined reference to `xdr_enum'
>> | util-linux/lib.a(mount.o): In function `xdr_fhandle3':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1071:
>> undefined reference to `xdr_bytes'
>> | util-linux/lib.a(mount.o): In function `xdr_mountres3_ok':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1080:
>> undefined reference to `xdr_int'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1080:
>> undefined reference to `xdr_array'
>> | util-linux/lib.a(mount.o): In function `xdr_dirpath':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1066:
>> undefined reference to `xdr_string'
>> | util-linux/lib.a(mount.o): In function `get_mountport':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1145:
>> undefined reference to `pmap_getmaps'
>> | util-linux/lib.a(mount.o): In function `nfsmount':
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1662:
>> undefined reference to `clnttcp_create'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1677:
>> undefined reference to `authunix_create_default'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1652:
>> undefined reference to `clntudp_create'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1672:
>> undefined reference to `clnt_spcreateerror'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1702:
>> undefined reference to `clnt_sperror'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1707:
>> undefined reference to `clnt_sperror'
>> | 
>> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1788:
>> undefined reference to `pmap_getport'
>>
> 
> We need to specify
> 
> CONFIG_EXTRA_LDLIBS="tirpc"
> 
> along with
> 
> CONFIG_FEATURE_MOUNT_NFS=y
> 
> secondly in v2 please delete
> 
> # CONFIG_FEATURE_MOUNT_NFS is not set
> 
> from meta/recipes-core/busybox/busybox/musl.cfg as well
> 

On second thought, this probably should be enabled using a config 
fragment, since its not gonna link in another library it may not be 
common case to justify for a default config.

>> Ross
>>
>> On 10 May 2018 at 13:20, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> * We dropped in-tree obsoleted rpc from glibc and now busybox builds
>>>    which had CONFIG_FEATURE_MOUNT_NFS enabled were failing with:
>>>    | util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file 
>>> or directory
>>>    |  # include <rpc/rpc.h>
>>>    |            ^~~~~~~~~~~
>>>    | compilation terminated.
>>>    | make[1]: *** [util-linux/mount.o] Error 1
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>   meta/recipes-core/busybox/busybox.inc       | 6 +++---
>>>   meta/recipes-core/busybox/busybox/defconfig | 2 +-
>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox.inc 
>>> b/meta/recipes-core/busybox/busybox.inc
>>> index d1675c37aa..2db19ed317 100644
>>> --- a/meta/recipes-core/busybox/busybox.inc
>>> +++ b/meta/recipes-core/busybox/busybox.inc
>>> @@ -3,7 +3,7 @@ DESCRIPTION = "BusyBox combines tiny versions of many 
>>> common UNIX utilities into
>>>   HOMEPAGE = "http://www.busybox.net"
>>>   BUGTRACKER = "https://bugs.busybox.net/"
>>>
>>> -DEPENDS += "kern-tools-native"
>>> +DEPENDS += "kern-tools-native libtirpc"
>>>
>>>   # bzip2 applet in busybox is based on lightly-modified bzip2 source
>>>   # the GPL is version 2 only
>>> @@ -15,8 +15,8 @@ SECTION = "base"
>>>   # Whether to split the suid apps into a seperate binary
>>>   BUSYBOX_SPLIT_SUID ?= "1"
>>>
>>> -export EXTRA_CFLAGS = "${CFLAGS}"
>>> -export EXTRA_LDFLAGS = "${LDFLAGS}"
>>> +export EXTRA_CFLAGS = "${CFLAGS} -I${STAGING_INCDIR}/tirpc"
>>> +export EXTRA_LDFLAGS = "${LDFLAGS} -ltirpc"
>>>
>>>   EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} 
>>> CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' 
>>> HOSTCPP='${BUILD_CPP}'"
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox/defconfig 
>>> b/meta/recipes-core/busybox/busybox/defconfig
>>> index fbb5fd852c..816555fc21 100644
>>> --- a/meta/recipes-core/busybox/busybox/defconfig
>>> +++ b/meta/recipes-core/busybox/busybox/defconfig
>>> @@ -638,7 +638,7 @@ CONFIG_MOUNT=y
>>>   # CONFIG_FEATURE_MOUNT_VERBOSE is not set
>>>   # CONFIG_FEATURE_MOUNT_HELPERS is not set
>>>   # CONFIG_FEATURE_MOUNT_LABEL is not set
>>> -# CONFIG_FEATURE_MOUNT_NFS is not set
>>> +CONFIG_FEATURE_MOUNT_NFS=y
>>>   # CONFIG_FEATURE_MOUNT_CIFS is not set
>>>   CONFIG_FEATURE_MOUNT_FLAGS=y
>>>   CONFIG_FEATURE_MOUNT_FSTAB=y
>>> -- 
>>> 2.17.0
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

