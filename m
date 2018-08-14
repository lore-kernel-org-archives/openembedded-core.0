Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 59FC579098
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 23:37:49 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 13-v6so36881983ois.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d2YPe6EM+9itSoeKaZ0xYdxHcQumHw/rjC2Npjdphc8=;
	b=qu7PG//FfgUdsidsPwMwaXnUecZ25vDiUHKIJphABNyaNquaoBMzwz22xOX27JwwKj
	tNMyndeV/c5Owd8tk6Tok8Dd+apkN5WGFGlVkzXTJrRDlxBgwoW1HIXoN8u2HRJQS7oB
	7anO8LAf2p9OL3Ys9XIbdWgn10F+CYQv0baHmjr0B0jT1xD9gXhuEHFFe2FOeT1rQgMW
	p33jlEEg8ngeuF9/DncgJOjhFfWCKGJdN5bsUDqTlwM07Q2mz23Q2kWvdtR8MDHeKBRk
	OAESlv9vZE6pL9ay9bgrcV1ygGCtpCgSMrqZ5x3AhWo6c0U31tujkr0tAjqFJ4G2dSWs
	Kg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=d2YPe6EM+9itSoeKaZ0xYdxHcQumHw/rjC2Npjdphc8=;
	b=iUWv4vso89k/87AjDEpo5U2uJzWgEAeFfm/nFOWjEVJYmQeOygj2gr7c1bHWo4VP0X
	rhd0LkQRznhmNSsaS6QhAKt3sEWVSc7Un4H9/Ks0RFtxde4RbBZejmoGkhpMMBsrDeJY
	PHarlIPm9fHKajNn2bNPEZwTqM7ITweVN4V7lrCwaUTLBcG1xtN+/AeUMJvhHOXhdEwd
	dDlAYDc+VBl0QcV78w6Roc39i2ESP/1ASy7LucuXiJvbz44kEVxDYra53Mn5PtE9OL1P
	BsgQVYX2ayO2ffq5AqjGzUyvbWp17wThdyT5/GjjKJBCV5qVkkpaCmKx/M4wuhypEh4W
	EfXw==
X-Gm-Message-State: AOUpUlH6CopuS4hEE8JrDhaxuNl6wxU2g3e+xX8WAmgVMMspP6G+8133
	HVrc2wWjDEjlrOtFZbjsSAGv5dSk
X-Google-Smtp-Source: AA+uWPxL3cqvh7CmHzWhF9RMrfK81GyG50c8hIjkIO4QZBVQjnJkFoVYmA1IHrM5X5daSWL1yGIp/Q==
X-Received: by 2002:aca:cc0b:: with SMTP id
	c11-v6mr23903644oig.314.1534289870200; 
	Tue, 14 Aug 2018 16:37:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a992:553:fc14:a9d6?
	([2601:202:4180:c33:a992:553:fc14:a9d6])
	by smtp.gmail.com with ESMTPSA id
	l204-v6sm13894314oia.45.2018.08.14.16.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 16:37:49 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <058532a438814db98ab5389758a226fd@XBOX02.axis.com>
	<11df0453-3c35-b868-6d96-b23bd675ae9a@gmail.com>
	<8406638238c34c4799a21e8e39a4dd49@XBOX02.axis.com>
	<372f31a2e1d34d3390be9d5841bc2a6e@XBOX02.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <66a9e0c0-0435-1e99-01bb-a303bcf0f56e@gmail.com>
Date: Tue, 14 Aug 2018 16:37:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <372f31a2e1d34d3390be9d5841bc2a6e@XBOX02.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
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
X-List-Received-Date: Tue, 14 Aug 2018 23:37:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/13/2018 05:14 AM, Peter Kjellerstedt wrote:
> *ping*
they are in stable/sumo-nmut for testing.

- armin
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
>> Sent: den 7 juni 2018 16:05
>> To: akuster808 <akuster808@gmail.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-
>> pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
>>
>>> -----Original Message-----
>>> From: akuster808 [mailto:akuster808@gmail.com]
>>> Sent: den 3 juni 2018 17:13
>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
>>> core@lists.openembedded.org
>>> Subject: Re: [OE-core] Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-
>>> pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
>>>
>>> On 06/02/2018 12:48 PM, Peter Kjellerstedt wrote:
>>>> These two patches, in addition to "oe-pkgdata-util: lookup-recipe,
>>>> package-info: Don't finish prematurely" (commit 32c2a2dd) that is
>>>> already on master, need to be cherry-picked to the sumo branch as
>>>> well. Without them, `oe-pkgdata-util package-info ...` is more or
>>>> less broken.
>>>>
>>>> //Peter
>>> Thanks peter. I hope to remember to back port them once they hit
>>> master.
>>>
>>> -armin
>> They have hit master now. The commits I want cherry-picked to Sumo
>> from master are:
>>
>> 32c2a2dd oe-pkgdata-util: lookup-recipe, package-info: Don't finish
>> prematurely
>> 38f82842 oe-pkgdata-util: Make parse_pkgdatafile() support package
>> suffixed vars
>> cd195bdf oe-pkgdata-util: package-info: Re-add support for the --extra
>> option
>>
>> //Peter
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


