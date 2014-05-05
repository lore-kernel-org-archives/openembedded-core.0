Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4E760D8D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 21:54:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2014 14:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,991,1389772800"; d="scan'208";a="533965334"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2014 14:54:08 -0700
Message-ID: <53680880.30402@linux.intel.com>
Date: Mon, 05 May 2014 14:54:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
References: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Mon, 05 May 2014 21:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2014 04:26 AM, Koen Kooi wrote:
> This fixes the following build error:
> 	| libarchive/archive_entry.c:59:55: fatal error: ext2fs/ext2_fs.h: No such file or directory
>
> There is no configure options to avoid this dependency.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> index eedbaa7..277d8c8 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> @@ -5,6 +5,8 @@ SECTION = "devel"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
>
> +DEPENDS = "e2fsprogs"
> +

By doing this we also have to extend e2fprogs to be a nativesdk target.

Is there not a way to make this optional by editing the configure.ac and 
adding a switch?  What functionality to we gain or loose with / without 
the ext2fs extensions?

Sau!

>   PACKAGECONFIG ?= "libxml2 zlib bz2"
>
>   PACKAGECONFIG_append_class-target = "\
>

