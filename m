Return-Path: <steffen.pankratz@elektrobit.com>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Jul 2015 08:16:11 UTC
Received: from smtpgw1fi.bittium.com (smtpgw1fi.bittium.com [194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id F2AC975D16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:16:11 +0000 (UTC)
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.bittium.com (8.14.4/8.14.4) with ESMTP id t638B3q2027348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 11:11:03 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 11:11:02 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Fri, 3 Jul 2015 10:11:01 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libdrm: Upgrade to 2.4.62
Thread-Index: AdC1Z8p3zllC9RjxR9meZsKny4a3+A==
Date: Fri, 3 Jul 2015 08:11:01 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.bittium.com [172.16.0.202]);
	Fri, 03 Jul 2015 11:11:03 +0300 (EEST)
X-Virus-Scanned: at elektrobit.com
X-Scanned-By: MIMEDefang 2.78 on 172.16.0.202
Subject: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Fri, 03 Jul 2015 08:16:16 -0000
X-Groupsio-MsgNum: 67506
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836deeres07ebgroup_"

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836deeres07ebgroup_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

attached you can find a patch to upgrade libdrm to version 2.4.62.
I added a temporary workaround, as Valgrind support is enabled by default c=
urrently,
this was already fixed upstream for the next version.


Regards
-Steffen

--
Steffen Pankratz
Expert, Software Integration & Services

EB - Driving the Future of Software
Phone:  +49 9131 7701-6605
Fax: +49 9131 7701 6333
steffen.pankratz@elektrobit.com
http://automotive.elektrobit.com/
PGP-Key: http://keyserver.elektrobit.com/

Elektrobit Automotive GmbH, Am Wolfsmantel 46, 91058 Erlangen, Germany
Managing Directors Alexander Kocher, Gregor Zink
Register Court F=FCrth HRB 488




----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.


--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836deeres07ebgroup_
Content-Type: application/octet-stream;
	name="0001-libdrm-Upgrade-to-2.4.62.patch"
Content-Description: 0001-libdrm-Upgrade-to-2.4.62.patch
Content-Disposition: attachment;
	filename="0001-libdrm-Upgrade-to-2.4.62.patch"; size=1661;
	creation-date="Fri, 03 Jul 2015 08:02:36 GMT";
	modification-date="Fri, 03 Jul 2015 08:04:59 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMzU0M2JlZjQzMjI5MGE0YWQ4YjVmNjJlMTA2MDA2ODBkYzRkMWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmZmVuIFBhbmtyYXR6IDxzdGVmZmVuLnBhbmtyYXR6QGVs
ZWt0cm9iaXQuY29tPgpEYXRlOiBGcmksIDMgSnVsIDIwMTUgMDc6NDU6MzcgKzAwMDAKU3ViamVj
dDogW1BBVENIXSBsaWJkcm06IFVwZ3JhZGUgdG8gMi40LjYyCgpTaWduZWQtb2ZmLWJ5OiBTdGVm
ZmVuIFBhbmtyYXR6IDxzdGVmZmVuLnBhbmtyYXR6QGVsZWt0cm9iaXQuY29tPgotLS0KIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5iYiB8ICA2IC0tLS0tLQogbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjYyLmJiIHwgMTAgKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5iYgogY3Jl
YXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC42Mi5i
YgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC41OS5iYgpkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMTRiZjQ0YS4uMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNTkuYmIKKysrIC9kZXYvbnVsbApAQCAtMSw2ICswLDAg
QEAKLXJlcXVpcmUgbGliZHJtLmluYwotCi1TUkNfVVJJICs9ICJmaWxlOi8vaW5zdGFsbHRlc3Rz
LnBhdGNoICIKLQotU1JDX1VSSVttZDVzdW1dID0gImQzMmExZDM3YzI1NDZlZTExZmM1OTI0YWJl
ZWRiMjNlIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4ZDI2ZTFmZDg1NTgyZjQyNDNkNjY4NjRm
OWI0M2NhNGVlOTM2NjI4MjVkZTMyYjU1MDZmYzhlMTgxZWE0MWIiCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuNjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZHJtL2xpYmRybV8yLjQuNjIuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMC4uMTA5ZmMyYwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC42Mi5iYgpAQCAtMCwwICsxLDEwIEBACityZXF1aXJlIGxpYmRybS5pbmMK
KworU1JDX1VSSSArPSAiZmlsZTovL2luc3RhbGx0ZXN0cy5wYXRjaCAiCisKK1NSQ19VUklbbWQ1
c3VtXSA9ICJjOTI5MWJhZTBlNWNhNjVkMTQ4MzgyMWQzNjk4ZDNhYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MDZjMjk0YmRiZTFjOTRjM2NhMDg0MzA1ZDYxYTZlNWE4MzY3ZjNiNDk4NmU2Y2Mx
M2IxZTliM2Y3NTkzMWRjIgorCisjIFZhbGdyaW5kIHN1cHBvcnQgaXMgZW5hYmxlZCBieSBkZWZh
dWx0IGN1cnJlbnRseQorIyBhbHJlYWR5IGZpeGVkIHVwc3RyZWFtOiBodHRwOi8vY2dpdC5mcmVl
ZGVza3RvcC5vcmcvbWVzYS9kcm0vY29tbWl0Lz9pZD02NzZjODA2ZDAyMjFhN2VhMzc1Njc2YjJl
YWI1MTRjNDI2ZmNhY2QzCitFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS12YWxncmluZCIKLS0g
CjEuOS4xCgo=

--_002_81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836deeres07ebgroup_--
