Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B8DCFA443
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:38:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.517.1729697900422265902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UDPxTcVV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso5546944f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729697899; x=1730302699; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCgRFtH3NDvyYHpatRmrN6FBjBDPnsCiTTV5bElJUoM=;
        b=UDPxTcVVi1tftbcLpRHcvDESmh9u7r93i0FxNHrtXs3Y4WSu7QCaR2cP+7YYaVKg+0
         1ER86MY2G4p48YE5rCL9Yv6UXb4D48Lmqdt58E2nW/GdRSY5Yrez6VEepPVlUxm0VNpr
         VVA0vZNamUnN6nqEutQxXdMx9Egqv88c8kZ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697899; x=1730302699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCgRFtH3NDvyYHpatRmrN6FBjBDPnsCiTTV5bElJUoM=;
        b=u6mIY+J22mOcjwGvqKvw/iv2HUWKyYCzknSlFjOOiG1KKvnXoN0MkZxJFqYH9hd5Sz
         e2MUAbPFAIPSqd13LhzLVzZv2fZdElpKe/HPARwgVxRA7y571lLvvAF/n62SmJISnYxU
         3INCpObT5WBk98QGu2aKpV/WY7/N/dB+d6H8tKMMln8b1vjPGqCc07nkHraXHlljF4dt
         0kl05er3lruy4C+0+WJLuzIw4g0nsPelELYlGxBZTMUZeKEFQSmpFduL7HfkXI07whaP
         qcbdXniEMSD+JDI7yC6KrY2VVS/VgA2fqi5JjmLk3smtsNM3vx1Bp0Ad17m+VnD8HAXW
         y2yg==
X-Forwarded-Encrypted: i=1; AJvYcCXV5slbc0jT1tKInPfBsqpG7Bkn3p+xceroQQQwNSp97jVA2jAxHrHkI6eJor22dOxpaIKWcdp+5M4SYEeoAYKjOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4maATS1I9A48NInB/Bv7rSv6jBVOSc0hf+lynQoPaQCDciyLT
	+7D243773MSoje72PmEhQryKUG0fLo75b9Lakicxb3Lve24FmKS7por4EUbAdefMAJuK3oi/jDX
	c
X-Google-Smtp-Source: AGHT+IEaZCCk+PRvAvoBUsn+1/vIquRA3UmFUz1z2s70ndGSTvsvD1+gnG+SvsiYglNprUErpvbfzA==
X-Received: by 2002:a05:6000:83:b0:37d:4ebe:1644 with SMTP id ffacd0b85a97d-37efcf8d3afmr1934041f8f.43.1729697898705;
        Wed, 23 Oct 2024 08:38:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58cd2sm9151183f8f.55.2024.10.23.08.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:38:18 -0700 (PDT)
Message-ID: <0be330e10f6ac9dc2b18e284e674f201506a9fc6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] busybox: 1.36.1 -> 1.37.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2024 16:38:17 +0100
In-Reply-To: <58fc2ed7-17d8-486e-9b0e-d4bf8588e542@skyrain.eu>
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
	 <20241019160221.47501-1-andrej.v@skyrain.eu>
	 <f7b1d43d-9d5b-44d5-b7ba-02d6efeb6780@skyrain.eu>
	 <b75ccaa35901e5b4cc42d486eb56723f682f8f61.camel@linuxfoundation.org>
	 <58fc2ed7-17d8-486e-9b0e-d4bf8588e542@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206253

T24gV2VkLCAyMDI0LTEwLTIzIGF0IDE3OjA5ICswMjAwLCBBbmRyZWogVmFsZWsgd3JvdGU6Cj4g
QWgsIEkgc2VlIHNvbWUgZXJyb3JzIHRoZXJlLCBidXQgaXQncyBsaXR0bGUgYml0IGludGVyZXN0
aW5nLCB3aGlsZSBJCj4gd2FzIHRlc3RpbmcgaXQgb24gImNvcmUtaW1hZ2Utc2F0byIgd2l0aDoK
PiAKPiBCQl9WRVJTSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAiMi45LjEiCj4gQlVJTERfU1lT
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICJ4ODZfNjQtbGludXgiCj4gTkFUSVZFTFNCU1RSSU5H
wqDCoMKgwqDCoCA9ICJ1bml2ZXJzYWwiCj4gVEFSR0VUX1NZU8KgwqDCoMKgwqDCoMKgwqDCoMKg
ID0gIng4Nl82NC1wb2t5LWxpbnV4Igo+IE1BQ0hJTkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA9ICJxZW11eDg2LTY0Igo+IERJU1RST8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAi
cG9reSIKPiBESVNUUk9fVkVSU0lPTsKgwqDCoMKgwqDCoCA9ICI1LjEiCj4gVFVORV9GRUFUVVJF
U8KgwqDCoMKgwqDCoMKgID0gIm02NCBjb3JlMiIKPiAKPiAKPiBTbyBJIHdpbGwgdGVzdCBpdCB3
aXRoICJwb2t5LWFsdGNmZyIgYW5kICJjb3JlLWltYWdlLXNhdG8tc2RrIiBhbmQgCj4gaG9wZWZ1
bGx5IGhpdCB0aGUgcHJvYmxlbS4KCkxvb2tpbmcgYXQgdGhlIHBhdHRlcm4gZW1lcmdpbmcgaW4g
dGhlIGZhaWx1cmVzLCB0aGF0IGxvb2tzIGxpa2UgYSBnb29kCnBsYW4hCgpjb3JlLWltYWdlLWZ1
bGwtY21kbGluZSBsb29rcyBhZmZlY3RlZCBhbmQgaXMgc2xpZ2h0bHkgc21hbGxlciB0b28KRldJ
Vy4KCkNoZWVycywKClJpY2hhcmQK


