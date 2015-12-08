Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5A460110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 18:55:27 +0000 (UTC)
Received: by ioc74 with SMTP id 74so33906891ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 10:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=G56CFcLRhYfZpcfnzdXuFGBITVCerMXSVZifraEWspE=;
	b=RuooHAr0b8Oc9ZKLnB38BGh2cqjcm6iFuvKmkIxkKU2Dsctk9xJaYlAnjmAjSoCxWQ
	tjIkkC8TLQDIXjWv6LCm9ENZRVMVWkmwLD5GUmpcseoeg5S7E62j77ka6XvFNpUUKOR8
	rZARDv6k/IcXXjmUxfj7pasm0E2Z7qFIxdkeVELQTou3PDoDcPTb++n7I3R/U1gTp3aG
	k8Srel6FUPNUfEf3VXbzTXzdADfbxnl2BRD3LuJDTR48rbqb9y9us5YdG+ZzMC/m2oTv
	PSLD2fxyHaBUAtPmBkJwyizSd8kia1RzY2sbohcp0BrcsZiYChXB3TO79hVx+wPlHfnB
	llaQ==
X-Received: by 10.107.162.137 with SMTP id l131mr1305792ioe.49.1449600927816; 
	Tue, 08 Dec 2015 10:55:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 8 Dec 2015 10:54:58 -0800 (PST)
In-Reply-To: <1449585184-7423-1-git-send-email-maxin.john@intel.com>
References: <1449585184-7423-1-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Dec 2015 10:54:58 -0800
Message-ID: <CAMKF1srf+pv0uaZw1kv3Lr9n+2gJ+=npQcB8AZUUh8=nDGHbig@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libtirpc: upgrade to 1.0.1
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
X-List-Received-Date: Tue, 08 Dec 2015 18:55:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2015 at 6:33 AM, Maxin B. John <maxin.john@intel.com> wrote:
> 0.2.5  -> 1.0.1
>

this library is used by non-glibc system C libs e.g. uclibc a lot. Can
you see if it builds with uclibc and with musl.

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../libtirpc/{libtirpc_0.2.5.bb => libtirpc_1.0.1.bb}                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/libtirpc/{libtirpc_0.2.5.bb => libtirpc_1.0.1.bb} (88%)
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
> similarity index 88%
> rename from meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
> rename to meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
> index 330b829..0a236d2 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
> @@ -19,8 +19,8 @@ SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch \
>                                 file://va_list.patch \
>                               "
>
> -SRC_URI[libtirpc.md5sum] = "8cd41a5ef5a9b50d0fb6abb98af15368"
> -SRC_URI[libtirpc.sha256sum] = "62f9de7c2c8686c568757730e1fef66502a0e00d6cacf33546d0267984e002db"
> +SRC_URI[libtirpc.md5sum] = "36ce1c0ff80863bb0839d54aa0b94014"
> +SRC_URI[libtirpc.sha256sum] = "5156974f31be7ccbc8ab1de37c4739af6d9d42c87b1d5caf4835dda75fcbb89e"
>  SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
>  SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

