Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E9DAC60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:20:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n19so9238351pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6PJitkszlWPiQn6BUH3sRcHHsadZCMlC3hoBOE1MtqA=;
	b=CxchFwQS/5eB0IQv1EiZ10TmuoUEzM/VD6WFf5hz5jnQ7wvVdQbMEfWbPOZFcQDi7s
	QCTs5M2Y1PEchFIwBRn7HMKKpfDHWx9YYVvvc1Jg7ndmnlpz1tn96VZGg37TLjYy+YU5
	nRijwG3ViyDhQ/wLH2JDe/Biqn66sOnjaGjzjAg+AQsSn4ItYd5WMnky52t6nQWq/wkh
	19PHGyiqFLpUcR13Pz3ftAbjjbynRw7ARGdBLP9P+jqLt7iJ5HYETA/FoeRXD50R+Cvi
	JewjtLyoRQhSYsur0ORIO3jhlYStOjL1Zg85x5wOu/UZJ0XarZ11Ypcff25n7EHWA8FE
	blsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6PJitkszlWPiQn6BUH3sRcHHsadZCMlC3hoBOE1MtqA=;
	b=ioKgnqmDzFqnkSyUD2fj8DkO8UpdB9rbkol7W1fmotpEejW2RZR+lnk34kfxyNxfEW
	xqkvaPf4cD4TaCcK7PSHt3G3S8NJyjKtWHYjFL8YN4BiwNqp1BulmsEg/68+iGV2rdZe
	J9zvLLqdITTCOfZYG9ILKro35HlvCUhRnO9m/vAc4Sva8QRPCilKAFK5mTVzzlL8lRrm
	7UQMZNlDbNJgqEHK/IAHhVmCwW5sKtSVdzMBFKyHnIP70D450arGhAqQwUM9qkKTCFWE
	eO4wgYMPV4NO9zSWGX7EyOU/k98CmehwSaGDGenkOJUqCz79g8oRIC+fhqe74vyx5KHt
	l/yw==
X-Gm-Message-State: APjAAAV5N7CxQQ11ugtHDXsL/vjJ2OP3VL69BSM7MgOEfQpkHueacv2d
	fR+G1JHafthWSd3PNDXbUQIq+n8+
X-Google-Smtp-Source: APXvYqxyFKsIe8m8TvaAdBQoWR/CK9nDUe6AZ4FlQlpM/b8CV8Uy65o4rhYWkDp2jjzhA0loTun/uw==
X-Received: by 2002:a65:5682:: with SMTP id v2mr38500174pgs.100.1557843640820; 
	Tue, 14 May 2019 07:20:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d909:eb3d:d2ab:fd1d?
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	v81sm49546913pfa.16.2019.05.14.07.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 07:20:39 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1557809500.git.akuster808@gmail.com>
	<551153b0bd1ebbc05582f6014e3d88b9ce4a46d0.1557809500.git.akuster808@gmail.com>
	<20190514083019.GB11298@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9a378954-386b-9552-0e11-54773260e135@gmail.com>
Date: Tue, 14 May 2019 07:20:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514083019.GB11298@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/23] oeqa: Drop OETestID
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
X-List-Received-Date: Tue, 14 May 2019 14:20:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/14/19 1:30 AM, Adrian Bunk wrote:
> On Mon, May 13, 2019 at 09:54:03PM -0700, Armin Kuster wrote:
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> These IDs refer to testopia which we're no longer using. We would now use the test
>> names to definitively reference tests and the IDs can be dropped, along with their
>> supporting code.
>> ...
> Is this bringing any benefits for a stable branch or was it just a cleanup?
Well, testopia no longer exists for stable branches  and since this
affects a lot of QA code, I backported this to make my life going 
forward easier. As I am sure there will be more QA work to come.
>
> And AFAIR this needs "oeqa/systemd_boot: Drop OETestID" or it might 
> cause a regression.
That patch is against a different layer that was sent to a different
mailing list.

- armin


>
> cu
> Adrian
>


