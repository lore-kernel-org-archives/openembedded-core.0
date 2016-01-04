Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 99A04731DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:13:18 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id yy13so96764353pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jan 2016 18:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=5x3llIOpgUYbMo2kYt7cwezaQ9EmbGd4oRCkwYzb2xw=;
	b=epAVVuiM8UGrfEtbON9BSO/35Jf/ljhWIbgxP4Rmv5Vce1SpviFUZxcaUWppVnDsj8
	YPBJLkOmujFdDXsCufrDP8d6EG0RxMk+fUGw10cOuAo8/kGeDqGlKOgNtJh7VwL34EAK
	82LzuHxsUhFIZIj2otdBLiUOy9SIzPq49NwU9+HpzltFMWf3bLKO/1mM/BPFJOnaE5N0
	rfoFmq8kVEw1Ql3ivkZ3RFXdkKaMzTyplCKuGAz/YxNmGqAMEDYFRKvMvdOQO0tqeqzP
	7udEh6LJGd2SSTo4rauo4I1v6q32jzCUzazAPlYoh6gVz0mspNoyu5r8RPxE+6J/Qy9Y
	RSQQ==
X-Received: by 10.66.162.231 with SMTP id yd7mr121714710pab.98.1451873598898; 
	Sun, 03 Jan 2016 18:13:18 -0800 (PST)
Received: from Akusters-laptop.local ([2601:202:4000:1239:603d:1e7f:3049:777e])
	by smtp.googlemail.com with ESMTPSA id
	c87sm18613454pfj.79.2016.01.03.18.13.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 03 Jan 2016 18:13:17 -0800 (PST)
To: Awais_Belal@mentor.com
References: <1450869629-27805-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB77C51@EU-MBX-02.mgc.mentorg.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5689D53A.3040902@gmail.com>
Date: Sun, 3 Jan 2016 18:13:14 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB77C51@EU-MBX-02.mgc.mentorg.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Mon, 04 Jan 2016 02:13:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/31/15 5:38 AM, Belal, Awais wrote:
Awais,

> Ping!
This patch does not apply to the current dizzy branch.

is there a dependency patch I missed to apply?

regards,
Armin
>
> BR,
> Awais
>
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Belal, Awais
> Sent: Wednesday, December 23, 2015 4:20 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>
> http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 ++++++++++++++++++++++
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>  meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
>
> diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
> new file mode 100644
> index 0000000..f9252e9
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
> @@ -0,0 +1,52 @@
> +Upstream-Status: Accepted
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> +
> +From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
> +From: Hector Marco-Gisbert <hecmargi@upv.es>
> +Date: Wed, 16 Dec 2015 04:57:18 +0000
> +Subject: Fix security issue when reading username and password
> +
> +This patch fixes two integer underflows at:
> +  * grub-core/lib/crypto.c
> +  * grub-core/normal/auth.c
> +
> +CVE-2015-8370
> +
> +Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
> +Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
> +Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
> +---
> +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
> +index 010e550..683a8aa 100644
> +--- a/grub-core/lib/crypto.c
> ++++ b/grub-core/lib/crypto.c
> +@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)
> +
> +       if (key == '\b')
> +       {
> +-        cur_len--;
> ++        if (cur_len)
> ++          cur_len--;
> +         continue;
> +       }
> +
> +diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
> +index c6bd96e..8615c48 100644
> +--- a/grub-core/normal/auth.c
> ++++ b/grub-core/normal/auth.c
> +@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)
> +
> +       if (key == '\b')
> +       {
> +-        cur_len--;
> +-        grub_printf ("\b");
> ++        if (cur_len)
> ++          {
> ++            cur_len--;
> ++            grub_printf ("\b");
> ++          }
> +         continue;
> +       }
> +
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> index 7674255..6822e7a 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://grub-2.00-add-oe-kernel.patch \
>             file://grub-efi-fix-with-glibc-2.20.patch \
>             file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
> +           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
>            "
>  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>  SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
> index d4df676..94b6da9 100644
> --- a/meta/recipes-bsp/grub/grub_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> @@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>            file://fix-endianness-problem.patch \
>            file://grub2-remove-sparc64-setup-from-x86-builds.patch \
>            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
> +          file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
>            "
>
>  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


