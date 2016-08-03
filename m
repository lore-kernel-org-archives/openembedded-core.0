Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A80456E64A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 09:33:23 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l89so11655129lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=FpffslCG9Y57pZGwDb9OQNq5tKIkS0OpF0VMXMJ7hXc=;
	b=AV/aGKjqOE0y16mzs8oTWMDsHnmUrU0xqmEsmlsU2lsGrZSnaZWloH/8a/VSGwtaiC
	FPwfrm0ti6iToOmdxxEuzBQWTMKLzcsCVjp8pWscuX4Mr67aenFy544XJmDbFyaqbnpA
	JDqyFvapaseUY/FnRhwhuXfQ2kMkkxgMIon9gGBlY2tmVtjyd08KvtCqK0EZXyyhKIQO
	nakThGvdOhH8XsAqUkHIznQA6RTtmFpFIFkNFdxT5Ig8NKSSts/Rf/sMK5ogbqM/C4xg
	vV7FStNUptBzwolVnQCFBkD15O88Jy+ByFqrgejZRYpMJKqeNl9vUSUZSMSyfwYwmOQr
	XvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FpffslCG9Y57pZGwDb9OQNq5tKIkS0OpF0VMXMJ7hXc=;
	b=CTQeZcIq5kwqMqLv8ZHarHve3R10bGg2UaryMhnNymEtJ6owpR5uyumUioh+kQGocY
	1wd8c+v4sVCsBilygQXzExgoQTtzImaBvP8F+o209WV7D+VEEcc9rNWEhAXC5TPtFpWY
	zEbhSuj/8ZH+Okdkfh7AsPPGbdE8xBdBhDfhd5MHP9F62NBFudbBBrfG6M4ZnJXTtX/n
	Xfr5daOwjVVPSomA8hgFTDnuLBOUnxOR0xgu14VaA3JuP84S6+FVBILcoMuQDrG1FqFf
	uLmq4K8cRjpvUNpcRolX3i4diLhYz/YZi+Ej2n6311EiDFRLHiUgM2NXHpaQg9MWGnKO
	s+Iw==
X-Gm-Message-State: AEkoout3VII0CxorQhX6LrGw+leUQWP4/5DJOK2pwJaOvOawGL/VO7a14WmhhdJMJP8q6w==
X-Received: by 10.25.88.145 with SMTP id m139mr18075138lfb.19.1470216802423;
	Wed, 03 Aug 2016 02:33:22 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by smtp.gmail.com with ESMTPSA id 41sm1242425lft.20.2016.08.03.02.33.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Aug 2016 02:33:21 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1469552171-8500-1-git-send-email-jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <1e6c0615-e39a-e2c3-23dd-992a03e06901@gmail.com>
Date: Wed, 3 Aug 2016 11:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469552171-8500-1-git-send-email-jacob.kroon@gmail.com>
Subject: Re: [PATCH] kernel-devsrc: Don't package kernel meta-data
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
X-List-Received-Date: Wed, 03 Aug 2016 09:33:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2016 06:56 PM, Jacob Kroon wrote:
>  * The kernel meta-data doesn't need to be distributed in the kernel source
>    package, so drop it
>  * Fix a typo
>  * Split long lines
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 0fdd0ad..2dcf01e 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -41,13 +41,17 @@ do_install() {
>
>          #
>          # Copy the staging dir source (and module build support) into the devsrc structure.
> -        # We can keep this copy simple and take everything, since a we'll clean up any build
> +        # We can keep this copy simple and take everything, since we'll clean up any build
>          # artifacts afterwards, and the extra i/o is not significant
>          #
>          cd ${B}
> -        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
> +        find . -type d -name '.git*' -prune -o \
> +               -path '.debug' -prune -o \
> +               -type f -print0 | cpio --null -pdlu $kerneldir
>          cd ${S}
> -        find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
> +        find . -type d -name '.git*' -prune -o \
> +               -type d -name '.kernel-meta' -prune -o \
> +               -type f -print0 | cpio --null -pdlu $kerneldir
>
>          # Explicitly set KBUILD_OUTPUT to ensure that the image directory is cleaned and not
>          # The main build artifacts. We clean the directory to avoid QA errors on mismatched
>

Ignore this patch, I'm suspecting that .kernel-meta/ directory shouldn't 
exist in ${STAGING_KERNEL_DIR} to begin with ?
/Jacob

