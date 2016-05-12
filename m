Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1C76E6B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2092; q=dns/txt; s=iport;
	t=1463073523; x=1464283123;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=przTuipG0BZAMwo8dilyFCGeQtbVtghpWx28cUq0RSo=;
	b=N1qDVogLtuVOSH99hGc1JjJ3HzXAVe0SptAoaapHaJhsauxmIZ6auBNm
	vjWOYKytWt/QnDBlygq1XtIzLuNxkt0kZZdc53oB89FhCM010HCnh7ykl
	k8t+e9QfkDR9bcn0S+JWvpDDUt39yFYSPQDt5V599JmkBSHfoIRP1NbVo c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DHEwCgujRX/xbLJq1ehA1+rXqJVnODI?=
	=?us-ascii?q?CSFNjoCggQBAQEBAQFmJ4RDAQEEOEARCxgJFg8JAwIBAgEPNgYBDAYCAQGIEQM?=
	=?us-ascii?q?XDrg8DYQtAQEBAQEBAQMBAQEBAQEhhiWETIJDh1UBBI5PiScxhX6GJ4F5gWlOh?=
	=?us-ascii?q?AGDB4Vah1yHZWKDbjkyBYgsAQEB?=
X-IronPort-AV: E=Sophos;i="5.24,610,1454976000"; d="scan'208";a="635616064"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2016 17:18:40 +0000
Received: from [10.61.85.202] (ams3-vpn-dhcp5579.cisco.com [10.61.85.202])
	by aer-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id u4CHIeXM014338;
	Thu, 12 May 2016 17:18:40 GMT
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2c4a85a78d98c32bbd311fee753dddeececf3f17.1462987863.git.raj.khem@gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <5734BAF0.9060302@cisco.com>
Date: Thu, 12 May 2016 20:18:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <2c4a85a78d98c32bbd311fee753dddeececf3f17.1462987863.git.raj.khem@gmail.com>
Subject: Re: [PATCH 18/42] conf: bump minimum kernel to 3.2.0
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
X-List-Received-Date: Thu, 12 May 2016 17:18:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/11/2016 08:35 PM, Khem Raj wrote:
> glibc 2.24 have raised the bar for minimum supported kernel
> for more details see
>
> http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5fc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/populate_sdk_base.bbclass | 2 +-
>   meta/conf/bitbake.conf                 | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 008bb57..645a7f4 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -90,7 +90,7 @@ SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK
>   # Some archs override this, we need the nativesdk version
>   # turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
>   # manipulation.
> -SDK_OLDEST_KERNEL = "2.6.32"
> +SDK_OLDEST_KERNEL = "3.2.0"
>   
>   fakeroot python do_populate_sdk() {
>       from oe.sdk import populate_sdk
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8e02e91..07d171d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -403,7 +403,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>   # Kernel info.
>   ##################################################################
>   
> -OLDEST_KERNEL = "2.6.32"
> +OLDEST_KERNEL = "3.2.0"
>   OLDEST_KERNEL_aarch64 = "3.14"
>   STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
>   STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
Could you please keep 2.6.32 for i386/x86_64? In mentioned glibc commit
http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5fc
I see that Linux v3.2 is required for all architectures except x86 / x86_64.
Currently we build OE and use SDK on x86_64 hosts and some of them
run Linux based on kernel 2.6.32 so we would like to still have ability
to use OE/SDK on such machines

Thanks,
Ruslan

