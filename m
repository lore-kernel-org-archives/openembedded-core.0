Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web10.3767.1603744884430102793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 13:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=LqwTpY9f;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09QKWOCY027431
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 16:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Ej5zfMfmFNU6NQb3EacnBdzUVzN2afW8v8FBw2nMFbo=;
 b=LqwTpY9fd5s+946SveEveJr2WbuAl6C2X7SjMO2GTqppGRmt6dk2DfWBaqA9WPuD22i9
 LDxOLvnggEiLeZknM6obtAQS6wwv2F42PhD4If3+OTeXPP4qREEeCMYI5NvWo+84pGPt
 4oeNiDBIA0wMouTMWFAa0zP4NvlaV6VT2fzhzevbaU4s38yEeXxANW7bybVF7x6WSM3K
 AzeX0KoO2FZzSJrbqrOfUWEl+D1UFQ5UjN5sPncTKB3Mq8j7Rop6dHWoHc6t9awWRr02
 64vU22NuJ6JQYLgTvPzGG0AI7np9YPQfGyGr/gX6lQfWBoBq5u2YeK7cCNKd59q6kE8e TA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 34dq9fst6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 16:41:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09QKb31U024728
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 20:41:23 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02dal.us.ibm.com with ESMTP id 34e1gna17x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 20:41:22 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09QKfEmZ61800908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 20:41:14 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD27B6A058
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 20:41:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CDEE6A051
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 20:41:21 +0000 (GMT)
Received: from [9.85.157.1] (unknown [9.85.157.1])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 20:41:21 +0000 (GMT)
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: [PATCH] add new extrausers command passwd-expire
Message-ID: <978bccd7-a2f4-9aa0-9c77-9c10c81e068f@linux.ibm.com>
Date: Mon, 26 Oct 2020 15:41:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-26_14:2020-10-26,2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260132
X-MIME-Autoconverted: from 8bit to base64 by mx0a-001b2d01.pphosted.com id 09QKWOCY027431
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64

VGhpcyBlbmhhbmNlcyBleHRyYXVzZXJzIHdpdGggYSBuZXcgcGFzc3dkLWV4cGlyZSBjb21t
YW5kIHRoYXQgY2F1c2VzDQphIGxvY2FsIHVzZXIncyBwYXNzd29yZCB0byBiZSBleHBpcmVk
IGFzIGlmIHRoZSBgcGFzc3dkIC0tZXhwaXJlYA0KY29tbWFuZCB3YXMgcnVuLCBzbyB0aGUg
cGFzc3dvcmQgbmVlZHMgdG8gYmUgY2hhbmdlZCBvbiBpbml0aWFsIGxvZ2luLg0KDQpFeGFt
cGxlOiBFWFRSQV9VU0VSU19QQVJBTVMgKz0gIiB1c2VyYWRkIC4uLiBzb2ZpYTsgcGFzc3dk
LWV4cGlyZSBzb2ZpYTsiDQoNClRlc3RlZDogb24gdXNlcmFkZCBhY2NvdW50cw0KV2hlbiBj
b25maWd1cmVkIHdpdGggTGludXgtUEFNLCBjb25zb2xlIGxvZ2luIHByb21wdHMgZm9yIGFu
ZCBjYW4NCnN1Y2Nlc3NmdWxseSBjaGFuZ2UgdGhlIHBhc3N3b3JkLsKgIE9wZW5TU0ggc2Vy
dmVyIHdvcmtzLsKgIERyb3BiZWFyDQpTU0ggc2VydmVyIG5vdGVzIHRoZSBwYXNzd29yZCBt
dXN0IGJlIGNoYW5nZWQgYnV0IGRvZXMgbm90IG9mZmVyIGENCnBhc3N3b3JkIGNoYW5nZSBk
aWFsb2cgYW5kIHJlamVjdHMgdGhlIGxvZ2luIHJlcXVlc3QuDQoNClNpZ25lZC1vZmYtYnk6
IEpvc2VwaCBSZXlub2xkcyA8am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0Pg0KLS0tDQog
wqBtZXRhL2NsYXNzZXMvZXh0cmF1c2Vycy5iYmNsYXNzwqDCoCB8wqAgMyArKysNCiDCoG1l
dGEvY2xhc3Nlcy91c2VyYWRkX2Jhc2UuYmJjbGFzcyB8IDE4ICsrKysrKysrKysrKysrKysr
Kw0KIMKgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQg
YS9tZXRhL2NsYXNzZXMvZXh0cmF1c2Vycy5iYmNsYXNzIA0KYi9tZXRhL2NsYXNzZXMvZXh0
cmF1c2Vycy5iYmNsYXNzDQppbmRleCAzMjU2OWU5Li45MDgxMWJmIDEwMDY0NA0KLS0tIGEv
bWV0YS9jbGFzc2VzL2V4dHJhdXNlcnMuYmJjbGFzcw0KKysrIGIvbWV0YS9jbGFzc2VzL2V4
dHJhdXNlcnMuYmJjbGFzcw0KQEAgLTQ2LDYgKzQ2LDkgQEAgc2V0X3VzZXJfZ3JvdXAgKCkg
ew0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgdXNlcm1vZCkNCiDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqBwZXJmb3JtX3VzZXJtb2QgIiR7SU1BR0VfUk9PVEZTfSIgIi1SICR7
SU1BR0VfUk9PVEZTfSANCiRvcHRzIg0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDC
oDs7DQorwqDCoCDCoMKgwqAgwqDCoMKgIMKgcGFzc3dkLWV4cGlyZSkNCivCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgcGVyZm9ybV9wYXNzd2RfZXhwaXJlICIke0lNQUdFX1JPT1RG
U30iICIkb3B0cyINCivCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgOzsNCiDCoMKgwqAg
wqDCoMKgIMKgwqDCoCDCoGdyb3VwbW9kKQ0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoHBlcmZvcm1fZ3JvdXBtb2QgIiR7SU1BR0VfUk9PVEZTfSIgIi1SICR7SU1BR0VfUk9P
VEZTfSANCiRvcHRzIg0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoDs7DQpkaWZm
IC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3VzZXJhZGRfYmFzZS5iYmNsYXNzIA0KYi9tZXRhL2Ns
YXNzZXMvdXNlcmFkZF9iYXNlLmJiY2xhc3MNCmluZGV4IDBkMGJkYjguLjdmNWI5YjcgMTAw
NjQ0DQotLS0gYS9tZXRhL2NsYXNzZXMvdXNlcmFkZF9iYXNlLmJiY2xhc3MNCisrKyBiL21l
dGEvY2xhc3Nlcy91c2VyYWRkX2Jhc2UuYmJjbGFzcw0KQEAgLTE0NSwzICsxNDUsMjEgQEAg
cGVyZm9ybV91c2VybW9kICgpIHsNCiDCoMKgwqAgwqBmaQ0KIMKgwqDCoCDCoHNldCAtZQ0K
IMKgfQ0KKw0KK3BlcmZvcm1fcGFzc3dkX2V4cGlyZSAoKSB7DQorwqDCoCDCoGxvY2FsIHJv
b3RkaXI9IiQxIg0KK8KgwqAgwqBsb2NhbCBvcHRzPSIkMiINCivCoMKgIMKgYmJub3RlICIk
e1BOfTogUGVyZm9ybWluZyBlcXVpdmFsZW50IG9mIHBhc3N3ZCAtLWV4cGlyZSB3aXRoIFsk
b3B0c10iDQorwqDCoCDCoCMgRGlyZWN0bHkgc2V0IHNwX2xzdGNoZyB0byAwIHdpdGhvdXQg
dXNpbmcgdGhlIHBhc3N3ZCBjb21tYW5kOiANCk9ubHkgcm9vdCBjYW4gZG8gdGhhdA0KK8Kg
wqAgwqBsb2NhbCB1c2VybmFtZT1gZWNobyAiJG9wdHMiIHwgYXdrICd7IHByaW50ICRORiB9
J2ANCivCoMKgIMKgbG9jYWwgdXNlcl9leGlzdHM9ImBncmVwICJeJHVzZXJuYW1lOiIgJHJv
b3RkaXIvZXRjL3Bhc3N3ZCB8fCB0cnVlYCINCivCoMKgIMKgaWYgdGVzdCAieCR1c2VyX2V4
aXN0cyIgIT0gIngiOyB0aGVuDQorwqDCoCDCoMKgwqAgwqBldmFsIGZsb2NrIC14ICRyb290
ZGlyJHtzeXNjb25mZGlyfSAtYyBcIiRQU0VVRE8gc2VkIC1pIA0KXCcncy9eXCgnJHVzZXJu
YW1lJzpbXjpdKlwpOlteOl0qOi9cMTowOi8nXCcgJHJvb3RkaXIvZXRjL3NoYWRvdyBcIiB8
fCB0cnUNCmUNCivCoMKgIMKgwqDCoCDCoGxvY2FsIHBhc3N3ZF9sYXN0Y2hhbmdlZD0iYGdy
ZXAgIl4kdXNlcm5hbWU6IiANCiRyb290ZGlyL2V0Yy9zaGFkb3cgfCBjdXQgLWQ6IC1mM2Ai
DQorwqDCoCDCoMKgwqAgwqBpZiB0ZXN0ICJ4JHBhc3N3ZF9sYXN0Y2hhbmdlZCIgIT0gIngw
IjsgdGhlbg0KK8KgwqAgwqDCoMKgIMKgwqDCoCDCoGJiZmF0YWwgIiR7UE59OiBwYXNzd2Qg
LS1leHBpcmUgb3BlcmF0aW9uIGRpZCBub3Qgc3VjY2VlZC4iDQorwqDCoCDCoMKgwqAgwqBm
aQ0KK8KgwqAgwqBlbHNlDQorwqDCoCDCoMKgwqAgwqBiYm5vdGUgIiR7UE59OiB1c2VyICR1
c2VybmFtZSBkb2Vzbid0IGV4aXN0LCBub3QgZXhwaXJpbmcgaXRzIA0KcGFzc3dvcmQiDQor
wqDCoCDCoGZpDQorfQ0KLS0gDQoyLjcuMg0KDQo=
