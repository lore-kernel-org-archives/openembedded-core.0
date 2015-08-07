Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0206776707
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 02:13:09 +0000 (UTC)
Received: by ioii16 with SMTP id i16so99452405ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xaWezZ64bfyby963xeGxxa7m2AHquMweGZrBLcjppPo=;
	b=k8gbvusDWfjOmycuIHWnIowpIqlf6cRtw0rtXwmJrR1UXsVp3s5Xz+oLSWpjNkj9jv
	wxkS2QZq/NduVhuc/kg942jheL4/jHNUouuoSqrMGvZ4X/PEKjMKXrs5NP3LLdvHkCmz
	6sH4wtWv0KTRHXIWDsquUuzAWGA5efHW/Q0ZL5r+31yNCnwhTiVv1htM9GSAXEpyRMfC
	mn7t6E3XHpaqJJgkn2iNn3Xz1YlN/Olu3SAnyF2YA398pPmDgCd8OvldcVDplUuARLmG
	S3IdrH7blMvx4N3CcRTpjV8hskyIVTqKO71h1n6LBafsRgRAbFzUgAffOQGSxrySnkGW
	yFxg==
X-Received: by 10.107.168.145 with SMTP id e17mr5532911ioj.112.1438913589725; 
	Thu, 06 Aug 2015 19:13:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 19:12:40 -0700 (PDT)
In-Reply-To: <1438912459-7242-2-git-send-email-armccurdy@gmail.com>
References: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
	<1438912459-7242-2-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 19:12:40 -0700
Message-ID: <CAMKF1sr34efvDCOResE8Xu0ag-KnEMw62e10_rr-u8J6fWnHKg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS
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
X-List-Received-Date: Fri, 07 Aug 2015 02:13:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 6:54 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 08465c4..c483228 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -59,7 +59,6 @@ export V="2"
>  #
>  CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
>  UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
> -UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}', d)}"
>

those variables are part of .config so please make sure that they are
really redundant and dont make into .config

>  do_compile_prepend () {
>    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

