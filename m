Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1572.1629824519749683835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 10:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PBbhZuQ1;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3870967b85=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17OCsqwq015724
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 17:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=1bm+iADk24Rol8+Jn1fHTpjDjQ+EOIUHe9+0uRC5Eok=;
 b=PBbhZuQ1m3WqMnDL3Cnav5P0yf5d7iGvvm+EUjwUy8jX8KHzJH/M/9spQ/og8WfrMMqi
 lURORwWgHKxQFEdhtDMvv95VNfCFCTcqQOEF3AaSK6ubjMdb4TnXHXHtepZfoMCYTxc3
 zq0EGY8PnsghKmVxeps0vGzG4K3+iUXHTnrGxhJl6fJyCeZw9I2d+NgX1YCFovMXLr1s
 ao/2cuNw3GpbQbBlo+IcD2wE+5f043aZ1YYMXjd23JtJH7nAYRG6GqAdFXkdJ4lgUdRE
 WmtrunnGJzGB5NU+w5rsa+2x8m9MglX4/pPaUOJIV79IDdhld9Cvu2sP0ChCglqctRGm TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3amg3pgtut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 17:01:57 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17OGxY85026569
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 17:01:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176] (may be forged))
	by mx0a-0064b401.pphosted.com with ESMTP id 3amg3pgtuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Aug 2021 17:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI4PFNZFrKVH5sjNpIxJr+7ELtCsGON7e2N9k/iuhngduB6+P+l7yqAg3AEEgiQIUZMB8mtHKjCasJcyQevNi4RdumSp+L9CQDKGDYHUuvZQRXncmw8knxbuyZm4zrqlEzEZwrLo7LdDVq7RWzF7pfm5YXb4VMhlzUJtZGCU1ER0KKzfz0z+XMsC+6WsLvQovmORCRQgPykBqzXAFEfdGVbq7qIdtobYv3ylbqLp3x+ZqZQNyQ9KXFUqBgHvYXVLn5hzvo3PDDG2NsewxU0d5bRxaK02BY/rpPwzitP3P87HoKUP/wXQtpyZ2A5uHAY21mrvPbWmTTrs+1DLqjOPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bm+iADk24Rol8+Jn1fHTpjDjQ+EOIUHe9+0uRC5Eok=;
 b=PC5Wskty4HnjQ716utNO7U6Zq2p0nOt7tY/kQZaAXePwL3Hw/G2iMEfmyZPcVacuj+eUMj3+T5p5xVNwpxP+4XaS0MZvTPFitnvwAINzKyMIrroUpmBz9HvzveM/BupO+wkyw5TGpaIcdBHXQjyP87yi1xhUyyERpwzd9aCma7fR0jkfeZwbuEhgebi9sCTB0HCj6xNPtqxwI64T2a8wwfAwehtCqdOjdK4dNzAgPDhJFFmvU+Y0VEsGRlGgOstYKi/2TOBffoOiL7YDjTurQeYmD3s3vjxB+VSvYHcYe1LpzV0RUSVjFeiVwO8pB5Fa/5VDoUX6HPDl2rYfVS7Grw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3993.namprd11.prod.outlook.com (2603:10b6:5:19c::10)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 17:01:49 +0000
Received: from DM6PR11MB3993.namprd11.prod.outlook.com
 ([fe80::45ea:4a77:48b1:256b]) by DM6PR11MB3993.namprd11.prod.outlook.com
 ([fe80::45ea:4a77:48b1:256b%2]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 17:01:49 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command buffer size
Thread-Topic: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command
 buffer size
Thread-Index: AQHXmGYF3FwvGkXZBU+hErU29IkRtauCCXMAgADYakA=
Date: Tue, 24 Aug 2021 17:01:49 +0000
Message-ID: 
 <DM6PR11MB3993976A3B8D546FBD8207AD88C59@DM6PR11MB3993.namprd11.prod.outlook.com>
References: <20210823212944.159869-1-joe.slater@windriver.com>
 <6093d42eedfe1d8a6673f78d8ada092af5cc7c2e.camel@intel.com>
In-Reply-To: <6093d42eedfe1d8a6673f78d8ada092af5cc7c2e.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d569737-23d0-47bd-f2dd-08d96720dd06
x-ms-traffictypediagnostic: DM6PR11MB4580:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DM6PR11MB4580ABA5527A398A55AFE04588C59@DM6PR11MB4580.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KWww/ghF9TN6iu/ae4F2WaQAA4n1mEm5xOOyhUwZBy1ynMj0ww2OI3EWsbgQqLzPSVZncQx8EFhi+miGChNB8rKJCIkNHWXEtjLf2vPyQ/mLHjAqg/OejEdoG3IkBUqHo3qc+XVVdFSb/Yd5ksMNey2KUFX84h/NiwEUI5Xsz0ihRyUDow+PSwzjChh1YZTmcTzMuYPShnjWQqZFRAjwY8s4SaUa2BXCNlhikvhCasRP//buD8DCeBsq+mYY2FXLkdsFhty73e+UWaAbug2aJ5MjGRihSmWYtcoxa72F9QNmcysfXZY6POe3ELs/JsBdwwwh79uEtLLTtOT++1swyZ92qTONG3/NULmc48iU40D7BFA2g6f/vvO4txx3vj+Wu6Y27hkktR18sszvvzJFyDNzspGsMmCPukxBAxLaNdwSDY1Vm1yDf8/vuVZ3XbJXdgy8zcYrKvv2ZFEsIvD5hfj+gIy2yViA4nw+bVnYVMRmHH0XQB9SbPfe/Lfsq7o+eSPSk2yZ7LYIsVGrCKtNBSaN2ZOiFqfvWgJvhPr4qD/UHWc71RDuqURP3ponYXZ4Q5D91YwQToVul4oUPoZwzw4vP1S8GxqtDLeoPu87GVx1IuDGZp+/osqBeccVKWeBytGDU0uPT4GlshBNN4DAj7efaeLOVCNR6gemT7/1jggY6mBVXKW6Ce859smE7TgeN582KqM4RNebYgrj4jPrlGAl4tlXH+QrfhViNVBTOZIdTGxoT9pfmVIvu8KvvQMwbfUW5EJr4jVzcsTsDowMxIEj0NaFKVBxhSY54CgmUxYdIn2ipdwPycsANJ6xzXu5cd5dyA2NwNXRuvfOg4SRVw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(346002)(136003)(396003)(107886003)(66946007)(9686003)(66446008)(66556008)(8936002)(76116006)(66476007)(64756008)(316002)(26005)(5660300002)(2906002)(4326008)(33656002)(53546011)(86362001)(110136005)(8676002)(7696005)(186003)(6506007)(55016002)(122000001)(38070700005)(71200400001)(966005)(38100700002)(83380400001)(52536014)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TU1naEErQUV3Y3NFR1E0aVBtVlRhbVdQMm5kdC9tNjN2bVhveHpGL0JzMkdh?=
 =?utf-8?B?N3kvRjFWQktibS8wdlduTlpMbnVhcGZQdFZ2L3BQcElBRDJUdWw4YWI2SGc5?=
 =?utf-8?B?QnJhYVdPSlQzdEZ3T2k0ODNTV0FhSi85MEpENzRNOWRXSnpiU1FRay9ZV3Bj?=
 =?utf-8?B?WTBsdkhBYThabkJ1N0FkZ1A0QUsyeUFuODR1U3FWcGI3bHo2UHByQUJrS1V3?=
 =?utf-8?B?Y29jb0V3VTdDT2U2bTlhcnJuTW43a1czdnZzbTI3RStnK2FESlh3NjZrTXAr?=
 =?utf-8?B?dlhFNzI4c2N6K09Rc2x1TkdPcHZSdFhTZ1dLY2ZQN0huS2owZUZRaGwrLzR1?=
 =?utf-8?B?TE1ibXA2Nkg5M0JScC8wMElYU01HRWVTa2Z0bGgxOGlkU09ydmgyNWdGdDh0?=
 =?utf-8?B?dVdYbHZUTnY1WHR6YXI5b3ZNbm8zZFUvakNyaGtBT3pxMjdhUUpudk5YMCtw?=
 =?utf-8?B?ejBGa0l6STdMSkIvaFprQnAyaXJZUjcvTmlBWFhUZi85ejMzeWJmSFJLRHBV?=
 =?utf-8?B?c0tLakFsUi9Eaks5WnJDN2VienhnS3BDa1REZmw1UDZaRVl6OFJ5U1RyYTgz?=
 =?utf-8?B?Y2E5WDk2cVVXcnZKRWdQc3dwSVViYkNTZnRvOWJTWG44T3d4TkZUR3Urc3VV?=
 =?utf-8?B?L044WUxzZmZaVDBXOXc5UEJPQ0RoUEVqVDNYMHR5NGRVTDI1YWE5dUx3UEQ3?=
 =?utf-8?B?aVU2eFN6cTg4ZVVXWWtQUFdsK24vTkdZcU84Z3RIUERSTHdTU3pFS09zNitT?=
 =?utf-8?B?RGYweHRvVG1GQmJkR3ZwQUh0UjVYYzhRemxxZ0NZV3VNSTRoazZOTmRLZmgx?=
 =?utf-8?B?bnJyOHdET0ZlMmZvUkxjVnRsT2JheXArdlJGbi9EamJsT2xNckdEbnNvbElu?=
 =?utf-8?B?TU9ITUxlamlDaXAxdWxjUERkWEdIbWhFdldhMTZIb25XYlk5QzlOZEJpOVlN?=
 =?utf-8?B?bFJLVWxoSndhR3JmTFROaDU1SGp3NkdSMWlZU0VydFJnZDJvQlNiUGwzU1Bo?=
 =?utf-8?B?dll5TjdwdTRQRUl2VGZoVDRESlhHamliZkM0aE5tZkhpL2E0bFBGRjFoM0sx?=
 =?utf-8?B?OEJuaTcxYWh2UkhvR1NhZ1RlbytTU3d2RC9MV1dwVjNSMXNldG1vNktaZisr?=
 =?utf-8?B?Mlpmb1M4bkJRbCt3aTEraHR3N2x3VTUrVlR0QzFiUzdBQTk3KzQ0b1pRUlNi?=
 =?utf-8?B?SVZFdFVkUE0wRzk0Z3FkV1d0WE9Cdmp4RjNBa0dPYkM2YmNrSlE4ckg4dVM4?=
 =?utf-8?B?SzlraElTRnVSUExqaHhNSjFYaFV0Rm54SGo2a211d3BWZmpNanN5d25oYzVE?=
 =?utf-8?B?TjUwcFJEMjFZVlhMZkx6M2ZpZ3U1b3FkOUlPckZDK00zWG5FYytOTDJqUHM5?=
 =?utf-8?B?Ymg5K2tPVFc1SERIS0NvNU1NZmttSW1KUTh6dmMyVTlRbnI3QlRwRUM3VDU1?=
 =?utf-8?B?OUNva1Npa3A3N2dzbEhWODhyYTJSdlhZMURkNEc4ZzJKRGZOQUl6bHV6bGFS?=
 =?utf-8?B?YmVQQlV5aSsrL0FGeUltcHBNUHcvM1BCMmh2WVk1WXNVOVBHU1hNTjBqTjZ6?=
 =?utf-8?B?SWMvTnpTWmVUcVBhR2lscGJPNGxFbjBpTjY5ZTBWdXdFZ2hEMGRpZnozQ3Yx?=
 =?utf-8?B?NEdkM1BFNEJHejA5cmxQS28xSmpseHJMUExkZkNMTEg2Z1BvVVM0ZXN5L2dL?=
 =?utf-8?B?VWw5QkFlUzdFRDdXS3p0V1lld09ZK1J1QzhqL2RpT1RqbXVhSXhDbFozTW9p?=
 =?utf-8?Q?XREDvV/8babm1Uu6TU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d569737-23d0-47bd-f2dd-08d96720dd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 17:01:49.3061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKjQYn9Xi7uDxMS2lx2k9EbavRFHnb56HEjFADxMxAbM9hzdNhjOHMQOT976FIfBKT0L84Du6+lTHd9Rfii8wNVF9DkrWMRLdhejHizTLaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
X-Proofpoint-ORIG-GUID: Xsnj7-YYr-rKYp-QlWxDiAazv6uHdDJg
X-Proofpoint-GUID: W16jVAoT5J60EJfogSd5evgWeT6vh7xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-24_05,2021-08-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240112
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aHR0cHM6Ly91bmljb2RlLW9yZy5hdGxhc3NpYW4ubmV0L2Jyb3dzZS9JQ1UtMjE3MDIgaGFzIGJl
ZW4gYWNjZXB0ZWQuICBNeSBwYXRjaCBqdXN0IG1pdGlnYXRlcyB0aGUgcHJvYmxlbSBidXQgZG9l
cyBub3QgdGFrZSBjYXJlIG9mIGlzc3VlcyBhcm91bmQgbGFjayBvZiBlcnJvciByZXBvcnRpbmcu
DQoNCkpvZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pdHRhbCwg
QW51aiA8YW51ai5taXR0YWxAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAyMywg
MjAyMSA5OjA0IFBNDQo+IFRvOiBTbGF0ZXIsIEpvc2VwaCA8am9lLnNsYXRlckB3aW5kcml2ZXIu
Y29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6
IE1hY0xlb2QsIFJhbmR5IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbb2UtY29yZV1baGFyZGtub3R0XVtQQVRDSCAxLzFdIGljdTogaW5jcmVhc2UgcGtnZGF0
YSBjb21tYW5kDQo+IGJ1ZmZlciBzaXplDQo+IA0KPiBIaSBKb2UsDQo+IA0KPiBPbiBNb24sIDIw
MjEtMDgtMjMgYXQgMTQ6MjkgLTA3MDAsIEpvZSBTbGF0ZXIgd3JvdGU6DQo+ID4gTWl0aWdhdGUg
cGF0aG5hbWUgdHJ1bmNhdGlvbiB3aGVuIGluc3RhbGxpbmcgaW4gYSBwcm9qZWN0IHdpdGggYSB2
ZXJ5DQo+ID4gbG9uZyBwYXRobmFtZS7CoCBUaGUgcGF0Y2ggaXMgb24gdGhlIG1hc3RlciBicmFu
Y2gsIGJ1dCB0aGV5IGhhdmUgbW92ZWQNCj4gPiB0byBhIGxhdGVyIHZlcnNpb24gb2YgaWN1IHNv
IHdlIGNhbm5vdCBjaGVycnktcGljay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0
ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLnBrZ2RhdGEt
aW5jcmVhc2UtY29tbWFuZC1idWZmZXItc2l6ZS5wYXRjaCB8IDQzDQo+ID4gKysrKysrKysrKysr
KysrKysrKw0KPiA+IMKgbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV82OC4yLmJiwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9u
cygrKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
aWN1L2ljdS8wMDAxLXBrZ2RhdGEtaW5jcmVhc2UtDQo+ID4gY29tbWFuZC1idWZmZXItc2l6ZS5w
YXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3Uv
MDAwMS1wa2dkYXRhLWluY3JlYXNlLQ0KPiA+IGNvbW1hbmQtYnVmZmVyLXNpemUucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtcGtnZGF0YS0NCj4gPiBpbmNyZWFzZS1j
b21tYW5kLWJ1ZmZlci1zaXplLnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwMDAwLi5lYTY4ZTRiZTlmDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1wa2dkYXRhLWluY3JlYXNlLWNvbW1h
bmQtDQo+ID4gYnVmZmVyLXNpemUucGF0Y2gNCj4gPiBAQCAtMCwwICsxLDQzIEBADQo+ID4gK0Zy
b20gYWI2YjFhY2RlZWQ3Njg5OWY4MjI3YzM4YWI3ZTc2NzVjNzY3M2ZmMSBNb24gU2VwIDE3IDAw
OjAwOjAwDQo+ID4gKzIwMDENCj4gPiArRnJvbTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5k
cml2ZXIuY29tPg0KPiA+ICtEYXRlOiBUaHUsIDUgQXVnIDIwMjEgMDk6MjM6NDggLTA3MDANCj4g
PiArU3ViamVjdDogW1BBVENIIDEvMV0gcGtnZGF0YTogaW5jcmVhc2UgY29tbWFuZCBidWZmZXIg
c2l6ZQ0KPiA+ICsNCj4gPiArTWFrZSBjbWQgTEFSR0VfQlVGRkVSX1NJWkUgdG8gYXZvaWQgcGF0
aG5hbWUgdHJ1bmNhdGlvbiB3aGVuIGluc3RhbGwNCj4gPiArcGF0aHMgYXJlIGxvbmdlciB0aGFu
IGFib3V0IDE1MCBjaGFyYWN0ZXJzLg0KPiA+ICsNCj4gPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5k
aW5nDQo+IA0KPiBJIHRoaW5rIHRoZXJlIHdhcyBhIGNvbW1lbnQgZnJvbSBBbGV4IG9uIHRoZSBv
cmlnaW5hbCBwYXRjaCBmb3IgbWFzdGVyDQo+IHJlcXVlc3RpbmcgdGhpcyBiZSBzZW50IHVwc3Ry
ZWFtIGZpcnN0LiBDYW4geW91IGRvIHRoYXQgcGxlYXNlPw0KPiANCj4gVGhhbmtzLA0KPiANCj4g
QW51ag0KPiANCj4gPiArDQo+ID4gK1NpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0
ZXJAd2luZHJpdmVyLmNvbT4NCj4gPiArLS0tDQo+ID4gKyBzb3VyY2UvdG9vbHMvcGtnZGF0YS9w
a2dkYXRhLmNwcCB8IDYgKysrLS0tDQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ICsNCj4gPiArZGlmZiAtLWdpdCBhL3NvdXJjZS90b29s
cy9wa2dkYXRhL3BrZ2RhdGEuY3BwDQo+ID4gYi9zb3VyY2UvdG9vbHMvcGtnZGF0YS9wa2dkYXRh
LmNwcA0KPiA+ICtpbmRleCA1YWI2ODJlLi5kNGI3MGVmIDEwMDY0NA0KPiA+ICstLS0gYS90b29s
cy9wa2dkYXRhL3BrZ2RhdGEuY3BwDQo+ID4gKysrKyBiL3Rvb2xzL3BrZ2RhdGEvcGtnZGF0YS5j
cHANCj4gPiArQEAgLTExMzEsMTcgKzExMzEsMTcgQEAgbm9ybWFsX3N5bWxpbmtfbW9kZToNCj4g
PiArDQo+ID4gKyBzdGF0aWMgaW50MzJfdCBwa2dfaW5zdGFsbExpYnJhcnkoY29uc3QgY2hhciAq
aW5zdGFsbERpciwgY29uc3QgY2hhcg0KPiA+ICp0YXJnZXREaXIsIFVCb29sIG5vVmVyc2lvbikg
ew0KPiA+ICvCoMKgwqDCoCBpbnQzMl90IHJlc3VsdCA9IDA7DQo+ID4gKy3CoMKgwqAgY2hhciBj
bWRbU01BTExfQlVGRkVSX01BWF9TSVpFXTsNCj4gPiArK8KgwqDCoCBjaGFyIGNtZFtMQVJHRV9C
VUZGRVJfTUFYX1NJWkVdOw0KPiA+ICsNCj4gPiArwqDCoMKgwqAgYXV0byByZXQgPSBzbnByaW50
ZihjbWQsDQo+ID4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNNQUxMX0JVRkZFUl9NQVhfU0la
RSwNCj4gPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTEFSR0VfQlVGRkVSX01BWF9TSVpFLA0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImNkICVzICYmICVzICVzICVzJXMlcyIsDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXJnZXREaXIsDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwa2dEYXRhRmxhZ3NbSU5TVEFMTF9DTURdLA0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbGliRmlsZU5hbWVzW0xJQl9GSUxFX1ZFUlNJT05dLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5zdGFsbERpciwgUEtHREFUQV9GSUxFX1NFUF9TVFJJTkcs
DQo+ID4gbGliRmlsZU5hbWVzW0xJQl9GSUxFX1ZFUlNJT05dKTsNCj4gPiArwqDCoMKgwqAgKHZv
aWQpcmV0Ow0KPiA+ICstwqDCoMKgIFVfQVNTRVJUKDAgPD0gcmV0ICYmIHJldCA8IFNNQUxMX0JV
RkZFUl9NQVhfU0laRSk7DQo+ID4gKyvCoMKgwqAgVV9BU1NFUlQoMCA8PSByZXQgJiYgcmV0IDwg
TEFSR0VfQlVGRkVSX01BWF9TSVpFKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgIHJlc3VsdCA9IHJ1
bkNvbW1hbmQoY21kKTsNCj4gPiArDQo+ID4gKy0tDQo+ID4gKzIuMjkuMg0KPiA+ICsNCj4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV82OC4yLmJiIGIvbWV0YS9y
ZWNpcGVzLQ0KPiA+IHN1cHBvcnQvaWN1L2ljdV82OC4yLmJiIGluZGV4IDFjYTg3ZmVlZTQuLjEz
MDIxMmQyNDUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV82
OC4yLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV82OC4yLmJiDQo+
ID4gQEAgLTEwNyw2ICsxMDcsNyBAQCBTUkNfVVJJID0gIiR7QkFTRV9TUkNfVVJJfTtuYW1lPWNv
ZGUgXA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL2ZpbHRlci5qc29uwqBcDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vZml4LWluc3RhbGwtbWFueC5wYXRjaMKg
XA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovLzAwMDEtaWN1LUFkZGVkLWFybWVi
LXN1cHBvcnQucGF0Y2jCoFwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovLzAwMDEt
cGtnZGF0YS1pbmNyZWFzZS1jb21tYW5kLWJ1ZmZlci1zaXplLnBhdGNowqBcDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiDQo+ID4NCj4gPiDCoFNSQ19VUklfYXBwZW5kX2NsYXNzLXRhcmdl
dCA9ICJcDQo+ID4NCj4gPiANCj4gPg0KDQo=
