Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C058BC77B78
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.144513.1671136353235532239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=itm0BzDK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d1d47-3a7c6fe0-5d14-4981-bc95-27e96594230f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wAFQmqFF9Q78nkU9wmdzpqYSSHm7oubZniCf07sJp8k=;
	b=itm0BzDKrpR9mF5oDcQJeoi1wiPgFC4ZTahy1kY9bCWZ1mBQhGXeyvuOVDC/tuCf
	8QrB/9OQnyVtVo/BVU6+yuL21gWvLXvEYdiNlj2YGsVDiEffh01CyqagwrEhiGVvZ7r
	1mEJRBZumyitHkWbncAq1+xyl6bwTyqJxZVn4RZM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wAFQmqFF9Q78nkU9wmdzpqYSSHm7oubZniCf07sJp8k=;
	b=Qmw7DDB5qnmaK9LJzUzQoYDH3pYjZWCSVtKJta0So877JEuqUB5/RUw7xLmKrA34
	OfC3spfK/7F94TBUKHYbh43XpLiwfhjFfgrP4spcp8IxIuBVdq9H9FcQery8ex/uiza
	SX3XPJuIcGco3mRPX3oAPH/8tzF9PFWW46oThSig=
Content-Type: multipart/mixed; boundary="===============2916732932112423677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20221214 SUCCEEDED
Message-ID: <01010185177d1d47-3a7c6fe0-5d14-4981-bc95-27e96594230f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174707

--===============2916732932112423677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20221214* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20221109-20221214.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2916732932112423677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20221109-20221214.patch"

RnJvbSA2YzdhMzcxNmY5YjlhZDM5YWRiNjdiYWYwYmE1ZGQwZjU1MjkxMmFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTc6MjQ6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIyMTEwOSAtPiAyMDIyMTIxNAoKLS0tCiAuLi4yMDIy
MTEwOS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIyMTIxNC5iYn0gfCAxODEgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTc5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMjExMDkuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMjEyMTQuYmJ9ICg5MCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIyMTEwOS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMjEyMTQuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIyMTEwOS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIyMTIxNC5iYgppbmRleCBiMDViOTYwZWJkLi5kYTQ2ZGQxMDQxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIx
MTA5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMjEyMTQuYmIKQEAgLTEsMyArMSwxODAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMjYyMiw2ICsyNjIyLDggQEAKKyMgIEZpbGU6
IGFtZGdwdS9hbGRlYmFyYW5fbWVjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2FsZGViYXJhbl9ybGMu
YmluCisjICBGaWxlOiBhbWRncHUvYWxkZWJhcmFuX3NkbWEuYmluCisjICtGaWxlOiBhbWRncHUv
YWxkZWJhcmFuX3NqdF9tZWMyLmJpbgorIyArRmlsZTogYW1kZ3B1L2FsZGViYXJhbl9zanRfbWVj
LmJpbgorIyAgRmlsZTogYW1kZ3B1L2FsZGViYXJhbl9zbWMuYmluCisjICBGaWxlOiBhbWRncHUv
YWxkZWJhcmFuX3Nvcy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9hbGRlYmFyYW5fdGEuYmluCisjIEBA
IC0yNjM4LDggKzI2NDAsMTggQEAKKyMgIEZpbGU6IGFtZGdwdS9nY18xMF8zXzdfbWVjMi5iaW4K
KyMgIEZpbGU6IGFtZGdwdS9nY18xMF8zXzdfcGZwLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzEw
XzNfN19ybGMuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX2ltdS5iaW4KKyMgK0ZpbGU6
IGFtZGdwdS9nY18xMV8wXzBfbWUuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX21lYy5i
aW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzBfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9n
Y18xMV8wXzBfbWVzLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfMF9wZnAuYmluCisjICtG
aWxlOiBhbWRncHUvZ2NfMTFfMF8wX3JsYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25fM18xXzVf
ZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV82X2RtY3ViLmJpbgorIyArRmlsZTog
YW1kZ3B1L2Rjbl8zXzJfMF9kbWN1Yi5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTNfMF8wX3Nv
cy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTNfMF8wX3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1
L3BzcF8xM18wXzVfYXNkLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzVfdGEuYmluCisj
ICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfNV90b2MuYmluCisjIEBAIC0yNjQ4LDcgKzI2NjAsMTAg
QEAKKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF84X3RvYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9z
ZG1hXzVfMl82LmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNV8yXzcuYmluCisjICtGaWxlOiBh
bWRncHUvc2RtYV82XzBfMC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9zbXVfMTNfMF8wLmJpbgorIyAg
RmlsZTogYW1kZ3B1L3Zjbl8zXzFfMi5iaW4KKyMgK0ZpbGU6IGFtZGdwdS92Y25fNF8wXzAuYmlu
CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kZ3B1IGZv
ciBkZXRhaWxzLgorIyAgCisjIEBAIC0yODQwLDYgKzI4NTUsNyBAQAorIyAgRmlsZTogYnJjbS9i
cmNtZm1hYzQzMzAtc2Rpby5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzM0LXNkaW8uYmlu
CisjICBGaWxlOiBicmNtL2JyY21mbWFjNDMzNS1zZGlvLmJpbgorIyArRmlsZTogYnJjbS9icmNt
Zm1hYzQzMzktc2Rpby5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzI0MWIwLXNkaW8uYmlu
CisjICBGaWxlOiBicmNtL2JyY21mbWFjNDMyNDFiNC1zZGlvLmJpbgorIyAgRmlsZTogYnJjbS9i
cmNtZm1hYzQzMjQxYjUtc2Rpby5iaW4KKyMgQEAgLTI4NDksNyArMjg2NSwxMCBAQAorIyAgRmls
ZTogYnJjbS9icmNtZm1hYzQzNDMwYTAtc2Rpby5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0
MzUwYzItcGNpZS5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzUwLXBjaWUuYmluCisjICtG
aWxlOiBicmNtL2JyY21mbWFjNDM1NC1zZGlvLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQz
NTY5LmJpbgorIyArRmlsZTogYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5iaW4KKyMgK0ZpbGU6IGJy
Y20vYnJjbWZtYWM0MzU2LXNkaW8uYmluCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM1OC1wY2ll
LmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzNjAyLXBjaWUuYmluCisjICBGaWxlOiBicmNt
L2JyY21mbWFjNDM2MDItcGNpZS5hcC5iaW4KKyMgQEAgLTQ0NDcsNiArNDQ2Niw4IEBACisjICBG
aWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMV9nZl8wMTBhLmJpbgorIyAgRmlsZTogcWNhL252bV91
c2JfMDAxMzAyMDFfZ2ZfMDEwYi5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dm
XzAzMDMuYmluCisjICtGaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMTkwMjAwLmJpbgorIyArRmls
ZTogcWNhL252bV91c2JfMDAxOTAyMDAuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgcWNhL05PVElDRS50
eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNDg0Niw2ICs0ODY3LDEyIEBACisjICAKKyMgIEZp
bGU6IGk5MTUvZGcyX2RtY192ZXIyXzA3LmJpbgorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVy
IDIgcmVsZWFzZSA3IGZvciBERzIKKyMgKworIyArRmlsZTogaTkxNS9kZzJfZG1jX3ZlcjJfMDgu
YmluCisjICtWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDggZm9yIERHMgorIyAr
CisjICtGaWxlOiBpOTE1L210bF9kbWNfdmVyMl8xMC5iaW4KKyMgK1ZlcnNpb246IERNQyBBUEkv
QVBCIHZlciAyIHJlbGVhc2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgTGljZW5zZTogUmVk
aXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pOTE1IGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyBAQCAtNTQ0MywzNSArNTQ3MCwzOSBAQAorIyAgRHJpdmVyOiBtdDc5MTVlIC0g
TWVkaWFUZWsgV2lyZWxlc3MgTUFDcyBmb3IgTVQ3OTE1L01UNzkxNi9NVDc5ODYKKyMgIAorIyAg
RmlsZTogbWVkaWF0ZWsvbXQ3OTE1X3dtLmJpbgorIyAtVmVyc2lvbjogMjAyMTEyMjIxODQwNTIK
KyMgK1ZlcnNpb246IDIwMjIwOTI5MTA0MTQ1CisjICBGaWxlOiBtZWRpYXRlay9tdDc5MTVfd2Eu
YmluCisjIC1WZXJzaW9uOiAyMDIxMTIyMjE4NDExMQorIyArVmVyc2lvbjogMjAyMjA5MjkxMDQy
MDUKKyMgIEZpbGU6IG1lZGlhdGVrL210NzkxNV9yb21fcGF0Y2guYmluCisjIC1WZXJzaW9uOiAy
MDIxMTIyMjE4NDAxN2EKKyMgK1ZlcnNpb246IDIwMjIwOTI5MTA0MTEzYQorIyAgRmlsZTogbWVk
aWF0ZWsvbXQ3OTE1X2VlcHJvbS5iaW4KKyMgIFZlcnNpb246IDIwMjAwODIxCisjICBGaWxlOiBt
ZWRpYXRlay9tdDc5MTVfZWVwcm9tX2RiZGMuYmluCisjICBWZXJzaW9uOiAyMDIwMDgyMQorIyAg
CisjICBGaWxlOiBtZWRpYXRlay9tdDc5MTZfd20uYmluCisjIC1WZXJzaW9uOiAyMDIxMTIzMDEz
NTcyMAorIyArVmVyc2lvbjogMjAyMjEwMzExNTQ3MTMKKyMgIEZpbGU6IG1lZGlhdGVrL210Nzkx
Nl93YS5iaW4KKyMgLVZlcnNpb246IDIwMjExMjMwMTM1ODA4CisjICtWZXJzaW9uOiAyMDIyMTAz
MTE1NDc1NworIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTE2X3JvbV9wYXRjaC5iaW4KKyMgLVZlcnNp
b246IDIwMjExMjMwMTM1NjIwYQorIyArVmVyc2lvbjogMjAyMjEwMzExNTQ2NTJhCisjICBGaWxl
OiBtZWRpYXRlay9tdDc5MTZfZWVwcm9tLmJpbgorIyAgVmVyc2lvbjogMjAyMTExMzAKKyMgIAor
IyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTg2X3dtLmJpbgorIyAtVmVyc2lvbjogMjAyMjAxMTMxNjI2
NDEKKyMgK1ZlcnNpb246IDIwMjIxMDEyMTc0NzI1CisjICBGaWxlOiBtZWRpYXRlay9tdDc5ODZf
d21fbXQ3OTc1LmJpbgorIyAtVmVyc2lvbjogMjAyMjAxMTMxNjI3NTYKKyMgK1ZlcnNpb246IDIw
MjIxMDEyMTc0ODA1CisjICBGaWxlOiBtZWRpYXRlay9tdDc5ODZfd2EuYmluCisjIC1WZXJzaW9u
OiAyMDIyMDExMzE2MzAzNAorIyArVmVyc2lvbjogMjAyMjEwMTIxNzQ5MzcKKyMgIEZpbGU6IG1l
ZGlhdGVrL210Nzk4Nl9yb21fcGF0Y2guYmluCisjIC1WZXJzaW9uOiAyMDIyMDExMzE2MjU0M2EK
KyMgK1ZlcnNpb246IDIwMjIxMDEyMTc0NjQ4YQorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTg2X3Jv
bV9wYXRjaF9tdDc5NzUuYmluCisjIC1WZXJzaW9uOiAyMDIyMDExMzE2MjcwMWEKKyMgK1ZlcnNp
b246IDIwMjIxMDEyMTc0NzQzYQorIyArRmlsZTogbWVkaWF0ZWsvbXQ3OTg2X3dvXzAuYmluCisj
ICtWZXJzaW9uOiAyMDIyMTAxMjE3NTAwNQorIyArRmlsZTogbWVkaWF0ZWsvbXQ3OTg2X3dvXzEu
YmluCisjICtWZXJzaW9uOiAyMDIyMTAxMjE3NTAzMgorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTg2
X2VlcHJvbV9tdDc5NzYuYmluCisjICBWZXJzaW9uOiAyMDIxMTEwNQorIyAgRmlsZTogbWVkaWF0
ZWsvbXQ3OTg2X2VlcHJvbV9tdDc5NzZfZGJkYy5iaW4KKyMgQEAgLTU0ODgsOSArNTUxOSw5IEBA
CisjICBEcml2ZXI6IG10NzkyMSAtIE1lZGlhVGVrIE1UNzkyMSBXaXJlbGVzcyBNQUNzCisjICAK
KyMgIEZpbGU6IG1lZGlhdGVrL1dJRklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbgorIyAt
VmVyc2lvbjogMjAyMjA5MDgyMTA5MTlhCisjICtWZXJzaW9uOiAyMDIyMTEwOTExMDkxOGEKKyMg
IEZpbGU6IG1lZGlhdGVrL1dJRklfUkFNX0NPREVfTVQ3OTYxXzEuYmluCisjIC1WZXJzaW9uOiAy
MDIyMDkwODIxMTAyMQorIyArVmVyc2lvbjogMjAyMjExMDkxMTEwMDUKKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMg
IAorIyBAQCAtNTQ5OSw3ICs1NTMwLDcgQEAKKyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsg
TVQ3OTIxIGJsdWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9D
T0RFX01UNzk2MV8xXzJfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyMjA5MDgyMTEyMzQKKyMgK1Zl
cnNpb246IDIwMjIxMTA5MTExMjEzCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTYyMjMsMyArNjI1
NCwxMSBAQAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRl
ayBmb3IgZGV0YWlscy4KKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVy
OiBueHAtc3IxeHggLSBOWFAgVWx0cmEgV2lkZSBCYW5kIGRyaXZlcgorIyArRmlsZTogbnhwL3Ny
MTUwX2Z3LmJpbgorIyArVmVyc2lvbjogMzUuMDAuMDMKKyMgKworIyArTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5TRS5ueHAgZm9yIGRldGFpbHMKKyMgK09yaWdpbmF0ZXMgZnJv
bSBodHRwczovL2dpdGh1Yi5jb20vTlhQL3V3Yi1OWFBVV0ItRlcuZ2l0CisjICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGgg
TGludXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVND
UklQVElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdz
aWRlIHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTI4LDcgKzMwNSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFk
YzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNDAwMDttZDU9
MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdmNGQwOTk4ZDUzZjY2
IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJl
ZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
V0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L1dIRU5DRTttZDU9YmY3YzcxNmQxNmU0OGZlMTE4YzYyMDlmOTliMTMyNTMgXAogICAgICAgICAg
ICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8g
ZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpA
QCAtMjA5LDcgKzM4Niw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0gPSAiZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAjIFBpbiB0aGlzIHRv
IHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2FsLmNvbmYKIFNSQ1JF
VjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBjOTFiZTE1YTIyNTY4
ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMwZGRmZmJiY2YzMGYyZTAxNWJkZGQ1
YzZkM2NlMWYxMzk3NmI5MDZhY2VhYmRhNGE1N2UzYzQxYTMxOTA3MDEiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZTc5Mzc4M2U5MmFjYmRlNTQ5OTY1NTIxNDYyZDFkMTMyNzgyNzM2MDY2NGNmMjQy
ZGJkYTA4ZjA3NTY1NDMzMSIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuMzcuMwoK

--===============2916732932112423677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221109.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221214.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/psp_13_0_0_sos.bin /lib/firmware/amdgpu/gc_11_0_0_me.bin /lib/firmware/amdgpu/psp_13_0_0_ta.bin /lib/firmware/amdgpu/dcn_3_2_0_dmcub.bin /lib/firmware/amdgpu/gc_11_0_0_imu.bin /lib/firmware/amdgpu/gc_11_0_0_mes.bin /lib/firmware/amdgpu/aldebaran_sjt_mec2.bin /lib/firmware/amdgpu/gc_11_0_0_rlc.bin /lib/firmware/amdgpu/smu_13_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_pfp.bin /lib/firmware/amdgpu/vcn_4_0_0.bin /lib/firmware/amdgpu/aldebaran_sjt_mec.bin /lib/firmware/amdgpu/gc_11_0_0_mec.bin /lib/firmware/amdgpu/sdma_6_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_mes1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 65320058 to 69094574 (+6%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGSIZE changed from 455745 to 459988 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGSIZE changed from 253748 to 246791 (-3%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGSIZE changed from 223635 to 225090 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGSIZE changed from 633817 to 634361 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_dmc_ver2_08.bin /lib/firmware/i915/mtl_dmc_ver2_10.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 25534811 to 25605463 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.nxp"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 152743 to 157939 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/rampatch_usb_00190200.bin /lib/firmware/qca/nvm_usb_00190200.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1744896 to 1960217 (+12%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 203715 to 204929 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/nxp/sr150_fw.bin /lib/firmware/mediatek/mt7986_wo_0.bin /lib/firmware/mediatek/mt7986_wo_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 252633154 to 257851634 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20221109" to "20221214"

--===============2916732932112423677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_0_pfp.bin /lib/firmware/amdgpu/gc_11_0_0_mes1.bin /lib/firmware/amdgpu/aldebaran_sjt_mec.bin /lib/firmware/amdgpu/psp_13_0_0_sos.bin /lib/firmware/amdgpu/gc_11_0_0_imu.bin /lib/firmware/amdgpu/psp_13_0_0_ta.bin /lib/firmware/amdgpu/gc_11_0_0_mes.bin /lib/firmware/amdgpu/gc_11_0_0_rlc.bin /lib/firmware/amdgpu/dcn_3_2_0_dmcub.bin /lib/firmware/amdgpu/vcn_4_0_0.bin /lib/firmware/amdgpu/smu_13_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_me.bin /lib/firmware/amdgpu/sdma_6_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_mec.bin /lib/firmware/amdgpu/aldebaran_sjt_mec2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_dmc_ver2_08.bin /lib/firmware/i915/mtl_dmc_ver2_10.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.nxp"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/rampatch_usb_00190200.bin /lib/firmware/qca/nvm_usb_00190200.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1744896 to 1960217 (+12%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/mediatek/mt7986_wo_0.bin /lib/firmware/nxp/sr150_fw.bin /lib/firmware/mediatek/mt7986_wo_1.bin"

--===============2916732932112423677==--

