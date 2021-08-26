Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.32655.1629994363464324930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 09:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hq1dZyLL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z4so5927250wrr.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 09:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vaOBXU7qHhDH47FsFbKeJpcMaYAuGwt7WxIs9unuSdk=;
        b=hq1dZyLLdWRwKWJYZSUUvf0ZhRzSQyL9rLF0ThgHscTOi+qI3aepZxjxUVLWSabbVT
         G8lMm/JK4eBR6h653LDXXGYCzGxLndF2IhG/Yr+O2xwOZ9fH5PKib0wafsLjnZ631uSX
         osqwu1VBnxWoiUrUN6NUfHypBAnok9cjBUUTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vaOBXU7qHhDH47FsFbKeJpcMaYAuGwt7WxIs9unuSdk=;
        b=aWGY2yX8ITnnwxMEuor1F0PzGqsjdb/IZqrpjGKcgawJ5AWWUtWQA4xWobPVvOjMQW
         xKkUxNe68LKYf5wmgGL5v7vuFVeh4jr/9KAl0UrYqyQDTTzQdZmakjAeV4pdYHbxxsFE
         6agi32C5uI47jg6eeFTWChlSzFRj6XTifeQ3V8/O6/nmJ+VEOLtxNUnIv5r2cuQ/VQaJ
         cjIVKjjX4R7yD2p1cqJ9RuKCcZcZHUfjzecwBepEjgp7UruiRdI5BDgrbZJuUGBL3Qio
         4tv0kxGhbPPgJGLgPy5n8yQtS+nOme/sX80CWBXaOAL7atvkmAIIUAKdwowwyh0P8iMb
         fBHQ==
X-Gm-Message-State: AOAM5317LNV+yRrEQoZC86o5vnGiJcpf4pyyv5xp2DOxUostSUP2VVn5
	IkiFpPDlqLK+ncPqaqI6h+mtQg==
X-Google-Smtp-Source: ABdhPJx+d5Flhnz4siiDQSBoFMu6oTVLCOdLUgODe3J0wvx+AhDq9gOt1lYCZ5BaBISThKrIiPrfFg==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr5110523wrv.170.1629994361924;
        Thu, 26 Aug 2021 09:12:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id c190sm3113570wma.21.2021.08.26.09.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 09:12:41 -0700 (PDT)
Message-ID: <e4091533694cd7b4a93407bf131eea0a28191c4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-pluggy: upgrade 0.13.1 -> 1.0.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Date: Thu, 26 Aug 2021 17:12:39 +0100
In-Reply-To: <20210825202805.714379-1-timothy.t.orling@intel.com>
References: <20210825202805.714379-1-timothy.t.orling@intel.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-08-25 at 20:28 +0000, Tim Orling wrote:
> * All ptests pass on qemux86-64
> 
> pluggy 1.0.0 (2021-08-25)
> 
> Deprecations and Removals
> 
>     #116: Remove deprecated implprefix support. Decorate hook
> 	  implementations using an instance of HookimplMarker instead.
> The deprecation was announced in release 0.7.0.
>     #120: Remove the deprecated proc argument to call_historic. Use
> 	  result_callback instead, which has the same behavior. The
> deprecation was announced in release 0.7.0.
>     #265: Remove the _Result.result property. Use _Result.get_result()
> 	  instead. Note that unlike result, get_result() raises the
> exception if the hook raised. The deprecation was announced in release
> 0.6.0.
>     #267: Remove official support for Python 3.4.
>     #272: Dropped support for Python 2. Continue to use pluggy 0.13.x
> 	  for Python 2 support.
>     #308: Remove official support for Python 3.5.
>     #313: The internal pluggy.callers, pluggy.manager and pluggy.hooks
> 	  are now explicitly marked private by a _ prefix (e.g.
> pluggy._callers). Only API exported by the top-level pluggy module is
> considered public.
>     #59: Remove legacy __multicall__ recursive hook calling system. The
> 	 deprecation was announced in release 0.5.0.
> 
> Features
> 
>     #282: When registering a hookimpl which is declared as
> 	  hookwrapper=True but whose function is not a generator
> function, a PluggyValidationError exception is now raised.
> 
>     Previously this problem would cause an error only later, when
> calling the hook.
> 
>     In the unlikely case that you have a hookwrapper that returns a
> generator instead of yielding directly, for example:
> 
>     def my_hook_real_implementation(arg):
>         print("before")
>         yield
>         print("after")
> 
>     @hookimpl(hookwrapper=True)
>     def my_hook(arg):
>         return my_hook_implementation(arg)
> 
>     change it to use yield from instead:
> 
>     @hookimpl(hookwrapper=True)
>     def my_hook(arg):
>         yield from my_hook_implementation(arg)
> 
>     #309: Add official support for Python 3.9.
> 
> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> ---
>  .../{python3-pluggy_0.13.1.bb => python3-pluggy_1.0.0.bb}      | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pluggy_0.13.1.bb => python3-pluggy_1.0.0.bb} (80%)

I haven't proof but I suspect this has caused python3-jinja2's ptests to
regress:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2433/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2152/steps/12/logs/stdio

I didn't spot this before it merged unfortunately.

Cheers,

Richard

