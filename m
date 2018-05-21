Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 27FDF74DAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 13:45:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a22-v6so7114742pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 06:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z/0RJViUv/+4YP0RmQNoYx7Z/sUCN+w4w+beZzQwc/o=;
	b=QARE5QtqA7tw+up9DbE2Ua+aBZ56engczClLA8KpLtlHLgQnsO0tHpPOuA5LH8FVKw
	x7t0XI7byXKwExtElGwqqv9USyro0S42bBcFKPsLRVJNYHJkffUhTdx/ldQquxrmWGmc
	ZLKQxzWvU8PGykagYw3xjdkMVHkJyONFt887uWP/cY/TIZw5ip+Xz7APNzbxrBtXppRW
	O5wRfnJzEhGHRKS2v1r1dV1aJDGeSChIOiDEGakd4xj/Qnjh/HPxFWF7Mtn8FnhZbE2U
	YNSR3huJ7xHtvGj5Q5ZQUUmiQq3XLpJbyouG950cMZ/Hm8VMZg2/Us795K5khhSpZg7R
	PXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z/0RJViUv/+4YP0RmQNoYx7Z/sUCN+w4w+beZzQwc/o=;
	b=Md9Q82T+Ib6cUsO/IVPsH8qBBgr8g4tiYfBs0Ciw2/F7SVbpvNyeb2J8iADIKxHwE6
	gyDUElG06IV4ILVhoCrwNeaEQcc+hXSXn41nM6aex/8YDPljItmJad9iuB6BoL+5Hv3U
	kimCiw+CO8Dw4PD3bwXKvJHsB37pJDckn6X5RchM5G6oPw8R6lKJU40INa/RJZpsm8Wu
	+ePUAwUV/sjb1+F/dY5olXsfgbN/5PVAVXjbPbAw9UrdopeESUgfkNop+14CfHLoWtgu
	2R8+sIjYVjlHbMvI1+ldcYYPyK2gp1uHBcfm8C9JwGwB2xAo/vmxY7LvplZivd3veKuc
	lG/Q==
X-Gm-Message-State: ALKqPwepeJpA1uZHp0T4Tzs+j2/P/i6h+LWYtcXD93CFrJ3mCVcTIae1
	0Oqu0w/B1kB1aG8kkeSZlh5ec7CLF89F7EOVCk0=
X-Google-Smtp-Source: AB8JxZpw7qkPJ+UJZGmZSwGnHzte2WWA+sgZ9B0B5vd/8c5TRmn9irlGZbY+zBvyDnOytpmozYli0ykQ13C2gcicyLw=
X-Received: by 2002:a62:74b:: with SMTP id
	b72-v6mr20083089pfd.133.1526910302829; 
	Mon, 21 May 2018 06:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Mon, 21 May 2018 06:44:32
	-0700 (PDT)
In-Reply-To: <CAJTo0LZdLBNX5p-=2YFj-pJ2m=KHO_MXRD9UVj6L8SuqgSHOdw@mail.gmail.com>
References: <20180520220442.16092-1-raj.khem@gmail.com>
	<20180520220442.16092-2-raj.khem@gmail.com>
	<CANNYZj8nv6EDkp46yJjxqBQs3jRZcTFeP19e5uKA_ye0a0JH6A@mail.gmail.com>
	<CAJTo0LZdLBNX5p-=2YFj-pJ2m=KHO_MXRD9UVj6L8SuqgSHOdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 06:44:32 -0700
Message-ID: <CAMKF1sr9RSK_no6D1saKYW4C6GjE5Zwjta+fQPYooa3XYF2TBg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Mon, 21 May 2018 13:45:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 3:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 May 2018 at 07:07, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> 2018-05-21 1:04 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>>> +Subject: [PATCH] soup: Forward declare URL class
>>> +
>>> +This helps getting away with compiler errors seen with clang
>>> +
>>> +/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
>>> +error: unknown type name 'URL'
>>> +    static std::optional<ResourceError> checkTLSErrors(const URL&,
>>> +GTlsCertificate*, GTlsCertificateFlags);
>>
>> Thanks - gcc has the same issue. I'm not sure how upstream is able to build.
>
> https://trac.webkit.org/changeset/231876/webkit

yes its fixed in master Carlos informed me offline

>
> Ross

