Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Mar 2019 14:37:50 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6137CEB9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=essvote.com; s=omaha.092018;
	c=relaxed/relaxed; 
	q=dns/txt; i=@essvote.com; t=1551968570; x=1554560570;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5vd34CHF3rsJFA27kGW/scEIFQewbODPQwl7G6h8LFo=;
	b=EhFapb7c84IVKMhe4Hmc5IOobpU/ADSXGtv4xzsQc/doHa5N82QCT+YTJqo7Thho
	Etn7/UkZXXHuO0vW6U3HdwUrkjtfY1E72TYliJdmhiAe9Ay3+wKbjt4Rh2vvFjOr
	ZZP3j0vg1TCl6Y4jo3tXfciSAhZYwDClXQ4kN9xLjthWST8JroHD+Syt6wZh0YsE
	eJx4gSm4webeQSgFOeIRdz64UGkN+xaAvT8Sk8dK8Q0ypIP5w2c2i9w7bctBDTzl
	Czx07zyOm9ocB8+osJMznyyX5QIC70Cwzwc+A8YhqZ89AkY5Nr6mT3VQ/HCDUAXw
	c6fG7WtiGbTObyeTtRHd/Q==;
X-AuditID: 0a00029b-dcfff70000004f6d-aa-5c812939a4aa
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	6E.3F.20333.A39218C5; Thu,  7 Mar 2019 08:22:50 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%16]) with mapi
	id 14.03.0301.000; Thu, 7 Mar 2019 08:22:49 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Thread-Topic: npm offline build for yocto
Thread-Index: AQHU1MlkZV5uEJFVS0WmVVpBC0QISqYANYAQ
Date: Thu, 7 Mar 2019 14:22:48 +0000
Message-ID: <655290B7709079438B7932553958E60DA164130D@ESS-EX01.essvote.corp.local>
References: <46d4a7de-f19f-8fa2-63b7-f21431d3435c@siemens.com>
In-Reply-To: <46d4a7de-f19f-8fa2-63b7-f21431d3435c@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.13.85.74]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWyRiBPQ9dKszHG4NEGZYt7N28yW9z5+Y7d
	gcnj3MYVjB7bT05iCmCK4rJJSc3JLEst0rdL4Mq4df8qe8EVgYrG77OYGxjnCHQxcnJICJhI
	PP37grGLkYtDSOAoo8Sx3euYIJwTjBInTt9nBKliEzCSOHd9E5gtIqAusWHVPDYQm1nATKLn
	7wmwuLCAhsS6n7OZIWo0Jc43voOqN5KY9b8HrJ5FQEXifNsUsBpegSCJbRtmgMWFBOwk5rc9
	AYtzCthLTPh5mwXEZhQQk/h+ag0TxC5xiVtP5jNBXC0gsWTPeWYIW1Ti5eN/rBC2vMT8xjdA
	vRxA9ZoS63fpQ7QqSkzpfsgOsVZQ4uTMJywTGEVnIZk6C6FjFpKOWUg6FjCyrGLkyzXSSy0u
	LssvSdVLzs/dxAiMCy4Gptk7GHuaYg8xCnAwKvHw6jM1xgixJpYVV+YeYpTmYFES523my4kR
	EkhPLEnNTk0tSC2KLyrNSS0+xMjEwQkiuKQaGKcfjA/n5HvOuEjWKu3fbp5ZpZZrutYnzgj8
	mxdozvRPNKbyk90rrd16K84Vr2O2mcJQ/72u7/n2mIfmn93CuatdZ8id+iPja/7a4mNOilbl
	Mgc+5vkCNYUGy9pftr+76B7zvMBX8fbB77Zty/7LBWxYXT3twQeTq0tF9S931V77lmwiv2BP
	hRJLcUaioRZzUXEiALULLgRxAgAA
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: npm offline build for yocto
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
X-List-Received-Date: Thu, 07 Mar 2019 14:37:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VW5mb3J0dW5hdGVseSBuby4gIEkgY291bGQgbmV2ZXIgZ2V0IHRoZSBjYWNoZSB0byBwcmVmaWxs
IGNvcnJlY3RseSB3aXRoIG5vZGUgOCBhbmQgaGF2ZW4ndCB0cmllZCBhbnkgb2YgdGhlIG5ld2Vy
IHZlcnNpb25zLiAgVGhlIHdheSB0aGV5IGRpZCB0aGUgc2hhMS8yNTYvNTEyIHN1bXMgbWFkZSBp
dCBpbXBvc3NpYmxlIHRvIHByZWZpbGwgdGhlIGNhY2hlLCBhbmQgdGhlIGltcG9ydCBvZiB0YXJz
IGp1c3QgZGlkbuKAmXQgd29yay4NCg0KSSBlbmRlZCB1cCB1c2luZyB5YXJuIGFuZCBidWlsZGlu
ZyB0aGUgYXBwIG91dHNpZGUgb2YgYml0YmFrZSwgdGhvdWdoIHdpdGggeWFybiB0aGUgb2ZmbGlu
ZSBwcm9ibGVtIHdvdWxkIGJlY29tZSBtdWNoIGVhc2llci4gICBJdCBoYXMgbXVjaCBiZXR0ZXIg
c3VwcG9ydCBmb3Igb2ZmbGluZSBidWlsZHMgdGhhbiBub2RlIC8gbnBtIGRvZXMuICBJZiBJIGhh
ZCB0byBzdGFydCBhZ2FpbiBJIHdvdWxkIHN0YXJ0IHdpdGggYWRkaW5nIHN1cHBvcnQgZm9yIHlh
cm4gYW5kIGdvIGZyb20gdGhlcmUuICBOb2RlIGFwcGVhcnMgdG8gYmUgYSBkZWFkIGVuZCB1bmxl
c3MgLyB1bnRpbCB0aGV5IGZpeCB0aGUgb2ZmbGluZSBidWlsZC4NCg0KDQpTaW1wbGUgZ3VpZGUg
SSBmb2xsb3dlZCB0byBnZXQgb2ZmbGluZSB5YXJuIHdvcmtpbmcuICBJdCBzaG91bGRuJ3QgYmUg
aGFyZCB0byB0cmFuc2xhdGUgaW50byBhIHN5c3RlbSBtdWNoIGxpa2UgdGhlIG5wbSBwYXJ0IG9m
IGJpdGJha2UuDQpodHRwczovL3lhcm5wa2cuY29tL2Jsb2cvMjAxNi8xMS8yNC9vZmZsaW5lLW1p
cnJvci8NCg0KTWlrZQ0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphbiBLaXN6
a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+IA0KU2VudDogVGh1cnNkYXksIE1hcmNoIDA3LCAy
MDE5IDM6MzcgQU0NClRvOiBEYXZpcywgTWljaGFlbCA8bWljaGFlbC5kYXZpc0Blc3N2b3RlLmNv
bT4NCkNjOiBPRS1jb3JlIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
Pg0KU3ViamVjdDogbnBtIG9mZmxpbmUgYnVpbGQgZm9yIHlvY3RvDQoNCkhpIE1pY2hhZWwsDQoN
CkkgZm91bmQgeW91ciBwcm9ncmVzcyByZXBvcnQgKGFuZCB1bmFuc3dlcmVkIHF1ZXN0aW9uKSBv
biB0aGF0IHRvcGljIGluIGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3BpcGVybWFpbC9v
cGVuZW1iZWRkZWQtY29yZS8yMDE4LUFwcmlsLzI2ODYzOS5odG1sLiANCkRpZCB0aGlzIGVmZm9y
dCBnbyBmdXJ0aGVyPw0KDQpJIGp1c3QgcmFuIGludG8gaXQgYWdhaW4gd2hpbGUgdXBkYXRpbmcg
aHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMvbWV0YS1pb3QyMDAwDQp0byBOb2RlLmpzID52Ni4g
SSBhbHNvIHBsYXllZCB3aXRoIHByZWZpbGxpbmcgdGhlIGNhY2hlLCBidXQgbGlrZWx5IGluIHRo
ZSB3cm9uZyB3YXkuDQoNClRoYW5rcywNCkphbg0KDQotLQ0KU2llbWVucyBBRywgQ29ycG9yYXRl
IFRlY2hub2xvZ3ksIENUIFJEQSBJT1QgU0VTLURFIENvcnBvcmF0ZSBDb21wZXRlbmNlIENlbnRl
ciBFbWJlZGRlZCBMaW51eA0K

