Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17A3A61625
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 09:59:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n7so1560103wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=K9H+UrzZ1ZPBP6omyeMRLKCY8jhzsgXJ+IHbUQXDcL4=;
	b=oZ4LzB3e88gV31BnsSExG0T3GyrH3O2Kh+7Mh9g7hPmSJVM+7InQ4i+ItJ2YokDM6b
	6VeUh9yQWDKDyWnx2ofxzDlZCuMNURb0J5sSkCIJvIlBP9s5vSXFQ42t9JN8Lyh544Ku
	uNjUBvk7mKz8TNmP2v4Uwtm+Rld5CNwIJaH+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=K9H+UrzZ1ZPBP6omyeMRLKCY8jhzsgXJ+IHbUQXDcL4=;
	b=tHPZqcgfEtqACFRS8vo7Wxv7ffTlTV59aPTXEU9khrjSl4v9HQDu2Ug9HdsTi6DoLl
	X5ceMxQPWJrFaV6bOltvt5/CjrX6E3PCt8PaK09pderb0T1EzSXYLFkax5eBb/Vkbac4
	5U8uYwoFJnfQ7nv4kVkx+PpVX63c3yZqiQcyAtV4DtIqrcu1ySQ52Jh627ln0TQKsrXB
	lh9ksNB9SSJp5MIkLZiggyG3IWB1HHDNgeuMk/xur30UqL5z2VH/eiwrq+KNgZdZwCOC
	jWQxfOlPG6+djIqE7MOWpeSH5InFCmSvhS6B6bI+XSlOgPPI+B6EZMfeY3hfBea9bIHg
	eEXA==
X-Gm-Message-State: ANhLgQ0uBNImv/2Vt8ILEKf8NKLY1gLtxgnCEe9HpAIQQXtalBGmmT21
	6LiJeMjCKBpQtmQUlF53UQXVNw==
X-Google-Smtp-Source: ADFU+vu0oNLYuMeGoEOojx5vJTTaotCRCV8NyxOd36UrGfSiPkNTSIqwKiCet8wVmFhllzImUGj/Cw==
X-Received: by 2002:adf:eece:: with SMTP id a14mr3236169wrp.311.1583315990694; 
	Wed, 04 Mar 2020 01:59:50 -0800 (PST)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	w206sm3514443wmg.11.2020.03.04.01.59.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 01:59:50 -0800 (PST)
Date: Wed, 4 Mar 2020 09:59:44 +0000
From: Paul Barker <pbarker@konsulko.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Message-ID: <20200304095944.792423a0@ub1910>
In-Reply-To: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
References: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: gitsm: download submodules
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
X-List-Received-Date: Wed, 04 Mar 2020 09:59:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Mar 2020 08:12:27 +0000
"Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:

> The unpack function failed because the submodules were not downloaded.
> Calling download before unpack for each submodule solves this issue.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  bitbake/lib/bb/fetch2/gitsm.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/bitbake/lib/bb/fetch2/gitsm.py
> b/bitbake/lib/bb/fetch2/gitsm.py
> index c622771d21..3715e9824f 100644
> --- a/bitbake/lib/bb/fetch2/gitsm.py
> +++ b/bitbake/lib/bb/fetch2/gitsm.py
> @@ -184,6 +184,7 @@ class GitSM(Git):
>  
>              try:
>                  newfetch = Fetch([url], d, cache=False)
> +                newfetch.download()
>                  newfetch.unpack(root=os.path.dirname(os.path.join(repo
> _conf, 'modules', module)))
>              except Exception as e:
>                  logger.error('gitsm: submodule unpack failed: %s %s' %
> (type(e).__name__, str(e)))

You shouldn't be trying to download submodules in the do_unpack step. If
they're missing at this stage it probably indicates a fetch issue.

What's the exact error that you're seeing?

This could be related to the issue I saw when the fetcher uses git shallow
tarballs from a mirror - if that's the case I'm planning to get that fixed
this weekend.

Also, your email client seems to have chewed the patch up. It's best to send
patches using `git send-email` only.

-- 
Paul Barker
Konsulko Group

