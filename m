Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id EBAB470253
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:04:31 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id p9so611018lbv.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZluTgNq3zx6bTx31DxnO+7JwgWMKi/B2MaqhyvnGe8M=;
	b=qqfu1u8LGC48gQhBKj1c+k29mb4OQaPxxfBY7tYF65Tl8L1fPrGeHaRm92ouiNgo3p
	wyuxD2sWxl/xITDvwvg+CpZP3rqEq+4w1ItgWoXY3Heq3oxve+HXAm1ifukiZfwzixBQ
	n4NFYXarnJPdHyZQ5Dqh1vQZeq+M7g9Id4byb/ESw7cE0aBNTrp/RrohuQkmyQJN11lk
	K7JG8vEeHfBPO+Gl2mj724tKNOZ4A8oTh+VkOSZzuUjzUfaEtFNIaFARyENStCjxeXhs
	WKYZdvkQ+dG0r5qnvhy7qPUakg/2Zq1tzeICE/yOsu+FVjeqZt8Jp2w4x7AVwgNNc3fD
	k0uQ==
MIME-Version: 1.0
X-Received: by 10.152.115.173 with SMTP id jp13mr25414514lab.6.1405515871872; 
	Wed, 16 Jul 2014 06:04:31 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Wed, 16 Jul 2014 06:04:31 -0700 (PDT)
In-Reply-To: <5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>
References: <cover.1405497586.git.Chong.Lu@windriver.com>
	<5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>
Date: Wed, 16 Jul 2014 09:04:31 -0400
Message-ID: <CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] perf: split package
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
X-List-Received-Date: Wed, 16 Jul 2014 13:04:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 16, 2014 at 4:00 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
> Fix incorrect paths to split perf package.

Can you elaborate here ? This commit message doesn't really tell us much.
Why is the current split incorrect ? What is the symptom and result of the
incorrect split ? Are the package contents the same after this change ?

Bruce

>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 20968f9..781a738 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -166,10 +166,10 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>
>  FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
>  FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
> -FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
> -FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
> -FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
> -FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
> +FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
> +FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
> +FILES_${PN}-python = "${libdir}/python*/site-packages ${exec_prefix}/libexec/perf-core/scripts/python"
> +FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
>
>
>  INHIBIT_PACKAGE_DEBUG_SPLIT="1"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

