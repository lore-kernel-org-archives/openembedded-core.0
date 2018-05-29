Return-Path: <ishitsuka.sc@ncos.nec.co.jp>
Received: from tyo162.gate.nec.co.jp (tyo162.gate.nec.co.jp [114.179.232.162])
	by mail.openembedded.org (Postfix) with ESMTP id E4BF5606A8
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 05:45:28 +0000 (UTC)
Received: from mailgate01.nec.co.jp ([114.179.233.122])
	by tyo162.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id w4T5jQww003310
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Tue, 29 May 2018 14:45:26 +0900
Received: from mailsv01.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
	by mailgate01.nec.co.jp (8.15.1/8.15.1) with ESMTP id w4T5jQrw028760;
	Tue, 29 May 2018 14:45:26 +0900
Received: from mail02.kamome.nec.co.jp (mail02.kamome.nec.co.jp [10.25.43.5])
	by mailsv01.nec.co.jp (8.15.1/8.15.1) with ESMTP id w4T5hZBU000967; 
	Tue, 29 May 2018 14:45:26 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.141] [10.38.151.141]) by
	mail01b.kamome.nec.co.jp with ESMTP id BT-MMP-750372;
	Tue, 29 May 2018 14:44:48 +0900
Received: from BPXM17GP.gisp.nec.co.jp ([10.38.151.209]) by
	BPXC13GP.gisp.nec.co.jp ([10.38.151.141]) with mapi id 14.03.0319.002;
	Tue, 29 May 2018 14:44:47 +0900
From: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] telnetd:Fix deadlock on cleanup
Thread-Index: AdP2S72BtbjSe1hGRA+y3gxwx+00Z///kF4A//4O3jA=
Date: Tue, 29 May 2018 05:44:46 +0000
Message-ID: <D3AF589C68C3694A8188BC776DB93B48A2F26F15@BPXM17GP.gisp.nec.co.jp>
References: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
	<c23b345f-564c-6fc8-c1be-7476d7853719@linux.intel.com>
In-Reply-To: <c23b345f-564c-6fc8-c1be-7476d7853719@linux.intel.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.27.178.67]
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: Re: [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Tue, 29 May 2018 05:45:29 -0000
X-Groupsio-MsgNum: 111819
Content-Language: ja-JP
Content-Type: multipart/mixed;
	boundary="_002_D3AF589C68C3694A8188BC776DB93B48A2F26F15BPXM17GPgispnec_"

--_002_D3AF589C68C3694A8188BC776DB93B48A2F26F15BPXM17GPgispnec_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Dear Alex,

> The patch should go to meta-openembedded list, and it should be created a=
gainst the layer source tree, not against the component source
> tree.

Thank you for all your kindness.
I have created a patch for meta-networking/recipes-netkit/netkit-telnet.
Please refer to the attached patch.

Best regards,
Seiichi Ishitsuka

--_002_D3AF589C68C3694A8188BC776DB93B48A2F26F15BPXM17GPgispnec_
Content-Type: application/octet-stream;
	name="0001-netkit-telnet-Fix-deadlock-on-cleanup.patch"
Content-Description: 0001-netkit-telnet-Fix-deadlock-on-cleanup.patch
Content-Disposition: attachment;
	filename="0001-netkit-telnet-Fix-deadlock-on-cleanup.patch"; size=4752;
	creation-date="Tue, 29 May 2018 04:57:13 GMT";
	modification-date="Tue, 29 May 2018 04:26:50 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OWUwMzhjOWQxNTc3MDMyM2JlMjNmNGYxMjA4N2JkZjQzZGI3YTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWlpY2hpIElzaGl0c3VrYSA8aXNoaXRzdWthLnNjQG5jb3Mu
bmVjLmNvLmpwPgpEYXRlOiBUdWUsIDI5IE1heSAyMDE4IDExOjQzOjI1ICswOTAwClN1YmplY3Q6
IFtQQVRDSF0gbmV0a2l0LXRlbG5ldDogRml4IGRlYWRsb2NrIG9uIGNsZWFudXAKClNpZ25lZC1v
ZmYtYnk6IFNlaWljaGkgSXNoaXRzdWthIDxpc2hpdHN1a2Euc2NAbmNvcy5uZWMuY28uanA+Ci0t
LQogLi4uLzAwMDEtdGVsbmV0ZC1GaXgtZGVhZGxvY2stb24tY2xlYW51cC5wYXRjaCAgICAgfCAx
MDcgKysrKysrKysrKysrKysrKysrKysrCiAuLi4vbmV0a2l0LXRlbG5ldC9uZXRraXQtdGVsbmV0
XzAuMTcuYmIgICAgICAgICAgICB8ICAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtbmV0a2l0
L25ldGtpdC10ZWxuZXQvZmlsZXMvMDAwMS10ZWxuZXRkLUZpeC1kZWFkbG9jay1vbi1jbGVhbnVw
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtbmV0a2l0L25ldGtp
dC10ZWxuZXQvZmlsZXMvMDAwMS10ZWxuZXRkLUZpeC1kZWFkbG9jay1vbi1jbGVhbnVwLnBhdGNo
IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtbmV0a2l0L25ldGtpdC10ZWxuZXQvZmlsZXMvMDAw
MS10ZWxuZXRkLUZpeC1kZWFkbG9jay1vbi1jbGVhbnVwLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAuLmQ2ODczYTUKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LXRlbG5ldC9maWxlcy8wMDAxLXRlbG5ldGQtRml4
LWRlYWRsb2NrLW9uLWNsZWFudXAucGF0Y2gKQEAgLTAsMCArMSwxMDcgQEAKK0Zyb20gY2RmODgy
OWY3NDNhZGIzZWM3MmMyMzFlZTU4NDNkYWJlZDkxYjMwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IFNlaWljaGkgSXNoaXRzdWthIDxpc2hpdHN1a2Euc2NAbmNvcy5uZWMuY28uanA+
CitEYXRlOiBUdWUsIDggTWF5IDIwMTggMDk6NTM6MzQgKzA5MDAKK1N1YmplY3Q6IFtQQVRDSF0g
dGVsbmV0ZDpGaXggZGVhZGxvY2sgb24gY2xlYW51cAorCit0aGUgcGF0Y2ggY29tZXMgZnJvbToK
K2h0dHBzOi8vbGF1bmNocGFkbGlicmFyaWFuLm5ldC8zNzg4Mjk3My8wMDAxLXRlbG5ldGQtRml4
LWRlYWRsb2NrLW9uLWNsZWFudXAucGF0Y2gKKworVGhlIGNsZWFudXAgZnVuY3Rpb24gaW4gdGVs
bmV0ZCBpcyBjYWxsZWQgYm90aCBkaXJlY3RseSBhbmQgb24gU0lHQ0hMRAorc2lnbmFscy4gVGhp
cywgdW5mb3J0dW5hdGVseSwgdHJpZ2dlcmVkIGEgZGVhZGxvY2sgaW4gZ2xpYmMgMi4yIHdoaWxl
CitydW5uaW5nIG9uIGEgNC40LjMyIGtlcm5lbC4KKworV2hhdCB3ZSB3ZXJlIHNlZWluZyBpcyBo
YW5ncyBsaWtlIHRoZXNlOgorCisoZ2RiKSBidAorICMwICAweDQ4OWZlZTZjIGluIF9fbGxsX2xv
Y2tfd2FpdF9wcml2YXRlIChmdXRleD0weDQ4YTVlOWE0IDxfX2xpYmNfdXRtcF9sb2NrPikgYXQg
Li9sb3dsZXZlbGxvY2suYzozMworICMxICAweDQ4YTI3OTM0IGluIF9fdXRtcG5hbWUgKGZpbGU9
MHg0OGFjMTI3OCAiL3Zhci9ydW4vdXRtcCIpIGF0IHV0bXBuYW1lLmM6NDIKKyAjMiAgMHg0OGFj
MGVjMCBpbiBsb2dvdXQgKGxpbmU9MHgyN2U5ZCAicHRzLzExIikgYXQgbG9nb3V0LmM6MzIKKwor
SG93IHRvIHJlcHJvZHVjZToKKworUnVuIHRoZSBzY3JpcHQgbW9yZSB0aGFuIG9uY2UgaW4gdGhl
IGJhY2tncm91bmQuCisKKyAjIS9iaW4vc2gKKworIEhPU1Q9Imhvc3QudGFyZ2V0IgorIFVTRVI9
InJvb3QiCisgUEFTUz0icGFzc3dvcmQiCisKKyB3aGlsZSA6CisgZG8KKyAgIGV4cGVjdCAtYyAi
CisgICBzZXQgdGltZW91dCAxMAorICAgc3Bhd24gdGVsbmV0ICRIT1NUCisgICBleHBlY3QgbG9n
aW46XCAgOyBzZW5kIFwiJFVTRVJcclwiCisgICBleHBlY3Qgc3dvcmQ6XCAgOyBzZW5kIFwiJFBB
U1NcclwiCisgICBleHBlY3QgXCIjIFwiIDsgc2VuZCBcImV4aXRcclwiCisgIiA+IC9kZXYvbnVs
bAorIGRvbmUKKworU2lnbmVkLW9mZi1ieTogU2VpaWNoaSBJc2hpdHN1a2EgPGlzaGl0c3VrYS5z
Y0BuY29zLm5lYy5jby5qcD4KKy0tLQorIHRlbG5ldGQvZXh0LmggICAgICB8ICAxICsKKyB0ZWxu
ZXRkL3N5c190ZXJtLmMgfCAxNyArKysrKysrKysrKysrKysrLQorIHRlbG5ldGQvdGVsbmV0ZC5j
ICB8ICAyICstCisgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQorCitkaWZmIC0tZ2l0IGEvdGVsbmV0ZC9leHQuaCBiL3RlbG5ldGQvZXh0LmgKK2luZGV4
IGI5OGQ2ZWMuLjA4ZjlkMDcgMTAwNjQ0CistLS0gYS90ZWxuZXRkL2V4dC5oCisrKysgYi90ZWxu
ZXRkL2V4dC5oCitAQCAtOTcsNiArOTcsNyBAQCB2b2lkIGFkZF9zbGMoaW50LCBpbnQsIGludCk7
Cisgdm9pZCBjaGVja19zbGModm9pZCk7Cisgdm9pZCBjaGFuZ2Vfc2xjKGludCwgaW50LCBpbnQp
OworIHZvaWQgY2xlYW51cChpbnQpOworK3ZvaWQgY2xlYW51cF9zaWdoYW5kbGVyKGludCk7Cisg
dm9pZCBjbGllbnRzdGF0KGludCwgaW50LCBpbnQpOworIHZvaWQgY29weV90ZXJtYnVmKGNoYXIg
KiwgaW50KTsKKyB2b2lkIGRlZmVyc2xjKHZvaWQpOworZGlmZiAtLWdpdCBhL3RlbG5ldGQvc3lz
X3Rlcm0uYyBiL3RlbG5ldGQvc3lzX3Rlcm0uYworaW5kZXggNWI0YWE4NC4uYzRmYjBmNyAxMDA2
NDQKKy0tLSBhL3RlbG5ldGQvc3lzX3Rlcm0uYworKysrIGIvdGVsbmV0ZC9zeXNfdGVybS5jCitA
QCAtNzE5LDcgKzcxOSw3IEBAIHN0YXRpYyB2b2lkIGFkZGFyZyhzdHJ1Y3QgYXJndl9zdHVmZiAq
YXZzLCBjb25zdCBjaGFyICp2YWwpIHsKKyAgKiBUaGlzIGlzIHRoZSByb3V0aW5lIHRvIGNhbGwg
d2hlbiB3ZSBhcmUgYWxsIHRocm91Z2gsIHRvCisgICogY2xlYW4gdXAgYW55dGhpbmcgdGhhdCBu
ZWVkcyB0byBiZSBjbGVhbmVkIHVwLgorICAqLworLXZvaWQgY2xlYW51cChpbnQgc2lnKSB7Cisr
dm9pZCBjbGVhbnVwX3NpZ2hhbmRsZXIoaW50IHNpZykgeworICAgICBjaGFyICpwOworICAgICAo
dm9pZClzaWc7CisgCitAQCAtNzQyLDMgKzc0MiwxOCBAQCB2b2lkIGNsZWFudXAoaW50IHNpZykg
eworICAgICBzaHV0ZG93bihuZXQsIDIpOworICAgICBleGl0KDApOworIH0KKysKKyt2b2lkIGNs
ZWFudXAoaW50IHNpZykgeworKyAgICBzaWdzZXRfdCBtYXNrLCBvbGRtYXNrOworKworKyAgICAv
KiBTZXQgdXAgdGhlIG1hc2sgb2Ygc2lnbmFscyB0byB0ZW1wb3JhcmlseSBibG9jay4gKi8KKysg
ICAgc2lnZW1wdHlzZXQgKCZtYXNrKTsKKysgICAgc2lnYWRkc2V0ICgmbWFzaywgU0lHQ0hMRCk7
CisrCisrICAgIC8qIEJsb2NrIFNJR0NITEQgd2hpbGUgcnVubmluZyBjbGVhbnVwICovCisrICAg
IHNpZ3Byb2NtYXNrIChTSUdfQkxPQ0ssICZtYXNrLCAmb2xkbWFzayk7CisrCisrICAgIGNsZWFu
dXBfc2lnaGFuZGxlcihzaWcpOworKyAgICAvKiBUZWNobmljYWxseSBub3QgbmVlZGVkIHNpbmNl
IGNsZWFudXBfc2lnaGFuZGxlciBleGl0cyAqLworKyAgICBzaWdwcm9jbWFzayAoU0lHX1VOQkxP
Q0ssICZtYXNrLCBOVUxMKTsKKyt9CitkaWZmIC0tZ2l0IGEvdGVsbmV0ZC90ZWxuZXRkLmMgYi90
ZWxuZXRkL3RlbG5ldGQuYworaW5kZXggOWFjZTgzOC4uNzg4OTE5YyAxMDA2NDQKKy0tLSBhL3Rl
bG5ldGQvdGVsbmV0ZC5jCisrKysgYi90ZWxuZXRkL3RlbG5ldGQuYworQEAgLTgzMyw3ICs4MzMs
NyBAQCB2b2lkIHRlbG5ldChpbnQgZiwgaW50IHApCisgICAgIHNpZ25hbChTSUdUVE9VLCBTSUdf
SUdOKTsKKyAjZW5kaWYKKyAgICAgCistICAgIHNpZ25hbChTSUdDSExELCBjbGVhbnVwKTsKKysg
ICAgc2lnbmFsKFNJR0NITEQsIGNsZWFudXBfc2lnaGFuZGxlcik7CisgICAgIAorICNpZmRlZiBU
SU9DTk9UVFkKKyAgICAgeworLS0gCisyLjYuNAorCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LXRlbG5ldC9uZXRraXQtdGVsbmV0XzAuMTcuYmIgYi9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LXRlbG5ldC9uZXRraXQtdGVsbmV0
XzAuMTcuYmIKaW5kZXggODA3YjU2Ni4uZTE1NjZmOCAxMDA2NDQKLS0tIGEvbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtbmV0a2l0L25ldGtpdC10ZWxuZXQvbmV0a2l0LXRlbG5ldF8wLjE3LmJiCisr
KyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLW5ldGtpdC9uZXRraXQtdGVsbmV0L25ldGtpdC10
ZWxuZXRfMC4xNy5iYgpAQCAtMTEsNiArMTEsNyBAQCBTUkNfVVJJID0gImZ0cDovL2Z0cC51ay5s
aW51eC5vcmcvcHViL2xpbnV4L05ldHdvcmtpbmcvbmV0a2l0LyR7QlB9LnRhci5neiBcCiAgICAg
ICAgICAgIGZpbGU6Ly90ZWxuZXQteGluZXRkIFwKICAgICAgICAgICAgZmlsZTovL2Nyb3NzLWNv
bXBpbGUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZWxuZXQtdGVsbmV0ZC1GaXgt
cHJpbnQtZm9ybWF0LXN0cmluZ3MucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS10ZWxu
ZXRkLUZpeC1kZWFkbG9jay1vbi1jbGVhbnVwLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBFWFRS
QV9PRU1BS0UgPSAiSU5TVEFMTFJPT1Q9JHtEfSBTQklORElSPSR7c2JpbmRpcn0gREFFTU9OTU9E
RT03NTUgXAotLSAKMS44LjMuMQoK

--_002_D3AF589C68C3694A8188BC776DB93B48A2F26F15BPXM17GPgispnec_--
