Return-Path: <prvs=08495bd464=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 522AE79AF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 15:21:49 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	wA7FHhuU023882; Wed, 7 Nov 2018 09:21:43 -0600
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam05lp0117.outbound.protection.outlook.com
	[216.32.181.117])
	by mx0a-00010702.pphosted.com with ESMTP id 2nkvah96d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 07 Nov 2018 09:21:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H527Om7VoC+MzOjNI74dN/YxB7iondJHjq2kyCN+rP8=;
	b=dvKF9jYX4yf0Z58++3DDiImcDs9NaWTDieNuhiXGtpYc2Xc9I+YnGyrzhtMsxCu+HZda9kAmb4OBZj0ulZC72s0DXs+VuMP8Zk6lcx16594QxyHwvXGybgjKjiU1PV6/vLYUJuvpIVa2izqOLygwtWRY/LXfwpc5UolWuYE5Cdc=
Received: from SN6PR04MB4221.namprd04.prod.outlook.com (52.135.71.147) by
	SN6PR04MB5248.namprd04.prod.outlook.com (20.178.6.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.20; Wed, 7 Nov 2018 15:21:41 +0000
Received: from SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::b101:799c:362d:549e]) by
	SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::b101:799c:362d:549e%3]) with mapi id 15.20.1294.034;
	Wed, 7 Nov 2018 15:21:41 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: "opkg-devel@googlegroups.com" <opkg-devel@googlegroups.com>, Stefan Agner
	<stefan@agner.ch>
Thread-Topic: [opkg-devel] [opkg-utils PATCH] opkg-make-index: use ctime
	instead of mtime
Thread-Index: AQHUZ8HLUWQLgtaCxUyNWD8vwj5l7qUrCPWAgBlMXYCAADbNAA==
Date: Wed, 7 Nov 2018 15:21:41 +0000
Message-ID: <f0160c03-a410-ccce-cb5d-c4c62ce787e8@ni.com>
References: <20181019153821.21177-1-stefan@agner.ch>
	<670d0eab-f33b-8883-2cdf-d83c1701789b@ni.com>
	<11acdfc51839b0ac3392e31f38fd08a8@agner.ch>
In-Reply-To: <11acdfc51839b0ac3392e31f38fd08a8@agner.ch>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0096.namprd12.prod.outlook.com
	(2603:10b6:802:21::31) To SN6PR04MB4221.namprd04.prod.outlook.com
	(2603:10b6:805:30::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.135]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR04MB5248;
	6:/8P28yCdviiyInQwAzgQCdwL5dBmB/F3/5OrFWwR+KaLH95aWjLRdLywEIC3dpJdL0wUogWu4xr9oOA20/yiJwHX0Zt4ineYwod4N9VBC/w2Ntlmdh90X8HynIaC7lK0Yq6gb4+PBGOuQTNDaDZOte0Tqkkn9TQIgckEpz7bFI72zlsmMgAxgT3l8onmoeKQ10F8lfRRw2S2rLDWR1pXi/ifJNVDJlgHpBleuG5NFMWVX5+ho+w22vo+kOwH3NhMdTPjY46/0R0ccMsT5Mspf1rZqt6Wrx8SCSkDBSOi7e71tORZs/vb35D5xiyO5oMt9Jgs7oE5SMb/CHsYR5cfIbqDlE4MS6Wm7Vr70hz7uoZHGZtYZobQ4KeqLN3bQ/l0W3xgm4/CQ+hZrpIR2yxpzMzDEk++9MbosxRJ454u0FtLKntVSlimP/Bmhgh0Cr5lgmmXqr2AQ/vji9GT89NhEQ==;
	5:YNldbMJR9pARDh+YzANOwkL5k6+ZwUkbV+NAxl9u2cRw/+P/Z1wqt7VAvzpnpRVMg6ZiIYvYjmVl/FII8F47hJoXF2YR5QsCgk19n1QBdyGThbGVpDmeEkTvBm2SUZg0sElV3vGjQpRn1igHcQ08In2ZqFEpDRqBL1vNxPBWx90=;
	7:XVhpFivD32OCmsVnoLmxR6410uz9DKJDUgG4HLREiFZa7KfsEPU2YTtOGxYpbIq+k6smv8GdYrIspqLSlNnHywBbN3BkhfV/iHwW4FP/2mMS1HRfTeOSVEb4gKgIZk76Ezc91B5e4/fdUq4Y2Ogx8A==
x-ms-office365-filtering-correlation-id: 069a3aac-b951-4456-ab80-08d644c4b7cb
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR04MB5248; 
x-ms-traffictypediagnostic: SN6PR04MB5248:
x-microsoft-antispam-prvs: <SN6PR04MB52480BA29E1F3CDA1D62D02086C40@SN6PR04MB5248.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(244540007438412);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR04MB5248; BCL:0; PCL:0; RULEID:; SRVR:SN6PR04MB5248; 
x-forefront-prvs: 08497C3D99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39860400002)(346002)(396003)(376002)(199004)(189003)(76176011)(52116002)(7736002)(31686004)(81166006)(81156014)(8676002)(229853002)(8936002)(99286004)(106356001)(66066001)(105586002)(6246003)(54906003)(110136005)(6116002)(3846002)(68736007)(316002)(305945005)(5660300001)(39060400002)(6436002)(6486002)(2906002)(6512007)(53936002)(14454004)(86362001)(186003)(36756003)(26005)(25786009)(2900100001)(2501003)(97736004)(31696002)(4326008)(53546011)(386003)(256004)(102836004)(6506007)(478600001)(486006)(476003)(2616005)(446003)(11346002)(71190400001)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5248;
	H:SN6PR04MB4221.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: B6g0LXr+sN4yXu1SpkRgPSu2n98uBEtFwugDpwz4Kgi74c92SXWx5kk6smOtMLecBB65XMhufENvUJajTK8h3qFil3Jpoptaxak84nEJDqFmHNqDSjFA7jFBA3dHw/qnYoDrQ1eFmZoFiY0Q+IsJash0IJ7oitOXbxRwNXeu5q5HRiGddgEY4IUbdinu5OMj9qxK0FJh3MFJifiF21B/zirKBlVvgqC0I3evEIRgvpk8t+5+Dc8b9RhwH29RtK4N4QzInKUpCI4nvBYRt6m6iwHgQUtLSkx8ldROkgZ+tks5rsezCew4IhVhrMplp26eo9lCDeTAJvT8ehcrhM9KIHmedkPKQ5DQeaNZtc/vf+g=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069a3aac-b951-4456-ab80-08d644c4b7cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2018 15:21:41.4125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5248
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-11-07_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1811070137
Cc: Stefan Agner <stefan.agner@toradex.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"ricardo@foundries.io" <ricardo@foundries.io>
Subject: Re: [opkg-devel] [opkg-utils PATCH] opkg-make-index: use ctime instead of mtime
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
X-List-Received-Date: Wed, 07 Nov 2018 15:21:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A05878CF524864B9FD99AA650DC019A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDExLzcvMTggNjowNyBBTSwgU3RlZmFuIEFnbmVyIHdyb3RlOg0KPiBIaSBBbGVqYW5k
cm8sDQo+IA0KPiBPbiAyMi4xMC4yMDE4IDE2OjQ1LCBBbGVqYW5kcm8gRGVsIENhc3RpbGxvIHdy
b3RlOg0KPj4gbWFrZXMgc2Vuc2UsIHNvdW5kcyBsaWtlIHRoaXMgaXMgZ29pbmcgdG8gZml4IGEg
YnVuY2ggb2YgbmFzdHkNCj4+IGludGVybWl0dGVudCBmYWlsdXJlcywgdGhhbmtzIQ0KPj4NCj4+
IG1lcmdlZA0KPiANCj4gVGhhbmtzIGZvciBtZXJnaW5nIQ0KDQpucA0KDQo+IFdpdGggdGhlIG1l
cmdlIGluIG9wa2ctdXRpbHMgdGhpcyBpcyBub3QgeWV0IGFjdGl2ZWx5IHVzZWQgaW4gT0Ugb2YN
Cj4gY291cnNlLiBTbyBteSBxdWVzdGlvbjogSXMgdGhlcmUgYSBuZXcgcmVsZWFzZSBvZiBvcGtn
LXV0aWxzIHBsYW5uZWQNCj4gYW55dGltZSBzb29uPyBPciBzaG91bGQgdGhhdCBiZSBhZGRlZCBh
cyBhIHBhdGNoIGluIHRoZSBPRSByZWNpcGUgZm9yDQo+IG5vdz8NCg0KSSBwbGFuIHRvIHJlbGVh
c2Ugb3BrZyAmIG9wa2ctdXRpbHMsIHZlcnNpb24gMC40LjAgb24gbWlkLURlY2VtYmVyLiANCk1h
eWJlIGl0cyB3b3J0aCBhZGRpbmcgdGhlIHBhdGNoIG5vdz8NCg0KLS0gDQpDaGVlcnMsDQoNCkFs
ZWphbmRybw0K

