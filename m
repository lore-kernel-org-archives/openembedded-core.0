Return-Path: <federico.sauter@ableton.com>
X-Greylist: delayed 972 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 14:38:06 UTC
Received: from mail.ableton.net (mail.ableton.net [62.96.12.117])
	by mail.openembedded.org (Postfix) with ESMTP id 77924749F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ableton.com;
	s=mail; 
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:To:From;
	bh=THyaIc3b33Jt5iYzo8Bf6oW4AqQ3gxA6CUfNoQUgDAE=; 
	b=Db4lZLGk1YUqwwLkRCjNORcHyAq2Ko2eDgyJmm9lux+iPxlmowtMad+4qZMBGZgmQmYEIUFUcYH1qKB3ODrLwjToa6X7xhgnptWwKEdF7qVAkWlyROC5HofKd0EnRQy7LRuHCw4QU1nMI8eb5F9ea1OBtCHUw9Kqgj17ZeFH2aA=;
Received: from moon.office.ableton.com ([10.1.15.25]
	helo=mail.office.ableton.com)
	by mail.ableton.net with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.82) (envelope-from <federico.sauter@ableton.com>)
	id 1gUY3m-0002Wd-Qk for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2018 14:21:54 +0000
Received: from MOON.office.ableton.com ([::1]) by moon.office.ableton.com
	([::1]) with mapi id 14.03.0408.000; Wed, 5 Dec 2018 15:22:33 +0100
From: Federico Sauter <federico.sauter@ableton.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] meta/classes/kernel: don't assign the build user/host
Thread-Index: AQHUjKX2hGWSCTU7SU66S8aIQlBu8A==
Date: Wed, 5 Dec 2018 14:22:32 +0000
Message-ID: <EC9B64EE-BA2C-412F-8F8D-1031B7A00CA5@ableton.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.15.63]
MIME-Version: 1.0
Subject: [PATCH] meta/classes/kernel: don't assign the build user/host
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
X-List-Received-Date: Wed, 05 Dec 2018 14:38:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <287E2B653D21BE42BB61D6F2604A1E06@office.ableton.com>
Content-Transfer-Encoding: base64

VGhlIEtCVUlMRF9CVUlMRF9VU0VSIGFuZCBLQlVJTERfQlVJTERfSE9TVCB2YXJpYWJsZXMgd2Vy
ZQ0KYXNzaWduZWQgYXQgdGhlIGtlcm5lbCBjbGFzcyBsZXZlbCwgd2hpY2ggbWFkZSBpdCBpbXBv
c3NpYmxlDQp0byBvdmVycmlkZSB0aGVtIGluIHRoZSBsb2NhbCBjb25maWd1cmF0aW9uLg0KDQpC
eSBzZXR0aW5nIG9ubHkgdGhlIGRlZmF1bHQgdmFsdWVzIG9mIHRob3NlIHZhcmlhYmxlcyBpbiB0
aGUNCmtlcm5lbCBjbGFzcywgaXQgaXMgbm93IHBvc3NpYmxlIHRvIG92ZXJyaWRlIHRoZW0gYXMg
ZXhwZWN0ZWQuDQoNClNpZ25lZC1vZmYtYnk6IEZlZGVyaWNvIFNhdXRlciA8ZmVkZXJpY28uc2F1
dGVyQGFibGV0b24uY29tPg0KLS0tDQogbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzIHwgNCAr
Ky0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9r
ZXJuZWwuYmJjbGFzcw0KaW5kZXggODgwYzVlZjE3Mi4uMmU0ZWQ4ZDNhZiAxMDA2NDQNCi0tLSBh
L21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcw0KKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC5i
YmNsYXNzDQpAQCAtMTU3LDggKzE1Nyw4IEBAIFBBQ0tBR0VTX0RZTkFNSUMgKz0gIl4ke0tFUk5F
TF9QQUNLQUdFX05BTUV9LWZpcm13YXJlLS4qIg0KIGV4cG9ydCBPUyA9ICIke1RBUkdFVF9PU30i
DQogZXhwb3J0IENST1NTX0NPTVBJTEUgPSAiJHtUQVJHRVRfUFJFRklYfSINCiBleHBvcnQgS0JV
SUxEX0JVSUxEX1ZFUlNJT04gPSAiMSINCi1leHBvcnQgS0JVSUxEX0JVSUxEX1VTRVIgPSAib2Ut
dXNlciINCi1leHBvcnQgS0JVSUxEX0JVSUxEX0hPU1QgPSAib2UtaG9zdCINCitleHBvcnQgS0JV
SUxEX0JVSUxEX1VTRVIgPz0gIm9lLXVzZXIiDQorZXhwb3J0IEtCVUlMRF9CVUlMRF9IT1NUID89
ICJvZS1ob3N0Ig0KDQogS0VSTkVMX1JFTEVBU0UgPz0gIiR7S0VSTkVMX1ZFUlNJT059Ig0KDQot
LQ0KMi4xNy4xDQoNCg==

