Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id B70B37D264
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 13:18:16 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 72so1157470lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b8iyoGWPgI5tlIIKbphUFVBAYCzwynRtUde47pCQ6wA=;
	b=D9HTFy6uRnwnE6c1yrmy4XWYl6pQOY9TecX36Vx3W27TAqmTtLFgefRFmDihkKv4ky
	ocmvEHmJmp6EmPVa3G4Lv4DrgfwIZT0RAvTXGRlPzBs40QPTh/t/lhXcuT2zh+Smb9Ox
	u/xsfdwKCCXOf1rzWYmiM96srWBGMmFmRfre/BwmAf9MiCk8tJAX9jvB6pMgdNEg0L6g
	ZlEhpzjmHFDBF5NrP3aBtSfHQHfqZuOrmH5BN4g2t+vtHCuFOWKPUUd/kIiiUMurprM/
	E4ioIz4Oj2aQD9s8KmdW5ALlrYIszEcsJoi37jcOvfXIcEa1WqTsqnklSky37A1SnYeq
	EtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b8iyoGWPgI5tlIIKbphUFVBAYCzwynRtUde47pCQ6wA=;
	b=il38/QGlphhxOmUp9GYS11rxv6VYa41ejWNcaOdM7S2kbVyxTsMvaRdUxCY3XZThxe
	0KoGSJdQxsxsppFDMznhPHPfJeuS4V1Vc9cIFgaq3N/vrLkeXY/PuaJLOCm1ktQgCqJA
	MPqoA/8EJJPSOjT8TR3Ubo/v8bHqtfaDnkB9nJKRmt4zTb72vcbxm/v8iR89MV9CNYOj
	ZOqAgbo3+DmUSfxF37BDAYbRuD+FJDOyFsbzZJOLi6Q0lJcZeCAhmSCXIza2RGmlRixR
	S8qVNvwAnLGFpcCQHGvcEP6EbXbK3Ij6kXa4BmIF04AJMG5APMRZbnmEST6EeSk4fhsA
	6WZQ==
X-Gm-Message-State: APjAAAXhFRtyPFbqdY63ZazuG8R8x3ulMuT2h14UwTRJusGuEgjJyTwp
	4O7HBdu3mHReN1ALMwVpQvEl5zqpOxiajjdaE/E=
X-Google-Smtp-Source: APXvYqxgOpHR9Z5B0uOQC5iFeyNPl5dreFXnwT31iPB/6eac7ndLkOxurv84Eg6JAmQC+e5SO2OG38iseVA9b1hRWoA=
X-Received: by 2002:ac2:4c8b:: with SMTP id d11mr7056711lfl.36.1568639897020; 
	Mon, 16 Sep 2019 06:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190916124144.28576-1-ross.burton@intel.com>
In-Reply-To: <20190916124144.28576-1-ross.burton@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Sep 2019 09:18:06 -0400
Message-ID: <CADkTA4NPu1wUZL7Qri=CXS8QjoFv-KpTCk08-yXRkYLAgaUN=w@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: do verbose builds
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
X-List-Received-Date: Mon, 16 Sep 2019 13:18:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 16, 2019 at 8:41 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Pass V=1 to kernel builds so that the compile log is more useful if it all goes
> wrong.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ebcb79a5286..9d2e1e476d4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -324,7 +324,7 @@ kernel_do_compile() {
>         fi
>         cc_extra=$(get_cc_option)
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> +               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} V=1 $use_alternate_initrd

Personally, I wouldn't want this on all the time. Most of what V=1
provides, I never use for debugging and it just clutters the logs.

Can't this be triggered off a packageconfig-like setting for those
that want it ?

Bruce

>         done
>         # vmlinux.gz is not built by kernel
>         if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

