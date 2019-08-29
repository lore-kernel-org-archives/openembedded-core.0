Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id F3D757EC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:32:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l1so1242124lji.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 17:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UEmSpRiqnDOFI10XKWChzocWXJ/F0/Ot0EpHDVFKKhU=;
	b=vU4qsBt4ijxl0kY9D4G9N2l9Eu5XhGHOgZwboE2TgvrGGhBymjMlr8EU1tEAT2nh6c
	6+Pv4ztvkliPQtfAPQNNKsstUcfJwnLQkBxAiu71Js3EF7jcq/tAFeUSTMt0p/dztSZL
	9lKx9XtfGIWF6BXCtr5ql79BZjfFZ+n0mEv9weik7VkcZeiZjRcRQ5mIUGfMtnGioSYu
	RZueNYB19Wf071btNH675XyVpIMPbYE8n3rmYztS0rmpYHGGBWyZ2iI/599MZumy9WmT
	PEFoZn4UeJocQX218OmC1rKmNroi8WYuFghppoB01UU4q7W5iLraZIoqDT+2WMRLNUJO
	a9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UEmSpRiqnDOFI10XKWChzocWXJ/F0/Ot0EpHDVFKKhU=;
	b=K8/JaVlK/973wy36nAIcZa/P4voKCw1qB3JnWd2tZSATM/k5VxKeAxYJAqXU/Xy05q
	PS1vregl8kIw4mzfLpQKa5V8OueK373+S24+Prj47u8HUL7D7+ReS9oobSHR5WqMGhVE
	iDkK/92bT8sSaYCCOxcEcb6aC6FY+IhbLANnVo3RRq3f8zxCfUaDjKr7bwax1YCFDaoL
	I4bnbRvnWu6TwbFHAWqiI7ogKtkqMn6hjyILVHmQwskbo5epVjdNenA9V541XxLdAE/Z
	SFRonJGVvkTTsGvirtAVKyDAS+f+ZFN6dhq++HTRi4omTNkEMyXc4XMNBhcxMhj/Tkdv
	XvcA==
X-Gm-Message-State: APjAAAVNA05SP7fJ8HBTqDNQd9akHpt/vVvnE5W5j1jLNJZ8rpvWbPPL
	agkmaYBKyud3CpK3q0ASVq4vM9Iq9FHyGW1JEXgEVhUf
X-Google-Smtp-Source: APXvYqxATKcKXAvRNIcSYVRIDHAf3P+XZ6Xo44T29gQUsHL77x0LF9DN9RV0OAKRVetQRZ0AA7h5TtfmiHC7tmbmoEE=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr3753344ljl.118.1567038741085; 
	Wed, 28 Aug 2019 17:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<1d17bdc6ed17c0aa0680c7bcfbeb6f37a8d9cb8c.1567019771.git.bruce.ashfield@gmail.com>
In-Reply-To: <1d17bdc6ed17c0aa0680c7bcfbeb6f37a8d9cb8c.1567019771.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 20:32:09 -0400
Message-ID: <CADkTA4NjewFLyHM5W4+cC2ZGpwZecRQgvz_7Xhxe-Fd0UCHZiA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] perf: v5.3+ build fixes
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
X-List-Received-Date: Thu, 29 Aug 2019 00:32:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 3:28 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> In the 5.3+ perf builds, there are multiple unistd.h files that need
> to be kept in sync. So not only do we update one, we update both to
> ensure that libc-headers and the perf build are in sync.
>
> perf checks some key files itself to be sure they are in sync, and
> bits.h can be out of sync. There's no build error that results with
> bits.h at the moment, but we still make sure they are in sync to
> avoid the configure/compile warning.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 8ac8e7c308..58543c73d8 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -241,6 +241,10 @@ do_configure_prepend () {
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
>      # so we copy it from the sysroot unistd.h to the perf unistd.h
>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
> +    install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
> +

I just realized this may not be safe across all the kernel versions.
I'll submit a new version (if required), after I've tested my python3
changes to perf.

Cheers,

Bruce

> +    # bits.h can have the same issuen as unistd.h, so we make the tools variant take precedence
> +    install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
>  }
>
>  python do_package_prepend() {
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

