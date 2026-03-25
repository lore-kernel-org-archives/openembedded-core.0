Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56418106B535
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:13:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21928.1774444431158249413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iZKwtrGR;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2342918f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444429; x=1775049229; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wcWpQH00e84UgLeP4IHfE18Lr9PClSq5p/wCDbBl5M=;
        b=iZKwtrGRjFxgE5DIoLaFfs+8HxLONLiG9GvgcTggaB4bh90MBSem1iuBu6lu7nfGmD
         POrQrW253G0MmXHfUqvukhBHCt+6WPY4HWsg0J05Mg5kqvx1M6FgeY8gLOxHFNI9fphc
         SJ6snFxao1FfLePNrz8fFXUUW7sMTXkEu6t5BRnbn042illudl1wIPcB6X+o/O+uHbLk
         1TKUUZ4LCxLvvJGuby5RfCFmM937gOYhCtWXRs75oEAk412Hi6gA8xO+jhsahgAxIWON
         KCXvRynxf2qXe4OXixdZD5MjpD/zBaMmaun7BCD/yhZ6c/ULYBm9wQpDQ6Jqi6lwlwna
         dhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444429; x=1775049229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wcWpQH00e84UgLeP4IHfE18Lr9PClSq5p/wCDbBl5M=;
        b=W0Srq9a60eDaDG7Nhru/MdsGGHGTBrTGzn72RXgRfMVkD5Qz+ExOs0e09tHZ8725Q8
         dSsgXu0PB0QBfzTWV15dk+S/R6WYCKzQwUGFDUqyC9OVabVRVbrpCBmgPcPpXVaDrpdn
         6/SJEwd3nWPPdFto0Ab2wOPjp4tgmmFDz2eJXt+UT1JBfSez64t6cm4gWoUaHaKm+kWg
         wgXhcX6sCnfPYyxT2CtJZS75VlvG82ClVLfL4xUtPLhsEfYKDp1cUmP4VuBSwF+mldUo
         QtaxCisQlQ3xyzi4orPKwdmnjJk1u8BjP1/5nGGTyKlmxBM9TO0wZBDL2YNKYbdLPXOk
         bciQ==
X-Gm-Message-State: AOJu0YzdtpDpy6UV4s9cI9Oi+tsrxjfppCZewiXB7XhWc0h4afvIIqNM
	9hewo913goze/jPWRe4jBceQREDoBmR85EfHpWpnzGvoRjmebY9bNdQ2koZ0pg==
X-Gm-Gg: ATEYQzz0lnAllIi2IyLO4BA4UZssn4M3sYFp/XgGFXiU1qaeepUtPfmechRdGdOe+mt
	hoCcRgXWU38C56hq3RpVwdozzi/LNaBAg7v7VSST6W1/zNpTtFS2OOqxsAHvu+s/9dIL+LkKZcI
	K5o45C0p/oi4WYV4/0YKXNp/MlJR9tIwxbcaPk/roNmHxnmRpFr8+IUtJspjXJWuigL+EVDospw
	EMsyJCCCzh5S4wbdgKcOYRLK1O6ecbtSd+O6t4202ZX7PKDIUtLMMjaIfekdOwKjCt77cCMLJ4S
	ZM2KLfwFMVJ9uQ+Rd4Tfp+C+Ro6/UvoP1x848+9TY1R0c+6JOAnSfk1EQqOH5SMweUneZuRHlMC
	a4bqufiiTng1ITxFxtK0aDX6suWAdDhzBn+W+INsPvHBOyXv8pTWjK6o6QYVUuO/JitwL4qVrB6
	w/rHBWQbGE6hTsZ7ymymg06vTB7QrS/47mDJyjlOJVq2U966uh7q9S8UVeGAErI+OS7g==
X-Received: by 2002:a5d:64e7:0:b0:43b:5192:88cc with SMTP id ffacd0b85a97d-43b88a3679cmr5003241f8f.46.1774444429315;
        Wed, 25 Mar 2026 06:13:49 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8de2fc12sm4770953f8f.21.2026.03.25.06.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:13:48 -0700 (PDT)
Message-ID: <5bc1065a-005c-4219-bc69-e191e6be3f78@gmail.com>
Date: Wed, 25 Mar 2026 14:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC][PATCH 00/14] Support Python freethreading
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin
 <tgamblin@baylibre.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
 <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233910

2026. 03. 25. 14:01 keltezéssel, Bruce Ashfield írta:
>
>
> On Wed, Mar 25, 2026 at 7:31 AM Zoltan Boszormenyi via lists.openembedded.org 
> <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org> wrote:
>
>     This patchset allows turning on Python freethreading by using
>     a new DISTRO_FEATURES setting:
>
>     DISTRO_FEATURES += "python_freethreading"
>
>     and optionally:
>
>     DISTRO_FEATURES_NATIVE += "python_freethreading"
>
>     The change to python3-dir.bbclass is crucial, as all python module
>     build helper classes rely on it.
>
>     I also added native variants of some settings because another
>     series against meta-openembedded is needed to complete this one.
>     In that, the change to the fontforge recipe relies on the native
>     setting for setting BUILD_LDFLAGS.
>
>
> Looking at those other patches in the series, they don't seem to
> be conditional on the distro feature.
>
> Are those changes valid for a build with and without freethreading ?

Yes!

The main change is in python3-dir.bbclass, and the recipe tweaks
are just adaptations to the fact that only ${PYTHON_DIR} is needed,
not ${PYTHON_DIR}${PYTHON_ABI} from that point.

I was thinking that the introductory mail stressed this enough.

FWIW, less than 30 recipes was spelling the latter out in
openembedded-core and meta-openembedded combined.

> That's the type of information, along with the benefits of enabling
> this would be information expected in a 0/N introductory patch.
>
> Cheers,
>
> Bruce
>
>
>     All of the changes included here were successfully build tested,
>     except for the gdb-cross-canadian change. That one failed, but
>     it's included for completeness.
>
>     Quite a few of python modules were build tested for native and
>     target builds, including python3-pytorch from my meta-python-ai
>     with reduced RDEPENDS because e.g. python3-onnx there failed
>     to build with freethreading enabled.
>
>     All in all, this series at least allows to get things going.
>     Though maybe not for Yocto 6.0, as it's quite late.
>
>     Best regards,
>     Zoltán Böszörményi
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#233874):
>     https://lists.openembedded.org/g/openembedded-core/message/233874
>     Mute This Topic: https://lists.openembedded.org/mt/118499141/1050810
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>     [bruce.ashfield@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


