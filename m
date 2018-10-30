Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4295071AC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:03:00 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id z18so2660809uam.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=smpN6p72owpeIyKHETLZaUCmc1EnzJmoJI5fLurVmow=;
	b=h/yEzEsr8bFFddtG+hBnZU7gEFmN5P7jS8eWaoeOQEOCc49Ulfq9Rgm7oJQlYyDLw2
	V/W7EwIkJnvNaNGTw1++T/oXjw+qaMGlbruBrB1oKphqiGw4j4KQnD2zS3R0nChgeAEZ
	38dxKbIuedE3F8Iv0/k6VXMD7udfUl91yD6JtxnlBL6Zx0KhBCut65ThwWOy1Zgzre3e
	mK8a+llTHslgsbqsrbMF8aOs6RSxbYJgQvOcGmrf8jaGZ5XfdyJm7YXBm795UeXoud8r
	NImaaAzcId7Q19CEvxw7g6QZfsPXFtnVEQNVjXGhcvX4E3WPJeiy7U4JJo1rw8F5Mp/q
	Uycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=smpN6p72owpeIyKHETLZaUCmc1EnzJmoJI5fLurVmow=;
	b=m6P2PAB03QFUhIgzKYJNCmVE92V6VNJnHbdr6hYYlM9PllaB/DU8DY9dbjEOh6l3i1
	JJc8qyIpdLndyAxhBkulDHPRPjAUtecy1vFogA5RpIUacbTzHv48I4XYDLOCYFHtNgXM
	gk1iYX/Tuzly9+cJzYGsjy4eZx6szinMhUI8x3YFpZQms/lrJfds5c7nUjRa6v5aI0Ew
	U6ocWGsoQUoKLicSGUj1VDVyYODnVGasXQZ5mDJgDPwDmkhj9wqLymewJdcIyOIk8FDu
	xGEFTxivX6tvuUhOlvlV+SjtViqi72x7g76jBRrU/UxddyqPmhBhjqGhgal/IM7YZCCj
	cPIw==
X-Gm-Message-State: AGRZ1gL485u9ssaWmOUEjp4YZiNdAxww6ZMmPHHuy+DubuVR4sT9iY1t
	REbJLq5UIPWbCpp+c0Q2xQnD1kicCkIDTLAobRc=
X-Google-Smtp-Source: AJdET5dkIc7muDeVvi+5ri+xsW/K4+khc0A7UMXSZuIkj30kZPH18aM+XvRhedef3GLFKc3g+5Wg+fWhmN1MPSv55Nk=
X-Received: by 2002:a9f:28c4:: with SMTP id d62mr6950917uad.42.1540861381879; 
	Mon, 29 Oct 2018 18:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <1540836778-6573-1-git-send-email-bruce.ashfield@windriver.com>
In-Reply-To: <1540836778-6573-1-git-send-email-bruce.ashfield@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 29 Oct 2018 18:02:50 -0700
Message-ID: <CAJ86T=WCuu-Ls-Ch+dMiVnGKRSWvUM9sZd=NfvDw2Z6LLXAO2A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] kernel: change default kconfig mode to olddefconfig
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
X-List-Received-Date: Tue, 30 Oct 2018 01:03:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 11:13 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> As was warned by commit 312ee68752fa ("kconfig: announce removal
> of oldnoconfig if used"), it has been removed from the 4.20 kernel.
>
> So we switch our default mode to the proper olddefconfig

Mentioning which kernel version first introduced olddefconfig would be
useful information here as kernels prior to that version will now fail
to build. It looks like the patch was first proposed sometime around
2012:

  https://patchwork.kernel.org/patch/1394011/

We may also need to either add a fallback to use oldnoconfig or bump
OLDEST_KERNEL (it's currently 3.2.0, which was released in early 2012
and so probably predates olddefconfig).

> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> Not for the release, just wanted to get this in the queue for
> when master reopens so we'll be ready for 4.20+ kernel versions
>
> Bruce
>
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e04d2fe00434..d50f4a9ee822 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>         :
>  }
>
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig"
>
>  python check_oldest_kernel() {
>      oldest_kernel = d.getVar('OLDEST_KERNEL')
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

