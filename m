Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 632677C5AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:37:45 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id i12so8306230pfo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d9Xyzb98XBizVWkXrdM0JYtRqf5cWxdLvwcNM8IEl18=;
	b=cO5ybAlV880/2InhVQ8Z1QGxz1MKXhdzUN8j73bnpLIbJVjWy4cvgzXenPOkT/VvvY
	jCiZ/E8eaF1ktreUIkhY1cJfBJo6GergGSMatuuqNBQWqf3ryL8eHMUVrsTCZ3e5rwHz
	sI3o+viK5t2q5zi0sQeOixYU1hlndXo8FQDB6vWfVJvMNkJoqDr3T+yOAaHxxDHme7K0
	+Q7I8/ayqtqiXfp6WEREpZEPj/8fctKDpe1ndClgkgC4TyHV3AuI8zFGQgYfkUkrOcLR
	5bQRfdQHGoOORAJg6Hcc/WIBOfjnI0iGDTfoy66TpePOy4Dvk2RYczdP5q1S4wjjfLvz
	1hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=d9Xyzb98XBizVWkXrdM0JYtRqf5cWxdLvwcNM8IEl18=;
	b=W7st02r0ubaxuNu4sWT4Nydtyh2n6o06OQnN+jNgaedHgpCgMSLyDscBHatv4IQeA5
	Gnc8Koj4bUFI3h1HyL79WOaXQ4L7CaTj9xp47MWRrSZigFefM+Hk05njRIdoi0lmGG8q
	+MI+h77HPmKVLjQoLEd/K640Dn+km6VJDUjiDZZCnk6icpNUoFZypJMyWKrzdzZEZOdy
	0JONP1mahVr8XujmbtTQvmJ5al+0dFZvCOKEWxBBQvkIaYVlz2JEZREPCScZISmqYCRT
	PMxI0WcHU+h8Jt4JnfetU6L1R89X4rsVD1SbcRH+sjtkDmUFQqDCSTXjjDOcxPBj5Cz6
	U/WQ==
X-Gm-Message-State: AJcUukf9t2zeATOwnUzpAADto58AmoBmH16g9obhzpVQK/yUtlV3DPQC
	Y7h8KLtqKBHd00Lciuc2vCfCeRUKE1s=
X-Google-Smtp-Source: AHgI3IZqsg2fsH2I0HsoESLh44Zta4y+qWMLhmfpE+A8kzRDNN8gx6ydi3fKlNArjRpeZbBQptkYrA==
X-Received: by 2002:a62:4618:: with SMTP id t24mr5449128pfa.139.1548697066260; 
	Mon, 28 Jan 2019 09:37:46 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:e408:cd79:36d5:3097?
	([2601:202:4180:c33:e408:cd79:36d5:3097])
	by smtp.gmail.com with ESMTPSA id
	m85sm52072896pfj.171.2019.01.28.09.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 09:37:45 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Marcus Cooper <marcus.cooper@axis.com>
References: <20190128111732.16387-1-marcusc@axis.com>
	<CANNYZj-Ppan8+qjppbBasLG-D73Gh3qLNBmDOhpNPKgyxmn7Bw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a3569980-7818-e477-e20f-2a2c0bb20717@gmail.com>
Date: Mon, 28 Jan 2019 09:37:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-Ppan8+qjppbBasLG-D73Gh3qLNBmDOhpNPKgyxmn7Bw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] systemd: Fixes Security fix CVE-2018-16864 - CVE-2018-16866
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
X-List-Received-Date: Mon, 28 Jan 2019 17:37:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/28/19 3:20 AM, Alexander Kanavin wrote:
> Maybe it's better to update systemd to latest upstream release?
Thud benefits from this : )

>
> Alex
>
> On Mon, 28 Jan 2019 at 12:17, Marcus Cooper <marcus.cooper@axis.com> wrote:
>> Changed in v2:
>>  - Added CVE tag, Upstream-Status tag and Sign-off-by tags.
>>  - removed the verification of the entry length in the header
>>  - squashed CVE-2018-16865 patches into one
>>  - CVE-2018-16866 patch now taken from systemd-stable and includes
>>    an additional heap buffer overflow fix.
>>
>> Marcus Cooper (3):
>>   systemd: Security fix CVE-2018-16864
>>   systemd: Security fix CVE-2018-16865
>>   systemd: Security fix CVE-2018-16866
>>
>>  ...-not-store-the-iovec-entry-for-process-co.patch | 208 +++++++++++++++++++++
>>  ...rnald-set-a-limit-on-the-number-of-fields.patch | 139 ++++++++++++++
>>  ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 +++++
>>  meta/recipes-core/systemd/systemd_239.bb           |   3 +
>>  4 files changed, 399 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


