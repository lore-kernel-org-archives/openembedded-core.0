Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B244C731E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 20:12:15 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id g62so45917032wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VtberK0n7jPEMFSSGJSOPUvw7digLe9RCW9ejMGGGjo=;
	b=WgJjEVRw15kWf2OQCG/HtSqYzfEATjV2oRAw2Cr0TZ/6HORKB6hYzOiQ9duyTfAlcv
	vluj3bLvoSspQe7BM1ENJW3rbrH96ZXR/rvC7qOFwyg+KVObd9yo5wTstgyTkLPBIFQf
	tBSajarg3lmd8XkSJaHL16qsJ43Y6aLV8QesgF8VHPhpwB5Krl+BBsBpxtMrsf6VVDxi
	UztoVSs8AyR7pjfDYFWIU0BlVJ/r5EhZrSJYe30z8l41GHLKTvSv26UYYdN79HfxRnpg
	K9UYfhuST3ARzjgLE1wON4d1V1rK9P6WZO7mQ4EygIh7bHNUfaFRKeXwsfWnag5+0Zam
	VLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=VtberK0n7jPEMFSSGJSOPUvw7digLe9RCW9ejMGGGjo=;
	b=bLxy0PCFT/EX6+UZAtJTLykXw7sP/BbLF1Bo0Nty+8GjOL38N2UKm2p6F1ZOBNyq9t
	pKopbKEX+4WF7YvV7WqG1q/n5ungy60aiy46L1BpkEMHd3mckCmIl3a/2/oBlXfKIQGj
	qbEs8fGzM3sPeEUI0gKOHgcNLGtiffpz0BcqzfcudaJ4niaQyXFb/w69k44lVX9Y6tHZ
	HCC4x05GLvL6LfC/v9e/jaKr/CcS9amPgOluaizA+tUlvSdMAcXNLmU3Ny83uoIq+3ip
	KOJbi/myVIGSSixcOSgjSE1PZ4ckJ/kTm1TViRVYNDv0JL1U97I/PWDemB+Lkcsi5qAm
	P5Qw==
X-Gm-Message-State: AG10YOTwsps8lC+9lVxcozuKXLOFE04lU4kD423PrcdAKtcMs7bkKELNgGnATaHgpFqFjELsvF/Vy1cCdPqocQ==
MIME-Version: 1.0
X-Received: by 10.194.63.242 with SMTP id j18mr10819264wjs.114.1455826335819; 
	Thu, 18 Feb 2016 12:12:15 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 18 Feb 2016 12:12:15 -0800 (PST)
In-Reply-To: <CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<1455823285-32028-3-git-send-email-armccurdy@gmail.com>
	<CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
Date: Thu, 18 Feb 2016 12:12:15 -0800
Message-ID: <CAJ86T=Wby3W7ZakvBJN_rO2VDXfen1_2fPOU-MygPHg4=4Yv1Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 20:12:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 18, 2016 at 11:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> IIRC this will rename the resulting package (because there will be only one
> shared library now).

Yes, you're right. Previously "libsoup-2.4" and becomes
"libsoup-2.4-1" when the "gnome" PACKAGECONFIG is removed.

> that will probably break on device upgrade-path
>
> I'm not sure if someone still cares about upgrade-paths.. there are too many
> issues going in unnoticed.
>
> On Thu, Feb 18, 2016 at 8:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> libsoup-gnome is entirely deprecated and has just been stubs since 2.42.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
>> b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
>> index 865c1d7..a12f869 100644
>> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
>> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
>> @@ -18,9 +18,8 @@ S = "${WORKDIR}/libsoup-${PV}"
>>
>>  inherit autotools gettext pkgconfig upstream-version-is-even
>>
>> -# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.
>> Enable
>> -# by default but let it be easily disabled.
>> -PACKAGECONFIG ??= "gnome"
>> +# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.
>> Disable by default.
>> +PACKAGECONFIG ??= ""
>>  PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
>>
>>  EXTRA_OECONF = "--disable-vala"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

