Return-Path: <nick83ola@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9158D7490D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 14:15:34 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id 15-v6so6204657otn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=sZNjmDB04A3NOTWRWdtYhTWpopXG+04b9C8cKWMpHl8=;
	b=kaKK8SIAygtof3gGjrZTN2IquiVRhiH68oQHcKRuRuR5dLQfJiZ8by8cMoO4Ek+3/O
	rhHxjJ+8d4qARktZnHuksP/eF365hMXWrm/b43idstWaOSZ+LPXUy+GqH4YJpAe1pRe0
	CMM4GtNM7YNmZUh8v/OZSJPmId1uj6uEFgxOOjBndhxYiSakTV7U5HJO/fiIMGG/pbCI
	Zl4BsQGwqy8BPMRbx9mE1NmQOxkMzF50pgusi4ulCPujuxT6A/N4B2aQSh6Gglm++KPT
	GMHBISEmYuigOSvD4wPDGUTQ9X2WkNKidnDn0gE0LiU5SWjM+W7kyjL3IpPv/dXExKce
	Q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sZNjmDB04A3NOTWRWdtYhTWpopXG+04b9C8cKWMpHl8=;
	b=FJjNftylmluUxi19DvkimeZdAK2j7MotFX94LqGSPKBTzydaZXEyd0r++pa8bVkZQF
	w6oAz3mgYw627C87hFq4b73IzQrF5rVIGmA04TF2qwvPeK+BFj2WWJNjBkW4s8cioyD4
	RmSJauUjm8BrCogrBWEx/JrKPq4ssVDco5Dht1obwu5tOzPGc5ZM0kJE3yynUAoFxPAN
	OOr6yO8XtRepDxiIgbHbnHml0PQ2EqXojQg+V9AYbzAw7hrlOAIgxBo/eX1CDeZwl9+l
	92xebaJ8bbmcTLoIjYfLdVOwFGNntVcyh4wXpkeU+3r3oDtJfQyoY2yQQo1n9hfZBGa2
	h9WQ==
X-Gm-Message-State: ALKqPwfefQCh5Rw2P1IdvWd5fl0nRkn1RhDO+ynX2JqPuEfj80O7sKsz
	LiPpfIbdD39fmSGIzrhv5pjiuwPELO+RR2fX0YQ=
X-Google-Smtp-Source: ADUXVKKD/qL4KGPznvTR/Ak4FdDEtvwFqi1qI586Q+dc02X+M9nlRiLTMJvsHsa5kFdKyFxZ1iXrNxCnEupRhyP9V9g=
X-Received: by 2002:a9d:3d37:: with SMTP id
	a52-v6mr1773691otc.91.1527257735090; 
	Fri, 25 May 2018 07:15:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2927:0:0:0:0:0 with HTTP; Fri, 25 May 2018 07:15:14
	-0700 (PDT)
From: nick83ola <nick83ola@gmail.com>
Date: Fri, 25 May 2018 15:15:14 +0100
Message-ID: <CABPh3UOz_E4ue_M22FvuSh1GV3HbL5GDzJNpLE7c12J-gYG0Cg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/3] Mosquitto add a mosquitto conf and logging to the default mosquitto recipe
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
X-List-Received-Date: Fri, 25 May 2018 14:15:34 -0000
X-Groupsio-MsgNum: 111760
Content-Type: multipart/mixed; boundary="000000000000c7fd70056d0866b6"

--000000000000c7fd70056d0866b6
Content-Type: multipart/alternative; boundary="000000000000c7fd6c056d0866b4"

--000000000000c7fd6c056d0866b4
Content-Type: text/plain; charset="UTF-8"



--000000000000c7fd6c056d0866b4
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--000000000000c7fd6c056d0866b4--

--000000000000c7fd70056d0866b6
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-mosquitto_1.4.14-add-default-configuration-file.patch"
Content-Disposition: attachment; 
	filename="0002-mosquitto_1.4.14-add-default-configuration-file.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jhm1t55x0

RnJvbSAyNmU2MzMxZDE4ZWRmNzg0OTc3NmQxOTM3YjYzMDc0ZTgwMTdiNmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNvbGEgTHVuZ2hpIDxuaWNvbGEubHVuZ2hpQGpjaS5jb20+
CkRhdGU6IEZyaSwgMjUgTWF5IDIwMTggMTQ6MzI6MzQgKzAxMDAKU3ViamVjdDogW1BBVENIIDIv
M10gbW9zcXVpdHRvXzEuNC4xNDogYWRkIGRlZmF1bHQgY29uZmlndXJhdGlvbiBmaWxlCgp0aGlz
IHBhdGNoIGltcGxlbWVudCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Ci1hZGQgYSBtb3NxdWl0dG8g
Y29uZmlndXJhdGlvbiBmaWxlIHRvIHRoZSByZWNpcGUgdG8gbWFrZSBzaW1wbGVyIHRvCiB1c2Ug
d2l0aCBiYmFwcGVuZHMKLWNyZWF0ZSBhIGNvbmYuZCBkaXJlY3Rvcnkgd2hlcmUgdG8gcHV0aCBj
dXN0b21pemVkIGNvbmZpZ3VyYXRpb24gZmlsZXMKCkNoYW5nZS1JZDogSTJlZTJkM2M1MzNmNTM0
NTAyNDlkZTM1NTY5MjVjNGI0YjJmZmZkYTgKU2lnbmVkLW9mZi1ieTogTmljb2xhIEx1bmdoaSA8
bmljb2xhLmx1bmdoaUBqY2kuY29tPgotLS0KIC4uLi9tb3NxdWl0dG8vZmlsZXMvbW9zcXVpdHRv
LXlvY3RvLmNvbmYgICAgICAgICAgICAgIHwgIDQgKysrKwogLi4uL21vc3F1aXR0by9tb3NxdWl0
dG9fMS40LjE0LmJiICAgICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmlsZXMvbW9zcXVpdHRvLXlvY3RvLmNvbmYK
CmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vc3F1aXR0by9maWxl
cy9tb3NxdWl0dG8teW9jdG8uY29uZiBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9z
cXVpdHRvL2ZpbGVzL21vc3F1aXR0by15b2N0by5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMC4uOWI0MzMyM2YzCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmlsZXMvbW9zcXVpdHRvLXlvY3RvLmNvbmYKQEAg
LTAsMCArMSw0IEBACitwaWRfZmlsZSBATE9DQUxTVEFURURJUkAvcnVuL21vc3F1aXR0by5waWQK
KworIyBQbGFjZSB5b3VyIGxvY2FsIGNvbmZpZ3VyYXRpb24gaW4gL2V0Yy9tb3NxdWl0dG8vY29u
Zi5kLworaW5jbHVkZV9kaXIgQFNZU0NPTkZESVJAL21vc3F1aXR0by9jb25mLmQKZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRvL21vc3F1aXR0b18xLjQu
MTQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vc3F1aXR0by9tb3NxdWl0dG9f
MS40LjE0LmJiCmluZGV4IDc2ZWI3OWI5Zi4uY2UyMTM3OWY2IDEwMDY0NAotLS0gYS9tZXRhLW9l
L3JlY2lwZXMtY29ubmVjdGl2aXR5L21vc3F1aXR0by9tb3NxdWl0dG9fMS40LjE0LmJiCisrKyBi
L21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRvL21vc3F1aXR0b18xLjQuMTQu
YmIKQEAgLTE0LDYgKzE0LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vbW9zcXVpdHRvLm9yZy9maWxl
cy9zb3VyY2UvbW9zcXVpdHRvLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LWNvbmZpZy5tay1hbGxvdy1wcmVmaXgtbWFuZGlyLWxvY2FsZWRpci1mcm9tLWVudmlyb24ucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi11dGhhc2gtcmVtb3ZlLWluLXRyZWUtdmVyc2lv
bi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXJlbW92ZS1leGFtcGxlLWZpbGVzLnBh
dGNoIFwKKyAgICAgICAgICAgZmlsZTovL21vc3F1aXR0by15b2N0by5jb25mIFwKICAgICAgICAg
ICAgZmlsZTovL21vc3F1aXR0by5zZXJ2aWNlIFwKICAgICAgICAgICAgZmlsZTovL21vc3F1aXR0
by5pbml0IFwKICIKQEAgLTQ1LDYgKzQ2LDE1IEBAIGRvX2luc3RhbGwoKSB7CiAgICAgaW5zdGFs
bCAtZCAke0R9JHtsaWJkaXJ9CiAgICAgaW5zdGFsbCAtbSAwNjQ0IGxpYi9saWJtb3NxdWl0dG8u
YSAke0R9JHtsaWJkaXJ9LwogCisgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9tb3Nx
dWl0dG8KKyAgICBpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9tb3NxdWl0dG8teW9jdG8uY29u
ZiAke0R9JHtzeXNjb25mZGlyfS9tb3NxdWl0dG8vbW9zcXVpdHRvLmNvbmYKKyAgICBzZWQgLWkg
LWUgJ3MsQExPQ0FMU1RBVEVESVJALCR7bG9jYWxzdGF0ZWRpcn0sZycgXAorICAgICAgICAtZSAn
cyxAU1lTQ09ORkRJUkAsJHtzeXNjb25mZGlyfSxnJyBcCisgICAgICAgICR7RH0ke3N5c2NvbmZk
aXJ9L21vc3F1aXR0by9tb3NxdWl0dG8uY29uZgorCisgICAgIyBjcmVhdGUgYW4gZW1wdHkgY29u
Zi5kIGRpcmVjdG9yeSB0byBtYWtlIG1vc3F1aXR0byBoYXBweQorICAgIGluc3RhbGwgLWQgJHtE
fSR7c3lzY29uZmRpcn0vbW9zcXVpdHRvL2NvbmYuZAorCiAgICAgaW5zdGFsbCAtZCAke0R9JHtz
eXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbS8KICAgICBpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9t
b3NxdWl0dG8uc2VydmljZSAke0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbS8KIApAQCAtNjUs
NiArNzUsNyBAQCBGSUxFU18ke1BOfSA9ICIke3NiaW5kaXJ9L21vc3F1aXR0byBcCiAgICAgICAg
ICAgICAgICAke3N5c2NvbmZkaXJ9L2luaXQuZCBcCiAgICAgICAgICAgICAgICAke3N5c3RlbWRf
dW5pdGRpcn0vc3lzdGVtL21vc3F1aXR0by5zZXJ2aWNlIFwKICIKK0NPTkZGSUxFU18ke1BOfSAr
PSAiJHtzeXNjb25mZGlyfS9tb3NxdWl0dG8iCiAKIEZJTEVTX2xpYm1vc3F1aXR0bzEgPSAiJHts
aWJkaXJ9L2xpYm1vc3F1aXR0by5zby4xIgogCi0tIAoyLjE3LjAKCg==

--000000000000c7fd70056d0866b6--
