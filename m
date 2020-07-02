Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.4471.1593718470923289671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 12:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DI+oWbMO;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2246; q=dns/txt; s=axis-central1;
  t=1593718471; x=1625254471;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=laCCZEfhUaQU4LAIdxrJWI0gFE4rkQkGhpPILpeLtd8=;
  b=DI+oWbMO0UdO5Z7wGq5v2haxAiuY1v0zOEaKpgRKa3veBFcO9dWfrUxN
   qG7HIrZuYAZ3GZwltlIAxAsFcKg8w6zPTxY1mu7CYLrKxEwB3i9Zd+MAf
   ey6baZmMAuSCde/4z05ViO+fyNOdGlbhAbpw1wMtulHY9jxZpU8d1CSz2
   UEhDGr2dfZbL+EuYCT9WVcod5YySV2HmV6LjW3JlM8up3gFDjg0vgOyMA
   WI5+YmYgKooI2Z0OH98XkAEsfw2plof5JFjGOldAmAh4oCp8rqRd2AbBT
   TCMsNvpBAP6at1gT1nI8pIxvJ3MGye9Agng5hIET4s+yHWnkx8NuXvxKK
   A==;
IronPort-SDR: fGmPcJYKnAGM4CzxM97RQlhtTj6JNPHZr0iXvy5UpCef/pSKrbTQTr/PDEAZ9YF4Q9mBy0w9Vd
 xqskolZi537CERqSQ821SIWKt/mYRidhVVhZwA/pnJBUpjH09Iw4D/vY1Rwz4zRvWsaByd3C99
 9auQbk9/aBQ1Fp++4iOqaqGFDXxyWpW1DkWiJNO6SR7sjmRMPpjGAaRK955g773PaECIxMAbkD
 RbACySqJWjmYQSoSGSPUcNnJvYAc3+oqAvuUZ5VqzRw1gLxTcChB2lfply9tLaskzgDcgZHbHv
 VW8=
X-IronPort-AV: E=Sophos;i="5.75,305,1589234400"; 
   d="scan'208";a="10441285"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjNdIE1vdmUgcnBtIG1hbmlmZXN0IHRvIGl0cyAuLi4iIGFuZCAyIG1vcmU=?=
Thread-Topic: =?utf-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlt2M10gTW92ZSBycG0gbWFu?=
 =?utf-8?Q?ifest_to_its_..."_and_2_more?=
Thread-Index: AQHWUKeUUMEeH49VmkuCOYiQhslZfqj0rjDr
Date: Thu, 2 Jul 2020 19:34:29 +0000
Message-ID: <1593718468896.73516@axis.com>
References: <20200702192906.6301-1-fredrigu@axis.com>,<20200702193249.20801.25821@do>
In-Reply-To: <20200702193249.20801.25821@do>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: Fredrik.Gustafsson@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2luY2UgSSd2ZSBlZGl0ZWQgZm91ciBmaWxlcywgd2hpY2ggb25lIHNob3VsZCBiZSB1c2VkIGFz
IDx0YXJnZXQ+PwoKL0ZyZWRyaWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpGcm9tOiBQYXRjaHdvcmsgPHBhdGNod29ya0BwYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9y
Zz4KU2VudDogVGh1cnNkYXksIEp1bHkgMiwgMjAyMCA5OjMyIFBNClRvOiBGcmVkcmlrIEd1c3Rh
ZnNzb24KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKU3ViamVj
dDog4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlt2M10gTW92ZSBycG0gbWFuaWZlc3QgdG8g
aXRzIC4uLiIgYW5kIDIgbW9yZQoKPT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogIlt2M10g
TW92ZSBycG0gbWFuaWZlc3QgdG8gaXRzIC4uLiIgYW5kIDIgbW9yZQpSZXZpc2lvbjogMQpVUkwg
ICA6IGh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvc2VyaWVzLzI0OTcwLwpTdGF0
ZSA6IGZhaWx1cmUKCj09IFN1bW1hcnkgPT0KCgpUaGFuayB5b3UgZm9yIHN1Ym1pdHRpbmcgdGhp
cyBwYXRjaCBzZXJpZXMgdG8gT3BlbkVtYmVkZGVkIENvcmUuIFRoaXMgaXMKYW4gYXV0b21hdGVk
IHJlc3BvbnNlLiBTZXZlcmFsIHRlc3RzIGhhdmUgYmVlbiBleGVjdXRlZCBvbiB0aGUgcHJvcG9z
ZWQKc2VyaWVzIGJ5IHBhdGNodGVzdCByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBmYWlsdXJl
czoKCgoKKiBQYXRjaCAgICAgICAgICAgIFt2MywxLzNdIE1vdmUgcnBtIG1hbmlmZXN0IHRvIGl0
cyBvd24gc3ViZGlyCiBJc3N1ZSAgICAgICAgICAgICBTaG9ydGxvZyBkb2VzIG5vdCBmb2xsb3cg
ZXhwZWN0ZWQgZm9ybWF0IFt0ZXN0X3Nob3J0bG9nX2Zvcm1hdF0KICBTdWdnZXN0ZWQgZml4ICAg
IENvbW1pdCBzaG9ydGxvZyAoZmlyc3QgbGluZSBvZiBjb21taXQgbWVzc2FnZSkgc2hvdWxkIGZv
bGxvdyB0aGUgZm9ybWF0ICI8dGFyZ2V0PjogPHN1bW1hcnk+IgoKCgpJZiB5b3UgYmVsaWV2ZSBh
bnkgb2YgdGhlc2UgdGVzdCByZXN1bHRzIGFyZSBpbmNvcnJlY3QsIHBsZWFzZSByZXBseSB0byB0
aGUKbWFpbGluZyBsaXN0IChvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
KSByYWlzaW5nIHlvdXIgY29uY2VybnMuCk90aGVyd2lzZSB3ZSB3b3VsZCBhcHByZWNpYXRlIHlv
dSBjb3JyZWN0aW5nIHRoZSBpc3N1ZXMgYW5kIHN1Ym1pdHRpbmcgYSBuZXcKdmVyc2lvbiBvZiB0
aGUgcGF0Y2hzZXQgaWYgYXBwbGljYWJsZS4gUGxlYXNlIGVuc3VyZSB5b3UgYWRkL2luY3JlbWVu
dCB0aGUKdmVyc2lvbiBudW1iZXIgd2hlbiBzZW5kaW5nIHRoZSBuZXcgdmVyc2lvbiAoaS5lLiBb
UEFUQ0hdIC0+IFtQQVRDSCB2Ml0gLT4KW1BBVENIIHYzXSAtPiAuLi4pLgoKLS0tCkd1aWRlbGlu
ZXM6ICAgICBodHRwczovL3d3dy5vcGVuZW1iZWRkZWQub3JnL3dpa2kvQ29tbWl0X1BhdGNoX01l
c3NhZ2VfR3VpZGVsaW5lcwpUZXN0IGZyYW1ld29yazogaHR0cDovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL2NnaXQvY2dpdC5jZ2kvcGF0Y2h0ZXN0ClRlc3Qgc3VpdGU6ICAgICBodHRwOi8vZ2l0Lnlv
Y3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wYXRjaHRlc3Qtb2UKCg==
