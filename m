Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.8444.1604645754152194491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=SVmnbXZe;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.165.212, mailfrom: nate.karstens@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A66tZ8U018282;
	Fri, 6 Nov 2020 00:55:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps1;
 bh=FIIa/4/+Qj8yl/UpUtqCr2YwhLaXWHyE4lLypVQ0Y0Q=;
 b=SVmnbXZeDqmjhaL6HUO32DeLRcsrrnPSQZJHWZuTxxFyKmOML2eefOTkeXELW+eycV/+
 vX/gvV3COx6cHooYkBK2hboQ6OUlkTmpzkMK6sk7kWyH1DUnzkjqz7BtIY6dqPn4+Gui
 P2grbRJD6M6lUkRgNQFHLtcdAAi8WXMG/f+HCzvUuHyMMBtiYr2tEyxEw46Oqb+PZzNB
 7lwPwsxSw+WPWVbELzTbn7ZKD5oybEO4KXaIUi+ndsw+nvOecdC7LkU3cUTtYm8drgWT
 e1PrKwo83jReLYmjf8Zc1+Ll80zpuYB7vQu6vxEaL/vx+mzZlZ1xcWqrb8xsPUEfrYtt 2A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-000eb902.pphosted.com with ESMTP id 34jkmb6jrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2020 00:55:52 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR+NyrhH0A3iYZY2AZC+7MQdrPjJkgu8SIWmSwetNOhhYDH96L+nIWdXx05SILKQ4OWlk9WkPCCNrIrmBcnqACVhdQBAL/r9Rf2mCOhV88s4Wz5+vYBnw/uZjui5hfwvyFAwJddvGhwWhXwB3tq+0Q4Weoq7NV2ACQSbs3BeEF+dSovEapuPt8D/erc9jHv1O4ZB3Nk8ytuoDIbQP3HEnddBwSGn6GwTDKhit+Liipymzi25i4ELbvb3kF8rIsqu2mYsDx2jmXEQwgdG6SsFEI2n1WSAS/K1VrBRCt0m401SMjcWMPx0lelN5OmyZYDchwIg2qZPPIi1RD7oR4cTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIIa/4/+Qj8yl/UpUtqCr2YwhLaXWHyE4lLypVQ0Y0Q=;
 b=M5eAp1hx2pwiMHk5gfyBw/YrYX6EdmnXgm1RtzQ4zhN5IddZUp2G2lxZtikUtcEPQw98XulxeOzzDXiW9xRLcP8bq7Xs9JQtDcTAL89L+XiWnJGi0rdxYINk6FUjZBvBgEaLDO1ZK+t9iQe7lFy1SZLc/ja4hB6cDMMK3XoZlhUuTFoT4npFa9Dkj6nZ1mTEQzjOurfZoP1O4UIMQ6fYvZ9HnRZpeBN9+6FdFejiiufC9qhusrazvUrYPYnkd8bqUvS23jnAilMk92HYAjMAIeoZs4GskqNDTSxuQODljiFSVa7QWRLsT+ni2zPa/eCgWGhmBiZfBu+6E0Ow6x9wWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIIa/4/+Qj8yl/UpUtqCr2YwhLaXWHyE4lLypVQ0Y0Q=;
 b=ARt2qUV18cooqAIEKObpaVdCycZ1ZtRgIO4rNVfzqmcK4XYqxdrCTqt/GLErzvc1thywJ92EfTnVp9nFSvLuuEJXdip8KNGG4+9Mp1/YviIBfkAuhp+SfQIo0HMplIbtEnNi+NiRFgNmuJzs8uHOsOsKjsJyjUm7M5SQr4AsA3KGH2nc+tZv2hj7Haic48QEZQm78rcSELE0hXmCNBjYPbMuIB9Y8vjEmcvGyJOGgode3cf65lL4oz0WKO6lmgsXYmZjOJBPcCn8SLNkdD2lrITKpp/wsCNZ01C5VrAoC12AXCGoot8+3quiJ6+QIgyltYbGOqdE8QopZlbPtLfaAw==
Received: from DM5PR20CA0044.namprd20.prod.outlook.com (2603:10b6:3:13d::30)
 by BY5PR04MB7010.namprd04.prod.outlook.com (2603:10b6:a03:22f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 06:55:51 +0000
Received: from DM6NAM10FT013.eop-nam10.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::21) by DM5PR20CA0044.outlook.office365.com
 (2603:10b6:3:13d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 06:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 DM6NAM10FT013.mail.protection.outlook.com (10.13.152.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.22 via Frontend Transport; Fri, 6 Nov 2020 06:55:51 +0000
Received: from OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Fri, 6 Nov 2020 00:55:28 -0600
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
 OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 6 Nov 2020 00:55:50 -0600
Received: from OLAWPA-EXMB7.ad.garmin.com ([fe80::68cc:dab9:e96a:c89]) by
 OLAWPA-EXMB7.ad.garmin.com ([fe80::68cc:dab9:e96a:c89%23]) with mapi id
 15.01.2106.003; Fri, 6 Nov 2020 00:55:49 -0600
From: "Nate Karstens" <nate.karstens@garmin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] openssl: Do not create /etc/ssl/certs
Thread-Topic: [OE-core][PATCH] openssl: Do not create /etc/ssl/certs
Thread-Index: AQHWseeQ3QOfqdzmJ0qQa4+WXV07jKm29YoAgAO4GHA=
Date: Fri, 6 Nov 2020 06:55:49 +0000
Message-ID: <d71df6ac554e452791305de8d2c1d8e2@garmin.com>
References: <20201103134411.118217-1-nate.karstens@garmin.com>
	 <20201103134411.118217-2-nate.karstens@garmin.com>
 <3ef5e39f58625f8044ffd75e790df399979b2243.camel@linuxfoundation.org>
In-Reply-To: <3ef5e39f58625f8044ffd75e790df399979b2243.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.7]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6bda8e0-21fb-416b-d676-08d88220ff94
X-MS-TrafficTypeDiagnostic: BY5PR04MB7010:
X-Microsoft-Antispam-PRVS: 
	<BY5PR04MB7010333295A083BEE7A4F3BC9CED0@BY5PR04MB7010.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IPqm0gNd/+ogtXIAZgv23qFeHwWi8jZaVZcbM84NIJ8DLi1yUynxzWR52Z6sEmiFwuU9pR8Ze/6ZIDw/IBYgW/mbl17XViw1V20+Q3FsB+9sCmffkEc4KHG9kCjfwNuDSlqR09FoWygK1FtD3xh5V1ytA0h9eBkOpJLqXrkiY+rmqDhRC6ipf+VkLGQQDpKcXuZiM0AbKE0f1rL3UdSGCQQ7JMD6aQrvNQh+vu4vsmx3awbjJ0jU5TDv1gKjuBICGevwt3vASuOLwZMo80seLDr1omAT8vj+dZlGLyp1bVhvyVG0Bt97DZnnhcVxoxAFVySTQSlCbfaI5f8Q/6HPSRbNNtmr5pVYQjuUuipsa+oWKFNQam4XfEWSXLlrYI48flpNKy/L8pX82/fGfugMeUHYqjtPJIOWgGmVSV81hZ8EAaasjRSnj0WWYzEh1IErGlR8cOXYrA/ADfNpbPIoLuQnvcGQdX6umYVPYeTl2lM=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(346002)(376002)(39860400002)(396003)(136003)(46966005)(86362001)(478600001)(336012)(82740400003)(316002)(7696005)(966005)(36756003)(82310400003)(24736004)(108616005)(110136005)(186003)(5660300002)(47076004)(53546011)(26005)(2616005)(8936002)(8676002)(7636003)(356005)(2906002)(83380400001)(426003)(70586007)(70206006);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 06:55:51.0534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bda8e0-21fb-416b-d676-08d88220ff94
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM10FT013.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7010
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_02:2020-11-05,2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060047
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgaW4gbG9va2luZyBpbnRvIHRoaXMuIEFm
dGVyIGxvb2tpbmcgYXQgaXQgZnVydGhlciB0aGUgT3BlblNTTCBjb2RlIGl0c2VsZiBpcyBjcmVh
dGluZyB0aGUgZW1wdHkgY2VydHMgZm9sZGVyOg0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbnNz
bC9vcGVuc3NsL2Jsb2IvZjEyMzA0M2ZhYTE1OTY1YzM0OTQ3NjcwZmYzZDNhNzAwNWQ2YmRiNC9D
b25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwjTDU1Mg0KDQpBcyBzdWNoLCB3ZSB0aG91
Z2h0IGl0IHdvdWxkIGJlIHVud2lzZSB0byBtb2RpZnkgdGhlIG9wZW5zc2wgcmVjaXBlLiBJbnN0
ZWFkLCB3ZSBwbGFuIHRvIGNoYW5nZSB0aGUgY29uZmxpY3RpbmcgcmVjaXBlIHRvIHVzZSBhIHBv
c3QtaW5zdGFsbGF0aW9uIHNjcmlwdC4NCg0KQ2hlZXJzLA0KDQpOYXRlDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhh
bGYgT2YgUmljaGFyZCBQdXJkaWUNClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDAzLCAyMDIwIDEw
OjAwDQpUbzogS2Fyc3RlbnMsIE5hdGUgPE5hdGUuS2Fyc3RlbnNAZ2FybWluLmNvbT47IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29y
ZV1bUEFUQ0hdIG9wZW5zc2w6IERvIG5vdCBjcmVhdGUgL2V0Yy9zc2wvY2VydHMNCg0KQ0FVVElP
TiAtIEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgYW55IGxpbmtzIG9yIG9wZW4gYW55IGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlLg0KDQoNCk9uIFR1ZSwgMjAyMC0xMS0wMyBhdCAwNzo0NCAtMDYwMCwgTmF0ZSBL
YXJzdGVucyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gVGhlIG9wZW5zc2wg
cGFja2FnZSBwcmV2aW91c2x5IGNyZWF0ZWQgYW4gZW1wdHkgZm9sZGVyIGZvciBDQSANCj4gY2Vy
dGlmaWNhdGVzIGF0IC9ldGMvc3NsL2NlcnRzLiBPdGhlciBwYWNrYWdlcywgbGlrZSBjYS1jZXJ0
aWZpY2F0ZXMsIA0KPiB3b3VsZCB0aGVuIHBvcHVsYXRlIHRoaXMgZm9sZGVyLg0KPg0KPiBDZXJ0
YWluIHN5c3RlbXMgbmVlZCBtb3JlIGZsZXhpYmlsaXR5IHdpdGggaG93IHRoaXMgZm9sZGVyIGlz
IGNyZWF0ZWQgDQo+IGFuZCBwb3B1bGF0ZWQgKGUuZy4sIGEgc3ltbGluayBpcyBuZWVkZWQpLiBU
byBhY2NvbW1vZGF0ZSB0aGlzLCB0aGUgDQo+IG9wZW5zc2wgcmVjaXBlIG5vIGxvbmdlciBjcmVh
dGVzIHRoZSBlbXB0eSBmb2xkZXIuIEluc3RlYWQsIHRoZSBmb2xkZXIgDQo+IHdpbGwgb25seSBi
ZSBjcmVhdGVkIGJ5IHBhY2thZ2VzIHRoYXQgcG9wdWxhdGUgaXQuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IE5hdGUgS2Fyc3RlbnMgPG5hdGUua2Fyc3RlbnNAZ2FybWluLmNvbT4NCj4gLS0tDQo+ICBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjEuMWguYmIgfCA0ICst
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3Ns
XzEuMS4xaC5iYiANCj4gYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNz
bF8xLjEuMWguYmINCj4gaW5kZXggZWIxMWZlMzk2MC4uNTcyM2QxOWRiZiAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFoLmJiDQo+
ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzEuMS4xaC5i
Yg0KPiBAQCAtMTM0LDE0ICsxMzQsMTIgQEAgZG9faW5zdGFsbCAoKSB7DQo+ICAgICAgICMgQ3Jl
YXRlIFNTTCBzdHJ1Y3R1cmUgZm9yIHBhY2thZ2VzIHN1Y2ggYXMgY2EtY2VydGlmaWNhdGVzIHdo
aWNoDQo+ICAgICAgICMgY29udGFpbiBoYXJkLWNvZGVkIHBhdGhzIHRvIC9ldGMvc3NsLiBEZWJp
YW4gZG9lcyB0aGUgc2FtZS4NCj4gICAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9z
c2wNCj4gLSAgICAgbXYgJHtEfSR7bGliZGlyfS9zc2wtMS4xL2NlcnRzIFwNCj4gLSAgICAgICAg
JHtEfSR7bGliZGlyfS9zc2wtMS4xL3ByaXZhdGUgXA0KPiArICAgICBtdiAke0R9JHtsaWJkaXJ9
L3NzbC0xLjEvcHJpdmF0ZSBcDQo+ICAgICAgICAgICR7RH0ke2xpYmRpcn0vc3NsLTEuMS9vcGVu
c3NsLmNuZiBcDQo+ICAgICAgICAgICR7RH0ke3N5c2NvbmZkaXJ9L3NzbC8NCj4NCj4gICAgICAg
IyBBbHRob3VnaCBhYnNvbHV0ZSBzeW1saW5rcyB3b3VsZCBiZSBPSyBmb3IgdGhlIHRhcmdldCwg
dGhleSBiZWNvbWUNCj4gICAgICAgIyBpbnZhbGlkIGlmIG5hdGl2ZSBvciBuYXRpdmVzZGsgYXJl
IHJlbG9jYXRlZCBmcm9tIHNzdGF0ZS4NCj4gLSAgICAgbG4gLXNmICR7QG9lLnBhdGgucmVsYXRp
dmUoJyR7bGliZGlyfS9zc2wtMS4xJywgJyR7c3lzY29uZmRpcn0vc3NsL2NlcnRzJyl9ICR7RH0k
e2xpYmRpcn0vc3NsLTEuMS9jZXJ0cw0KPiAgICAgICBsbiAtc2YgJHtAb2UucGF0aC5yZWxhdGl2
ZSgnJHtsaWJkaXJ9L3NzbC0xLjEnLCAnJHtzeXNjb25mZGlyfS9zc2wvcHJpdmF0ZScpfSAke0R9
JHtsaWJkaXJ9L3NzbC0xLjEvcHJpdmF0ZQ0KPiAgICAgICBsbiAtc2YgJHtAb2UucGF0aC5yZWxh
dGl2ZSgnJHtsaWJkaXJ9L3NzbC0xLjEnLCANCj4gJyR7c3lzY29uZmRpcn0vc3NsL29wZW5zc2wu
Y25mJyl9ICR7RH0ke2xpYmRpcn0vc3NsLTEuMS9vcGVuc3NsLmNuZg0KDQpXaGVuIHlvdSBhc2tl
ZCBhYm91dCB0aGlzIGluIHRoZSBwcmV2aW91cyBlbWFpbCwgSSBxdWVzdGlvbmVkIHdoZXRoZXIg
d2Ugc3RpbGwgbmVlZGVkIHRoZSBzeW1saW5rLiBEaWQgeW91IGNoZWNrIGludG8gdGhhdD8gSSBz
dXNwZWN0IHdlIG1heSBuZWVkIGl0IGFzIG9wZW5zc2wgaXRzZWxmIG1heSByZWZlcmVuY2UgdGhh
dCBwYXRoIGludGVybmFsbHk/DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=
