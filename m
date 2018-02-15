Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5C28D71BFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 18:56:44 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id s5so720679wra.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 10:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TwcMjmkwdczPplL0AI+pbVqAf20fFsg6iVsbCBcjgjk=;
	b=IyCJoWMMdcXp6O/wu8+eJNQAbs26E8R4Baaz6QQRnZrpUCzwBZpAjC6sOsqAvbnTDB
	SvV9faw/QY9F7Ex/+FhEQETiLt/lNZvFwA24ZdgS0AaY13xbolX1MBJAXegY9LUiJlbW
	6Z8pKCR42KNrFn/mUGhd/5yZz05vVV2iI7V9gvuVT/EFUYdPmrcXzZOl9AUkr8Ev+lEz
	hW6Jj782xCYeghS9tNv5ZUFUdy7bW+7l8HcDRCLgWkHNf69YNPmOkPjmMya/UMQrvGZl
	G8qu/+dbu/Agj7xgett1o5Ikeb98m5zLY0phl/2qzS/ffkgQgBgRuIlkwDL+jd91yoeu
	5sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TwcMjmkwdczPplL0AI+pbVqAf20fFsg6iVsbCBcjgjk=;
	b=VfQGcN4VIQFwNfT+ua4WYuDgVhfYS2jvusu1BToRL8RS8e4RWZ575VLLusrnbezvME
	Px2eD7BBEQIg/DXCknlkeQzqgtTZwyeyCpfOAaAXPM7vT8JS8KVoz+C8l3PAkqvKPI4n
	DbyrxkGFTxoaAx5MG3HeIFbwZWNdhYnJU1KTgEeySnw5NUNOhcb+TW2qn9BiLhdTy+Fa
	OjtcHmJLidMXOakpKy4i96ySc8znIxKFgEW0lwLIly9Y7q+QOM4Aku+Q/dT/H4sPJjCQ
	bIrSUnkAGo2EJM+1EV1O5+L983bQ3IcPiLf0rOtSHYNguVuDaClgSSBPQC4d1cf02Nj1
	mi5Q==
X-Gm-Message-State: APf1xPAoVAg5gPpl9Pm/Np5JhQWJJZ+VpArknDmzX4PhnGYOtlARTiyb
	S6eWmsp9xjWUrdAFCCcgOmNeRvEkL6HYrwmZwIU=
X-Google-Smtp-Source: AH8x22486XzDzioIRTDGHDRvzHsfHAYhHYDSo+FZs3KBRhBNeauOFu950i8pzL3gp1mVDtEDHemJiVhZA1KtAZSaOUg=
X-Received: by 10.223.164.158 with SMTP id g30mr3217247wrb.62.1518721005921;
	Thu, 15 Feb 2018 10:56:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.193 with HTTP; Thu, 15 Feb 2018 10:56:45 -0800 (PST)
In-Reply-To: <1518719422.24236.164.camel@linuxfoundation.org>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<7224a2768d18f72afc37cea4b47718510d54c8b7.1517798422.git.liezhi.yang@windriver.com>
	<1518719422.24236.164.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Feb 2018 10:56:45 -0800
Message-ID: <CAJ86T=XjNB--HMxxByLsYaw1NLdz325nXH0CyBwwENynHDJyyQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] time: 1.7 -> 1.8
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
X-List-Received-Date: Thu, 15 Feb 2018 18:56:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 15, 2018 at 10:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-02-05 at 10:41 +0800, Robert Yang wrote:
>> * Remove debian.patch which is already in the source.
>> * The license is changed to GPLv3, I will add the v2 one
>> (time_1.7.bb) to
>>   meta-gplv2.
>
> Could you point me at that patch please as we'll need to merge this at
> the same time to avoid test failures.

If there are going to be time recipes in both layers, maybe now is
also the right time to merge time.inc into the main recipe (rather
than duplicate a time.inc in two places... or worse still try to make
both recipes share one copy).

