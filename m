Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB436D320
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:36:33 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id kp14so3150512pab.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 21:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=PepGWTn6xvtMyBhksUXTNww4MS5Yi19f21+WZmR+P/8=;
	b=J8K1mW8PxHo4rHbrAbEgrsFHx4BTo8/KnX/GwblgboabAvNRbYfc8RvYbgp1Ar79vs
	wT0WZN+hElonwLNhRgPym3j1Mu/Zc8SfocJtUt8JM1jAlkx2euRm54MLL6TEf5yK9Vku
	z5AyOTfOqAn58RWJaREe+REAijKh7uivXqQT9Hw58+YQ0rB7zNCk2FAz0N1aQHyCidWw
	CcnYb/OczA/yLnI+qdSx8Cszik0KzljuDYzISOz+W2K9sp4qgdCSN/VsKdIFO4qzUvAD
	YVLjWKRn1EyMXOvstVbaOCazQjDTTEhBFI6VlIO7g+wYJsYVb58yOWlcu/br4LLvbXNi
	M55w==
X-Received: by 10.66.66.161 with SMTP id g1mr110277pat.175.1383975395008;
	Fri, 08 Nov 2013 21:36:35 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id xe9sm18907561pab.0.2013.11.08.21.36.32
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Nov 2013 21:36:34 -0800 (PST)
Message-ID: <527DC9DE.6010306@gmail.com>
Date: Sat, 09 Nov 2013 16:36:30 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1383511181-8005-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1383511181-8005-1-git-send-email-raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 09 Nov 2013 05:36:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/2013 7:39 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.02.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/syslinux/{syslinux_6.01.bb => syslinux_6.02.bb} (94%)
>
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
> similarity index 94%
> rename from meta/recipes-devtools/syslinux/syslinux_6.01.bb
> rename to meta/recipes-devtools/syslinux/syslinux_6.02.bb
> index 4438ea8..b4ba0ad 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.02.bb
> @@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>   DEPENDS = "nasm-native util-linux"
>   
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
> -SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
> +SRC_URI[md5sum] = "5410b1c2614cc8375bfc92fe308ca5c8"
> +SRC_URI[sha256sum] = "16027cbc1a7d18a48f3d26fbea771896d892cb43860b8d2f596baef7f2789b6e"
>   
>   COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
>   # Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
Note that syslinux 6.02 has a known bug which corrupts the superblock 
when used on BTRFS volumes due to ldlinux.sys exceeding 64000 bytes.
It fixes booting memtest86+ with pxelinux though (see 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5501).

Regards,
Jonathan

