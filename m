Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 356247C0AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 23:06:19 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l11so4996850pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=f4Mk1mYjWRJ1pRPHbRtx6lkqeqCTA3H40t1oNsgxxgI=;
	b=GO11wkb4QGM8wxc+4YgXia1sTanEPpDgEr4/m2ApkGX4gDZBMwM+hJAcTWLJpkXFlm
	LuJQTKLySEW+GYXU3piNZcn/o/YPqlCDCxFNN4CZWsPcIfPHkZkmD+ERmsgI3RCCZ3m8
	DvZzpzq7MBacRvVUECJ98eclSuX/jVriJSD9FaYUE3ImWjwsvsztPNpNr8oLCcbmCWvx
	vIlDTiLJLcKit5wHC8/JolpXV/3nuuolGfkiY/ojLkDPvBzTUb++VHs+OcUDpXceZN9c
	98nnk4kc5GUc/qevT1ro0GkENPAdY8KC2QS7CkXAb3LPAcHbw+Ol/fw3Ot1mrNGZG3FH
	wH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=f4Mk1mYjWRJ1pRPHbRtx6lkqeqCTA3H40t1oNsgxxgI=;
	b=KYNNKQ4L1Ekm5XSQbnDsU7Qbf92tAYyp9f17q6UAbA9PVhYSNsjC5OxpU2FIl+OxYS
	xn+DJNuzgoagPhA2BuU+O4AphCBYBIDPAkeyh49zLuAeTAwnzZ3gIOASdcswbufi2tdL
	ZSHdTjOEU7R2EcymPUbq6xX0gOfVVV7FNy1jNdCMVeGPPYhXO3/G72/vXSW0cnKmnk1o
	OCUM0p9mGQRpBBw+o7RcJA8GwLUOVYdUFi0dCHxetATloIyY6+wx+smoFQSca362au9a
	MXm+7fQTU1MemmJqqS4Gjn/purDQStH3PZ8wQ1tTcFUZI36fltK+FHQdAyf9bOZmZnC5
	GaxA==
X-Gm-Message-State: APjAAAXd2QHCWjmgGkby5DC3Kvi6DtHqaxI3F71FVh9iCaZoO5V2UOSj
	EMqIy18988RvjBp9NjGnVdMXRDe6
X-Google-Smtp-Source: APXvYqzim7Mh+n3qw+xTDh+tFLgcj5PFJL99ohwJ71/xeFMK+Tn6ZX6AQcxt0A3/aMKiMa/iTHjYQQ==
X-Received: by 2002:a62:4793:: with SMTP id p19mr790663pfi.76.1552604781163;
	Thu, 14 Mar 2019 16:06:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1c38:8eb8:1763:902b?
	([2601:202:4180:c33:1c38:8eb8:1763:902b])
	by smtp.gmail.com with ESMTPSA id l12sm328805pgn.83.2019.03.14.16.06.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 16:06:20 -0700 (PDT)
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
References: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
	<20190313224749.GC14253@joraj-alpa>
	<cd83f247-3a1e-64d9-bc76-e0c05b4745f1@gmail.com>
	<20190314162923.GF14253@joraj-alpa>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <752c3497-efc3-86b6-90b7-32a97577d1c8@gmail.com>
Date: Thu, 14 Mar 2019 16:06:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190314162923.GF14253@joraj-alpa>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Thud][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Thu, 14 Mar 2019 23:06:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/14/19 9:29 AM, Jonathan Rajotte-Julien wrote:
>>> Disregard this series. It does not follow the project guideline regarding recipe
>>> update for stable release.
>> There are exceptions when a package update is a bugfix only change. I
>> know the kernel, openssl, bind, curl and a few others fall into that
>> category. Many minor version updates tend to be  bug fix only but that
>> all depends on the upstream project policies. Binutils does not follow
>> that scheme as they add features in minor version updates. This is what
>> I know from personal experience. What helps the project along with the
>> maintainer is  having a brief summary of the changes in the commit
>> message. I am at the mercy of commit message.
> I get that. I assumed that most project are *sane* and stick to something
> similar to SemVer. Sorry for that.
>
> We follow SemVer [1] for the following projects:
>
>     Babeltrace
>     LTTng-tools
>     LTTng-ust
>     LTTng-modules
>     userspace-rcu
>
> This series contains only PATCH level update (MAJOR.MINOR.PATCH).
>
> You will note that the lttng-tools recipes was not updated to the 2.10.x release
> in this series.
>
> Side note, as a project (lttng) we recommend that lttng-tools and lttng-ust be
> upgraded in lockstep (MINOR == MINOR). But since we also conform to SemVer there
> is no problem using an older MINOR version of lttng-tools with a newer MINOR
> version of lttng-ust. The other way around is not recommended and will simply
> not build most of the time.
>
> lttng-modules is *special* since we fix thing to allow support of
> newer kernel as time goes by. Again, we do not add features across PATCH level
> release.
>
> Still, I think I understand a bit more the constraint oe-core and yocto stable
> branch are facing and would not mind if the recipes stay at the version they are
> now.
>
> [1] https://semver.org/

Thank you for the explanation. This will help me moving forward.
>
>> Can you confirm this is bug fix only update?
>>
> Yes it is.
Great. I took your series and have them in the builds.

regards,
Armin

>
> Cheers
>


