Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id B424D78A84
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:46:21 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id w38so13194639ota.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=VsLLewmbIk0z6ZnvpadBStWQSSlieYs3FlZexiSHOlA=;
	b=JsrcBnaKepSjigyuoUyuYHKeEeJmC3LVNZHLzF5d9weffJFMa8DDzQk6DESgk4GQ1d
	6q5/c9jFCUR5zf750NBzKZf5vBRh0ofqXBxp6OkofzL17B368yDTLii1kHinSTvG94L9
	dlg2bl8GOxv7xjHXgA5nxQwJhI+zO4lfc84m5V1e5MeYlqXV3qUhJzgIuRMGax1mv7no
	EQNwhQU6gDkGPj8USGkvxX9pFoFg1zQnOrCVasEALh2vOMPBX1+/liT8Lr4IeaXpk8Dc
	e0P65U6EdL7G5KL8RYjSx/9N49cEMOVdOi0DAdRBePX04oMEsTkJ4Pqf+UaNBiiwKWm9
	3LfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=VsLLewmbIk0z6ZnvpadBStWQSSlieYs3FlZexiSHOlA=;
	b=ebE5MagekmYWrAFH4TpyAbEZR7wvlajlzNxChfFCQ2nBmATH/orGPV/OmkJN55PXiA
	hZN4U6aS+QiedaeDGsTpw4YP8VwPNgpiKQIL5DLn79mMO2cWM6NiEKOZJ0PsHvE5E2ok
	OE6uYCRjXWYucBMg4QJeqGR70p3/CC9v3h6TpwzgyfDsbiJQrLA4L0RTjYJTG7bzxTPf
	743nVYbuPCvTfiMzeEQ+Soq3mEGPEf4oi8UGwLbkvh0SdUtrEklYeNyM6NdvqX1bqj5p
	iFqzTYiqo8YBqaQe2B9GEPFqSt1AxeU4rCd9XIG4Azhv1byIiLOLuRq3tCEghzqMkYWj
	O1yg==
X-Gm-Message-State: AElRT7HpjjVpHME1UHMF+BerB46BGdAqbNo474GlfUuoqzwOK0hYoq/2
	EntW4Sx7HN2W7IgsfFjpYnUgO5Hf
X-Google-Smtp-Source: AG47ELt4KpAidLQ6sJKTEu0BebhFRYmKiKKKPJjmJ6//sVZ8KbvmAkMvHAKM0Hh/yCiIKosmUR2w0g==
X-Received: by 10.157.45.117 with SMTP id v108mr8436834ota.92.1520196382391;
	Sun, 04 Mar 2018 12:46:22 -0800 (PST)
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com.
	[74.125.82.171])
	by smtp.gmail.com with ESMTPSA id p57sm6256065otd.7.2018.03.04.12.46.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:46:21 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f171.google.com with SMTP id y11so13225419otg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:46:21 -0800 (PST)
X-Received: by 10.157.63.184 with SMTP id r53mr8560825otc.168.1520196380871;
	Sun, 04 Mar 2018 12:46:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Sun, 4 Mar 2018 12:46:19 -0800 (PST)
In-Reply-To: <CAMKF1sp5tRPs7yB9bCZShJnozK_cHTskcSSTUP-=Vag72sZZRg@mail.gmail.com>
References: <20180302203314.32737-1-matt@madison.systems>
	<876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
	<CAGgRHJoNhQTyVN7ww5BAoQLs1GPkxO3rsdujLttH8V-84vFiAw@mail.gmail.com>
	<CAMKF1sqZr+tBB9wVR_aVp0U8X2v25_LX1fuRHSaH=JqAiOUPmg@mail.gmail.com>
	<CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
	<CAMKF1sp5tRPs7yB9bCZShJnozK_cHTskcSSTUP-=Vag72sZZRg@mail.gmail.com>
Date: Sun, 4 Mar 2018 17:46:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpRAUwaUysuOVC7rWq1ZdXDAzH31L2YRAt2Dp7u1MoNkA@mail.gmail.com>
Message-ID: <CAP9ODKpRAUwaUysuOVC7rWq1ZdXDAzH31L2YRAt2Dp7u1MoNkA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sun, 04 Mar 2018 20:46:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 3, 2018 at 11:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Mar 3, 2018 at 2:45 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Sat, Mar 3, 2018 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sat, Mar 3, 2018 at 9:44 AM, Matt Madison <matt@madison.systems> wrote:
>>>> Since it looks like I'll have to do a v5 on my series anyway, I can
>>>> pull in that backport for the aarch64 issue.
>>>
>>> sure,  I would suggest we keep 1.9 around as well.
>>
>> I am against. Go is good to provide backward compatibility and keeping
>> both just causes people to delay the update. We have some time to
>> April release and thus any regression will be ironed out. Possibly
>> wait until 1.10.1 is out but keeping two releases I am unsure it is
>> needed.
>
> Your disagreement is acknowledged.
> There are larger systems written in go which haven't moved to go 1.10
> and I know for sure influxdb and grafana are not working with 1.10
> and there might be many more real world programs which will be in same
> boat. This is no different then what we do with gcc releases where we
> overlap them for couple of releases to smooth out transition.

I understand the need and I see the value. The GCC is harder to
upgrade but problems using newer Go toolchain does not happen very
often and likely are caused by a regression on Go itself.

As I said, there are two options:

a) wait for 1.10.1 release
b) keep 1.9.4 around

My preference goes to (a) as I prefer to not include 1.10 now with
those known issues.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

