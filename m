Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF3E56E3E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 18:41:58 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id ec20so2986024lab.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 10:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dchS/TV5ceStetBk35JLhlRuQjRjMTomeko9NYAlraA=;
	b=Lydy3L7zE5Ds/O/B5DDqwOZK+90+wR+smWLLcXI70Ve+MM90hFR5jcJ3JObmlH0pih
	fYels0oLSElTgCjCONTow3Ul8UmFsMBujqBZXt4qGVon9kUT8mEEubta3qNHZTnhkr5z
	BqHN9Nm27FJOCXfj1akuWB2vDR8gpyuefEvrAvRmFn9suLW/qESYB0D+PPIYyeiK/zTk
	aAaGhZiLCs8Evl4BZdqcge8JUW9RutduveKgVQkQDjaidGXzS8HIBbXRvaGl89lgZcYF
	10G5fjBozdxMDHQU/yKfZOfZPUmOKg4tyatqjNZw/vspjIiCEbZgRd07ODDQJy6VohLz
	qsAQ==
MIME-Version: 1.0
X-Received: by 10.112.122.174 with SMTP id lt14mr29033lbb.79.1393612917876;
	Fri, 28 Feb 2014 10:41:57 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Fri, 28 Feb 2014 10:41:57 -0800 (PST)
In-Reply-To: <1393597694-5843-1-git-send-email-bruce.ashfield@windriver.com>
References: <1393597694-5843-1-git-send-email-bruce.ashfield@windriver.com>
Date: Fri, 28 Feb 2014 13:41:57 -0500
Message-ID: <CADkTA4OEvrDPDPq3-cKsX+_gN_qgR_dEVJKPWvkM2bV1TW0NHQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: bump to v3.14-rc4
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
X-List-Received-Date: Fri, 28 Feb 2014 18:41:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

FYI: Some extended testing with my image-core-kernel-dev image type
has shown that lttng and perf have some build issues, so we are
finding the issues that we wanted to with this -dev kernel :)

Cheers,

Bruce

On Fri, Feb 28, 2014 at 9:28 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Updating the version of linux-yocto-dev to reflect the integration of
> the 3.14-rc4 kernel.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 2b8c0556d0ed..5e097203e209 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -43,7 +43,7 @@ python () {
>              d.setVar("SRCREV_meta", "${AUTOREV}")
>  }
>
> -LINUX_VERSION ?= "3.13+"
> +LINUX_VERSION ?= "3.14+"
>  LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

