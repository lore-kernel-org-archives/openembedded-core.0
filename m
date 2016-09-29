Return-Path: <mateusz.cz.nowakowski@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5C760722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:54:00 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b4so33565957wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=9Zu7ZzBK9xqE1uZ3LaqD4q760Que9OicYwh60/wZWdY=;
	b=V+sIPG/e6a4reB6bPlS7FF2mnsY5Hpnm8oTXs24vWm0u13xE2FAZBGFk4vP+05f00l
	uRK/NpcwcK6D5cKObTSP6jKXrpENNIE87qv7HiYKG1CfG5K13jf13gWB8mtEr+wj7861
	+V+W1T1rBHluMUZSsnyogSp2G6FFdPcc4MM5ErYgkWF4afeE8BOE7xZy3g89Qmiv41Q9
	Iag2CPamUsHFQ+Asmak7J8enV0dNpG3Kx/vIUChUCdUA0knGbv+O+LBH/Cu03qJm39vy
	Etp4d5iyVbhqWT20A3D69Lm00RQB1vNazkD3Wm5R5Rwh71I9v0qNV/3Zf17p5APrkNPH
	x/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9Zu7ZzBK9xqE1uZ3LaqD4q760Que9OicYwh60/wZWdY=;
	b=ACvLMmee3Kilah9qABmT2/Z6WTPws+feVl9+8hP9kQgagPD8G2bs/oguOe6BCmiY6l
	nCBOK9EebN10Qav62R0kiLOZLKPs9EA4wS13wanLk3emZQGWhMDa8Ad2WdOcrKgmMS/o
	GzzLP+PlSlMf9nNmV8E+mev1G7Riz5pHLC8fxt2cYa2L3X5pqj0YdztO5DuA417wFzuI
	FikTCeJ8IVLQXoWg9xQoGae7rnl+R9Qiu0XmQ6y/9LURvUlbRTj6ZovOYtrGjuuzEhkS
	Nf+kGLCbVNGV7R6TWtGlKEChUbVxtlZjQR9CLOjZCfB0Yhu3kSQ24V+8IuBegSHytEwd
	FulQ==
X-Gm-Message-State: AA6/9Rm1A/Uvy/RU5TuudwjHACXUt2asxReaqAyGQnEvCZqtCHCSz1ucgqyB1PdVHpNAIJotvYHT30dodksASA==
X-Received: by 10.194.206.68 with SMTP id lm4mr1946453wjc.106.1475160841008;
	Thu, 29 Sep 2016 07:54:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.146.134 with HTTP; Thu, 29 Sep 2016 07:54:00 -0700 (PDT)
From: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
Date: Thu, 29 Sep 2016 14:54:00 +0000
Message-ID: <CAG_Oc3aNNFhTVy_Rg1fmS-jXPoestjjBdZYnEhsoGQqd-qjXUg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: gmock install fix for 64bit architectures
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
X-List-Received-Date: Thu, 29 Sep 2016 14:54:00 -0000
X-Groupsio-MsgNum: 87685
Content-Type: multipart/mixed; boundary=047d7bae41feea5934053da6a5bb

--047d7bae41feea5934053da6a5bb
Content-Type: multipart/alternative; boundary=047d7bae41feea592f053da6a5b9

--047d7bae41feea592f053da6a5b9
Content-Type: text/plain; charset=UTF-8

Hi i found some bug in gmock receipe when target architecture is 64bit. I
attach simple fix

How to deploy this fix to jethro/kroghot and master branches ??



-- 
Pozdrawiam, Mateusz Nowakowski

--047d7bae41feea592f053da6a5b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi i found some bug in gmock receipe when target arch=
itecture is 64bit. I attach simple fix<br><br></div>How to deploy this fix =
to jethro/kroghot and master branches ??<br><br><br clear=3D"all"><div><div=
><br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><font color=3D"#666666">Pozdrawiam, Mateusz Nowakowski<=
/font></div></div>
</div></div></div>

--047d7bae41feea592f053da6a5b9--

--047d7bae41feea5934053da6a5bb
Content-Type: text/x-patch; charset=US-ASCII; name="gmock.patch"
Content-Disposition: attachment; filename="gmock.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_itokxz1n0

ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy10ZXN0L2dtb2NrL2dtb2NrL2NtYWtlLUFkZC1p
bnN0YWxsLWNvbW1hbmQtZm9yLWxpYnJhcmllcy1hbmQtaGVhZGVycy5wYXRjaCBiL21ldGEtb2Uv
cmVjaXBlcy10ZXN0L2dtb2NrL2dtb2NrL2NtYWtlLUFkZC1pbnN0YWxsLWNvbW1hbmQtZm9yLWxp
YnJhcmllcy1hbmQtaGVhZGVycy5wYXRjaAppbmRleCA5MmE2MzkzLi4wZGFjOTk4IDEwMDY0NAot
LS0gYS9tZXRhLW9lL3JlY2lwZXMtdGVzdC9nbW9jay9nbW9jay9jbWFrZS1BZGQtaW5zdGFsbC1j
b21tYW5kLWZvci1saWJyYXJpZXMtYW5kLWhlYWRlcnMucGF0Y2gKKysrIGIvbWV0YS1vZS9yZWNp
cGVzLXRlc3QvZ21vY2svZ21vY2svY21ha2UtQWRkLWluc3RhbGwtY29tbWFuZC1mb3ItbGlicmFy
aWVzLWFuZC1oZWFkZXJzLnBhdGNoCkBAIC0yOSw4ICsyOSw4IEBAIGluZGV4IDU3MmQwNDQuLjkw
ZTc5N2EgMTAwNjQ0CiAgICAgICAgICAgICAgc3JjL2dtb2NrX21haW4uY2MpCiAgCiArCi0raW5z
dGFsbChUQVJHRVRTIGdtb2NrIERFU1RJTkFUSU9OIGxpYikKLStpbnN0YWxsKFRBUkdFVFMgZ21v
Y2tfbWFpbiBERVNUSU5BVElPTiBsaWIpCisraW5zdGFsbChUQVJHRVRTIGdtb2NrIERFU1RJTkFU
SU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9KQorK2luc3RhbGwoVEFSR0VUUyBnbW9ja19tYWlu
IERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9KQogKwogICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogICMKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy10ZXN0L2dtb2NrL2dtb2NrL2NtYWtl
LWdtb2NrLnBjLmluLUFkZC1wa2ctY29uZmlnLXN1cHBvcnQucGF0Y2ggYi9tZXRhLW9lL3JlY2lw
ZXMtdGVzdC9nbW9jay9nbW9jay9jbWFrZS1nbW9jay5wYy5pbi1BZGQtcGtnLWNvbmZpZy1zdXBw
b3J0LnBhdGNoCmluZGV4IGFhMzhmZTQuLjhmZmUxYTYgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVj
aXBlcy10ZXN0L2dtb2NrL2dtb2NrL2NtYWtlLWdtb2NrLnBjLmluLUFkZC1wa2ctY29uZmlnLXN1
cHBvcnQucGF0Y2gKKysrIGIvbWV0YS1vZS9yZWNpcGVzLXRlc3QvZ21vY2svZ21vY2svY21ha2Ut
Z21vY2sucGMuaW4tQWRkLXBrZy1jb25maWctc3VwcG9ydC5wYXRjaApAQCAtMjcsMTEgKzI3LDEx
IEBAIGluZGV4IDkwZTc5N2EuLjk4ZmQ4MjQgMTAwNjQ0CiAgIyBQcm9qZWN0LXdpZGUgc2V0dGlu
Z3MKIEBAIC04Nyw3ICs5MCw5IEBAIGN4eF9saWJyYXJ5KGdtb2NrX21haW4KICAKLSBpbnN0YWxs
KFRBUkdFVFMgZ21vY2sgREVTVElOQVRJT04gbGliKQotIGluc3RhbGwoVEFSR0VUUyBnbW9ja19t
YWluIERFU1RJTkFUSU9OIGxpYikKKyBpbnN0YWxsKFRBUkdFVFMgZ21vY2sgREVTVElOQVRJT04g
JHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0pCisgaW5zdGFsbChUQVJHRVRTIGdtb2NrX21haW4gREVT
VElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0pCiAtCiAraW5zdGFsbChGSUxFUyAiJHtD
TUFLRV9DVVJSRU5UX0JJTkFSWV9ESVJ9L2dtb2NrLnBjIgotKyAgICBERVNUSU5BVElPTiAiJHtD
TUFLRV9JTlNUQUxMX1BSRUZJWH0vbGliL3BrZ2NvbmZpZy8iCisrICAgIERFU1RJTkFUSU9OICIk
e0NNQUtFX0lOU1RBTExfTElCRElSfS9wa2djb25maWcvIgogKykgIAogICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogICMK

--047d7bae41feea5934053da6a5bb--
