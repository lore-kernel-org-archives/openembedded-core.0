Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE6FA60214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 19:12:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so10279009pgr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 12:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=w7fevfH/xyFMuPby0wqQR0wMuH2Fip3ceouvOjCisbs=;
	b=CshKV3awqwTuZGWCPhvKBb/zXT3yv/ySQCQHCNXYULPgLiZlRH8750erZ80ZRAg/kT
	T0A+jXXynO1NocU0jkY8cnwhBZooKm5Z/LxZib6vwK1vo0Du22F7yEICHxEosdKLx3wf
	KhGZHjBLx2P8lyBIZrJz1DxBfrv+nJrnsdQtM61dsiHyJmmVvD/APr+9iGKPCD6L19BA
	LmooHmFa3YDROeSO9t2JqLtEWZ6FJHcHPwW7EABU7MA7MR85ZLyx+QXSl7uAwXm0U5My
	O9NhNjSiAufzirE5YY/tvxhuAuoh736lO0spnoPl5zdI5UBW4GKVp3tmXv6MQ2NyWQtl
	TzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=w7fevfH/xyFMuPby0wqQR0wMuH2Fip3ceouvOjCisbs=;
	b=YZxkDj0mq71p4LPWFqUK8fOmrT4JPGrmXrsMEAEom2aWunjSxu+HUANXWhXxvz0ql5
	SsAie72fRiuAL58f5kBDQVEGlTOdBm6HvQHX4rPde/wVi94gZ3uZoTCF2TDVUtqv+TCk
	kM+xsiUunSqJVFKjFy6uJSLbwSx6QIGBYYLHRso8PlnUqTcPc5XhxplY32Fd/gaVAas4
	iLgEn7xWX9WqyBTPCeNzeocBE9flb6MxcN99j6hvMmzHbMdOTSUhoH+AtBh0UDpCN7cX
	cOF5TVHEYkZk5/GGfYyr/j8nJ82Kg5PncFFsNl3hR0SAQ4hRdx7PMFzxW1B0lbrmmqDl
	sFTQ==
X-Gm-Message-State: ANhLgQ0Suzvw1LW2HKjNSB2ILQwuz1sb0BUHZBurrS8VQsgFQUyZnyeQ
	BHtcL6dj07o7MiVaXB0iBcbJhIrT
X-Google-Smtp-Source: ADFU+vt10sxDF0nc/z7tNZUgxlDkrM2vy1s8NvAO7sRKpP0wQaE6pGgeh09nUhwc59qWlLkcF9NvvQ==
X-Received: by 2002:aa7:93cd:: with SMTP id y13mr1072082pff.213.1584385975118; 
	Mon, 16 Mar 2020 12:12:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:a8a5:d87f:edce:bba6?
	([2601:202:4180:a5c0:a8a5:d87f:edce:bba6])
	by smtp.gmail.com with ESMTPSA id
	s206sm624838pfs.100.2020.03.16.12.12.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Mar 2020 12:12:33 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200316190628.19383-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <62485e60-999e-54c6-09a6-590a8a3e2072@gmail.com>
Date: Mon, 16 Mar 2020 12:12:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316190628.19383-1-raj.khem@gmail.com>
Subject: Re: [PATCH] oeqa: Extend parselogs to rpi4
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
X-List-Received-Date: Mon, 16 Mar 2020 19:12:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/16/20 12:06 PM, Khem Raj wrote:
> rpi had additional diagnostics which should be ignored [1]
>
> [1] https://github.com/raspberrypi/linux/issues/3195

So does this mean OE will take similar patches for every BSP in the world?

- armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/parselogs.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> index cc4f5f8c78..48712d4dac 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -183,6 +183,11 @@ ignore_errors = {
>          'Failed to make EGL context current',
>          'glamor initialization failed',
>          ] + common_errors,
> +    'raspberrypi4-64' : [
> +        'bcmgenet fd580000.genet: failed to get enet-eee clock',
> +        'bcmgenet fd580000.genet: failed to get enet-wol clock',
> +        'bcmgenet fd580000.genet: failed to get enet clock',
> +        ] + common_errors,
>  }
>  
>  log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]


