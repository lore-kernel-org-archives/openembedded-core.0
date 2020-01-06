Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id C4F6E7FCD0
	for <openembedded-core@openembedded.org>;
	Mon,  6 Jan 2020 16:40:56 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id z16so27212595pfk.0
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=jZwrPcs2dpC/hRy+yajrIz1NqaFK2oiZXQJ/Wxxy3pU=;
	b=EVFxk1w6NOgE8ueyMx4ZDTZuifvEJmp81jW+cfH7xoqO1kMjTCE54GuHwXMYBf8kZn
	9x3T1Uu7cqiCYr+MEZ9gaD9rTc8+WJVYNHqe/C38HSaeTw2/FT9YWm35dfEtvRErYL9V
	eMmcKlAEfm0XdYQLzxpyBnIKMs1oAmf0PAb5DKucQeY0tme+QG5MjbltxMTd75d6aIps
	aMu0AyAy2eGORc155qrV5j1TEbZgPDnDp8MTn6RPnXRwa+CdYv2obODsmlIlPkjhL2CW
	lSn3baUjK9L04n9UtI211g8j6hjQa8bul9k7jhO12YG2KX/+bAiXG0BzcRZl+wJUlL2x
	ryzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jZwrPcs2dpC/hRy+yajrIz1NqaFK2oiZXQJ/Wxxy3pU=;
	b=oChTeD6DFycj7QelOsoBVqgreHRj2I3D3O6IMDSfIgMeD3sC6unYcWK0keX7eSAbkn
	2TOAN+WF4U/HpZYa5Osd3kVSNyAIMTnpXq2ogQYTXUHP+GmQX5vITucCCRpAj+gVqohl
	Nat7M7OjURKmurzhtXrIvufUUk8Qh5e2NimUPFgeoaA7kXlOE7JjEsIdVWt9cW0+IxW/
	V2EuPy9a4N48/MggiYt4n57mGXU6CR25vt1FhB4EKSnOjtLL4PF16gIpfwtf+5Nm3a7G
	zoS2XCeODROsbhCo3nqO6a9ZSHXmvcwUMql8SLXXPvm9M7txk9nr6Qn/XncXHannPngQ
	QAWw==
X-Gm-Message-State: APjAAAV3MeK5udkMiwdi2YBevbTOl2CMMl8TCxkIMkPW5GfN+QG8jINZ
	zplx4DDYiMicm/P0hkmVWMK4LOnZ
X-Google-Smtp-Source: APXvYqyZdmcoNhVr976vHpeLTn8t0Sl+gZ6i0LdLsQ2qK2OfM5N7F5tDP0pkx0YEAZ3MhIUS6Zinqg==
X-Received: by 2002:a62:ddd0:: with SMTP id w199mr107743846pff.1.1578328857373;
	Mon, 06 Jan 2020 08:40:57 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:6832:e19c:36b9:d5e?
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	j28sm73021146pgb.36.2020.01.06.08.40.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 06 Jan 2020 08:40:56 -0800 (PST)
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>,
	openembedded-core@openembedded.org
References: <1578308090-3504-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fe6eaed4-d38a-fb88-dd6b-724e38eb7a33@gmail.com>
Date: Mon, 6 Jan 2020 08:40:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578308090-3504-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Subject: Re: [zeus] feature-microblaze-versions.inc: Update MB to v11.0
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
X-List-Received-Date: Mon, 06 Jan 2020 16:40:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/6/20 2:54 AM, Manjukumar Matha wrote:
> Update the Microblaze to v11.0
>
> (From OE-Core rev: 0cd48fe0feb248c451841f6ad42777460ac81c7e)
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Adding something new fails outside the acceptable changes for a stable
release per current guidelines.

- armin
>  meta/conf/machine/include/microblaze/feature-microblaze-versions.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> index 955674f..3221e2a 100644
> --- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> @@ -44,6 +44,7 @@ TUNEVALID[v9.4]  = "MicroBlaze version 9.4"
>  TUNEVALID[v9.5]  = "MicroBlaze version 9.5"
>  TUNEVALID[v9.6]  = "MicroBlaze version 9.6"
>  TUNEVALID[v10.0] = "MicroBlaze version 10.0"
> +TUNEVALID[v11.0] = "MicroBlaze version 11.0"
>  
>  # Version conflict matrix
>  TUNECONFLICTS[v8.00] = ""
> @@ -60,6 +61,7 @@ TUNECONFLICTS[v9.4]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3"
>  TUNECONFLICTS[v9.5]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4"
>  TUNECONFLICTS[v9.6]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5"
>  TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
> +TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
>  
>  # Version flags
>  TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"


