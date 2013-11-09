Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D879C6D1FB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 14:55:30 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so4993342iec.26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SA+fguOsgsq8ovxPAtQn8O9wL8cCTcMCOnsYzUnZW0w=;
	b=p6WR3YBx1KNiU4sg3yXQz8InzOu/6+ASPrdiyBTqT2AxuF8oCnXwDpWql6C3ZAKB7C
	HyJZA0PtuKdh5SyuARwyfKIA5d9cRpS7LsaKrrB3neC1xTQLa+PbiTi25WLM9rduiF+1
	3Jsb9C17Yvm0BYFSeHUN3WyDaFnscEeTWUjgtbTXB9a82ln/UcLGQFuGMh4JWjKgTpd1
	LxOBSlcIOSlMf6SmSuoxyvtUA/3KqFoZAwb5n415xKD3kWfvYk/iPQxS9zvuaP8TsS9d
	M0w+E3OiJg4GrYuZbi6QKreYkuveeeVQRe4lImtRUUNc2IzZJ2CKc1Z+kSdqxNXp5Qht
	TlQg==
X-Received: by 10.50.22.67 with SMTP id b3mr6573070igf.39.1384008931935; Sat,
	09 Nov 2013 06:55:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Sat, 9 Nov 2013 06:55:01 -0800 (PST)
In-Reply-To: <527DC9DE.6010306@gmail.com>
References: <1383511181-8005-1-git-send-email-raj.khem@gmail.com>
	<527DC9DE.6010306@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Nov 2013 06:55:01 -0800
Message-ID: <CAMKF1spK2555wssQAUSRZfOVwykE-4MxAmXS+cvFx1yjr-y4Ng@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
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
X-List-Received-Date: Sat, 09 Nov 2013 14:55:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 8, 2013 at 9:36 PM, Jonathan Liu <net147@gmail.com> wrote:
> On 4/11/2013 7:39 AM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.02.bb} | 5
>> ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>   rename meta/recipes-devtools/syslinux/{syslinux_6.01.bb =>
>> syslinux_6.02.bb} (94%)
>>
>> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
>> b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
>> similarity index 94%
>> rename from meta/recipes-devtools/syslinux/syslinux_6.01.bb
>> rename to meta/recipes-devtools/syslinux/syslinux_6.02.bb
>> index 4438ea8..b4ba0ad 100644
>> --- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
>> +++ b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
>> @@ -9,9 +9,8 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>   DEPENDS = "nasm-native util-linux"
>>     SRC_URI =
>> "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
>> -SRC_URI[sha256sum] =
>> "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
>> +SRC_URI[md5sum] = "5410b1c2614cc8375bfc92fe308ca5c8"
>> +SRC_URI[sha256sum] =
>> "16027cbc1a7d18a48f3d26fbea771896d892cb43860b8d2f596baef7f2789b6e"
>>     COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
>>   # Don't let the sanity checker trip on the 32 bit real mode BIOS
>> binaries
>
> Note that syslinux 6.02 has a known bug which corrupts the superblock when
> used on BTRFS volumes due to ldlinux.sys exceeding 64000 bytes.
> It fixes booting memtest86+ with pxelinux though (see
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5501).


so it fixes one and regresses 1 and then for third one we can backport a patch
is btrfs volume issue a blocker ? if not I would say a v2 with
http://git.kernel.org/cgit/boot/syslinux/syslinux.git/commit/?h=firmware&id=4ac63b5ac412d54462e292daf65a309775bc0448
applied would be good.
atleast it will give us more testing and time to find issues before
6.03 comes out

>
> Regards,
> Jonathan

