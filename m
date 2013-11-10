Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 80DB36D2FE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2013 00:36:42 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id p10so3671789pdj.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 16:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=T/dQcDvwAjhA5ApCDqPyKDQpR/Edzle6T6LNX8LdsBQ=;
	b=vYVheEGa5ZvYorH7TPUf78PSZGzdDxw/2BF8gxgxRTj/4Hqw8Xz+QcIYZ9tuFtyh8T
	NBrgBpyDN52qOMKOoBsOs5/1lnyr4ho4y+Jc/8h5AjKOdT7LqYRPtAP91e0VNgjFYTIE
	GWXdgYG8FHspL8whLIppNNM6gvXFeJyG3z4lMFObGx3OIyLOU3RH8Yv5WHxLZVg9IJvL
	3xYsH64lYGfbQk+FIzlHC9btANk7hlqCdNZVJ8b9AsI07e/xYwbHrZHb6NVRmFvcTd/c
	eWBegZqmDfCpLcNUXgnP0eV0JmEx/YOFIjqEZzmd6zYrX/1D287gCv+/ucZxP2HaxxVO
	IhUQ==
X-Received: by 10.66.118.129 with SMTP id km1mr101816pab.127.1384043804284;
	Sat, 09 Nov 2013 16:36:44 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	zq10sm24658312pab.6.2013.11.09.16.36.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Nov 2013 16:36:43 -0800 (PST)
Message-ID: <527ED3C9.6070608@gmail.com>
Date: Sun, 10 Nov 2013 11:31:05 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1383511181-8005-1-git-send-email-raj.khem@gmail.com>
	<527DC9DE.6010306@gmail.com>
	<CAMKF1spK2555wssQAUSRZfOVwykE-4MxAmXS+cvFx1yjr-y4Ng@mail.gmail.com>
In-Reply-To: <CAMKF1spK2555wssQAUSRZfOVwykE-4MxAmXS+cvFx1yjr-y4Ng@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: Upgrade to 6.02
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
X-List-Received-Date: Sun, 10 Nov 2013 00:36:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2013 1:55 AM, Khem Raj wrote:
> On Fri, Nov 8, 2013 at 9:36 PM, Jonathan Liu <net147@gmail.com> wrote:
>> On 4/11/2013 7:39 AM, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>    .../recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.02.bb} | 5
>>> ++---
>>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>>    rename meta/recipes-devtools/syslinux/{syslinux_6.01.bb =>
>>> syslinux_6.02.bb} (94%)
>>>
>>> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
>>> b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
>>> similarity index 94%
>>> rename from meta/recipes-devtools/syslinux/syslinux_6.01.bb
>>> rename to meta/recipes-devtools/syslinux/syslinux_6.02.bb
>>> index 4438ea8..b4ba0ad 100644
>>> --- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
>>> +++ b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
>>> @@ -9,9 +9,8 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>>    DEPENDS = "nasm-native util-linux"
>>>      SRC_URI =
>>> "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2"
>>> -
>>> -SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
>>> -SRC_URI[sha256sum] =
>>> "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
>>> +SRC_URI[md5sum] = "5410b1c2614cc8375bfc92fe308ca5c8"
>>> +SRC_URI[sha256sum] =
>>> "16027cbc1a7d18a48f3d26fbea771896d892cb43860b8d2f596baef7f2789b6e"
>>>      COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
>>>    # Don't let the sanity checker trip on the 32 bit real mode BIOS
>>> binaries
>> Note that syslinux 6.02 has a known bug which corrupts the superblock when
>> used on BTRFS volumes due to ldlinux.sys exceeding 64000 bytes.
>> It fixes booting memtest86+ with pxelinux though (see
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5501).
>
> so it fixes one and regresses 1 and then for third one we can backport a patch
> is btrfs volume issue a blocker ? if not I would say a v2 with
> http://git.kernel.org/cgit/boot/syslinux/syslinux.git/commit/?h=firmware&id=4ac63b5ac412d54462e292daf65a309775bc0448
> applied would be good.
> atleast it will give us more testing and time to find issues before
> 6.03 comes out
>
>> Regards,
>> Jonathan
I don't know of anyone using BTRFS volumes in production. It's not a 
blocker for me at least.

Regards,
Jonathan

