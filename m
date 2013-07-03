Return-Path: <373466062@qq.com>
Received: from smtpbg52.qq.com (smtpbg52.qq.com [64.71.138.43])
	by mail.openembedded.org (Postfix) with SMTP id 6AFC06AEA2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 03:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s0907;
	t=1372823722; bh=s1Hx9fihgS+1W0yo6KZrlaBW6sEW+ZkzPmjS96u5lTs=;
	h=X-QQ-SSF:X-HAS-ATTACH:X-QQ-BUSINESS-ORIGIN:X-Originating-IP:
	X-QQ-STYLE:X-QQ-mid:From:To:Subject:Mime-Version:Content-Type:
	Content-Transfer-Encoding:Date:X-Priority:Message-ID:X-QQ-MIME:
	X-Mailer:X-QQ-Mailer:X-QQ-FName:X-QQ-LocalIP;
	b=J6gv3FMceUDa7E7oeHCy1mC6pMqAnnr7nEjiRV+3oauocslQg2AZRQ5y9fDseU8W4
	3LJA9u1aLC6ej5Kd3dbsuwYuT6bScsIOyywWC//4J08yEnWXEXCQrWsRoCT7ML1
X-QQ-SSF: 000000000000005000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 210.22.130.90
X-QQ-STYLE: 
X-QQ-mid: webmail381t1372823719t4239790
From: "=?gb18030?B?us66zA==?=" <373466062@qq.com>
To: "=?gb18030?B?b3BlbmVtYmVkZGVkLWNvcmU=?="
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Date: Wed, 3 Jul 2013 11:55:19 +0800
X-Priority: 3
Message-ID: <tencent_2B635D5449F619A5533C8210@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-FName: E55FB0496F8A44609001C4E4E79D0582
X-QQ-LocalIP: 58.250.132.20
Subject: [HELP]How Can I make the uImage contain dtb?
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
X-List-Received-Date: Wed, 03 Jul 2013 03:55:24 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_51D3A0A7_09A0A848_4DD4BECC"
Content-Transfer-Encoding: 8Bit

------=_NextPart_51D3A0A7_09A0A848_4DD4BECC
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SSdtIHVzaW5nIHRoZSB5b2N0byBwcm9qZWN0IHRvIGJ1aWxkIHRoZSBrZXJuZWwgYW5kIHJv
b3Rmcy4gQWZ0ZXIgdGhlIHlvY3RvIGJpdGJha2UgZmluaXNoIGJ1aWxkaW5nIHRoZSBrZXJu
ZWwsIGl0IHdpbGwgcHJvZHVjdCBhIGR0YiBmaWxlIGFuZCB1SW1hZ2UrZHRiIGZpbGUuIA0K
Tm93IEkgcGljayB1cCB0aGUga2VybmVsIHNvdXJjZSBjb2RlIGZyb20gdGhlIHlvY3RvLCBh
bmQgd29uZGVyaW5nIGhvdyB0byBwcm9kdWN0IHRoZSB1SW1hZ2UrZHRiIGZpbGUuIFNpbmNl
IG15IHVib290IGlzIGxhY2sgb2Ygc3VwcG9ydGluZyB0aGUgZmR0IGNvbW1hbmQuIFVzaW5n
IHRoZSB1SW1hZ2UgaXMgYSBtdXN0LiANCkluIHRoZSBwb3dlcnBjIE1ha2VmaWxlIEkgY2F0
Y2ggYGR0YkltYWdlYCx3aGljaCBpcyBhIHpJbWFnZSBjb250YWlucyBkdGIgZmlsZS4gIEJ1
dCBteSBTb0MgaXMgQVJNLiBJdCBoYXMgbm8gdGFyZ2V0IG5hbWVkIGR0YkltYWdlLg==

------=_NextPart_51D3A0A7_09A0A848_4DD4BECC
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5JJ20gdXNpbmcgdGhlIHlvY3RvIHByb2plY3QgdG8gYnVpbGQgdGhlIGtlcm5lbCBh
bmQgcm9vdGZzLiBBZnRlciB0aGUgeW9jdG8gYml0YmFrZSBmaW5pc2ggYnVpbGRpbmcgdGhl
IGtlcm5lbCwgaXQgd2lsbCBwcm9kdWN0IGEgZHRiIGZpbGUgYW5kIHVJbWFnZStkdGIgZmls
ZS4mbmJzcDs8L2Rpdj48ZGl2Pk5vdyBJIHBpY2sgdXAgdGhlIGtlcm5lbCBzb3VyY2UgY29k
ZSBmcm9tIHRoZSB5b2N0bywgYW5kIHdvbmRlcmluZyBob3cgdG8gcHJvZHVjdCB0aGUgdUlt
YWdlK2R0YiBmaWxlLiBTaW5jZSBteSB1Ym9vdCBpcyBsYWNrIG9mIHN1cHBvcnRpbmcgdGhl
IGZkdCBjb21tYW5kLiBVc2luZyB0aGUgdUltYWdlIGlzIGEgbXVzdC4mbmJzcDs8L2Rpdj48
ZGl2PkluIHRoZSBwb3dlcnBjIE1ha2VmaWxlIEkgY2F0Y2ggYGR0YkltYWdlYCx3aGljaCBp
cyBhIHpJbWFnZSBjb250YWlucyBkdGIgZmlsZS4gJm5ic3A7QnV0IG15IFNvQyBpcyBBUk0u
IEl0IGhhcyBubyB0YXJnZXQgbmFtZWQgZHRiSW1hZ2UuPC9kaXY+

------=_NextPart_51D3A0A7_09A0A848_4DD4BECC--
