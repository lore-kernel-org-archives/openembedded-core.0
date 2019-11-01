Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3834C7FAA3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 09:59:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n7so8756124wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5gZUIypm/ipLKtXl07X9BSwM3RMKXFGZT30PPmTEbso=;
	b=C2x+0AeOdTYZ74lCp9CTtCpPhxoJEQ2hupqp90a6auI1mljbT+tU3CFc+EzofwfXBk
	DYFQTmOrCOZl9gOB/VZN+OIjKPEPPO50qBmBMxkiS7QmGHy7cSO5NVy7eXSC5rIGRmrI
	40+XqnCl20zjUNootmOpoqada8D/Tr2ksc75/9WMv+7fmZpNZWtDQGQOAegjS8sPgHnF
	bv/RXTIqcXjAju3HZDcbpovG4y6f19dPahP13hS2tldevVUpEsZY4C60zunIr6meLpeu
	sHCgWODNInZSyV7O+tdfU0FUzl8Xj8nelP92UGmS0s9cLtd1yxJY7IU3YeVPqmgX5/pk
	wXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5gZUIypm/ipLKtXl07X9BSwM3RMKXFGZT30PPmTEbso=;
	b=XF6o5VlpxW8LjXm2LNFFj8X5g6qh1mvMaDeNYHOoNyVHCsi53pfrFxm6JxJL8Z7aTt
	hk5PyIgVRn/+95th2duMIpzl+cfoZexm4vOafdgSuBm8VAm3Nnw6nf/uxvHdl44683JU
	hSJfKCzQ0EqB+LFk3BiwDMx0HwWWkao21kyHPvJV7AEnarXpBAYE5/o7ikLcOJzf1cOG
	WltAxVqNSStcH13HBbxnwlWAWaolH0iaHhBIbdIcl+OS/5AAupe4uT8ptVG9lkHE1Bg/
	o7wLhvzqwXin0wY2uLHUVRbkEHWG/yvDga/Qvrdlipvem8uOjJx09glmwcaxVG7nIyWk
	j6ZQ==
X-Gm-Message-State: APjAAAV+/Csud4AFtR3yKKHUZ0IHsiYOFljSOCB+AmzSiPXkp9KuTSWC
	leBFN4B8IRGHo40uuPXn/l4tOA==
X-Google-Smtp-Source: APXvYqyKat8dOx5TAyGwmVrZVYtXa/KmgkM5C1ELLxq7miubWngj7yRNWehMTacowqiqO6KWwyUYCg==
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr9845572wmh.98.1572602375899; 
	Fri, 01 Nov 2019 02:59:35 -0700 (PDT)
Received: from [172.20.38.113] ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id u7sm7448478wre.59.2019.11.01.02.59.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2019 02:59:35 -0700 (PDT)
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <20191101071043.16558-1-gtertych@cisco.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <5cd1a0c7-ee0e-25c8-d0c1-75d2f44a5b80@gherzan.ro>
Date: Fri, 1 Nov 2019 09:59:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101071043.16558-1-gtertych@cisco.com>
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Fri, 01 Nov 2019 09:59:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 01/11/2019 07:10, grygorii tertychnyi via Openembedded-core wrote:
> do_ar_recipe fails on perf recipe on line:
> 
> include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}
> 
> 1. "${...}" part expands into empty string
> 2. bb.utils.which() takes empty string and returns first directory name from bbpath

This doesn't sound sane. If the include directive has no argument, 
incfile should end up None. That's what the code "assumes" at this 
point. I would fix it either at the regex expression level or strip the 
match. I reckon former would make more sense. It sounds like the match 
expression should use * (none or more).

> 3. shutil.copy() fails on copying directory:
> 
> Exception: IsADirectoryError: [Errno 21] Is a directory: ......
> 
> Hence, check "incfile" variable on each step.
> 
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
>   meta/classes/archiver.bbclass | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 093e2d95af..7c46cff91f 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -441,9 +441,10 @@ python do_ar_recipe () {
>               incfile = include_re.match(line).group(1)
>           if incfile:
>               incfile = d.expand(incfile)
> +        if incfile:
>               incfile = bb.utils.which(bbpath, incfile)
> -            if incfile:
> -                shutil.copy(incfile, outdir)
> +        if incfile:
> +            shutil.copy(incfile, outdir)
>   
>       create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR'))
>       bb.utils.remove(outdir, recurse=True)
> 


-- 
Andrei Gherzan

