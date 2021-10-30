Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF284C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 21:35:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.23889.1635629699494022714
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 14:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ekXKJaO2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id v127so10674672wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2Cc3ipscmiarRfR1QDgspkSLxmZhK2HRQJ/DuUjMzIs=;
        b=ekXKJaO2Vaq/qIZmD9eIzrLydklK/6s8MAakEUlrz+dlEt8D8lzpimx+OuhA5G6ey8
         o6l0nHQzComXcSFhpvR1hHC9MPqACkt0J3I3l2/nH1cZHu9Vlrovp7EU59cwmoswaw6l
         SgtoXOzFyOnxGQbaWJ9ETIo3pEiBKiJKqGfl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2Cc3ipscmiarRfR1QDgspkSLxmZhK2HRQJ/DuUjMzIs=;
        b=tOALkP+EP7cxRVgGP1F9x1ZNgxZuqn67e8Rrzv+48QJwI9+bBSBCFASf41XC2x9iVA
         T9Vr27Qz+BNXrEWWaCAALIda1oGsaBVQefGBO7h75i/geEqACN+3rtih8b/PNUjY42z7
         8YYwQILw5l6AiQhXnQ8mJUTuceHIdNz1quS99JHv1SE1DhIvuNGAd/PhZ8uiEREGss0Z
         Nlwys+8+xYsJezsyj5cEadWO0wSmYT+gF4NnwLrb+GeWa0Zzy4kxlsmkiftEnZ2WH7WG
         zOZRud2RRiJZSC8cMmGOvqOKoxze1rrPBhMFjW212Aypdd4dqHMy4biycIqtoGM1Ij4L
         L9fQ==
X-Gm-Message-State: AOAM533tHrqyul7WIAz9pHiQ6riXItwPnFjJLryRyg8m8iRbUDAd5zy6
	dzO0xyc0lCddNTxqpyKABLx3Mw==
X-Google-Smtp-Source: 
 ABdhPJwMHKoKneBVWUBbt6jp0ALTp8pzDLwPkGtc/HO+1SCTiTkKYzAbw19slLsNr7DZC9P4cTNtXg==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr28235654wmb.79.1635629697853;
        Sat, 30 Oct 2021 14:34:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c?
 ([2001:8b0:aba:5f3c:b85c:77c5:c945:ad1c])
        by smtp.gmail.com with ESMTPSA id
 w15sm228000wrk.77.2021.10.30.14.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 14:34:57 -0700 (PDT)
Message-ID: 
 <e1aaf911870cae93d089ec745fbc243910863666.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] sstate.bbclass: exceptions on mirror
 fetcher is not fatal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 30 Oct 2021 22:34:56 +0100
In-Reply-To: <20211029231306.16066-1-quaresma.jose@gmail.com>
References: <20211029231306.16066-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 21:35:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157650

On Sat, 2021-10-30 at 00:13 +0100, Jose Quaresma wrote:
> An exceptions in sstate_checkhashes sstate mirror fetcher
> is not fatal for the build and it can be a warning.
> 
> If we can't check status in the fetcher we can assume that sstate
> file don't exist on the mirror and build it from sources, ignoring
> the sstate cache.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 6e4eb09f8e..54d38ed42d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -995,7 +995,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>                  missed.add(tid)
>                  bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, e))
>              except Exception as e:
> -                bb.error("SState: cannot test %s: %s" % (srcuri, e))
> +                bb.warn("SState: cannot test file %s from mirrors '%s': (%s)" % (srcuri, mirrors, e))
>              if len(tasklist) >= min_tasks:
>                  bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
>  

This has been discussed a bit before. Whilst the issue isn't fatal to the build
I do think this should be an error and have bitbake return an exit code that
there was an issue as there is something wrong somewhere if we're hitting this
code path.

As an example:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4230/steps/15/logs/stdio

which might have not shown up if it wasn't an error.

Cheers,

Richard




