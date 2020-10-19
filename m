Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.4990.1603138684650766101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 13:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vV4YxSaS;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id n18so1158433wrs.5
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=B4Glb9xDdLu5iWc2KsKtOEeByRwywRslCn4Cmf1IlBc=;
        b=vV4YxSaSXc2hYcXWTEFXQXo64kL4pNyV7RQUEM8HvWzUym0nnB5LMQJGOrfn0A0nnY
         WIbL4AAF2c1xMOsj3fE9UbnlHEPydXOA9IAy0VGSbEFxt9Lg0hk0U9tLnscus2FPzb00
         5XZG6Y+ahq1rhlXxheE3Vd0GcBBTVP3bWGn0JbsLCBwaNHIPRLLtb5on4v7L4Nqx0kWC
         GG1v9Jb+iv5/WTi94s9B7aFcSzEBhRgpkG/ZCwNoDg+zv8pSvRG5Oz5y+VWIDKMpuGTn
         zalT8JR/fNzqAe/Q3tf9CsHW2goXxVM/kRRk0xN/o+791a1o/uNvfFkqXj8aCm6KOnD6
         2WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=B4Glb9xDdLu5iWc2KsKtOEeByRwywRslCn4Cmf1IlBc=;
        b=TLOAUCKGm69cQtVILVaMHEIEjY+VC8oj3c9fEVH2GJ+QD3cRxSqPiGhnOjRXzPPOWB
         7BU8yYtoECz7YCBCgp78S2CdZiSXuWQVGsk39hUG2m1zy0cvqvf+r+9/KI2fmEIaFhu3
         2omE5HaF2hzUEA28h2fxfzeuOdKULdZlu2PsCQQj7tAXioyIjmLQkPe995YghiyK8vbO
         MyU2m1QzqlY5+CEoerHvmv5jZe5V6OJEOH+0tJC9Ahmolr9jaBslnlCGFyLsXlwVFbgI
         1KLMmga5r41ny19arFphPfMy6txeENyTJgEQXtNzdJFanGl9pzgLFmBTKX/Pn+orfRLa
         PKIw==
X-Gm-Message-State: AOAM531VSj2jzjxuEupUQLMRW4YOLxn1jsH0gE3sQV7iIo01vbQ1xiQO
	80AdvXZzVdOY16JIblORFIE=
X-Google-Smtp-Source: ABdhPJzWsX03jhU5LzIoDQ9d0hIVqAGiQ5sNlpM593xRhoerFThDhoKA6NUkj6SX3inVx7rtZY43jw==
X-Received: by 2002:adf:e741:: with SMTP id c1mr1120882wrn.16.1603138683079;
        Mon, 19 Oct 2020 13:18:03 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id y10sm1017998wrq.73.2020.10.19.13.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:18:02 -0700 (PDT)
Date: Mon, 19 Oct 2020 22:18:00 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: ltp@lists.linux.it, openembedded-core@lists.openembedded.org
Subject: Re: [LTP] [PATCH v2] sigwaitinfo: Do not run invalid/undefined test cases
Message-ID: <20201019201800.GA12642@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200529014448.3815022-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200529014448.3815022-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

> These testcases run for eternity on musl

> test_bad_address* cases are passing invalid pointers to a function; that's always UB
> empty_set and timeout rely on the implementation-defined "may fail" for EINTR in sigtimedwait [1]

> normally "may fail" is an "unspecified" but here the impl
> is supposed to document it so it's "impl-defined"

> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigtimedwait.html

Sorry for the delay. Could you please verify, if test still fails in the current
master? If yes, would you please update the patch?

Now, I dropped it from the latest update:
https://lists.openembedded.org/g/openembedded-core/topic/patch_1_1_ltp_update_to/77667273?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,77667273

Kind regards,
Petr


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Rich Felker <dalias@aerifal.cx>
> ---
> v2: Extend same fixes to include sigwaitinfo01

>  .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

> --- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> +++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> @@ -422,15 +422,10 @@ struct test_desc {
>  } tests[] = {
>  #ifdef TEST_RT_SIGTIMEDWAIT
>  	{
> -	test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
>  	test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_timeout, my_rt_sigtimedwait, 0},
> +	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, 
>  	    /* Special cases */
>  	    /* 1: sigwaitinfo does respond to ignored signal */
>  	{
> @@ -452,25 +447,17 @@ struct test_desc {
>  #endif
>  #if defined TEST_SIGWAITINFO
>  	{
> -	test_empty_set, my_sigwaitinfo, SIGUSR1}, {
>  	test_unmasked_matching, my_sigwaitinfo, SIGUSR1}, {
>  	test_masked_matching, my_sigwaitinfo, SIGUSR1}, {
>  	test_unmasked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
> -	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
> -	test_bad_address, my_sigwaitinfo, SIGUSR1}, {
> -	test_bad_address2, my_sigwaitinfo, SIGUSR1},
> +	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1},
>  #endif
>  #if defined TEST_SIGTIMEDWAIT
>  	{
> -	test_empty_set, my_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching, my_sigtimedwait, SIGUSR1}, {
>  	test_masked_matching, my_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
> -	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
> -	test_bad_address, my_sigtimedwait, SIGUSR1}, {
> -	test_bad_address2, my_sigtimedwait, SIGUSR1}, {
> -	test_bad_address3, my_sigtimedwait, SIGUSR1}, {
> -	test_timeout, my_sigtimedwait, 0},
> +	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1},
>  #endif
>  };
