Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 862217D676
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:08:19 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k92so16893230edc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=kkmQAMmr8xkxE/stbwgpwe9GJ4/UGULWsLJpCraJMjM=;
	b=jv8TK2Y56jTGEAcwxGQ7m8Ca7BGbgiohbn3mv4Ndf78YwXyHtjLIfnJ3WcgEI+MZac
	o6JcJ4stGMkpVtzNaaD5ggTbINUq5nqzw4XnYsOHOoCgPPLSRCSTT1LRlYnXlEV9T7iw
	Vzv4HWmCCVl0HuQyX9Z1JbdLNQjN1dE/yrYa1qqgan7s4sBOmrFFZhIyalf+gaCbJDwx
	lt5aPKjNaLoZrjGHLnlWGwNJdrHkNeFO0nqLHBcC3joTNOe33mcOyjJLApKNx67ESXWb
	hvjDRdeK4j1vD/BaE7rYArqMEBFaNMlF4ddgcRqRJo2N00K1l66riAcqcEl1TFHF9TqN
	nbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kkmQAMmr8xkxE/stbwgpwe9GJ4/UGULWsLJpCraJMjM=;
	b=AP9otNjQMgI6K2P3xsnblqc59FmusOMNitIAhzlzRx/aFD5K8Bv8kkZO57FOmqt6fr
	1bT+88eFq80djDcUx4IEC8P+kmAcR7irZrb/FsQLqLc0AOv0qKQSb7hvLNsoDgAz2Sj/
	9jjiBRu9tYPhPhUZe7K1WubkMCwEF2rUWVjUBLm7tu4dpdbWtUQ9yLREssb4dMsczfPn
	peNqt/TNrbYO40sxI2NiiryzubA53RVgzkaDT0dWDUyAcT3Q+yS53LherYiiOv3yCVtl
	voZcS2VtyHQ0S+yGtb3/RUn9HHALa7vmgkMdoKnjLiI5W2Pw8w7cVSfghUDdZaICMNL2
	gPLw==
X-Gm-Message-State: APjAAAVUkFL0Ib495GyOPn3YvReUN6mWquCE3Uz/khMylrJXNB2Mf/gy
	1BcUmEFttrHuZf142HCN3FLFmyMxR7g=
X-Google-Smtp-Source: APXvYqxWaW2hMqrOgbqQIWw6Kz45L9RFOGiGpLkp31SpmV0jKKtPXwLf96rdCiPV8DGEwYVih9TLPQ==
X-Received: by 2002:a17:906:338a:: with SMTP id
	v10mr311312eja.146.1556132899850; 
	Wed, 24 Apr 2019 12:08:19 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p51sm4726561eda.3.2019.04.24.12.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 12:08:19 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190424184711.19015-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj80U3T9YqSm9OduV2zFzjygWb53m8M64uGFynsgh1K2dg@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <a4b459d7-8692-539e-8977-69a37ac00214@oleksandr-kravchuk.com>
Date: Wed, 24 Apr 2019 21:08:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj80U3T9YqSm9OduV2zFzjygWb53m8M64uGFynsgh1K2dg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Wed, 24 Apr 2019 19:08:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

No, It was dumb of me to not check the mailing list first.

Also, good to learn something...

On 24/04/2019 21:02, Alexander Kanavin wrote:
> On Wed, 24 Apr 2019 at 20:47, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> -FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
>> +
>> +FILES_${PN} += " \
>> +    ${datadir}/include/pycairo/py3cairo.h \
>> +    ${datadir}/lib/pkgconfig/py3cairo.pc \
>> +"
> This isn't right (and packaging the header installed into a wrong
> location wasn't right either). I sent a different patch that addresses
> this a bit earlier, together with the rest of python-* updates that
> are now in master-next - apologies for the duplicate effort :)
>
> Alex

