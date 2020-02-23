Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2042616FE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 16:33:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x185so4009029pfc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 08:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=D3IyLbKCgdYOvJCJCj/dYMEtlA5YhtMzWAhKFs9fHGY=;
	b=uu6g96WYrKCIXJ7fh+aU+SsKTjZ+yf2+U0xUWl+siz64401DPlAyuu+YIygB/214kr
	Tcu4DXqiEV2Y6efKzTkQVoYuVVG2Ky2ex4bZc/KC74h3FeM39VrkbNjJdqBjVyg3GVF+
	XFMQ9mPpo047mMyfmg5BjaX57wHJ0rxs2HJ1+6L0a64WOcMLxQwp68/qeZymOFqKfYqe
	KViNterbo4peYva9ZNJw4WD04W2wEq3+yIDg8J/ynepzIqo1+t4l0PAKr6swnNbFU4SZ
	yeJ4afKRV9PL/UoSiVhsVHFtK+XVpzWmkLYubwNkyfAHFTmUT0HdEttgAPrfdFPR4CRN
	80bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=D3IyLbKCgdYOvJCJCj/dYMEtlA5YhtMzWAhKFs9fHGY=;
	b=ta3YeVkX87Ov1tpnaAihR1CyxLCAwCtjnHaff1Wy12Uc5ZKCOMLavkrs6M/4EOzsZ1
	KjGTtJe4jFkrFP4C6HeEWwozFmkfLGC215hRZUKqYzZoE2h0HbodTehMCNMyyg0FlzWu
	vd3LhpPytUNIrj9BM+hkPX4jIUbnBTuODBVhWgZkDW9ZJS7aWEnBiCuCp/0WBvwayfH7
	syXt0mVuYUVwkR9dIeUpAv7AtqISgHyEIjXcyVrwNNgqXC0zt3mIzb02imDpRGvYPvAH
	RBvbJB949FrPJ0Jv6QDNIkbbkZQnUng7B/G6i2J0OUoTCmsGW/N1B6wcnF21ahx3HjWs
	b29w==
X-Gm-Message-State: APjAAAWctuShuJ2JDGY1rpJwksR3fykaFXHo66sSMflu3CGUCAojq0rL
	uVMIef3UOPfP8+IDyCzPLf5e50f0
X-Google-Smtp-Source: APXvYqxe2HVn86kBA5/sAaCWj8RVf0NOs4FOHWLTnQyF6QCDk4MGJdKlVtXn5xkmnIIbq4Cfrbswyg==
X-Received: by 2002:a63:ed01:: with SMTP id d1mr44488213pgi.95.1582475586159; 
	Sun, 23 Feb 2020 08:33:06 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:e00c:a014:85ef:e8c?
	([2601:202:4180:a5c0:e00c:a014:85ef:e8c])
	by smtp.gmail.com with ESMTPSA id
	l11sm9358417pgt.59.2020.02.23.08.33.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Feb 2020 08:33:05 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20200221210032.3414-1-bunk@stusta.de>
	<3a180667-45cb-a15a-8f6b-20d49802ee71@gmail.com>
	<20200222211234.GB9628@localhost>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <01e510d4-e97d-109c-f12b-322ca68d5ca9@gmail.com>
Date: Sun, 23 Feb 2020 08:33:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200222211234.GB9628@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus][PATCH 1/2] libxml2: fix CVE-2020-7595
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
X-List-Received-Date: Sun, 23 Feb 2020 16:33:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/22/20 1:12 PM, Adrian Bunk wrote:
> On Sat, Feb 22, 2020 at 10:50:13AM -0800, akuster808 wrote:
>> On 2/21/20 1:00 PM, Adrian Bunk wrote:
>>> From: Anuj Mittal <anuj.mittal@intel.com>
>>>
>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>> Is this a backport from Master?
> Yes.
>
>> please include masters commit id.
> openembedded-core commit id or poky commit id?
Openembedded-core  ID

- armin
> They are always different, and I am working on top of poky.
>
>> Since Master and Zeus are at different versions, was there anything you
>> had to do to make this apply to Zeus?
> There is always the trivial change to the bb file.
>
>> I have adopted the kernel stable note of [Fixup for XXX context] so the
>> folks know things had to be tweaked from the original commit.
> I am already doing the same for non-trivial changes, e.g.
> http://lists.openembedded.org/pipermail/openembedded-core/2020-February/293312.html
>
>> - Armin
> cu
> Adrian


