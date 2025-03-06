Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F5BC28B24
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:17:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.19587.1741281427624416115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 09:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=nONsQlP6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_bpothuno@quicinc.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526B3ipY031985;
	Thu, 6 Mar 2025 17:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqIdFP3/PSBPoq6TW5oPGdRfgdouBhHNxhbFgkJlzuM=; b=nONsQlP6UIFAdDAp
	iOfWkYN8IjRitZDDR4w6czD3/IRZE7BZdMqHA9zcl2SjDvRncqusRvJ8u1F/XD8E
	V0XVfShy/mqYCV2LVy+dKEAQgvu3XOP0P98KSzk3mqDWV5h6+Q1L9xaTkFT0qZbE
	JVIHNtzyt5PonjDxvzUd4FskfYNi8m7DDJhxjodmAJ283ec1Euf/XZoV7Nq62vcv
	/y05CE/O+Vznpp/S1xjUTt6Nbl+QoNw/vjttXUJO42v2ZJp0gm+TW6L/EcrxHRNN
	4T42MvqJ9EPzLwZ5ObXkJYLoGmrainnc48mfrpm69McyHbn4AhT1LCylP7SXBOBv
	ZHjoEA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 457aghh2w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 17:17:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526HH5BV005273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 17:17:05 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 09:17:05 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::fc0a:7737:fa2e:7315]) by
 nalasex01a.na.qualcomm.com ([fe80::fc0a:7737:fa2e:7315%4]) with mapi id
 15.02.1544.009; Thu, 6 Mar 2025 09:17:05 -0800
From: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] dhcpcd: upgrade 10.1.0 -> 10.2.2
Thread-Topic: [OE-core] [PATCH v2] dhcpcd: upgrade 10.1.0 -> 10.2.2
Thread-Index: AQHbjqd4p14XHRawGESvfLdtyM5Qx7Nm1J+A//+C86A=
Date: Thu, 6 Mar 2025 17:17:05 +0000
Message-ID: <d5b6d423c5284906a7e69eb0184938d8@quicinc.com>
References: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
 <0ba2e2413c2573331e643f0021dc0aed964e005e.camel@linuxfoundation.org>
In-Reply-To: <0ba2e2413c2573331e643f0021dc0aed964e005e.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.51.80]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7QBH6dmVHbRa-MSjKhDEuJ9ruHZcnu_t
X-Authority-Analysis: v=2.4 cv=R5D5GcRX c=1 sm=1 tr=0 ts=67c9d891 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=xqWC_Br6kY4A:10 a=_REmwED879gA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8
 a=Q4-j1AaZAAAA:8 a=5ikL7KXGl7_sQPdEancA:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 7QBH6dmVHbRa-MSjKhDEuJ9ruHZcnu_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 spamscore=0 mlxlogscore=896 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 17:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212400

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDYsIDIwMjUgMTA6MDYgUE0NCj4gVG86IEJhbGFqaSBQb3RodW5vb3JpIChRVUlDKSA8cXVpY19i
cG90aHVub0BxdWljaW5jLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIGRoY3BjZDogdXBn
cmFkZSAxMC4xLjAgLT4gMTAuMi4yDQo+IA0KPiBPbiBUaHUsIDIwMjUtMDMtMDYgYXQgMjA6MjIg
KzA1MzAsIEJhbGFqaSBQb3RodW5vb3JpIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPiA+IFRoaXMgY2hhbmdlIGluY2x1ZGVzOg0KPiA+IGEuIHVwZ3JhZGVzIGRoY3BjZCB2
ZXJzaW9uIHRvIGxhdGVzdCAxMC4yLjIuDQo+ID4gYi4gdXBkYXRlIExJQ19GSUxFU19DSEtTVU0g
Zm9yIGRoY3BjZA0KPiA+IExpY2Vuc2UtVXBkYXRlOiBVcGRhdGVkIE1ENSBjaGVja3N1bSBmb3Ig
TElDRU5TRSBmaWxlIHRvIHJlZmxlY3QNCj4gPiBjaGFuZ2VzIGluIHZlcnNpb24gMTAuMi4yDQo+
IA0KPiBUaGUga2V5IHRoaW5nIHdlIG5lZWQgdG8ga25vdyBpcyBkaWQgdGhlIGxpY2Vuc2Ugb2Yg
dGhlIGNvZGUgY2hhbmdlPw0KPiBUaGUgcmVjaXBlIHNheXMgaXQgaXMgQlNELTItQ2xhdXNlLCBp
cyB0aGF0IHN0aWxsIHRoZSBjYXNlPw0KDQpJIG5vdGljZWQgdGhhdCB0aGUgZGhjcGQgc291cmNl
IGNvZGUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIEJTRCAyLUNsYXVzZSBMaWNlbnNlLg0KVGhlIE1E
NSBjaGVja3N1bSBvZiB0aGUgZGhjcGNkIExJQ0VOU0UgZmlsZSBoYXMgY2hhbmdlZCwgY2F1c2lu
ZyB0aGUgcmVjaXBlIHRvIHRocm93IGEgY29tcGlsYXRpb24gZXJyb3IuDQoNCkVSUk9SOiBkaGNw
Y2QtMTAuMi4yLXIwIGRvX3BvcHVsYXRlX2xpYzogUUEgSXNzdWU6IGRoY3BjZDogVGhlIExJQ19G
SUxFU19DSEtTVU0gZG9lcyBub3QgbWF0Y2ggZm9yIGZpbGU6Ly9MSUNFTlNFO21kNT1kMjk2YzRi
ZWMzMDZmMzUxZTY3NjcwNWFhZjIzN2M4Yw0KZGhjcGNkOiBUaGUgbmV3IG1kNSBjaGVja3N1bSBp
cyA0ZGRhNWJlYjQzM2E4MDlmMmUwYWVmZmJmOWRhM2Q5MQ0KDQomDQoNCiNtZDVzdW0gTElDRU5T
RQ0KNGRkYTViZWI0MzNhODA5ZjJlMGFlZmZiZjlkYTNkOTEgIExJQ0VOU0UNCg0KPiANCj4gRG8g
d2UgbmVlZCB0byBkcm9wIHRoZSBmaXggSSBtZXJnZWQgaW4gb25lIG9mIHlvdXIgcHJldmlvdXMg
cGF0Y2hlcz8gSXMgaXQgc3RpbGwNCj4gbmVlZGVkIHdpdGggdGhpcyB2ZXJzaW9uPw0KDQpDb3Vs
ZCB5b3UgcGxlYXNlIGRpcmVjdCBtZSB0byB0aGUgc3BlY2lmaWMgY2hhbmdlIHlvdSBhcmUgbWVu
dGlvbmluZz8NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpSZWdhcmRzLA0KQmFs
YWppLg0KDQo=

