Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78524C7EE21
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 02:30:51 +0000 (UTC)
Subject: Re: [PATCH V1] e2fsprogs: fix ptest bug for second running
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 May 2023 19:30:42 -0700
References: <CAMKF1soZiL82M5y14agXb=OBU4Y3EeqUp=nzpD-kWO95q_z+3Q@mail.gmail.com>
In-Reply-To: <CAMKF1soZiL82M5y14agXb=OBU4Y3EeqUp=nzpD-kWO95q_z+3Q@mail.gmail.com>
Message-ID: <5798.1683253842910945486@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="f8O91Sc3wV78P2B9BUQq"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 02:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180891

--f8O91Sc3wV78P2B9BUQq
Content-Type: multipart/alternative; boundary="8HDHmD64pxNqGtrDAq2G"

--8HDHmD64pxNqGtrDAq2G
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C Khem Raj

It may be mangled by my mailer.

Could you use the attachments and try again?

Thanks,
Qiu Tingting

--8HDHmD64pxNqGtrDAq2G
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"elementToProof" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-variant-alternates: inherit;=
 font-stretch: inherit; font-size: 11pt; line-height: inherit; font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; font-=
kerning: inherit; font-feature-settings: inherit; font-variation-settings: =
inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #00000=
0;"><span class=3D"ContentPasted0" style=3D"border: 0px; font-style: inheri=
t; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font=
-size: medium; line-height: inherit; font-family: 'Segoe UI Web (West Europ=
ean)', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Ne=
ue', sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-=
feature-settings: inherit; font-variation-settings: inherit; margin: 0px; p=
adding: 0px; vertical-align: baseline; color: inherit; display: inline !imp=
ortant;">Hi=EF=BC=8C</span><span class=3D"ContentPasted0" style=3D"border: =
0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font=
-stretch: inherit; font-size: medium; line-height: inherit; font-family: 'S=
egoe UI Web (West European)', 'Segoe UI', -apple-system, BlinkMacSystemFont=
, Roboto, 'Helvetica Neue', sans-serif; font-optical-sizing: inherit; font-=
kerning: inherit; font-feature-settings: inherit; font-variation-settings: =
inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: inheri=
t;">Khem Raj</span></div>
<div class=3D"elementToProof" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-variant-alternates: inherit;=
 font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit;=
 font-kerning: inherit; font-feature-settings: inherit; font-variation-sett=
ings: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"><span =
class=3D"ContentPasted0" style=3D"border: 0px; font-variant-alternates: inh=
erit; font-variant-numeric: inherit; font-variant-east-asian: inherit; font=
-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font=
-kerning: inherit; font-feature-settings: inherit; font-variation-settings:=
 inherit; margin: 0px; padding: 0px; vertical-align: baseline;"><br /><span=
 style=3D"color: #000000; font-family: Segoe UI Web (West European), Segoe =
UI, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, sans-serif; =
font-size: medium;">It may be mangled by my mailer.</span><br /></span></di=
v>
<div class=3D"elementToProof" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-variant-alternates: inherit;=
 font-stretch: inherit; font-size: 11pt; line-height: inherit; font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; font-=
kerning: inherit; font-feature-settings: inherit; font-variation-settings: =
inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #00000=
0;"><span class=3D"ContentPasted0 ContentPasted1" style=3D"border: 0px; fon=
t-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch=
: inherit; font-size: medium; line-height: inherit; font-family: 'Segoe UI =
Web (West European)', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto=
, 'Helvetica Neue', sans-serif; font-optical-sizing: inherit; font-kerning:=
 inherit; font-feature-settings: inherit; font-variation-settings: inherit;=
 margin: 0px; padding: 0px; vertical-align: baseline; color: inherit;">Coul=
d you use the attachments and try again?</span></div>
<div class=3D"elementToProof" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-variant-alternates: inherit;=
 font-stretch: inherit; font-size: 11pt; line-height: inherit; font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; font-=
kerning: inherit; font-feature-settings: inherit; font-variation-settings: =
inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #00000=
0;">&nbsp;</div>
<div id=3D"appendonsend" style=3D"border: 0px; font-variant-numeric: inheri=
t; font-variant-east-asian: inherit; font-variant-alternates: inherit; font=
-stretch: inherit; font-size: medium; line-height: inherit; font-family: 'S=
egoe UI Web (West European)', 'Segoe UI', -apple-system, BlinkMacSystemFont=
, Roboto, 'Helvetica Neue', sans-serif; font-optical-sizing: inherit; font-=
kerning: inherit; font-feature-settings: inherit; font-variation-settings: =
inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #00000=
0;">&nbsp;</div>
<div class=3D"elementToProof" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-variant-alternates: inherit;=
 font-stretch: inherit; font-size: 11pt; line-height: inherit; font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-optical-sizing: inherit; font-=
kerning: inherit; font-feature-settings: inherit; font-variation-settings: =
inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: #00000=
0;"><span class=3D"ContentPasted2" style=3D"border: 0px; font-style: inheri=
t; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font=
-size: medium; line-height: inherit; font-family: 'Segoe UI Web (West Europ=
ean)', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Ne=
ue', sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-=
feature-settings: inherit; font-variation-settings: inherit; margin: 0px; p=
adding: 0px; vertical-align: baseline; color: inherit; display: inline !imp=
ortant;">Thanks,</span><br class=3D"ContentPasted2" style=3D"font-family: '=
Segoe UI Web (West European)', 'Segoe UI', -apple-system, BlinkMacSystemFon=
t, Roboto, 'Helvetica Neue', sans-serif; font-size: medium;" /><span class=
=3D"ContentPasted2" style=3D"border: 0px; font-style: inherit; font-variant=
: inherit; font-weight: inherit; font-stretch: inherit; font-size: medium; =
line-height: inherit; font-family: 'Segoe UI Web (West European)', 'Segoe U=
I', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif=
; font-optical-sizing: inherit; font-kerning: inherit; font-feature-setting=
s: inherit; font-variation-settings: inherit; margin: 0px; padding: 0px; ve=
rtical-align: baseline; color: inherit; display: inline !important;">Qiu Ti=
ngting</span></div>

--8HDHmD64pxNqGtrDAq2G--

--f8O91Sc3wV78P2B9BUQq
Content-Type: application/octet-stream; name="0001-e2fsprogs-fix-ptest-bug-for-second-running.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-e2fsprogs-fix-ptest-bug-for-second-running.patch"

RnJvbSBkYjRiNWUzMTcwM2U0MTQzNDUwYjFlNzIzOWIyNTAyYTg5ZWQwNDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBRaXUgVGluZ3RpbmcgPHFpdXR0QGZ1aml0c3UuY29tPgpEYXRl
OiBUaHUsIDI3IEFwciAyMDIzIDE1OjI5OjE0ICswODAwClN1YmplY3Q6IFtQQVRDSCBWMV0gZTJm
c3Byb2dzOiBmaXggcHRlc3QgYnVnIGZvciBzZWNvbmQgcnVubmluZwoKQXQgc2Vjb25kIHJ1bm5p
bmcsIHRoZXJlIGFyZSBmb3VyIG5ldyBmYWlsZWQgY2FzZToKICBkX2xvYWRkdW1wIGZfYmlnYWxs
b2NfYmFkaW5vZGUgZl9iaWdhbGxvY19vcnBoYW5fbGlzdCBmX2R1cF9yZXNpemUKClRoZSB0ZXN0
X2RhdGEudG1wIGlzIG5lY2Vzc2FyeSwgYnV0IGl0IGlzIGRlbGV0ZWQgYnkgcnVuLXB0ZXN0LgpT
byBpdCBzaG91bGQgYmUgcmVzdG9yZWQgYWZ0ZXIgdGVzdGluZy4KClNpZ25lZC1vZmYtYnk6IFFp
dSBUaW5ndGluZyA8cWl1dHRAZnVqaXRzdS5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2UyZnNwcm9ncy9lMmZzcHJvZ3MvcnVuLXB0ZXN0IHwgMSArCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjAuYmIgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJm
c3Byb2dzL2UyZnNwcm9ncy9ydW4tcHRlc3QgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3By
b2dzL2UyZnNwcm9ncy9ydW4tcHRlc3QKaW5kZXggYzk3YzAzNzdlOS4uMjc5OTIzZGI4ZSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcnVuLXB0
ZXN0CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3J1bi1w
dGVzdApAQCAtOCwzICs4LDQgQEAgcm0gLWYgKi50bXAKIHJtIC1mICoub2sKIHJtIC1mICouZmFp
bGVkCiBybSAtZiAqLmxvZworY3AgLi4vZGF0YS90ZXN0X2RhdGEudG1wIC4vCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjAuYmIKaW5kZXgg
YTJlYjRmOGY4Zi4uODdlMTNkNzQ0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcuMC5iYgpAQCAtMTQzLDQgKzE0Myw3IEBAIGRvX2lu
c3RhbGxfcHRlc3QoKSB7CiAKICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtQVEVTVF9QQVRIfS9s
aWIKICAgICAgICAgaW5zdGFsbCAtbSAwNjQ0ICR7Qn0vbGliL2NvbmZpZy5oICAke0R9JHtQVEVT
VF9QQVRIfS9saWIvCisKKyAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtQVEVTVF9QQVRIfS9kYXRh
CisgICAgICAgIGluc3RhbGwgLW0gMDY0NCAke0J9L3Rlc3RzL3Rlc3RfZGF0YS50bXAgJHtEfSR7
UFRFU1RfUEFUSH0vZGF0YS8KIH0KLS0gCjIuMjUuMQoK

--f8O91Sc3wV78P2B9BUQq--

