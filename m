Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B3B326C106
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 08:03:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u4so4223862wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 00:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eEer6u/gEomAgcfOhiOjB/FlHCfzbKSQlByyw0Kstyk=;
	b=TJxOqPvd4Kdn6SM4v8ncx0llFNYZ6Npg4lbk5+TtI4BCIXujIIDDFZhYO9COOUKjgO
	6RqkOqxJcS4Mx7qdiA6yH2LEbVSvLOCSdaGv5fOkL/dXSpKcRBlyHQsuys0CFXPv583l
	Fs0zXjHIlLWETS4gnwXkFjy2gii7OFPyoOshOmdDOwsHTnD4rmh2aHTO/IPoY0IX6lu0
	bv8tSrMg17Sn3TIFyd38LINBQlR5ZHV8G+tfFONxm+CN3tkvydf+eIKh6ibskfKstUrA
	gZa3fVcadlkBnT21uqN/6NSlO8fMOeuXR11LNx62YI58ku/zzCTy3cCB7syPiaBimueW
	nz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=eEer6u/gEomAgcfOhiOjB/FlHCfzbKSQlByyw0Kstyk=;
	b=NZPE4T4LE2ab7cguHYeixFPfSRdEF3cbQohPFdJBoOVkc4BKGuC6incjWFZLJn+RMh
	ar04Z2AyfdXa+7dk5NGRZ8WqBY8nwfR0UokOcWme4PmLgitHh7VizQTloRfmNX7dSNYk
	ZJevMBvkzWNY3gYxQfHLcEMXloQi4ND/zQgzxVRZ3NDSE0fyU72sdRsGrsi7OSA+bGWQ
	+otOvoCJOEdPsmZAAbrglZg4MPrYdya+dG+Lg7nO5hWjltLM29Ih1viw9Rcg0W7fSStz
	nnShfhHNWGucUtf7DUi6Zeyi0A1cG0ITk8PZit/Iux8WDcgWDF6glubhTpx73uuREcOn
	yaaQ==
X-Gm-Message-State: AJcUukfcqr0oAYKnnitLLa/JeHd9hjNA6Q1mMYf4n5HzOHGBSPCG873A
	0urizbgPSpFqfmCTRqqGT8Uku+ihepxcyQ==
X-Google-Smtp-Source: ALg8bN48KW2cVOsX3lciaIKC6QZo54tkjQoBM3QwI7KTcRvAi5NyanSbwnRGS8Gb4Mx9kbmKlj2UGg==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr1374644wrq.69.1545379436057;
	Fri, 21 Dec 2018 00:03:56 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	q14sm8963349wrw.39.2018.12.21.00.03.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 00:03:55 -0800 (PST)
To: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
	<CAMKF1soU6M4zv6Xu4ugwheBHGO49cZSnnOD-PWSWJsCaAJC28g@mail.gmail.com>
	<a212aa5f-27a7-3181-cab8-c07fa5eca72a@dresearch-fe.de>
	<d45d83de-c360-6306-d35a-1388fdbd518a@dresearch-fe.de>
	<04a430ad-567a-d9d3-8a17-77e2dd55d025@dresearch-fe.de>
	<20181106190645.4xgvktwoyfuzgmby@mcrowe.com>
	<20181121182831.imvsz7kheqpaswti@mcrowe.com>
	<20181213151730.v2eb7lcyj2ypans6@mcrowe.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sledz@dresearch-fe.de; prefer-encrypt=mutual; keydata=
	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
Message-ID: <03153a6d-f0c7-4eee-0b45-774f208fbe1b@dresearch-fe.de>
Date: Fri, 21 Dec 2018 09:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181213151730.v2eb7lcyj2ypans6@mcrowe.com>
Subject: Re: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0 (tmux only)
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
X-List-Received-Date: Fri, 21 Dec 2018 08:03:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.12.18 16:17, Mike Crowe wrote:
> This was deemed a bug by tmux upstream and fixed there:
> 
>  https://github.com/tmux/tmux/issues/1549
> 
> I reported the bug to Debian, who applied the fix on top of 2.8:
> 
>  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=914816

Filed a bug for openSUSE Leap 15.0 too.

 https://bugzilla.opensuse.org/show_bug.cgi?id=1120170

