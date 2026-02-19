Return-Path: <navinreddy23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EA5E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 15:38:25 +0000 (UTC)
Subject: How to backport latest go version?
To: openembedded-core@lists.openembedded.org
From: navinreddy23@gmail.com
X-Originating-Location: Voorburg, South Holland, NL (31.149.254.209)
X-Originating-Platform: Linux Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Feb 2026 07:38:23 -0800
Message-ID: <nOYT.1771515503207887946.99kd@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="34NSPz8iCODx7VViJZtR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 15:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231432

--34NSPz8iCODx7VViJZtR
Content-Type: multipart/alternative; boundary="FqYXA44rRKHBliKmFFYE"

--FqYXA44rRKHBliKmFFYE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I am currently using scarthgap branch and was not able to successfully back=
port latest go version 1.26.0.
I have created a custom layer (meta-dummy) and added all the files from rec=
ipes-devtools/go of Whinlatter branch. Yet, when I invoke bitbake recipe-na=
me, I get the old version which is present as

=E2=9D=AF tmp/sysroots-components/x86_64/go-cross-armv8a/usr/lib/aarch64-td=
x-linux/go/bin/go version
go version go1.22.12 linux/amd64

I am able to set the preferred version in local.conf and it builds fine and=
 I am able toverify the binary version for the host.
PREFERRED_VERSION_go=3D"1.26.0"
PREFERRED_VERSION_go-native=3D"1.26.0"
PREFERRED_VERSION_go-cross=3D"1.26.0"

Am I missing something here? Is it the right way to backport?

Best regards,
Navin

--FqYXA44rRKHBliKmFFYE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello all,</div>
<div>&nbsp;</div>
<div>I am currently using scarthgap branch and was not able to successfully=
 backport latest go version 1.26.0.</div>
<div>I have created a custom layer (meta-dummy) and added all the files fro=
m recipes-devtools/go of Whinlatter branch. Yet, when I invoke bitbake reci=
pe-name, I get the old version which is present as</div>
<div>&nbsp;</div>
<div>=E2=9D=AF tmp/sysroots-components/x86_64/go-cross-armv8a/usr/lib/aarch=
64-tdx-linux/go/bin/go version<br />go version go1.22.12 linux/amd64</div>
<div>&nbsp;</div>
<div>I am able to set the preferred version in local.conf and it builds fin=
e and I am able toverify the binary version for the host.</div>
<div>PREFERRED_VERSION_go=3D"1.26.0"<br />PREFERRED_VERSION_go-native=3D"1.=
26.0"<br />PREFERRED_VERSION_go-cross=3D"1.26.0"</div>
<div>&nbsp;</div>
<div>Am I missing something here? Is it the right way to backport?</div>
<div>&nbsp;</div>
<div>Best regards,</div>
<div>Navin</div>

--FqYXA44rRKHBliKmFFYE--

--34NSPz8iCODx7VViJZtR
Content-Type: text/plain; name="log.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="log.txt"

U3N0YXRlIHN1bW1hcnk6IFdhbnRlZCAxMiBMb2NhbCA1IE1pcnJvcnMgMCBNaXNzZWQgNyBDdXJy
ZW50IDQ5OCAoNDElIG1hdGNoLCA5OCUgY29tcGxldGUpIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMgICAgICAgICAgICAgICAgICAgICAgICB8IEVUQTogIDA6MDA6MDAKSW5pdGlhbGlzaW5n
IHRhc2tzOiAxMDAlIHwjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyN8IFRpbWU6IDA6MDA6MDAKTk9URTogRXhlY3V0aW5nIFRhc2tzCkVS
Uk9SOiBkaXNwbGF5c2V0dGluZ3N0dWktMC4wLjUrZ2l0LXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlv
bkVycm9yKCcvaG9tZS9uYXZpbi9QbGF5Z3JvdW5kL2J1aWxkL3RtcC93b3JrL2FybXY4YS10ZHgt
bGludXgvZGlzcGxheXNldHRpbmdzdHVpLzAuMC41K2dpdC90ZW1wL3J1bi5kb19jb21waWxlLjM0
OTcyOScsIDEsIE5vbmUsIE5vbmUpCkVSUk9SOiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVkIGlu
OiAvaG9tZS9uYXZpbi9QbGF5Z3JvdW5kL2J1aWxkL3RtcC93b3JrL2FybXY4YS10ZHgtbGludXgv
ZGlzcGxheXNldHRpbmdzdHVpLzAuMC41K2dpdC90ZW1wL2xvZy5kb19jb21waWxlLjM0OTcyOQpM
b2cgZGF0YSBmb2xsb3dzOgp8IERFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVuY3Rpb24gZG9fY29t
cGlsZQp8IGdvOiBnby5tb2QgcmVxdWlyZXMgZ28gPj0gMS4yNS4xIChydW5uaW5nIGdvIDEuMjIu
MTIpCnwgZ286IGdvLm1vZCByZXF1aXJlcyBnbyA+PSAxLjI1LjEgKHJ1bm5pbmcgZ28gMS4yMi4x
MikKfCBXQVJOSU5HOiBleGl0IGNvZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4KRVJST1I6IFRh
c2sgKC9ob21lL25hdmluL1BsYXlncm91bmQvbGF5ZXJzL21ldGEtZHVtbXkvcmVjaXBlcy1leGFt
cGxlL2Rpc3BsYXlzZXR0aW5nc3R1aS9kaXNwbGF5c2V0dGluZ3N0dWlfZ2l0LmJiOmRvX2NvbXBp
bGUpIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScKTk9URTogVGFza3MgU3VtbWFyeTogQXR0ZW1w
dGVkIDEyMjYgdGFza3Mgb2Ygd2hpY2ggMTIyNSBkaWRuJ3QgbmVlZCB0byBiZSByZXJ1biBhbmQg
MSBmYWlsZWQuCk5PVEU6IFdyaXRpbmcgYnVpbGRoaXN0b3J5Ck5PVEU6IFdyaXRpbmcgYnVpbGRo
aXN0b3J5IHRvb2s6IDMgc2Vjb25kcwoKU3VtbWFyeTogMSB0YXNrIGZhaWxlZDoKICAvaG9tZS9u
YXZpbi9QbGF5Z3JvdW5kL2xheWVycy9tZXRhLWR1bW15L3JlY2lwZXMtZXhhbXBsZS9kaXNwbGF5
c2V0dGluZ3N0dWkvZGlzcGxheXNldHRpbmdzdHVpX2dpdC5iYjpkb19jb21waWxlCiAgICBsb2c6
IC9ob21lL25hdmluL1BsYXlncm91bmQvYnVpbGQvdG1wL3dvcmsvYXJtdjhhLXRkeC1saW51eC9k
aXNwbGF5c2V0dGluZ3N0dWkvMC4wLjUrZ2l0L3RlbXAvbG9nLmRvX2NvbXBpbGUuMzQ5NzI5ClN1
bW1hcnk6IFRoZXJlIHdhcyAxIEVSUk9SIG1lc3NhZ2UsIHJldHVybmluZyBhIG5vbi16ZXJvIGV4
aXQgY29kZS4K

--34NSPz8iCODx7VViJZtR--

