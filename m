Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27571.1629134816925489383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 10:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sqY4w+t/;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3862dffb07=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17GF9UIx020854
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=5yiPrPpWV62ok5axUgV/9sO7IYRBD8rWUjcwliQHLrw=;
 b=sqY4w+t/yP4C2GBfF2akzAPLqTTSEL4uWgptbife9IY5sNYwe4Ad3JqS9STuh8/XasVL
 cmyAUoX9GP+WeXi1ohdckg+dWpHupyklPtvdynD30Lf0ItILIUxM8fuWrdifkmf/gXcB
 8yQ8wFmkkMZ/HEDmt6xfTxDGEkNiVya5DT3oRCpYkuWvf5jdHfHgwEzT4tBR46fYNDHg
 0zn44UfrxM+4ZV6zFJK8E0vaZAo7/VehjSfPmDHqct0gP62CRfNFsLhj6FMLYhmQI4/r
 wH7+FzpiRPC/GPX5FmZZO2zJ/90Er2083qFSmrJ4AHNB5OqWAxwPko1R95ssfZ8ToLIs gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3af2vg0qgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:26:55 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17GHOEFa026963
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:26:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3af2vg0qga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Aug 2021 17:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz1ucfxuQ1fHHCJhppEB6Z1xQ5Uqcw14FttbXpd2ssP9Aicf2NbCIIQgEXuE/kwYfEyGK2L1ex0gM6ILESWuSi+fbB3W8JZfbQUpugJYC3FwCFH7S4D19ygAl0Au8+IdxfxQ1N1jDnMqLUevjxUSNY2mKAVEcrz6IPp0shzHAs7sxrEi1j7rQQzeEF7xDV/oa1nZIdG8sgvsiP2KwiNilPJZ4YwNecjMqhLsys5QjJeQt4kS9TjEocrFK3DBEt/MowoTgrXd+FiDgYwFgGnwzsDBOqNouHp64/KN5aLK/EkERt1ZWv3irPzzng1wrYSISxKq8bdP+jOB198U/LGQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yiPrPpWV62ok5axUgV/9sO7IYRBD8rWUjcwliQHLrw=;
 b=LHHjXLxvsAnvTwAC2xCj86zQXkmjVU1M9EglCyVnVY9LewTiKi6DK68OwbCVTChL74pYFsN2u0cVJ304YnZd5cjOYxXr72JgTw+PFKVp3X73ch3Pg+fQWaGUJD7WjDgL3dI9Ti+a8J4X+j/HXLhYaUMojxrZZ/mz7sPkgKn7sixWcy7DRNRD21WBJgHo965omj9+NmNHTbnsBRclyuA1b4+ZfmZHg/UNrN1AoLgRB+KFnybFmj95t6yitH0EHHApJngCBHucx2m6oCZiJdXUEhwe/++EIcYIj3y5zjwUAZA6D4oIi85+cCAciCbEthAQyRp4a0iuQEk337RcTHOarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Mon, 16 Aug
 2021 17:26:52 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 17:26:52 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/1] blktrace: add rdepends
Thread-Topic: [oe-core][PATCH 1/1] blktrace: add rdepends
Thread-Index: AQHXkIE3qy7QFENVHkeNvZlpeta3+6tyFnaAgAGzvYCAApuk0A==
Date: Mon, 16 Aug 2021 17:26:51 +0000
Message-ID: 
 <BY5PR11MB399277689273C5667F0A574088FD9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20210813202416.138888-1-joe.slater@windriver.com>
 <827139a6-de73-ccf7-bbf8-a9097f5ac413@windriver.com>
 <9cf777d5-5798-8a6f-607b-7418e8dd57d0@gmail.com>
In-Reply-To: <9cf777d5-5798-8a6f-607b-7418e8dd57d0@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8391d72-3b63-4397-f9e6-08d960db096b
x-ms-traffictypediagnostic: BY5PR11MB4369:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BY5PR11MB4369E38FB52EC2F3A09F6F5788FD9@BY5PR11MB4369.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SDMPu5zMXhwZkwMbLb+sUuKay8kwcYNtZM+/PZnrBX6AKM+wn0Yasxg3S1sqkNRk8xuNi8GrjBULYIU3x5ZNiz1h2sBknpLwTa+JI0dhS3f+C7mvk9yE+d5cpOjtrt/kFtnLJTSLPifdiw+ak6OZunSNEMSdld2uKdVemF1kyYELxxXvPDk+hEEUZUCFy9eP4/eCkQdLRLRERR+9G7rSQU/XLTXijF6t0R+22uvcIppAKjssJslSOHktdN3piu46r5hW+ZcrlHcYarOKFANAM991GPcLWR/fkfehEpOoOcA6zKHXfpmqMD1lr07K2LX01GR9qWQNmPzX7gsuQ1zPJSDDhbDULJ7SzT+8T8cB0qxBSja431uxqL8Bt4ZPSvDqw+aZ+XU4oGxZoGqdajTvJFrlOqP8+ETnfMjVw0/9DNdtVV7y8dhOTped2g6VFGPMjKpFCk8iq6u90yhsIVeTf05lVT/lB4Zi3Xm1STQheJHIUv6qk7UJpGdAptwg1S10MY10DyJ6za4w5jUsJbOULnce6I71vO+DMEymnkB1hspI3HRRRONJoGfz+BExDQppzuvt6JU01RnrqxmYPM32iHtL5MoImPExwlwF/RjO0hL4BbPLHbkxD8htjv9N4MelWa/d1R4HQdDj32pNVgdvB0uWHd41OvbqXke2/O4Qj8CHUwKoPOpVsMsrzodvt8lQil3C4Qp6EKlRCK1Aa4DWgm53v7cERkoulB8TRvDbo1AYALyulfycELk4nTtNFfp7ysLKJN/1k/YGNXWicLHU6iahdO+3hYfRWdBvMzsoCWdll+NWE6ozcJ+T+eI8pxr3ZnCBfIRgBRhKqerlcQkIHA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(33656002)(66476007)(53546011)(6506007)(122000001)(83380400001)(52536014)(66946007)(316002)(8676002)(7696005)(478600001)(38100700002)(5660300002)(71200400001)(8936002)(966005)(66556008)(66446008)(26005)(64756008)(55016002)(86362001)(9686003)(38070700005)(2906002)(186003)(110136005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YlNTWDE1UGpoYktPWWhkNXIrRTJUd2lmZ2M4SUNwdzRRMkF4TUt0MHNQcjlB?=
 =?utf-8?B?UStxYkZ1U29Xd0ZZUDNNZXkvSVUwWUFFalREb2wzTWJjdHM5U1dxeWEvWVBn?=
 =?utf-8?B?VXJhWWdPaUQ1ZzJHalZMUlZmcTlKUzJvOHpWWHpjRm5zVDRDSXNhNzJET2JZ?=
 =?utf-8?B?YlBuK1ZqM3BpaStieDZZL21pZlFmRk1UazN1SGNmanBUd01JWVN3ZW9uR1lw?=
 =?utf-8?B?dWs5Q0RQeHFiVG1EL0xBMGpWZStqb29LWkRydjBmZUZOY1hDRFdad3BXM3h4?=
 =?utf-8?B?MWN3aTh3OFY5TFExTERzVHU3UE9IMVRkZ3J4aHY0bEdhbE5IRnlxZTczSUVT?=
 =?utf-8?B?b3Z4cnBUSlYyUkV4ZWxWZDYwTENyVlJldTZXZHdXVXh4TWplekFUUzEzK09H?=
 =?utf-8?B?YmhwU01LQ0lpSzlaSjdBcXlqeGNLN3ZFVHM0SXhjaFFrL1ZXeDYyUWxscmZp?=
 =?utf-8?B?UlBGc2FxYlVqZk1iVk45QklWTm96MXNlaVpvUVJrdXRRQjZSNk5zaTJ3ODZT?=
 =?utf-8?B?VGhkcFQycEZxc01HRWt1QnBqOVc4Y3pLcFo3ZDlIWlVnTlROSk5qbmphek5X?=
 =?utf-8?B?ZGhUcU8zTFlGanhQd3l6dzNiRTAxcUI1T3BoL0cycGRVM2dmZUovMEx3NzBX?=
 =?utf-8?B?SFZOaXZDZnMvVGRQdzIxOGQ5bzZpaWllZHRya0dnMUM3eGdIUm9hbTNlKzU2?=
 =?utf-8?B?NXZiZWg0S3FtQnJBeXJWTlRnYzNBQmNNZjlGTGNZeHgzRUJDQXFrRVZieU9y?=
 =?utf-8?B?bk9lT1VISlROWlVNZVVXRURpOXBoQi9kQ3NVQ1dOM293T2xIL3h6NWlrK28v?=
 =?utf-8?B?cmNkSm9NS0EvaVJnbkd2c0JhQ3VuZkN6R3dxaVpPRlhhMkl4TnhsaG11a1BY?=
 =?utf-8?B?eEtVaDE2Yk1FT0lsYXZNaXdMSGRtcTgyWTY0MmUrTzB4UitsNU96WEJnTnNI?=
 =?utf-8?B?U3I2K2RSaXpURUpZcEltcGh2eGVTYnlvU3pKTTRKSmVZbjBveGZWRzJhZUFD?=
 =?utf-8?B?ZkhPVjQ2eHhMUVdjK09vUk9NMVhrRjlYTjc5UXMwZzVpZ3BKNkFTVnpCOG9I?=
 =?utf-8?B?YWFSckk4SVAyZUg2THNqVmdkbk9TeFZzVWJTY1gvRk5WWUhTVXhmdTgxaUZE?=
 =?utf-8?B?YlM5MmVaSmErMUQ2NDZoWGlraU1PWC9xUFpsa0RzR2tZajY1Rk9tTTUxKzF2?=
 =?utf-8?B?aC9FcEVYNmNQSlRMMndkc1pTUDBBb1pCMjJ6ZS9FU3BWTmMxSHZuQUJrUDg1?=
 =?utf-8?B?TWUxUVZkQkRVblNQTHdJMmhEVzdSeXMyRmJKbjFjT3YxS1V0and6S01KSDVl?=
 =?utf-8?B?K2Y4T1cyR1l3d0hFODh4VitZQTZnSjN3WkZKWkxJd2VwNHN0ckJxaDQyYnBM?=
 =?utf-8?B?bmFlNzNnK3A1QmFsUUk5NGIrL3AreWs5RXh0cENxNnZQYW83SEl2d0I3WGFm?=
 =?utf-8?B?SEh6OU1POHQwUjIvUHRjOGJlY0Z0cC9Nd3NqSm9SVWhiSXhsMHdINHRBMGha?=
 =?utf-8?B?dDFEL01vMG9kRXE5eUsxeGVSRDNFV1RhM2dqUEZCbUFob0ErR1g5U1R3SlR5?=
 =?utf-8?B?VjRvOWVVQ0Z3d3NYVFFBZ2dwaURUd3BnRFhMcXArNG1vb2xwNXJZK3dMYXJV?=
 =?utf-8?B?RTdKWTdnOFpubVY2TlAxWHhaaWxxT3pYYWxiKzI4dUc0Y0pyMDU5czNLMHJy?=
 =?utf-8?B?NjVRNEpuMDZVamZraG5qWXVPK29KZVQzaDhuTGNLVmwzbXRLWnIxWWNsdjlC?=
 =?utf-8?Q?r2q7ijWNJb5Jgq7no4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8391d72-3b63-4397-f9e6-08d960db096b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 17:26:51.9502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/ruF7vvZN2ad5oNXhvG0eUkr3LehOWhazUR1bactwmSeWJxRpTCAsFsY4a/XkCsMxFbbCvGNWogtYvX6IaNLmVzu2L3VLsfvV0iMN8NB3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4369
X-Proofpoint-GUID: 7UzfEjLYzl7b74wdj_pMZV1Y2LJsnvVy
X-Proofpoint-ORIG-GUID: CuTEncy9qPcRqjUUv42sM_ds8TN4KkWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-16_06,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160110
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB3YW50ZWQgdG8gbWFrZSAvdXNyL2Jpbi9weXRob24gc3VwcGxpZWQgYnkgcHl0aG9uMyBidXQg
aGF2ZSB0aGF0IG92ZXJyaWRkZW4gYnkgYSBoaWdoZXIgcHJpb3JpdHkgdmVyc2lvbiBpbiBweXRo
b24yLCBidXQgbWV0YS1weXRob24yIHdvdWxkbid0IGdvIGZvciBpdC4gIFdpdGhvdXQgdGhhdCwg
YW55IGFsdGVybmF0aXZlIHB5dGhvbjMgc3VwcGxpZXMgd291bGQgcmVwbGFjZWQgdGhlaXIgdmVy
c2lvbi4NCg0KSm9lDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIEF1Z3VzdCAxNCwg
MjAyMSA2OjM0IFBNDQo+IFRvOiBNYWNMZW9kLCBSYW5keSA8UmFuZHkuTWFjTGVvZEB3aW5kcml2
ZXIuY29tPjsgU2xhdGVyLCBKb3NlcGgNCj4gPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtv
ZS1jb3JlXVtQQVRDSCAxLzFdIGJsa3RyYWNlOiBhZGQgcmRlcGVuZHMNCj4gDQo+IA0KPiANCj4g
T24gOC8xMy8yMSA0OjM0IFBNLCBSYW5keSBNYWNMZW9kIHdyb3RlOg0KPiA+IE9uIDIwMjEtMDgt
MTMgNDoyNCBwLm0uLCBKb2UgU2xhdGVyIHdyb3RlOg0KPiA+PiBibm9fcGxvdC5weSB1c2VzIGdu
dXBsb3QuwqAgQWxzbyBjaGFuZ2Ugc2hlYmFuZ3MgdG8NCj4gPj4gcHl0aG9uMyBiZWNhdXNlIHdl
IGRvIG5vdCBzdXBwb3J0IHB5dGhvbjIuDQo+ID4NCj4gPiBXZSBuZWVkIHRvIGdldCBhZ3JlZW1l
bnQgYWJvdXQgd2hhdCAncHl0aG9uJyBpcy4NCj4gPiBUaGF0J3Mgbm90IHNvbWV0aGluZyBpIGZv
bGxvdyBhbmQgaXQncyBhbHJlYWR5IGxhdGUgb24gRnJpZGF5IHNvIEknbQ0KPiA+IENDaW5nIFRy
ZXZvciwgTXIgbWV0YS1weXRob24gYW5kIHBvaW50aW5nIHlvdSB0bzoNCj4gPg0KPiA+IGh0dHBz
Oi8vd3d3LnB5dGhvbi5vcmcvZGV2L3BlcHMvcGVwLTAzOTQvDQo+ID4NCj4gPiB3aGljaCBmcm9t
IGEgYnJpZWYgcmV2aWV3IHNlZW1zIHRvIHNheSB0aGF0IGl0J3MgdXAgdG8gdGhlDQo+ID4gZGlz
dHJpYnV0aW9uISBGdW4hIQ0KPiA+DQo+ID4NCj4gPiBNeSBwcmVmZXJlbmNlIHdpdGhvdXQga25v
d2luZyB3aGF0IG90aGVyIGRpc3Ryb3MgaGF2ZSBkb25lIGlzIHRvIGhhdmUNCj4gPiB0aGUgYnVp
bGQgc3lzdGVtIG1ha2UgYSBzb2Z0IGxpbms6DQo+ID4gIMKgIHB5dGhvbiAtPiBweXRob24zDQo+
ID4NCj4gDQo+IEl0cyBiZXR0ZXIgdG8gYmUgZXhwbGljaXQsIG1ha2luZyBzb2Z0bGluayB3aWxs
IHNpbGVudGx5IHRyeSB0byBydW4gcHl0aG9uIHNjcmlwdHMNCj4gd2hpY2ggYXNzdW1lIHB5dGhv
biA9IHB5dGhvbjIgYW5kIGRvIHVuZXhwZWN0ZWQgdGhpbmdzDQo+IA0KPiANCj4gPg0KPiA+Pg0K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+
DQo+ID4+IC0tLQ0KPiA+PiDCoCBtZXRhL3JlY2lwZXMta2VybmVsL2Jsa3RyYWNlL2Jsa3RyYWNl
X2dpdC5iYsKgIHzCoCA2ICsrKy0NCj4gPj4gwqAgLi4uL2Jsa3RyYWNlL2ZpbGVzL3B5dGhvbjMt
c2hlYmFuZ3MucGF0Y2jCoMKgwqDCoCB8IDMwDQo+ID4+ICsrKysrKysrKysrKysrKysrKysNCj4g
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+PiBtZXRhL3JlY2lwZXMta2VybmVsL2Jsa3Ry
YWNlL2ZpbGVzL3B5dGhvbjMtc2hlYmFuZ3MucGF0Y2gNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvYmxrdHJhY2UvYmxrdHJhY2VfZ2l0LmJiDQo+ID4+IGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9ibGt0cmFjZS9ibGt0cmFjZV9naXQuYmINCj4gPj4gaW5kZXggZDAw
YjFiZDBiZS4uMzZjZTI4MjQ4MSAxMDA2NDQNCj4gPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9ibGt0cmFjZS9ibGt0cmFjZV9naXQuYmINCj4gPj4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9ibGt0cmFjZS9ibGt0cmFjZV9naXQuYmINCj4gPj4gQEAgLTEwLDExICsxMCwxNSBAQCBMSUNf
RklMRVNfQ0hLU1VNID0NCj4gPj4gImZpbGU6Ly9DT1BZSU5HO21kNT0zOTNhNWNhNDQ1ZjY5NjU4
NzNlY2EwMjU5YTE3ZjgzMyINCj4gPj4gwqAgREVQRU5EUyA9ICJsaWJhaW8iDQo+ID4+ICtSREVQ
RU5EUzoke1BOfSArPSAiZ251cGxvdCINCj4gPg0KPiA+IEFzIHRoZSBERVNDUklQVElPTiBzYXlz
Og0KPiA+DQo+ID4gVGhlcmUgYXJlIHRocmVlIG1ham9yIGNvbXBvbmVudHM6DQo+ID4gIMKgIGEg
a2VybmVsIGNvbXBvbmVudCwNCj4gPiAgwqAgYSB1dGlsaXR5IHRvIHJlY29yZCB0aGUgaS9vIHRy
YWNlIGluZm9ybWF0aW9uIGZvcg0KPiA+ICDCoMKgwqAgdGhlIGtlcm5lbCB0byB1c2VyIHNwYWNl
LA0KPiA+IGFuZA0KPiA+ICDCoCB1dGlsaXRpZXMgdG8gYW5hbHlzZSBhbmQgdmlldyB0aGUgdHJh
Y2UgaW5mb3JtYXRpb24uDQo+ID4NCj4gPiBzbyBzaG91bGRuJ3Qgd2Ugc3BsaXQgdGhlIHVzZXJz
cGFjZSBwYXJ0IHVwIHNvIHRoYXQgdGhlIHV0aWxpdGllcyBhcmUNCj4gPiBwYWNrYWdlZCBzZXBh
cmF0ZWx5IGFuZCBwZW9wbGUgd2hvIHdhbnQgdG8gY29sbGVjdCBkYXRhIG9uIHRhcmdldCBhbmQN
Cj4gPiBhbmFseXplIGl0IGVsc2V3aGVyZSBkb24ndCBwdWxsIGluIGdudXBsb3QgYW5kIG1heWJl
IG1vcmU/DQo+ID4NCj4gPg0KPiA+DQo+ID4gLi4vUmFuZHkNCj4gPg0KPiA+PiArDQo+ID4+IMKg
IFNSQ1JFViA9ICIzNjZkMzBiOWNkYjIwMzQ1YzVkMDY0YWY4NTBkNjg2ZGE3OWI4OWViIg0KPiA+
PiDCoCBQViA9ICIxLjMuMCtnaXQke1NSQ1BWfSINCj4gPj4gLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
Lmtlcm5lbC5kay9ibGt0cmFjZS5naXQiDQo+ID4+ICtTUkNfVVJJID0gImdpdDovL2dpdC5rZXJu
ZWwuZGsvYmxrdHJhY2UuZ2l0IFwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9w
eXRob24zLXNoZWJhbmdzLnBhdGNoIFwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAiDQo+ID4+
IMKgIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4+IGRpZmYgLS1naXQNCj4gPj4gYS9tZXRhL3Jl
Y2lwZXMta2VybmVsL2Jsa3RyYWNlL2ZpbGVzL3B5dGhvbjMtc2hlYmFuZ3MucGF0Y2gNCj4gPj4g
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2Jsa3RyYWNlL2ZpbGVzL3B5dGhvbjMtc2hlYmFuZ3MucGF0
Y2gNCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4gaW5kZXggMDAwMDAwMDAwMC4uNzBh
MzVjMmMzYQ0KPiA+PiAtLS0gL2Rldi9udWxsDQo+ID4+ICsrKyBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvYmxrdHJhY2UvZmlsZXMvcHl0aG9uMy1zaGViYW5ncy5wYXRjaA0KPiA+PiBAQCAtMCwwICsx
LDMwIEBADQo+ID4+ICtibGt0cmFjZTogVXNlIHB5dGhvbjMgc2hlYmFuZ3MNCj4gPj4gKw0KPiA+
PiArYmxrdHJhY2UgY2FuIHVzZSBlaXRoZXIgcHl0aG9uMiBvciBweXRob24zLCBidXQgd2UgcmVh
bGx5IHdhbnQNCj4gPj4gK3B5dGhvbjMsIHNvIG1vZGlmeSB0aGUgc2hlYmFuZ3MuDQo+ID4+ICsN
Cj4gPj4gK1Vwc3RyZWFtLVN0YXR1czogcGVuZGluZw0KPiA+PiArDQo+ID4+ICtTaWduZWQtb2Zm
LWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20uDQo+ID4+ICsNCj4gPj4g
Kw0KPiA+PiArZGlmZiAtLWdpdCBhL2J0dC9ibm9fcGxvdC5weSBiL2J0dC9ibm9fcGxvdC5weSBp
bmRleA0KPiA+PiArM2FhNGUxOS4uZDdkNzE1OSAxMDA2NDQNCj4gPj4gKy0tLSBhL2J0dC9ibm9f
cGxvdC5weQ0KPiA+PiArKysrIGIvYnR0L2Jub19wbG90LnB5DQo+ID4+ICtAQCAtMSw0ICsxLDQg
QEANCj4gPj4gKy0jISAvdXNyL2Jpbi9lbnYgcHl0aG9uDQo+ID4+ICsrIyEgL3Vzci9iaW4vZW52
IHB5dGhvbjMNCj4gPj4gKyAjDQo+ID4+ICsgIyBidHQgYmxrbm8gcGxvdHRpbmcgaW50ZXJmYWNl
DQo+ID4+ICsgIw0KPiA+PiArZGlmZiAtLWdpdCBhL2J0dC9idHRfcGxvdC5weSBiL2J0dC9idHRf
cGxvdC5weSBpbmRleA0KPiA+PiArNDBiYzcxZi4uODYyMGQzMSAxMDA3NTUNCj4gPj4gKy0tLSBh
L2J0dC9idHRfcGxvdC5weQ0KPiA+PiArKysrIGIvYnR0L2J0dF9wbG90LnB5DQo+ID4+ICtAQCAt
MSw0ICsxLDQgQEANCj4gPj4gKy0jISAvdXNyL2Jpbi9lbnYgcHl0aG9uDQo+ID4+ICsrIyEgL3Vz
ci9iaW4vZW52IHB5dGhvbjMNCj4gPj4gKyAjDQo+ID4+ICsgIyBidHRfcGxvdC5weTogR2VuZXJh
dGUgbWF0cGxvdGxpYiBwbG90cyBmb3IgQlRUIGdlbmVyYXRlIGRhdGENCj4gPj4gKyBmaWxlcyAj
DQo+ID4+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPiANCj4gPg0K
