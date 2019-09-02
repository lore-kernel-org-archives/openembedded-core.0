Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id A70EB7D72F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 21:33:03 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 205so7064042pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OW82cIXOjdY5Eh4LEyMKWs/yxVNLy1p++eYG2QYuT6A=;
	b=m6IH9XSNByZxl6TDRsyW/idnTM23b75jlq22ihZ3B+0+woC3NMVklWcqnc4a+XvPK5
	8/wuG3A+oN21S6Rf1hevtSbdaegqn7gKX9BHMkdypNWXTOcUJnzMDms6ruB+seP73IQU
	s6Zp+fNAhaRPoM0JX5MYX86nqif72RPHAGSGPfFna7NrLwRTAka4pf+gtXIRw/SvOI/n
	Ryrj5HvgwvSdpxkTjogWUX7PrmUbFCEESUTmHA6W+5mpDOX22jk4qRtokQj9U3S4AffU
	SYiV8H6aLPmD9sLpzMWFGF7akwidFy80HB5+M4Je6u8TWOD2o1VOooIZXhrnq8f3acd1
	I3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=OW82cIXOjdY5Eh4LEyMKWs/yxVNLy1p++eYG2QYuT6A=;
	b=gExafirvDL+g0/IuMydqpKRS1QsBTnUsX54AyB7DmpuiY/GI/Z5wUVgBeqhkKBObwW
	puw3hjWwXd+xwWra/nm2XIiUJ1UFn7JboVxDo1QbUcv+l2x6Hp6mHvroooEJ0Ao2p8s2
	j1qNmhePT4doJ6Gejbg0lsCdLqy8hn301WrGE+mQq1Fomz5EjQlMc5WAYJRCLCiJNp1f
	KUhO2icvr3Dt4oi6G42gVUCQkpGrZQk8qKH9C/GgbkRfYjkrHz2yaomVvZhHWD4Xy3BT
	Crf0Wpf54X0A8P7rsJW+Vi5NH/PWoWVt3/VMDH/F9kzcgPjb9CO1qWE/YN+Lstms5oO+
	0Gcg==
X-Gm-Message-State: APjAAAXMhmIwU0c0M9V/C+3HfxRhAoGl0w+RHutzOdyJnsdghR8dXuXC
	R1onc8+ixsfXmnNjz/aTPnO9yW7c
X-Google-Smtp-Source: APXvYqzm55/M2tUk2MURP2+4KJnYC/mMWHZVqD3k2DaIbgGmQbPfbUs8YWXP2NDIfn8zo81FYpbimA==
X-Received: by 2002:a65:47c1:: with SMTP id f1mr26605156pgs.169.1567459984509; 
	Mon, 02 Sep 2019 14:33:04 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	q71sm3465131pjb.26.2019.09.02.14.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 14:33:03 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190831211549.23729-1-akuster808@gmail.com>
	<20190901140542.GA11574@localhost>
	<9b09243d-86b7-b358-e0be-c41f8acbcd47@gmail.com>
	<20190902124003.GA8291@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <438c075e-9284-0eac-5aa0-9599d5c8dffe@gmail.com>
Date: Mon, 2 Sep 2019 14:33:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902124003.GA8291@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Mon, 02 Sep 2019 21:33:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/2/19 5:40 AM, Adrian Bunk wrote:
> On Sun, Sep 01, 2019 at 10:07:13AM -0700, akuster808 wrote:
>>
>> On 9/1/19 7:05 AM, Adrian Bunk wrote:
>>> thud and zeus are providing 2 gcc versions each that need fixing.
>> That is a true statement. What are you expecting?
> The other versions also being fixed?
>
> gcc-8 being fixed in warrior before it gets fixed in master would be
> the wrong order, and would introduce a security regression in master.
sent a patch. hope it is what is meant by the above.

>
> The code should be nearly identical in warrior and master, so fixing
> this also in gcc-8 in master should be trivial.
>
> Fixing gcc-7 in thud would be a bonus.
>
>> - armin
> cu
> Adrian
>


