Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 676A86E65F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 17:30:00 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id 20so206905964uak.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NuFDpZcTL+3vFWM1w8mQ5GYld37ca6R+dkjnc5FJzGM=;
	b=XYvin9bGQ2lrmE9/e4M8NBjIR5eCicVDqtKASPD/vQ0vPQ9Sw+KUsWYPY1bmySLXRZ
	Fz9nKCwNumX58QRNhLOwEnlmCRWWzQMF/T3cTGAOQ3VGDyQr2FjPoW12X9BGusJ7BlVT
	YWkN0wJ8FsUI9Ucwue5TMOeTeO7yGl0tYgZPRGDjX/SCdERCy80pS9jpoYK3b9rAwRqz
	dPTh9zuiCo2eKkyqEU+bpNgSUnH2FJh9XEVVuEEP9sYu2DR3DuJRJB8JeFixjLxQrKCU
	TlGFbQGd+jE0HjsxBYaLFdMwMSsCDWBvp+iL652LpoaYO/W+Qp59BVaW2+6bm9yito38
	yRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NuFDpZcTL+3vFWM1w8mQ5GYld37ca6R+dkjnc5FJzGM=;
	b=mr95pJJv3QRX8RXk9EV90yRR/MHMheycog5VCEI/X2bIn54DxehSUdqehf2zwfJDcv
	Z+EiFMkMc+v817z1n32o/jLSNYCH33tFodK4TvBZovkU3PLk1+XRThLdoiUc37uJHVQi
	9n3VbdP4k/0hahmmQbh3YUPIDsujicG6MkcqM5wp4ArqoRm/0IXfjLM1frGvXUCSVkBw
	z8jfUsJ/YJYgAnm2F5f++pY9PNyDXXfYKBGuBDBzffTH35PvNsmyTRSRjy4wCICMm5O1
	MbtVYwamRcbLAtEqpClRp/eTczi0dtnywR5CZoUesZHN2V18mEobDm5rFotpMRC+ogE1
	zpQA==
X-Gm-Message-State: ABUngvcoFcVTPr429TWmFPSSGb2z+cZ3EVQirJI2cKOe9XZeHkgTTplEgCgYwlYo4KP/2Q==
X-Received: by 10.176.80.195 with SMTP id d3mr4182438uaa.125.1478799001107;
	Thu, 10 Nov 2016 09:30:01 -0800 (PST)
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com.
	[209.85.217.175])
	by smtp.gmail.com with ESMTPSA id b7sm1277850uab.15.2016.11.10.09.30.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 09:30:00 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f175.google.com with SMTP id b35so206802828uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 09:30:00 -0800 (PST)
X-Received: by 10.176.6.233 with SMTP id g96mr4154026uag.97.1478798999731;
	Thu, 10 Nov 2016 09:29:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.151.16 with HTTP; Thu, 10 Nov 2016 09:29:59 -0800 (PST)
In-Reply-To: <CAJTo0LbQYQwY07evm3Re4x2_Bu-6AmcCW3_=GuAWGOJxGxFQ9A@mail.gmail.com>
References: <20161110121414.12937-1-otavio@ossystems.com.br>
	<CAJTo0LbQYQwY07evm3Re4x2_Bu-6AmcCW3_=GuAWGOJxGxFQ9A@mail.gmail.com>
Date: Thu, 10 Nov 2016 15:29:59 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoQNOgTWgsW=ZTDvU5hBgjCGaF_=YWcA+rjhxoy5wVXfg@mail.gmail.com>
Message-ID: <CAP9ODKoQNOgTWgsW=ZTDvU5hBgjCGaF_=YWcA+rjhxoy5wVXfg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-native: Extend RPROVIDES list
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
X-List-Received-Date: Thu, 10 Nov 2016 17:30:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 10, 2016 at 3:08 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 November 2016 at 12:14, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> @@ -46,6 +46,9 @@ RPROVIDES += " \
>>      python3-compression-native \
>>      python3-core-native \
>>      python3-distutils-native \
>> +    python3-datetime-native \
>> +    python3-enum-native \
>> +    python3-terminal-native \
>>      python3-email-native \
>>      python3-importlib-native \
>>      python3-io-native \
>
>
> Is it time to extend the manifest script to write this for us?

I am fine in doing so but this fix is important for us and it is
trivial enough to allow backport for krogoth and morty.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

