Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id EB6807D3A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 23:12:44 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id w5so13116693qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IRv8JCE4DSUsYfBjI8qGZsXrsfDflFyS6NYgfMcKJvU=;
	b=EU/7D/KaOkQ2cTHOKLjXXC8npbNqi+HgarP/puCkgciv1XuPsvOpm3blYnZS/0rQLa
	ZJXUQ3Y+jUCOZ1sUq/ekySxJHyz5OaZcyrj1QjG+WLcWwZthobz0b1xCS6rBykitMFna
	o+wUYjDN41pmcwo99QdYFn3SstQT1M121sOXJTD57FCybo5gBda6JP/yyneTlUpjgVNM
	iPa7eBwy8SrU4K4t3PRFmfiJhrhKgwCIG/vKO1cKUpGFvoEu/XwACpaVmrnQbvK++t5i
	j/QNWouvqCM46euqmcl8KxZe9opWon7trpQgi6GS/cEU+FmcT728dKcLgnxHEk7J5I4u
	kYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IRv8JCE4DSUsYfBjI8qGZsXrsfDflFyS6NYgfMcKJvU=;
	b=Aq6/XEbDLUyT+RfFkOy81HcqUUhqewULI2/YRjjTJSTZm73y7pX7nEbFvnqABqgyZE
	ldn92AIOHvSaCvNKeDG7SfA+4GCbP5Yp+ZLLHsNfmbUC2M/NlSIbf8rvTG5mjVS/6j1W
	SxfggqPMf+nYUGjbT8G0LJan1eNdXLE8Rf9wj/8LbD6BXarNdWVY/RLujaO6iQmWpnEY
	oCZxS71w7ti971mcjkLYGFQloYgCnL5x9nJKE/pdZ3Q3z/Vya1abro2t6fyj+NQNOa8U
	+9TZ5XoRrnI2Y/YyDChvU4PDgzb07G3+zKwQM6Fcdbo6QtH5dI16DGrZroiiYL/v1h1O
	iq0A==
X-Gm-Message-State: APjAAAVMQeKkGmUrz7X/kdEDf69pSeK3olopT6Gqtl7K90Z0gCymv50s
	dp+XCpVIGaSZQhoYqPWDqojPptLb0EtOGX2m5cPtrWJ9
X-Google-Smtp-Source: APXvYqwUjs5ilZw75qpMGy+iKUZPSdRvApxENqpKmxbXH9ciDwgQ0b1nJKOq9pztqJXGgR0R9QlXxJp0nHC6wgEpC6c=
X-Received: by 2002:ac8:1846:: with SMTP id n6mr48055993qtk.262.1555110765218; 
	Fri, 12 Apr 2019 16:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190412210912.21432-1-bunk@stusta.de>
In-Reply-To: <20190412210912.21432-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Apr 2019 16:12:19 -0700
Message-ID: <CAMKF1srHOayZ_MVHrwEA=54XD7HS5D5jT_fYmqF84mYuJ-cjEw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set XZ_COMPRESSION_LEVEL to -9
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
X-List-Received-Date: Fri, 12 Apr 2019 23:12:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 12, 2019 at 2:09 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> It is consistent with other compressors also using their
> best compression.
>
> xz is currently the option that offers best compression,
> using settings even lower than the default is surprising
> and makes it harder to choose the best available compression.
>
> For anyone who cares about compression time using a different
> option like gzip or bzip2 is the logical choice.
>
> For decompression, better compressed is actually faster
> to decompress.

I worry about resources we need to spend when creating these archives.
Can you post some comparisons
along to assess the performance.

>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 95aa1674cf..1c44ec4a80 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -54,7 +54,7 @@ def imagetypes_getdepends(d):
>      # Sort the set so that ordering is consistant
>      return " ".join(sorted(deps))
>
> -XZ_COMPRESSION_LEVEL ?= "-3"
> +XZ_COMPRESSION_LEVEL ?= "-9"
>  XZ_INTEGRITY_CHECK ?= "crc32"
>
>  ZIP_COMPRESSION_LEVEL ?= "-9"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

