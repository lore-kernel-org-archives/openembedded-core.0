Return-Path: <rpurdie@rpsys.net>
X-Greylist: delayed 481 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Jun 2019 14:30:24 UTC
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B33B47E508
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 14:30:24 +0000 (UTC)
Received: from [10.7.141.115] ([85.255.237.114]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	x5HEMKtf012735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 17 Jun 2019 15:22:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1560781342; bh=78TAybn8jUv0AVKFLsTvuQxAK8EFnandarl3RKDiy70=;
	h=Date:Subject:In-Reply-To:From:To:From;
	b=WuOJ/C0qIek54YdAEc9CTtLYbLpTickmTEtvbdBkWR17MIoZum83wSvxX2M+Op3AH
	Vm93+DjIiUda14ssNQGXe/FPunEFhQOqdUqlLP1+ml3gmal27DQBDz/HOwNesqF7eq
	uMWhBz3hvfGitiWU6yUzIp37wKcUG9BM1fJUr1QoQPueauTRrZgJw1dPEkOlVOlLzC
	u8HBZQxR5cX6RYGLa34OblMHECv9L45fEdUcz4uQvtWiMNFA9BmElqB6Fb8GohY1ZP
	gsriReNfE85upEeC49iSzB75I9m8qYTX1WCy5OJWNvMrzjv2v1EjCDNBVdIt9D6sKD
	9j1Ubz+zsJ5Yw==
Message-Id: <201906171422.x5HEMKtf012735@dan.rpsys.net>
SavedFromEmail: rpurdie@rpsys.net
Date: Mon, 17 Jun 2019 15:22:12 +0100
In-Reply-To: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
Importance: normal
From: Richard Purdie <rpurdie@rpsys.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.3 at dan
X-Virus-Status: Clean
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Mon, 17 Jun 2019 14:30:25 -0000
Content-Type: multipart/alternative;
	boundary="--_com.samsung.android.email_3082794604894640"

----_com.samsung.android.email_3082794604894640
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

CkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPjo+WWVzLCBp
dCdzIGFub3RoZXIgb25lIG9mIHRob3NlIHJlY2lwZXMgd2hpY2ggaW5jbHVkZXMgYcKgPmRpZmZl
cmVudCByZWNpcGUgd2l0aCBpdHMgdmVyc2lvbiBudW1iZXIgKHdoaWNoIGJyZWFrcyB3aGVuwqA+
ZGV2dG9vbCB1cGdyYWRlcyBvbmUgYnV0IG5vdCB0aGUgb3RoZXIpLj4+SSBoYXZlIGEgZml4IHF1
ZXVlZDo+aHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3ktY29udHJpYi9j
b21taXQvP2g9YWthbmF2aW4vcGFja2FnZS12ZXJzaW9uLXVwZGF0ZXMmaWQ9MDBlYjU5NTI0Nzkz
NzA1NTM3NTZkZmFjZTRjZjZjODFmNTFiOWU4ZkkgdGhpbmsgd2hhdCB3b3JyaWVzIG1lIG1vcmUg
aXMgdGhlIGJ1aWxkIGlzbid0IHJlc2V0IHNvIHRoaXMgaXMgcmVwb3J0ZWQgYWdhaW5zdCBsdHRu
Zy11c3QuIEkgZ3Vlc3MgaXRzIGJlY2F1c2UgaXRzIHRlc3RpbmcgdGhlIGNoYW5nZXMgdG9nZXRo
ZXI/UGVyaGFwcyBpdCBzaG91bGQgcGFyc2UgdGVzdCB0aGVtIGluZGl2aWR1YWxseT9DaGVlcnMs
UmljaGFyZMKgCgo=

----_com.samsung.android.email_3082794604894640
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keT48ZGl2Pjxicj48L2Rpdj48ZGl2IHN0
eWxlPSJmb250LXNpemU6MTAwJTtjb2xvcjojMDAwMDAwIj48IS0tIG9yaWdpbmFsTWVzc2FnZSAt
LT48ZGl2Pjxicj48L2Rpdj48ZGl2PkZyb206IEFsZXhhbmRlciBLYW5hdmluICZsdDthbGV4Lmth
bmF2aW5AZ21haWwuY29tJmd0Ozo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
L2Rpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PiZndDtZZXMsIGl0J3MgYW5vdGhlciBvbmUgb2YgdGhv
c2UgcmVjaXBlcyB3aGljaCBpbmNsdWRlcyBhJm5ic3A7PC9kaXY+PGRpdj4mZ3Q7ZGlmZmVyZW50
IHJlY2lwZSB3aXRoIGl0cyB2ZXJzaW9uIG51bWJlciAod2hpY2ggYnJlYWtzIHdoZW4mbmJzcDs8
L2Rpdj48ZGl2PiZndDtkZXZ0b29sIHVwZ3JhZGVzIG9uZSBidXQgbm90IHRoZSBvdGhlcikuPC9k
aXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7SSBoYXZlIGEgZml4IHF1ZXVlZDo8L2Rpdj48ZGl2
PiZndDs8YSBocmVmPSJodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC5jZ2kvcG9reS1j
b250cmliL2NvbW1pdC8/aD1ha2FuYXZpbi9wYWNrYWdlLXZlcnNpb24tdXBkYXRlcyZhbXA7aWQ9
MDBlYjU5NTI0NzkzNzA1NTM3NTZkZmFjZTRjZjZjODFmNTFiOWU4ZiI+aHR0cDovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3ktY29udHJpYi9jb21taXQvP2g9YWthbmF2aW4vcGFj
a2FnZS12ZXJzaW9uLXVwZGF0ZXMmYW1wO2lkPTAwZWI1OTUyNDc5MzcwNTUzNzU2ZGZhY2U0Y2Y2
YzgxZjUxYjllOGY8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHRoaW5rIHdoYXQgd29y
cmllcyBtZSBtb3JlIGlzIHRoZSBidWlsZCBpc24ndCByZXNldCBzbyB0aGlzIGlzIHJlcG9ydGVk
IGFnYWluc3QgbHR0bmctdXN0LiBJIGd1ZXNzIGl0cyBiZWNhdXNlIGl0cyB0ZXN0aW5nIHRoZSBj
aGFuZ2VzIHRvZ2V0aGVyPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UGVyaGFwcyBpdCBzaG91
bGQgcGFyc2UgdGVzdCB0aGVtIGluZGl2aWR1YWxseT88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkNoZWVycyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJpY2hhcmQmbmJzcDs8L2Rpdj48L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2
Pgo8L2JvZHk+PC9odG1sPg==

----_com.samsung.android.email_3082794604894640--
