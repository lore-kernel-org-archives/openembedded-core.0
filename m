Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7046086F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 14:21:04 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 78-v6so337021pfq.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TH/Yu5lw6CcjD+XRaI9Vfu5Vs6ZUIcCm6Ijq1SU4wg0=;
	b=Y5HPErbETjF78VBim88cs2bTCRIwoPWUVmSbQkDg3a41i/zcsmlJpFRmsUHspcHD19
	jRHAbGEGd/bmD/dDXZQV3a9ACRfEkbpYXoTzEJjyg93dQTZBYoWHU0zm6Dg+MQdOXj7i
	FwsuDXMZCJ/M7XlZklUarRFy21X+t2DmvvrSgLsOjuDXFkvWhvZbCrU8qS22mk6EXSk1
	P5cD71uqZb+RZD7z1Tk0oyNQ7UAaS32sL0+QdNtF3rNz0do4DMBD9B00UEDkj+MNqhs2
	FN7sZC7x/YVfUm/sDJn5BvqGv8uCBOHpoKCNMRfSY0bj7OVvduRaN3PnkzU6SCywcqUa
	yNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=TH/Yu5lw6CcjD+XRaI9Vfu5Vs6ZUIcCm6Ijq1SU4wg0=;
	b=I65B2S97Zi5ltF3f1vlrqwZ0RqHvuQjZt8R73mxs3BU3gSaLJ5DKvZipJRP4eEQfAy
	193dax0IF1XeedaS78fJyJ8STt9EeHTRtdQQ/IxsQbIbp9CAYRU4p0uTVwDEOc9JKJBo
	I9WiDR17Po/jUOeOxMEvusVUzSNJUF/fVj5gw5B6HjKNw25p9F5GBpUy6vcCUjFC+2EP
	0wtrXW6TJZs6sWMfkjgQCL2li801jJSxag4J7T+RKlF64YuaKFS9loPGlvwnYiayk01E
	h6cJRAh7y7zj94rFz0WdbSas4Py6nl3z0fht2DcnyIHd6O3oo94wlwOu1OCn2URwVfuA
	vwPA==
X-Gm-Message-State: ABuFfoh1L407aVDinyukQzZagjJ/Gn3UQAEsqc1JMOp4xX9wDdhb4Bi2
	/CMHVq6OU98ybf7MrHM870w8rn7J
X-Google-Smtp-Source: ACcGV625ogHfKcgDTPgeGxu1+E+XRjpS4xmTlrSJsfroTX3LHJTsPHXoURno8mqZu2miNYPNfJGFvA==
X-Received: by 2002:a63:6746:: with SMTP id
	b67-v6mr30280482pgc.310.1539181265280; 
	Wed, 10 Oct 2018 07:21:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:488d:f898:e690:f18b?
	([2601:202:4180:c33:488d:f898:e690:f18b])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm54973607pfd.99.2018.10.10.07.21.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 07:21:04 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20180927190648.27553-1-schnitzeltony@gmail.com>
	<CALbNGRQ8qkKnUz+BsPD9ReuEzYzLX4ni7cr70bFQpL3Uv0UNxg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <237e6b83-e0dc-4993-6dd6-d910b95fe10d@gmail.com>
Date: Wed, 10 Oct 2018 07:21:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ8qkKnUz+BsPD9ReuEzYzLX4ni7cr70bFQpL3Uv0UNxg@mail.gmail.com>
Subject: Re: [sumo][PATCH] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Wed, 10 Oct 2018 14:21:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/10/2018 01:57 AM, Andreas Müller wrote:
> On Thu, Sep 27, 2018 at 9:06 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
>> The patch should increase performance for libsdl2 on GLES2 too.
>>
>> (From OE-Core rev: 52f9659f2bb44affec2f67935df01f13b6ff3e02)
>>
>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ping
Timing is everything. it just got merge to sumo proper ( Thanks RP)

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=sumo&id=3acc7a6e28a980cf662a7aa600d5503780c522e8

- armin


