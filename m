Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCC078317
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 15:08:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r25so2705770pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 08:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=MUz4GX//UoA2oInIaHEMr2QZ+Y0GHXV2vn3bqjyaQUQ=;
	b=kQc7c7EWHsFCynQiPGgnEWdsoc/3yYCVzvQYpzvOC4XAYZWFLXkK2jqsumUD0fIU5D
	1wyrVfjx+F1SdvctG3rX9sTUjlAplDGGghhHN1f3sjBWzYEpOcnY8nhWHBtcolqSDMLh
	+Zkiikd0PuevgWJuOFpA9Q8IcujAKbZ5d9xeBOuIYH5rnl/G2rLAEJ5vWYjdcECqRiSa
	oG5plmylPwqqW57x0nQcbQAuWtZPebNl2v+hHRuDFJlJqbbjKjtrSUEjsHxnb9+Y0M8w
	BpN6lRhZrQDNUHQuhAaKt2/gZZEIOum6UlIChaxJUobGpoC9tqH+APKN6GaTDB6ehbLy
	iZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=MUz4GX//UoA2oInIaHEMr2QZ+Y0GHXV2vn3bqjyaQUQ=;
	b=MtZ1ZRBVj2fmhPouJpnHZiYBYRlKwB/PDxqaU3quAW9yPH5B8jxx8nynWLZomw005m
	gAvFLNG480h08VHvrnVYKxdGSEWRbMC+hzipa+OpR7XeGeOQf5fWUwWb4NE8nRu0/c93
	4tPGpQG12+ECzGyoC/BzpypXz1zmyI3kPTcF1C5YolWMgZvMMlNfnn5eFfU8KO7FY50h
	qdG16BedhdcZTdkrLHY6AuLWMB+X30AMLfa7e1BJDT1IrEhqD6RbOcNG73zMNCIjtFUM
	XjKqfPElrnfrrUKhYScJscRW7zfTbIVBdhYQJCiANgVrPZAioBqZQyuYgez3XtwZZ9Vp
	EODA==
X-Gm-Message-State: AMCzsaW+0/lnpKPCdBNd8T2QoNWT1z45enNQPw2bCswXTQkwz9JXMIhO
	IV83qdoJtsk8yd5OqKHRQV7Jrw==
X-Google-Smtp-Source: ABhQp+RTN0Vd0NewaSvpCNHdbFhBaD10NiE6PlMAE8nzMw6fH8qIU2i13Emsux2ADbfulsRgarE21A==
X-Received: by 10.101.88.140 with SMTP id d12mr7558540pgu.166.1509721715616;
	Fri, 03 Nov 2017 08:08:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:78e5:dcc3:4839:af44?
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id k12sm803349pgo.5.2017.11.03.08.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 08:08:35 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8a2910bb-d958-60e6-a04d-ce7593c4b83b@gmail.com>
Date: Fri, 3 Nov 2017 08:08:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Fri, 03 Nov 2017 15:08:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/02/2017 05:21 AM, Otavio Salvador wrote:
> On Thu, Nov 2, 2017 at 10:19 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 11/02/2017 07:39 AM, Khem Raj wrote:
>>
>>> Changes since v2: Move to 1.1.18 release
>>> -PV = "1.1.16+git${SRCPV}"
>>> +PV = "1.1.18+git${SRCPV}"
>>
>> Can you drop this, and simply rename the recipe to musl_1.1.18.bb please?
> Why? keeping it on _git makes sense to me.

SRCPV causes package versioning havoc. You can not tell what version
1.1.8+git(hash)  or 1.1.8+git(hash) is the latest on a system. Can your
package manage figure that out?

- Armin
>


