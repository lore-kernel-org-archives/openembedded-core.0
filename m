Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.4266.1604411285941970375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=MuRW88jf;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.177.212, mailfrom: nate.karstens@garmin.com)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3Dd4Iw020840
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2020 07:48:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps1;
 bh=6jRYi6shWCwUPCnKqef+ppht8XIsPC/E0HIonUyOEJU=;
 b=MuRW88jfeoWvJfaIZd8LrZ6SJJNETaNZMaweVg6iE93urNELvGs6+cs02arKKP0Ji+Dj
 c1lPDqMs+dwgL6sH/o0ZyLH5+oJ3yTOjGpy6Jx8Ewde+2vj5ogjxYoiKxzYxTmu8bZ/O
 OK/meSUPE/xLPwonNWk7Cr5OeizklWVG3WTdHnaCyYtQVb5qFoCarhKSsbraZEgvb1P6
 bUswWt4HfYKK2AxG87hWoj/8cRo2xQe1hDks2N+TO+YKUE+u6xWQnfM4lsir/ZgtXA6H
 +38azbz9KMVZMgbD2INI4ewc86QQ4J0XC73PDP8jXeMdUGkMrUyaHNquX/6SDCcAn2Pw uQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-000eb902.pphosted.com with ESMTP id 34h3xh3ype-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 07:48:04 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJsa4h1oZidfTcJaFjaNvsnKREvHWi6DiPPlekOv2y/Hl93pTI5ckjN2WTbgA5yqwHld3vrX/UC4fpdaiZTUu8KtTkamFQQFJUqLl0obmDMXSgRDMsxdCgLksB3ix8S2wIgQnWOZaA8DgFEAZYU0C/tXDnVe4IhEA67zsjaalaMyk1uTNVmZX+PGgJ+J1Ov3TAbQj2s4pNGRSCuJ1VAVowzrafkHjTqKcmPRVoEcyVtDvQsVb6BgN4mSXJDspk/qBn1BwpBHhXTeJHfGap2flzTEGl5Pf7GQ4z9gwOPvhG9BlUwUf4rnjr2hdRx2NjN1JQdk89QEiOL9RGV5PqMOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jRYi6shWCwUPCnKqef+ppht8XIsPC/E0HIonUyOEJU=;
 b=PofLa/Yn3NQg0XgQI8B7OCAyXTY6BLz46nJ6shrCponcHPX5qyw6FaP/GIJdU0pGd8BR/5Rf2iHe+4KTfDgOuqyh9SfkDhZkS73WVg2saahzlm98gwBoHb6bdVePW0M3L7/v0zDXFZ1GtwDPRHd2hwjAaGJMQN6+N1R3omGaoHjz7aZsFJ+t/BEu8tNVr3+D3ytYZ2oZ04ujuufZNIRiocrcNHL1mN4kcOoGMYsiO8FHxLFtQnJSahhjMfE/JcAT6TZZzCBcD02HA+kt+QGdn1ghtwqubPfZArTirIiM82/dAcjRjvJNcz2Zdoq49TJNxJfTWfy4MtR8BdmkExF+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jRYi6shWCwUPCnKqef+ppht8XIsPC/E0HIonUyOEJU=;
 b=oXx8CltdZjTxEHtqZjiQzWqxNWWeMzibY8j5XfM7gZlShro0//jmBHilpsqjZ6+aEDSLvgEVAnGhX+dKmDYEvS0MVoAeuhU7wPOG56CY3W1mULbW9i7+LoC+njTlwV1DgiQUmqJL+9UJ/Q5OthQgtCit0gJMvbprcZS3dqhioBtLZDsZFb/FWaFi6yY9WFm/w3pzBf/RUZ3+twuQQeEsP7p0oXf5a9azLXTB9+xtsyNAo0onYUcdZPwlpqd6Hdn47YhsgN1YtcirIWXaHQKL06jQTpvUsKJ3o91udQphQzYTEzP84Tefvn/jKsFpKEmKwjwuGuEHw34677+8++/kUw==
Received: from MWHPR12CA0057.namprd12.prod.outlook.com (2603:10b6:300:103::19)
 by PH0PR04MB7176.namprd04.prod.outlook.com (2603:10b6:510:c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 13:48:00 +0000
Received: from MW2NAM10FT010.eop-nam10.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::e6) by MWHPR12CA0057.outlook.office365.com
 (2603:10b6:300:103::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 13:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 MW2NAM10FT010.mail.protection.outlook.com (10.13.155.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.17 via Frontend Transport; Tue, 3 Nov 2020 13:47:57 +0000
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
 olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 3 Nov 2020 07:47:55 -0600
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
 OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 3 Nov 2020 07:47:54 -0600
Received: from OLAWPA-EXMB7.ad.garmin.com ([fe80::68cc:dab9:e96a:c89]) by
 OLAWPA-EXMB7.ad.garmin.com ([fe80::68cc:dab9:e96a:c89%23]) with mapi id
 15.01.2106.003; Tue, 3 Nov 2020 07:47:54 -0600
From: "Nate Karstens" <nate.karstens@garmin.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] openssl: Do not create /etc/ssl/certs
Thread-Topic: [OE-core][PATCH] openssl: Do not create /etc/ssl/certs
Thread-Index: AQHWseeQ3QOfqdzmJ0qQa4+WXV07jKm2a7oA
Date: Tue, 3 Nov 2020 13:47:54 +0000
Message-ID: <bad3d7c4bfe9407fa32d6ceccf520d63@garmin.com>
References: <20201103134411.118217-1-nate.karstens@garmin.com>
 <20201103134411.118217-2-nate.karstens@garmin.com>
In-Reply-To: <20201103134411.118217-2-nate.karstens@garmin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.6]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77965fda-aef3-4b73-3a0a-08d87fff12b7
X-MS-TrafficTypeDiagnostic: PH0PR04MB7176:
X-Microsoft-Antispam-PRVS: 
	<PH0PR04MB717623C817CAD10228B79F1F9C110@PH0PR04MB7176.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U5DdiysE6H8HFnFn2XxMeH14qnPERkdoZQPraz6633yqk2s/TW3xMEyn1OZpKEj+WebP/GA8HtqCVVpnQLuOu4gNiJt2vhlpAnCNs1B0RdbnW3NcdZInu1s6ZVWEjAGbRtFa1YiinsM9h8rwWq3gyyH/PNq73y2LaeUzRR5cR/JhCR9JrDldN6LnfLrqkWwwpD+69PbSLPztwgd9f3WitQ3c7coGraPBQDoo2r7vQmmQ1M49mD4YpWHnqzVoFe6N4KwgL83Q54++sfpIlZxpJ0CwhTxOXEF3A/TZUUHdfgo2+IhkTvXVqrCdBJYnmflNN4oBA7oXZ+p+lfjoVblH4glsP6O4+zX6/tb+92x2j9lRQVaVZ3Tm7zP6+rqL0YPyT3HUkdJsuiGE9yYNYn3xMt147MOqleok27BKOXZTbWRC37tipBEAA97I00qxCUMIcTMhecKPTeAK3m1G3l1KZqphR8JkreSXfijSdgOLRiI=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(136003)(376002)(39860400002)(346002)(396003)(46966005)(2906002)(2616005)(6916009)(86362001)(36756003)(336012)(8676002)(24736004)(26005)(186003)(8936002)(70586007)(478600001)(5660300002)(53546011)(966005)(426003)(108616005)(70206006)(7696005)(47076004)(316002)(83380400001)(82310400003)(82740400003)(7636003)(356005);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 13:47:57.8911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77965fda-aef3-4b73-3a0a-08d87fff12b7
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT010.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7176
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_08:2020-11-03,2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030094
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TXkgaW50cm9kdWN0b3J5IG1lc3NhZ2Ugc2VlbXMgdG8gaGF2ZSBiZWVuIGRlbGV0ZWQuDQoNClRo
aXMgd2FzIGluIHJlcGx5IHRvIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL3RvcGljLzc3OTE3NDkyIzE0NDAyNiBhbmQgd2FzIHRlc3RlZCB3aXRoIGNv
cmUtaW1hZ2Utc2F0byBidWlsZCB1c2luZyBPcGVuU1NMIDEuMS4xZy4NCg0KTmF0ZQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2Fyc3RlbnMsIE5hdGUgPE5hdGUuS2Fyc3Rl
bnNAZ2FybWluLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAwMywgMjAyMCAwNzo0NA0K
VG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBLYXJzdGVu
cywgTmF0ZSA8TmF0ZS5LYXJzdGVuc0BnYXJtaW4uY29tPg0KU3ViamVjdDogW09FLWNvcmVdW1BB
VENIXSBvcGVuc3NsOiBEbyBub3QgY3JlYXRlIC9ldGMvc3NsL2NlcnRzDQoNClRoZSBvcGVuc3Ns
IHBhY2thZ2UgcHJldmlvdXNseSBjcmVhdGVkIGFuIGVtcHR5IGZvbGRlciBmb3IgQ0EgY2VydGlm
aWNhdGVzIGF0IC9ldGMvc3NsL2NlcnRzLiBPdGhlciBwYWNrYWdlcywgbGlrZSBjYS1jZXJ0aWZp
Y2F0ZXMsIHdvdWxkIHRoZW4gcG9wdWxhdGUgdGhpcyBmb2xkZXIuDQoNCkNlcnRhaW4gc3lzdGVt
cyBuZWVkIG1vcmUgZmxleGliaWxpdHkgd2l0aCBob3cgdGhpcyBmb2xkZXIgaXMgY3JlYXRlZCBh
bmQgcG9wdWxhdGVkIChlLmcuLCBhIHN5bWxpbmsgaXMgbmVlZGVkKS4gVG8gYWNjb21tb2RhdGUg
dGhpcywgdGhlIG9wZW5zc2wgcmVjaXBlIG5vIGxvbmdlciBjcmVhdGVzIHRoZSBlbXB0eSBmb2xk
ZXIuIEluc3RlYWQsIHRoZSBmb2xkZXIgd2lsbCBvbmx5IGJlIGNyZWF0ZWQgYnkgcGFja2FnZXMg
dGhhdCBwb3B1bGF0ZSBpdC4NCg0KU2lnbmVkLW9mZi1ieTogTmF0ZSBLYXJzdGVucyA8bmF0ZS5r
YXJzdGVuc0BnYXJtaW4uY29tPg0KLS0tDQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NsL29wZW5zc2xfMS4xLjFoLmJiIHwgNCArLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFoLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFoLmJiDQppbmRleCBlYjExZmUzOTYwLi41NzIzZDE5
ZGJmIDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5z
c2xfMS4xLjFoLmJiDQorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbF8xLjEuMWguYmINCkBAIC0xMzQsMTQgKzEzNCwxMiBAQCBkb19pbnN0YWxsICgpIHsNCiAJ
IyBDcmVhdGUgU1NMIHN0cnVjdHVyZSBmb3IgcGFja2FnZXMgc3VjaCBhcyBjYS1jZXJ0aWZpY2F0
ZXMgd2hpY2gNCiAJIyBjb250YWluIGhhcmQtY29kZWQgcGF0aHMgdG8gL2V0Yy9zc2wuIERlYmlh
biBkb2VzIHRoZSBzYW1lLg0KIAlpbnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L3NzbA0KLQlt
diAke0R9JHtsaWJkaXJ9L3NzbC0xLjEvY2VydHMgXA0KLQkgICAke0R9JHtsaWJkaXJ9L3NzbC0x
LjEvcHJpdmF0ZSBcDQorCW12ICR7RH0ke2xpYmRpcn0vc3NsLTEuMS9wcml2YXRlIFwNCiAJICAg
JHtEfSR7bGliZGlyfS9zc2wtMS4xL29wZW5zc2wuY25mIFwNCiAJICAgJHtEfSR7c3lzY29uZmRp
cn0vc3NsLw0KIA0KIAkjIEFsdGhvdWdoIGFic29sdXRlIHN5bWxpbmtzIHdvdWxkIGJlIE9LIGZv
ciB0aGUgdGFyZ2V0LCB0aGV5IGJlY29tZQ0KIAkjIGludmFsaWQgaWYgbmF0aXZlIG9yIG5hdGl2
ZXNkayBhcmUgcmVsb2NhdGVkIGZyb20gc3N0YXRlLg0KLQlsbiAtc2YgJHtAb2UucGF0aC5yZWxh
dGl2ZSgnJHtsaWJkaXJ9L3NzbC0xLjEnLCAnJHtzeXNjb25mZGlyfS9zc2wvY2VydHMnKX0gJHtE
fSR7bGliZGlyfS9zc2wtMS4xL2NlcnRzDQogCWxuIC1zZiAke0BvZS5wYXRoLnJlbGF0aXZlKCck
e2xpYmRpcn0vc3NsLTEuMScsICcke3N5c2NvbmZkaXJ9L3NzbC9wcml2YXRlJyl9ICR7RH0ke2xp
YmRpcn0vc3NsLTEuMS9wcml2YXRlDQogCWxuIC1zZiAke0BvZS5wYXRoLnJlbGF0aXZlKCcke2xp
YmRpcn0vc3NsLTEuMScsICcke3N5c2NvbmZkaXJ9L3NzbC9vcGVuc3NsLmNuZicpfSAke0R9JHts
aWJkaXJ9L3NzbC0xLjEvb3BlbnNzbC5jbmYgIH0NCi0tDQoyLjI4LjANCg0K
