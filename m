Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0A26C0AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 21:09:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w7so3080460pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 13:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PPIEd4UR8g238TyU32wYy7/8a9zouAy+7vqfUcnucls=;
	b=Lp4UuCpjtvX+6ZKCr15Lo0BW1tBzm94K/e7LMSi1U46KcDoofgCBiL2zTdylIy2vni
	ftYK8dBKJKcqi3q43uXtiO8BtqFsG/UR+MP9cZAbQNmlZVV96dsuMo3YQDZ+osFnWZrV
	hmLS/zFej2FosjeoAWb5HT1FKWwU659x5SDt1uPIKYXWgpKXeFHmabL78p5Q3x0M1OBC
	WZB5gdKNQBeqh6lI1eqYptvJTGDPI5t7+z76tl3W9HFhEo3mpw7KSkmAv9YnS/GCHCyU
	URRBWPScnZdOBFBajkQzBrmE4kcVGHwSwssRUZYWe9xYWEpmEeCkG3ch2pcA2hxBJ78P
	176Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=PPIEd4UR8g238TyU32wYy7/8a9zouAy+7vqfUcnucls=;
	b=rxXnxKListjMTj5hWiR55p6vLQuQn0D1rRoSPTjKvLJi6LM2lLYQJPbA9ck4/vgOY7
	EWjv6JoUiuNnJ0BkZIeaMBe5zjNgpxBi5rVqnEnW4ih54+UpyPpkH7X7zdVPP6p7Ylu0
	RrIM/1TPF6me9yg/dzvG6x/7MpFtjd9Jzls3OcLPN+av9UVb9XqXFrsAo9Dpt39sLJb+
	/TuLDN3cV7rfE4LdcnaglwZnB7SB4f8DHSa+HKWuJeXFy/QzShDAbWuopbARmbPpvPBM
	8LBsxz6pMZmNZ6VmVBJD2i8BSMrQ05hX1BwXfIp8uFwtsPhSHM3JZBC/5Nb3gTuYTLSR
	OePA==
X-Gm-Message-State: AGRZ1gIyvzaepvTAv6f0vhM6NxNtHvNOFDgLAs+YmNTEa1fqPdcdBnfA
	k6D6gTZB/K0UENo7bQZ7e+BYCaxS
X-Google-Smtp-Source: AJdET5fydIMvNq8Qb6Ns4ihA1i8/JbN7LIM+/+jzilMCG5YKH+ixfVCQZd7r0tAzrhm0ML6bJArBaA==
X-Received: by 2002:a63:7418:: with SMTP id p24mr15327113pgc.196.1541970573113;
	Sun, 11 Nov 2018 13:09:33 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7077:6962:50cb:42de?
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	i88-v6sm29951567pfi.66.2018.11.11.13.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 13:09:32 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5f051eae-c4a6-dcba-be88-f84bcc8baac8@gmail.com>
Date: Sun, 11 Nov 2018 13:09:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already automated
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
X-List-Received-Date: Sun, 11 Nov 2018 21:09:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/9/18 6:29 AM, Richard Purdie wrote:
> The nightly-build-appliance target already tests this particular build.

If I am reading the AB code correctly, it is building for x86-64 where
as this is for x86.  A QA person would say they are not the same.

Are the resulting build results testing the same thing?

- armin

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/manual/build-appliance.json | 26 -----------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/meta/lib/oeqa/manual/build-appliance.json b/meta/lib/oeqa/manual/build-appliance.json
> index b8f89275d08..70f8c72c9bb 100644
> --- a/meta/lib/oeqa/manual/build-appliance.json
> +++ b/meta/lib/oeqa/manual/build-appliance.json
> @@ -1,30 +1,4 @@
>  [
> -    {
> -        "test": {
> -            "@alias": "build-appliance.build-appliance.Bitbake_build-appliance-image",
> -            "author": [
> -                {
> -                    "email": "alexandru.c.georgescu@intel.com",
> -                    "name": "alexandru.c.georgescu@intel.com"
> -                }
> -            ],
> -            "execution": {
> -                "1": {
> -                    "action": "Get poky source code and prepare the build environment",
> -                    "expected_results": "bitbake build-appliance-image is successful  "
> -                },
> -                "2": {
> -                    "action": "Set MACHINE to qemux86 and add the following line to conf/local.conf :  SRCREV_pn-build-appliance-image = \"${AUTOREV}\"",
> -                    "expected_results": ""
> -                },
> -                "3": {
> -                    "action": "Run \"bitbake build-appliance-image\" \n \n",
> -                    "expected_results": ""
> -                }
> -            },
> -            "summary": "Bitbake_build-appliance-image"
> -        }
> -    },
>      {
>          "test": {
>              "@alias": "build-appliance.build-appliance.Build_core-image-minimal_with_build-appliance-image",

