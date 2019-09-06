Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4BC7F322
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 09:49:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r195so6341109wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 02:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rTtC6MDubYPpp+d01xcNhmQvzrXviMn2mLEJ1G/Qvkw=;
	b=Ni/XmDiEol8Fj3mJY01x/Ldit7zYVCsKCmUnaHG615tWQ1nQ5fiiapUOX/BgCKJioa
	Pruuq7/TNQp6WlbqfnONWePoEjEEk38H6qB1M8+E9pnGC/MmmzL7Pt8UIyIluH8mCIXC
	K2QvjDZisgmQEGYC57+PNeK/13mJpejwV4oqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rTtC6MDubYPpp+d01xcNhmQvzrXviMn2mLEJ1G/Qvkw=;
	b=id6Jq7GQg4+kjH2KL4fsZl3vs051PHMqLLWsxZQ4G7VkalEoKeZ7YLc1QkJy6uxhgo
	vqgOfIM5m1idv0AXZGbM/KsGEUAffip5ejSu4rNBN1bGw7H0JZlh0WhUzt7A9z+abq/V
	ptZM+bs7vSNbkKcX0SzkuTS44ZYQrSK7Cdkn0NlmkT5pvCf1xCSw4K53wcjamyot4Km7
	3qVjoVR9Jyr3j1JfLN7yncVUsOaQfzW78R9JCM3/Ji1VsemBFY668pcnVWsUoQZo3ojU
	3Sri2HJvlYPLyPUuPYhQ3ISf/05n2DBVAJiPL/v5HQ3FqL7v9074S4ux3r8t36BrCEmC
	kDcg==
X-Gm-Message-State: APjAAAW2Uq/ZWvppJzpGbKHaYUi60+7zhs9lA4BDQkmBC5AwoG64//CA
	m3xpCaAvyIwbYu+5kDId9+wu6Q==
X-Google-Smtp-Source: APXvYqweHbeif820GeYn8T0cMkxPD+N9y3x//uP82OotzsfSyy1wsXNb63drQfRs/BcN16Df7JClLw==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
	9mr6708164wmg.133.1567763354427; 
	Fri, 06 Sep 2019 02:49:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p19sm4477870wmg.31.2019.09.06.02.49.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 02:49:13 -0700 (PDT)
Message-ID: <e4f98f46bf6430a9ada9b2ef796e45dfc1f7cbcc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org, Nathan Rossi
	<nathan@nathanrossi.com>
Date: Fri, 06 Sep 2019 10:49:12 +0100
In-Reply-To: <20190905135444.16261-1-JPEWhacker@gmail.com>
References: <20190905135444.16261-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] resulttool: Add reproducible log extraction
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
X-List-Received-Date: Fri, 06 Sep 2019 09:49:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-09-05 at 08:54 -0500, Joshua Watt wrote:
> Adds an argument to the log subcommand to extract the raw logs from
> the
> reproducible selftest.
> 
> To prevent ambiguity, the "--raw" argument has been renamed
> "--raw-ptest", although the old "--raw" argument is kept around for
> compatibility.
> 
> [YOCTO #13324]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  scripts/lib/resulttool/log.py | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/resulttool/log.py
> b/scripts/lib/resulttool/log.py
> index 25c3396717e..2352c767d91 100644
> --- a/scripts/lib/resulttool/log.py
> +++ b/scripts/lib/resulttool/log.py
> @@ -16,6 +16,16 @@ def show_ptest(result, ptest, logger):
>      print("ptest '%s' not found" % ptest)
>      return 1
>  
> +def show_reproducible(result, reproducible, logger):
> +    try:
> +        print(result['reproducible'][reproducible]['diffoscope.text'
> ])
> +        return 0
> +
> +    except KeyError:
> +        print("reproducible '%s' not found" % reproducible)
> +        return 1
> +
> +
>  def log(args, logger):
>      results = resultutils.load_resultsdata(args.source)
>  
> @@ -40,17 +50,28 @@ def log(args, logger):
>                          with open(dest, 'w') as f:
>                              f.write(ptest['log'])
> 

You might want to consider this in autobuilder context:

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/scripts/generate-testresult-index.py#n121

Since the indexer could extract reproducible logs as well as ptest
ones.

Nathan: We probably need to think about the new testsuite pieces in
this context too...

Cheers,

Richard


