Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
 by mx.groups.io with SMTP id smtpd.web09.4594.1627017551814985796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 22:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KYIGficS;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.214, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1627017553; x=1658553553;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/eHSiunUQeAr0dyKuTIak2sXnqkDLlQ/enW725d71as=;
  b=KYIGficSKXDRqqwx0/UKoEnfZ4GSzUmZUhVwjP6Ore7/vNYHEEEKCFO7
   BdSWCxDmmd+21cYY1gOOQoqIhumb3BTKNBxdPMKdMIQDciGHVOSbDnTid
   JfO6bg6+3J7+LsIRWPfT9L3Z7Ozt7HGUlyHRpIy3vYXaWlXCZqldhpqAC
   4LQW7uvZXZNd5Fpyx+SIHVAWZ5rI3pFkUh4IBIpHG6MHw9ntSxAzj1/fZ
   v3iV8sRtW+W4+eZyy8BI4g7XAUjQvTEh+WXVsMBwKFknw9T3uoRukAAt1
   6AXV/QFXUBqvbwMQP3cX2KOIRYcbtn/u+kPd3DakiRGKUuCWY5wZ0w+YJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="43359502"
X-IronPort-AV: E=Sophos;i="5.84,263,1620658800"; 
   d="scan'208";a="43359502"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2021 14:19:09 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhSvQTxqp9pCThUlLbnWhFucLh1rUA2FTu+wOLiFIaltEX3YUeaB+oUT1OFE25bsji4PtoLOmA/pgHcELtXQ6U0oowPqmG/wwwIMgH/a/n5d1zD7gBTjO2U5EWcRK9GWwwrFbgA6s1xx+A5LjHO5qrsIHVcRklK73iZt8hNlSfl3U6bAx3vkAsMnGELAuqROYD1FyfkLmIMiK1HNoZRkM3gSBKRIxTdrHwXjPSrdiDFSOHPeLGy0VV3Mpw7+yH8IUsz7i86LwG7hZ1WqLKYMmcSSJ4fPRVwP3uEMaD0sgtY06x7/tLA1wGDs1m12QUEOIHHydBjwhJ1H48iJmLTkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eHSiunUQeAr0dyKuTIak2sXnqkDLlQ/enW725d71as=;
 b=On9fSS8mRd1rTiEkIkzNDrpWLtWxS6XqOmvWYhHCwsf0dORCqBHVW6gMJ60Nue22pg1dOy3LhpBjts9AHnFrw0RxhG46QT8Bd8J6qJGZnV+qxcgSvwsVNZhIpdXJOi+ILBUupH1Ks+4p12iaCvkicYShdZFFaztIeh/uwHO3UixthkDlA+HM4jmON2pZ3EBeDb0ygwtzC/DiFbRQ078vLSkih0EQjUrY7meHkwLlplBwa82eJ2+3/PXWcg9LkG6DNjxsn31o6pVYe5f9RAeQEzsw4CqEoV0Ux8NVg81r/sDQ2yD3Qk4u2sZS3B+vFaEzbRAM9Md+jjqsAvf18xZ7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eHSiunUQeAr0dyKuTIak2sXnqkDLlQ/enW725d71as=;
 b=F1mE5/ulhc+8VoHEH6iGkw7k09+gPdc1MeRVZI4K2+3jGjVSwS8rpMl0QrY/kC07s6ftudO3ANk0hzVXhPvbZVvgIZ/L3GYoddzui9aZ2jJacRTh9hm769El/P2liqFXMa6EmkLD66r/CRfcv7pCSYzO07cAWM0CKu0inPMuMzs=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSZPR01MB7004.jpnprd01.prod.outlook.com (2603:1096:604:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 05:19:06 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::e949:47e2:9166:7cdc]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::e949:47e2:9166:7cdc%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 05:19:05 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libcap-ng: use update-alternatives for libcap-ng.so
Thread-Topic: [OE-core] [PATCH] libcap-ng: use update-alternatives for
 libcap-ng.so
Thread-Index: AQHXfc1zBfG8UpW+mUmEwgP02DxTUqtNLCSAgALcOoA=
Date: Fri, 23 Jul 2021 05:19:05 +0000
Message-ID: 
 <OSBPR01MB184597E308DF094557E4B594DCE59@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1626829912-1826-1-git-send-email-wangmy@fujitsu.com>
 <530d825cf7c40b354a4127df8181e5311267d1ef.camel@linuxfoundation.org>
In-Reply-To: 
 <530d825cf7c40b354a4127df8181e5311267d1ef.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a495743-db69-4cd6-2fd2-08d94d99646c
x-ms-traffictypediagnostic: OSZPR01MB7004:
x-microsoft-antispam-prvs: 
 <OSZPR01MB700458AD071D1AE9096B1390DCE59@OSZPR01MB7004.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LfaFzbhsbPqdYvm/ueRxZ80wfbnaNwXSAIJu9u5Ne5pd58535fvWr3TUdaMzxcxD8WuqdN48FfVRTAI0YN8DV6Jhv165UkbV+3RWxrxLTBI+KPKeUqTUY2nxCQTVW4rddgeg+mtB6TpB9aN3ai02wp4iUd08iOE+JX632nd5hvGxPJ03uelRSYrkFHgYVuPZynqkPSV2c/kP/ZUBY1gFvhdHfrFS02fkP3WHIgcfd7/E6O+Dh+qveyAfPlIJCl3/V8J/eeQ2DCnBYD3YDwXaC0mx5agz4iIpLwYaig8IZieL2NWqCoICVDTE19OJQbQg6EvEGD3p6/ZKafYalUBqscNaouhEPcmrpnu6CeZ9aSrTJ+S2t/Y4ZxhDmwSq5JPZCi5i8n5VAPrOO5HTRRw6ChsVF+0Niu48CiesBtiGJnzbVghCLu577Wb31zbq1trNT2xqZvC4iiSes7PlvmodbaFWiv527e6s38/GDHuMklLjbbODYENXXuJitfu03djLCgcimd/mz0Ceqlo2vo8fvRhq4rqcaP3KjFUTHuf66U9zrFiQcWKTFrC4L2EaROFKvLClE3LhlAVFe/oKWxKnUBLurjuOoIVHznxdXxHi7H7uYMOPzhI66G0xyCE+OcqISNFySgE3mhv8exw8v8OXRpSt+1a1YQyA/njlVOLMdi92+xXVobXFZfAQB9J6rmL+C3GflI3EQeZP9eZxHbpsZ5qRIrMQr7QYHu4BytVs2TqoBCiqSzOmiZtzR8AT6QkYT/m5TdGTEL6B7pv3ck8zUMb3JaTIkRFv0FBfJ8xdP/E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(6506007)(26005)(55016002)(8676002)(76116006)(66946007)(83380400001)(66476007)(316002)(966005)(85182001)(53546011)(5660300002)(9686003)(71200400001)(33656002)(7696005)(8936002)(122000001)(186003)(478600001)(86362001)(66446008)(38100700002)(66556008)(64756008)(2906002)(52536014)(15650500001)(110136005)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UnpZRWtzL3VrMlI1N2NURS9QUUlTOGJYUSt5Q3hoNFVxTUFvbDMwTmp4ZGpJ?=
 =?utf-8?B?YU9QRGZZVDBsczBPOEdQRGd1QkxhU05UNmphWm9HYU9sNEhpV1dVOTgzenF0?=
 =?utf-8?B?RUlJYWlGOVJGbThJVGhaMEl1Ym9aU3VaeWhkVCtyTGZXb2RLekdzUnZqeWtD?=
 =?utf-8?B?emJmRnZoYzVadm0yczNBdi9XNmFtblA1NEpaWk1oSDlaSTZXeDl4OXZXVlpW?=
 =?utf-8?B?RWpDSFk5TEtZWnZhckZBamt3OVB1SXhZSUdtVjZCMkEyR3psYzMyTVNIeDNw?=
 =?utf-8?B?czdURm5QNS9qY25ZcUZ1VjhyU2NFazAyUFpmUUY1VEkyckp3ZWc3c3NnRmJV?=
 =?utf-8?B?M1lWc05NNjZ3QlhLS3NsTDBXSTRrRmJ2RXNHUXBSRy9QLy8vNWU3VS83M3JH?=
 =?utf-8?B?SHVDMmFSWnl3VkQ5dFBXbjZCZXVDalVJd2N4Yzc5c0UvQ0lhRWtNekpxcDN3?=
 =?utf-8?B?WmxnMFdSc3grMDJJOEtEWHlLZ056V1p4MUlhZXVvZjNXQ1dVTDdoRllHT1N1?=
 =?utf-8?B?L01wOGNQRGVTMHdONWZHMzhZWmZCSXFjOXlVdmpSNkx3T09zTlVlcEtyaTNx?=
 =?utf-8?B?clcyd1gzZll1YW9KZmM4M2JsNmwvSytTMWRVTHJqTGNoMVlQYzRHbGlxUXA4?=
 =?utf-8?B?cUZYOENtT2FiNTZ1d3ZiS1dpeGo1d2R0VTZ3L210Z29HMzJRc2EwSXlzcHJm?=
 =?utf-8?B?U1V6VUliMktJbnJEVThiRDFHUE5OYlFYZ2g5TkhueUFFMDBISmZTdUVvZDdy?=
 =?utf-8?B?ZFA0elRLVHU1ZEZ0bnlhcVlaYTBTZUZaT01zWG5JMHIwOG1qbUpRY3N1RXRT?=
 =?utf-8?B?anNVTmpZaE91THhhbXplM2dhRmZoTUIyaEFUaWVQV2ZIUDR3MjYydFBpejNJ?=
 =?utf-8?B?WFVTMERDcHpGY3QzTExIYmQyOXFXOGdrM285YkMxdXpRZXdxdTVnTlNuTWQ3?=
 =?utf-8?B?aFptcGZxdDN3dlVSanl3Zk03S2paeDVDUHYvSFRENjMvUUNzRHN4R3VoWUF5?=
 =?utf-8?B?b3F1ZnhiRDcrWWFYaXAzSFMreUI4b0pmczRJZXFJU1phQ3h1MXI3MjZhUFFZ?=
 =?utf-8?B?OGFyYSs1NExlY3RpVHRMeHVmRzRKdWoreVB3dWZSYVZudEhlQSt6MUwyR3di?=
 =?utf-8?B?bnFsY0Q0ZFdzbUMwZFZkRlY1OHJEdnJYTmUxMTJHa2Jscm0vZmE4R1REVFFB?=
 =?utf-8?B?dDRNV0lNTk85akNsdmdVeVArRjZaNENuemRmTm15bTNVWmpyS0dFaUpvcitk?=
 =?utf-8?B?bDlTeGxMQ1pmOGRUbC9Wdy9KQzJtbng1VnR3Y2NFS3JmVFR4Z0I5bTJXakRK?=
 =?utf-8?B?eVFRUk5LMTFoZVJHNlVNeHRSZFREZjFycGR5RVNNaGZMMjQ5K3FSWklHMEh5?=
 =?utf-8?B?VzkrczdseWFtd2ZuZ3BjbmtBNGNmbWFZOERFV2UxTnFqNDIxWlVLVFRTcDc1?=
 =?utf-8?B?dnNjcUJuaDJVRWp2aDBaVzl6dEpCQ1NTWlpkKzZ0bnhWRitUK3YxamkxeHNT?=
 =?utf-8?B?b0s5SnJDMlNDb1lDY21VY01tblJiZTlHU216amFxOUI3eGdVWGRXTDhIVmhu?=
 =?utf-8?B?ZkhVTVRab1psQ2NwL296T25FY1ZBdlUyZHI5V09MbHo1VFl2b0JQczR3TXJk?=
 =?utf-8?B?Ukl3SlpQbGxmUzJiY3FsWFNEalFYSmRYa3hBS3dIbVFVcHVjRU1vODRXQUE5?=
 =?utf-8?B?NGRMbHNWWTVvSXQwTXc1R2lUMllUUDNEc2llLzNmS2ZUVUM5T0pIQTNjR1VX?=
 =?utf-8?Q?W9Xugtlbngc/HOruJo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a495743-db69-4cd6-2fd2-08d94d99646c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 05:19:05.8903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JyswLRbwsSReVfq3/iUs0MTBY16YceLyka7kAhCaEh/xK1sdhvua1qAZvcK1UoOyMpwllM67Z1B5vQcFpOJZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7004
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGJiIGZpbGUgY29udGVudCBvZiBvcGVuLWlzY3NpLXVzZXIgaW4gbWV0YS12aXJ0dWFsIGlz
IGluY29ycmVjdCwgcmVzdWx0aW5nIGluIGEgY29uZmxpY3QuIA0KTGliY2FwLW5nIGRvZXMgbm90
IG5lZWQgdG8gYmUgbW9kaWZpZWQuIFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaA0KDQrCoCAtLQ0K
QmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0LkkNCk5hbmppbmcgRnVqaXRz
dSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vuemh1IFJvYWQs
IE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1NjgNCkNPSU5T
OiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNv
bQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFs
ZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjEsIDIwMjEgNToz
NiBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47
DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGxpYmNhcC1uZzogdXNlIHVwZGF0ZS1hbHRlcm5hdGl2ZXMg
Zm9yDQo+IGxpYmNhcC1uZy5zbw0KPiANCj4gT24gV2VkLCAyMDIxLTA3LTIxIGF0IDA5OjExICsw
ODAwLCB3YW5nbXkgd3JvdGU6DQo+ID4gwqDCoMKgwqBvcGVuLWlzY3NpLXVzZXIgYWxzbyB1c2Vz
IHRoZSBkb2MgJ2xpYmNhcC1uZy5zbycuDQo+IA0KPiBBICJkb2MiPyBJZiBpdCBpcyBpbiBsaWJk
aXIgdGhpcyBpcyBhIGRldiBzeW1saW5rPyBJcyBpdCBhbiBhbHRlcm5hdGUgcHJvdmlkZXIgb2Yg
dGhpcw0KPiBsaWJyYXJ5IG9yIGlzIHRoaXMgc29tZSAga2luZCBvZiBsaW5raW5nIGludGVyY2Vw
dCBmdW5jdGlvbmFsaXR5PyBJdCBzZWVtcyBsaWtlIGEgYmFkDQo+IGlkZWEuLi4NCj4gPg0KPiA+
ICtpbmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMNCj4gPiArDQo+ID4gK0FMVEVSTkFUSVZFX1BS
SU9SSVRZID0gIjEwMCINCj4gPiArQUxURVJOQVRJVkVfJHtQTn0tZGV2ID0gImxpYmNhcC1uZy5z
byINCj4gPiArQUxURVJOQVRJVkVfTElOS19OQU1FW2xpYmNhcC1uZy5zb10gPSAiJHtsaWJkaXJ9
L2xpYmNhcC1uZy5zbyINCj4gDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCg==
