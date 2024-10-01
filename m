Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C5FCE7D0D
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 11:45:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.79548.1727783104490064720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 04:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6x+A/Jb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37cd1ccaf71so2674644f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727783103; x=1728387903; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxTXJPBygMKTiB1dOyJh5U3R9m66ZEOOFazbXSMUEj4=;
        b=a6x+A/JbW7OeX/qadqKcPwv7SjRbl4qpxoftRXIR3UVuLFnzSYnjxxVqnyrYtxRxDk
         Mf0XvKrlwTZn8Opdeqb1ButoaK75Xm/yfT0XnFsgt+0splA7XsArIdmIqi4kNVpraDF7
         fdQvKLrCcgJSu7hPdsWqLTBq00iLmPnt+mwBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783103; x=1728387903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxTXJPBygMKTiB1dOyJh5U3R9m66ZEOOFazbXSMUEj4=;
        b=EysXVZT5pvPQi5qhwyZV9w3gp3fVCPYsQx+U5eTVXltsieFBbhDFM1ITcWJ3r6++B1
         xMgD8d8WLgkkkpw/RKaBTW3SNvMj/mSXrI38Drl7IaD4huKx/xPq4QRagYFcCYcePzCi
         TdTHCjS935kC/DCgiOYypBsCHO37175SMcuI9g6m/pnH+trjNzbqsRyJaU8yQrSqljJx
         kysh51mQ6axZr3gkyO2Aea6DRRs5/w74LVtVEyuKoZHJbJRJ+doCZxA9iClcaJGeqPb9
         edWW27zAGlXj4JFF0hPjL54eC1MRFUCBX061CbXOj/9exk/VOrx+vaTB/rf60+d4VA2j
         hYUA==
X-Forwarded-Encrypted: i=1; AJvYcCXUaO2oS2HBQa8Qn1Xvl5BiBI96MB2uRwnsn5VB1axybR9q2djeAnyJ7A2KUzOOf4qyqgNtLhzWT8ZL+m2i272tsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxS9Oqp4UGbZh66gUl/ARkX+tcIL1yeuyZGsIvjIJ1piC6EyRzw
	lPJMo/kmg1lgdWe2PBA/6B7sy3iq09bjrOFkAVstzUlURDrePn2OO9URCMMrYh8=
X-Google-Smtp-Source: AGHT+IGtRLNgvLwvTr6zVzEi7kAFrCKTx5cnFtGbhRrDs+OGOFsaci+Od+8aUfqI2vsR/S3rLEhS3g==
X-Received: by 2002:adf:cd05:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-37cf289c624mr1749522f8f.3.1727783102790;
        Tue, 01 Oct 2024 04:45:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dd2d3bsm130408885e9.2.2024.10.01.04.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:45:02 -0700 (PDT)
Message-ID: <87ee2add3b3814aa41f6e0b6758dee068a1ab54f.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 6/6] patchtest: use black to format libraries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Tue, 01 Oct 2024 12:45:01 +0100
In-Reply-To: <20240924115503.1599651-7-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
	 <20240924115503.1599651-7-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 11:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205157

T24gVHVlLCAyMDI0LTA5LTI0IGF0IDA3OjU1IC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBCbGFjayBtYWtlcyB0aGluZ3MgZWFzaWVyIHRv
IHJlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxp
YnJlLmNvbT4KPiAtLS0KPiDCoG1ldGEvbGliL3BhdGNodGVzdC9tYm94LnB5wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQ0ICsrKy0tLQo+IMKgbWV0YS9saWIvcGF0
Y2h0ZXN0L3BhdGNodGVzdF9wYXJzZXIucHnCoMKgwqDCoMKgwqDCoCB8IDEwNiArKysrKysrKy0t
LS0tCj4gwqBtZXRhL2xpYi9wYXRjaHRlc3QvcGF0Y2h0ZXN0X3BhdHRlcm5zLnB5wqDCoMKgwqDC
oCB8wqAgODQgKysrKysrLS0tLQo+IMKgbWV0YS9saWIvcGF0Y2h0ZXN0L3JlcG8ucHnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzIgKystLQo+IMKgbWV0YS9saWIv
cGF0Y2h0ZXN0L3NlbGZ0ZXN0L3NlbGZ0ZXN0wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5MiArKysr
KysrKy0tLQo+IMKgbWV0YS9saWIvcGF0Y2h0ZXN0L3Rlc3RzL2Jhc2UucHnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgODYgKysrKysrLS0tLS0KPiDCoG1ldGEvbGliL3BhdGNodGVzdC90
ZXN0cy90ZXN0X21ib3gucHnCoMKgwqDCoMKgwqDCoMKgIHwgMTQ0ICsrKysrKysrKysrKystLS0t
LQo+IMKgbWV0YS9saWIvcGF0Y2h0ZXN0L3Rlc3RzL3Rlc3RfbWV0YWRhdGEucHnCoMKgwqDCoCB8
wqAgOTQgKysrKysrKystLS0tCj4gwqBtZXRhL2xpYi9wYXRjaHRlc3QvdGVzdHMvdGVzdF9wYXRj
aC5wecKgwqDCoMKgwqDCoMKgIHzCoCAzOSArKystLQo+IMKgLi4uL2xpYi9wYXRjaHRlc3QvdGVz
dHMvdGVzdF9weXRob25fcHlsaW50LnB5IHzCoCA0NSArKysrLS0KPiDCoHNjcmlwdHMvcGF0Y2h0
ZXN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxMTMgKysrKysrKysrLS0tLS0KPiDCoHNjcmlwdHMvcGF0Y2h0ZXN0LWdldC1icmFuY2jC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1NCArKysrLS0tCj4gwqBzY3Jp
cHRzL3BhdGNodGVzdC1zZW5kLXJlc3VsdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDY2ICsrKysrLS0tCj4gwqAxMyBmaWxlcyBjaGFuZ2VkLCA2NjAgaW5zZXJ0aW9ucygrKSwg
MzM5IGRlbGV0aW9ucygtKQoKSSdtIGEgYml0IG5lcnZvdXMgYWJvdXQgdGhpcyBjaGFuZ2UgZm9y
IGEgZmV3IHJlYXNvbnMuIEZpcnN0bHksIGl0IHNldHMKYSBwcmVjZWRlbnQgd2hlcmUgb3RoZXJz
IHdpbGwgd2FudCB0byBkbyB0aGlzIG9uIG90aGVyIGFyZWFzIG9mIHRoZQpjb2RlIGFuZCBJJ20g
bm90IHN1cmUgd2UgcmVhbGx5IHdhbnQgdG8gZG8gdGhhdC4KCmJsYWNrIGlzIHF1aXRlIG9waW5p
b25hdGVkIGFuZCBJIGRvbid0IGFncmVlIHdpdGggZXZlcnl0aGluZyBpdCBpcwpjaGFuZ2luZy4g
U29tZSBvZiB0aGUgY29kZSBkb2VzIGxvb2sgbW9yZSByZWFkYWJsZSBiZWZvcmUgaXQgbWFkZQpj
aGFuZ2VzIGNvbXBhcmVkIHRvIHRoZSBlbmQgcmVzdWx0LCBwYXJ0aWN1bGFybHkgYXJvdW5kIGhv
dyBpdCBpcwpjaG9vc2luZyB0byBsaW5lIHdyYXAgdGhlIGNvZGUuIFNvbWUgb2YgdGhlIGNoYW5n
ZXMgYXJlIGFsc28ganVzdApyZWFycmFuZ2luZyB0aGluZ3MgZm9yIGxpdHRsZSBnYWluIHN1Y2gg
YXMgY2hhbmdpbmcgcXVvdGluZyBjaGFyYWN0ZXJzLgoKSSdtIHRoZXJlZm9yZSBpbiB0d28gbWlu
ZHMgb2YgdGhpcy4gSSBkbyB3YW50IHRvIGVtcG93ZXIgcGVvcGxlIHRvCm1haW50YWluIGNvZGUg
YnV0IEkgZG9uJ3Qgd2FudCB0byBlbmQgdXAgZm9yY2VkIGludG8gdGFraW5nIHN0eWxlCmNoYW5n
ZXMgSSByZWFsbHkgZG9uJ3QgYWdyZWUgd2l0aCA6Ly4KCkNoZWVycywKClJpY2hhcmQKCgoKCgoK



