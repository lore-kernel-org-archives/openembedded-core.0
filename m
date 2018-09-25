Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id CD361607E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 11:57:26 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id E96B324E1FB5;
	Tue, 25 Sep 2018 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537876648; bh=y9TkemLHe5OjLl/gna6H90X0HvwOrl6Ofc1NMqXhlvc=;
	h=From:To:CC:Subject:Date:From;
	b=gYAn/P9bB6qga+wAvS2JRiE6NU0n4i87F1YrehKyLMQJTq5FBuDbNvo5cUKwHA5Ut
	in3Sgi7Esrz7UVcKnz4Z184elHUNitkFwZQDBp9RGxQvYAdHQ61ppExbIc/qOQAKp7
	dgb0h8sjouTRQOJhR3wykIrMoQu/UanBsu/Du1Ddy2ahiJZgx29uHys3Z16Pnd1vZg
	s3Ij725OvjEJq1HHbHoo43VcbxfS7xzshD33BZqN00NzALYihcJulkV7YBGVuxLBAm
	NwrgCRY70JaAxrQgW9J+p15dx+6RT+kb9nEfftpcroky37svDK0IQ0fKoZ1fghRIJX
	3bHtp0zbcPwlQ==
Received: from US01WXQAHTC1.internal.synopsys.com
	(us01wxqahtc1.internal.synopsys.com [10.12.238.230])
	by mailhost.synopsys.com (Postfix) with ESMTP id 1CDD5392F;
	Tue, 25 Sep 2018 04:57:27 -0700 (PDT)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 25 Sep 2018 04:57:26 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0361.001; Tue, 25 Sep 2018 13:57:24 +0200
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: machine dictionary - ARCompact vs ARCv2
Thread-Index: AQHUVMbr5uCi6aZNV0Wy3m1nLb5RXw==
Date: Tue, 25 Sep 2018 11:57:23 +0000
Message-ID: <e00126b08d5895fa7e4cc2fb0b8eaa9effb75cc4.camel@synopsys.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.121.3.61]
MIME-Version: 1.0
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: ARC: machine dictionary - ARCompact vs ARCv2
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
X-List-Received-Date: Tue, 25 Sep 2018 11:57:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFFAB44F8B12B24084C91C6F669CC1E6@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCldoaWxlIHVwc3RyZWFtaW5nIEFSQyBiaXRzIGluIE9FIGNvcmUgSSBmYWNlZCBv
bmUgaW50ZXJlc3RpbmcgY2hhbGxlbmdlLg0KDQpBcyBvZiB0b2RheSB3ZSBoYXZlIDIgYmluYXJ5
LWluY29tcGF0aWJsZSAzMi1iaXQgSVNBcyAoSW5zdHJ1Y3Rpb24gU2V0IEFyY2gpOg0KIDEuIEFS
Q29tcGFjdCAoQUtBIEFSQ3YxKSBhbmQNCiAyLiBBUkN2Mg0KDQpJbiBCaW51dGlscyB0aGV5IGhh
dmUgMiBzZXBhcmF0ZSBtYWNoaW5lIG51bWJlcnM6IEVNX0FSQ19DT01QQUNUPTkzIGZvciBBUkNv
bXBhY3QsDQpzZWUgWzFdIGFuZCBFTV9BUkNfQ09NUEFDVDI9MTk1IGZvciBBUkN2Miwgc2VlIFsy
XS4NCg0KU3RpbGwgd2UgY2FsbCB0aGVtIGJvdGggImFyYyIgYW5kIHNvIEknbSBub3Qgc3VyZSB3
aGF0IHdvdWxkIGJlIHRoZSByaWdodCB3YXkNCm9mIGhhbmRsaW5nIHRoYXQgbWVzcyBpbiBPRSdz
IG1hY2hpbmUgZGljdGlvbmFyeS4NCg0KRm9yIG5vdyBJIGp1c3QgaGF2ZSBzZXBhcmF0ZSBpbnN0
YW5jZXMgb2YgImFyY19tYWNoaW5lX2RpY3QiIGZvciBBUkNvbXBhY3QgWzNdDQphbmQgQVJDdjIg
WzRdIGFuZCBkZXBlbmRpbmcgb24gd2hhdCBhIGdpdmVuIE9FICJtYWNoaW5lIiBpbmNsdWRlcyBh
cyAidHVuZS1hcmNYLmluYyINCmJ1aWxkIHN5c3RlbSB1c2VzIG9uZSBvciBhbm90aGVyIGRpY3Rp
b25hcnkgZW50cnkuDQoNCkV2ZW4gdGhvdWdoIGl0IHdvcmtzIGZpbmUgaXQgZG9lc24ndCBmaXQg
aW50byBjb21tb24gZGljdGlvbmFyeSBpbiBtZXRhL2xpYi9vZS9lbGYucHkuDQoNCkFueSBzdWdn
ZXN0aW9ucyBvbiBob3cgQVJDIG1hY2hpbmUgZGljdGlvbmFyeSBtaWdodCBiZSB1cHN0cmVhbWVk
Pw0KDQotQWxleGV5DQoNClsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3ZWIuY2dp
P3A9YmludXRpbHMtZ2RiLmdpdDthPWJsb2I7Zj1pbmNsdWRlL2VsZi9jb21tb24uaDtoPWUxOTQy
NzQzMDU2NjNmNTY1YzZiZWVlNWVjMjFkYmVkNzBjZGFjNDY7aGI9SEVBRCNsMjAyDQpbMl0gaHR0
cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvZ2l0d2ViLmNnaT9wPWJpbnV0aWxzLWdkYi5naXQ7YT1i
bG9iO2Y9aW5jbHVkZS9lbGYvY29tbW9uLmg7aD1lMTk0Mjc0MzA1NjYzZjU2NWM2YmVlZTVlYzIx
ZGJlZDcwY2RhYzQ2O2hiPUhFQUQjbDMwOQ0KWzNdIA0KaHR0cHM6Ly9naXRodWIuY29tL2Zvc3Mt
Zm9yLXN5bm9wc3lzLWR3Yy1hcmMtcHJvY2Vzc29ycy9tZXRhLXN5bm9wc3lzL2Jsb2IvMDgzOTU4
ZGVkYmQ2MGMwMjI0MzJhMTdlOTUyNjM4YTQxZTM3YzNkYy9jb25mL21hY2hpbmUvaW5jbHVkZS90
dW5lLWFyY29tcGFjdC5pbmMjTDI1DQpbNF0gDQpodHRwczovL2dpdGh1Yi5jb20vZm9zcy1mb3It
c3lub3BzeXMtZHdjLWFyYy1wcm9jZXNzb3JzL21ldGEtc3lub3BzeXMvYmxvYi8wODM5NThkZWRi
ZDYwYzAyMjQzMmExN2U5NTI2MzhhNDFlMzdjM2RjL2NvbmYvbWFjaGluZS9pbmNsdWRlL3R1bmUt
YXJjdjIuaW5jI0wzOA0K

