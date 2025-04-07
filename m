Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A16AC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:05:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42315.1744016750237396408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Rj7gmHeC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_bpothuno@quicinc.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378e5ew002368;
	Mon, 7 Apr 2025 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hN+QIo0kImhZxCq2ooy4xeleo/8oXQ+dMswLh+Trt7s=; b=Rj7gmHeCJgjwrNwk
	6qUvXvcuHKMEhXenI5VtHx02a2p9j0l8zaI6+BZqQ5uvr3423d7dYrUzwz1UdXLJ
	68BtN3GGHRmRaIStyAWYOtzAFBd+rGOPQAWZms3Tfx97YOelTO1ldRMNqnJAhqJs
	vXVJQMIxHd1qKp8meHbeRkFll5gU86wzRsQ687GqV2I+fyU9Jye0h7hjtboDobnp
	dNaNL7BlzXt2d4n8WN2HC/y+1agOK9a/4apUP9zgM3xXF3p2WG7mV4KhaqwXKfE2
	n6+nxPIJDcQ4RVxxFbtJMSaZnnAmVyec0hTGgtAd9hTY3Ai1Q2Dj3LGhvjdVmILG
	Bo3Uuw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkbmdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 09:05:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53795N5J014094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 09:05:23 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 02:05:23 -0700
Received: from nalasex01a.na.qualcomm.com ([::1]) by
 nalasex01a.na.qualcomm.com ([fe80::df8a:bb4c:1e34:4344%4]) with mapi id
 15.02.1544.009; Mon, 7 Apr 2025 02:05:23 -0700
From: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] packagegroup-base.bb: Enable hostapd for WiFi
 SAP configuration
Thread-Topic: [OE-core] [PATCH] packagegroup-base.bb: Enable hostapd for WiFi
 SAP configuration
Thread-Index: AQHbpU3W6rDfPVj3tEaF4XmNbGtga7OUL42AgAO9TJA=
Date: Mon, 7 Apr 2025 09:05:23 +0000
Message-ID: <e1f115687c834e62aeb02259da322fd1@quicinc.com>
References: <20250404103901.3644174-1-quic_bpothuno@quicinc.com>
 <D8Y0GGHA95CW.28774KM48J5N3@bootlin.com>
In-Reply-To: <D8Y0GGHA95CW.28774KM48J5N3@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.11.177]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TnsBMFfuAo1hoRCW_wGqegG-1Ac29BT6
X-Proofpoint-ORIG-GUID: TnsBMFfuAo1hoRCW_wGqegG-1Ac29BT6
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f3956a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=xqWC_Br6kY4A:10 a=s79Y4jWm60cA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8
 a=Q4-j1AaZAAAA:8 a=mzjhrXI5L8IxHFg0_3oA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214406

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogRnJpZGF5LCBB
cHJpbCA0LCAyMDI1IDEwOjI2IFBNDQo+IFRvOiBCYWxhamkgUG90aHVub29yaSAoUVVJQykgPHF1
aWNfYnBvdGh1bm9AcXVpY2luYy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBwYWNrYWdlZ3Jv
dXAtYmFzZS5iYjogRW5hYmxlIGhvc3RhcGQgZm9yDQo+IFdpRmkgU0FQIGNvbmZpZ3VyYXRpb24N
Cj4gDQo+IE9uIEZyaSBBcHIgNCwgMjAyNSBhdCAxMjozOSBQTSBDRVNULCBCYWxhamkgUG90aHVu
b29yaSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBUaGlzIGNoYW5n
ZSBpcyB0byBlbmFibGUgaG9zdGFwZCBmb3IgV2lGaSBTQVAgY29uZmlndXJhdGlvbnMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYWxhamkgUG90aHVub29yaSA8cXVpY19icG90aHVub0BxdWlj
aW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9w
YWNrYWdlZ3JvdXAtYmFzZS5iYiB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3Jv
dXBzL3BhY2thZ2Vncm91cC1iYXNlLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtY29yZS9wYWNrYWdl
Z3JvdXBzL3BhY2thZ2Vncm91cC1iYXNlLmJiDQo+ID4gaW5kZXggY2I5ZDFmMDdhZjUxLi5lMGEw
MjFmYzYwOTEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vw
cy9wYWNrYWdlZ3JvdXAtYmFzZS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3BhY2th
Z2Vncm91cHMvcGFja2FnZWdyb3VwLWJhc2UuYmINCj4gPiBAQCAtMjYyLDYgKzI2Miw3IEBAIFJE
RVBFTkRTOnBhY2thZ2Vncm91cC1iYXNlLXdpZmkgPSAiXA0KPiA+ICAgICAgaXcgXA0KPiA+ICAg
ICAgd2lyZWxlc3MtcmVnZGItc3RhdGljIFwNCj4gPiAgICAgICR7V0lSRUxFU1NfREFFTU9OfSBc
DQo+ID4gKyAgICBob3N0YXBkIFwNCj4gDQo+IEhpLA0KPiANCj4gSSBiZWxpZXZlIHRoaXMgaXMg
bm90IHBvc3NpYmxlLCBhcyB0aGUgaG9zdGFwZCBwYWNrYWdlIGlzIG5vdCBwYXJ0IG9mDQo+IG9w
ZW5lbWJlZGRlZC1jb3JlIGJ1dCBtZXRhLW9wZW5lbWJlZGRlZC4gVGhpcyBjaGFuZ2UsIGlmIGl0
IGhhcyB0byBiZQ0KPiBtYWRlLCBzaG91bGQgYmUgbWFkZSBpbiBtZXRhLW9wZW5lbWJlZGRlZC4N
Cj4gDQpBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24uIEJvdGggdGhlIG1ldGEtb3BlbmVtYmVk
ZGVkIGFuZCBvcGVuZW1iZWRkZWQtY29yZSBmb2xkZXJzIGFyZSBwcmVzZW50IGluIG15IHdvcmtz
cGFjZSwNCnNvLCBJIGRpZG4ndCBlbmNvdW50ZXIgYW55IGNvbXBpbGF0aW9uIGlzc3Vlcy4gS2lu
ZGx5IGlnbm9yZSB0aGlzIGNoYW5nZS4NCg0KIj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5k
LCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0
cHM6Ly9ib290bGluLmNvbQ0KDQo=

