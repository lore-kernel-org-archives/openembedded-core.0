Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.1074.1601564753318615710
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 08:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kTDim0ZB;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: uvv.mail@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c18so4670380qtw.5
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=S3hO3wNCwcHt7LJd5TW2ED3bnUyvLuQcRTvFpKYmF2E=;
        b=kTDim0ZBgfRsftK9+ccQjx3TYT/aVgO+Ra2A1pvfHfhBgz93YxQLkdK34SohOA8o5R
         nSY7U04IPDV5fAqezPxkf+okigRau+EC7ssqj017fA7YyynXpc5S7dj+zgEgpJTGD1du
         OO/lo1MsCDfXpp5K4ppZgD25Ht4heCco1mgbPQ/QwMVaIZTm9MO2/gZQTfd0X6vw0jey
         aWPJd3Uq2EmYxUfYKbZUfYiSZaCSSztM/09hWlc0S2xsfW3bj8BYFXL/5dBnqcXpla63
         2kUBsacbT51MicyKjf2UZE1HcIRFT8Y/cSlZcaoNPd0m2iW9rJVFbMlXUt7rLnqN+es/
         gL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=S3hO3wNCwcHt7LJd5TW2ED3bnUyvLuQcRTvFpKYmF2E=;
        b=lyCL8WKTO3eLeH63Xg02iKAedvZUj9m5TIh7AaFd/iI55hHmdkaa6e+BnfwHLX8mLk
         7gffYR1Z+9/D1MgB4zGHOaAsvZTV5Qv+yJRLPgseoriM7FeDL68glnQcDFzBI2wOmIHm
         EezuLAqweEO4BnZtOGY4Ii1lLjFZjgWchvHz1Q9fq+ftvdA86DA0Hp/sbiKmnyzjyDhT
         w3P9U2tu/O1yCNKYCQN9mhkCx+mJeV8MHfSVe1ztvjHIpnUvlFWRzfj8knOXTAr+iTMh
         kljBdd4Wi+jsuYtkKIKfTSdArIBqQ9LuXZU4R+jzRCLfD4NeMwgrYw7qZ5H9+8BZZbJf
         O7bQ==
X-Gm-Message-State: AOAM530M8wAzlwaS6u8OHTGZqRWAFi4rF3E82rb9ZzOjiJatyMGzPb5a
	5JUCKSwMcPVglrpuei1PayA=
X-Google-Smtp-Source: ABdhPJyJTtJcIx4i22pVgzYANbIP2RORPWO51ic+8EUmnpz23bhRZ78Zu2IY6QGIQ5RPvCORreSAlw==
X-Received: by 2002:aed:3145:: with SMTP id 63mr8348958qtg.29.1601564752474;
        Thu, 01 Oct 2020 08:05:52 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.180])
        by smtp.gmail.com with ESMTPSA id s47sm7087213qtb.13.2020.10.01.08.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 08:05:52 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <Openembedded-core@lists.openembedded.org>,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20201001135927.721794-1-uvv.mail@gmail.com>
 <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
 <c71e99aa-5669-a75c-1e72-81c176ee71fa@gmail.com>
 <CADkTA4O_M+Wb5bXdiSTzKJDnB0GJVKoNUhD_t3x5qZsG0EvfLQ@mail.gmail.com>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <f850b3d4-b530-ade5-d64f-bc8611a1aba9@gmail.com>
Date: Thu, 1 Oct 2020 17:05:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4O_M+Wb5bXdiSTzKJDnB0GJVKoNUhD_t3x5qZsG0EvfLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 01.10.2020 16:53, Bruce Ashfield wrote:
> On Thu, Oct 1, 2020 at 10:47 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> On 01.10.2020 16:36, Bruce Ashfield wrote:
>>> We already ran into this with the main kernel flags, and we don't want
>>> to duplicate them here.
>>>
>>> Why aren't what we have in kernel.bbclass working in your scenario ?
>>>
>>> Bruce
>>>
>> Because kernel.bbclass is not pulled in into the environment of
>> out-of-tree module recipe. Should it be?
>> This can easily be checked when you do 'bitbake hello-mod -c devshell'
>> and examine $EXTRA_OEMAKE variable.
> Yes, it should be.
>
> We build out of tree modules in each autobuilder test run, so it is
> functional for the most part. I'd be interested to see the reproducing
> kernel module and build steps, so they can be built into the tests to
> catch this.
>
> But we absolutely do not want to duplicate those flags into this class.
>
> So with a reproducer, we can perhaps shuffle things around and make
> sure that both this new case and the old ones continue to work.
>
> Bruce
>
That's interesting to know. It has been easy to reproduce in 4.x kernel, 
but with 5.x in master it fails silently. So here's what you do with 5.x 
and meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb module

1. Set machine to any x86, e.g. qemux86-64
2. Enable CONFIG_UNWINDER_ORC in the kernel configuration
3. Modify kernel Makefile as follows:
Vyacheslav, [01.10.20 17:01]
index 8b1d5b9017a5..e35da9f9bb75 100644
--- a/Makefile
+++ b/Makefile
@@ -1058,7 +1058,9 @@ ifdef CONFIG_STACK_VALIDATION
       echo "int main() {}" | $(HOSTCC) -xc -o /dev/null 
$(HOST_LIBELF_LIBS) -,1,0)
    ifeq ($(has_libelf),1)
      objtool_target := tools/objtool FORCE
+    $(info "Validation enabled")
    else
+    $(info "Check failed, disabling stack validation")
      SKIP_STACK_VALIDATION := 1
      export SKIP_STACK_VALIDATION
    endif

4. If HOSTCC is set properly, then you should see "Validation enabled" 
in log.do_compile of hello-mod recipe.

Any hints where autobuilder tests are? Perhaps I could take a look and 
find a way to cover this...

Vyacheslav
