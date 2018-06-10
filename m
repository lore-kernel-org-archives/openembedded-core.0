Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14EF0770B4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 16:04:50 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f1-v6so10925730plt.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dWSqtLM4hSkLXQmPjTJOYRQmHIVr5wg7LSEemEBZKt4=;
	b=k1HNGXbIsYbgSBFLIY19DNwWf0xeLLBW+UDluvBK11jWE9LOOC0qBiLSJBeeXeKyfo
	y+3HWUKgDPtEZSwbwyCkJZ2W8J/EEGxm1nz2udpRFLx8UGHz2yvjyOpcfe/aVwuklPKu
	enxYtW2oRBXzkXrl53Mkg8y19zF+YM8bz0ETVGxNDFqwOGU/u8vvKRJqdi105tatYhUT
	w3bhWaticib7eL0FGcxKUXuHijfq0Qb06i6A2DY2AN+80BXdUeR3hTLKR9GQQ3ZK2mlY
	1yY4DoiddmXK7rho3DhXCR7Ii+jrclPy08h10+I3o7Hy8hl41wXBvFyO2a1f3S2L87wb
	3cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=dWSqtLM4hSkLXQmPjTJOYRQmHIVr5wg7LSEemEBZKt4=;
	b=NL345Kj2zs7OxGDDxk0sCs2n/H5QS/Q+aFiiRIxm28jEkbUveoF3H63eAulkrELvWC
	7oyWomx/FSwpmWD4mefNzizfVcyMi44Z9DK5NxXXFsQmZS49GUiShmq5+/nW2junxU0r
	gfLpjjq6/dDsXhszHRilXprrPO5tbIehCbwsyfEOj08MamvXoia6iYNsa1bOaeemm3PH
	T1AW+W3R2XArB5vA7DxvmNnU2wluLGDLpEpUP4Vy3WJMyEYahdgCwbrTPLrr3s1Z2oyQ
	Q/Gx5QNEVyKK9A0cRdDS8sulpk6aRU8As6f4CUPYBt4yEFZfSGMyrI2FkJjh9wcb241I
	kQLA==
X-Gm-Message-State: APt69E3F05Ak4bmUSOo0VO0GS+9ferujltCxmyun3I0sF1JcUBnbVoW6
	Ott6/w5J3HzLyba2mLF9ECYFww==
X-Google-Smtp-Source: ADUXVKL4Rh83LGRaMgisJNarSnTCQbhIWh+uzOzaxdRs1TRwEXUSZ2Cf2w0JLPL3jELwfzBT6fjy/A==
X-Received: by 2002:a17:902:7293:: with SMTP id
	d19-v6mr15013210pll.142.1528646692047; 
	Sun, 10 Jun 2018 09:04:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:15c3:2e27:788c:8085?
	([2601:202:4000:1184:15c3:2e27:788c:8085])
	by smtp.gmail.com with ESMTPSA id
	131-v6sm109935647pfa.128.2018.06.10.09.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 09:04:51 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
	<1528574447-21755-2-git-send-email-akuster808@gmail.com>
	<CANNYZj8UfLsDXQ=3tOAo+ih2B7T5orT_C9hE02pH_O1rHXtx+w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ea8c1a44-c10a-d693-578f-04ac8f4a4d51@gmail.com>
Date: Sun, 10 Jun 2018 09:04:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8UfLsDXQ=3tOAo+ih2B7T5orT_C9hE02pH_O1rHXtx+w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] selftest: add cmake test
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
X-List-Received-Date: Sun, 10 Jun 2018 16:04:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/10/2018 12:25 AM, Alexander Kanavin wrote:
> 2018-06-09 23:00 GMT+03:00 Armin Kuster <akuster808@gmail.com>:
>> +DEPENDS = "boost"
>
>
>> +find_package(Boost 1.60 REQUIRED
>> +    COMPONENTS
>> +        unit_test_framework
>> +)
>
> Is it possible to use something else than boost here, if we want to
> test cmake's ability to find compoments? 
I am not a cmake expert by any means. I just took a testcase given that
found a problem that I fixed earlier this week. I have not other idea
one would ensure folks don't break cmake when the update packages.

> So that the build time is as
> quick as possible - boost isn't particularly fast.

- armin
>
> Alex


