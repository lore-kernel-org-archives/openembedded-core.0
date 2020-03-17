Return-Path: <Qi.Chen@windriver.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	by mail.openembedded.org (Postfix) with ESMTP id BF28B60B9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 03:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mpt7QvA3cFGbbxJSrNgjTj8N1jgVYUTB5pY9Ujt2eFg1MPmq2ApZ4vSpzW6LE4dRK2mcKKvnZbr37a/YnpaFlJjBU1F0u7gdGOGBzlNYiSqxnzDLcnmNjMsuP4nwDDNstTBXXZv69oe1UZJiixsmfH5fPEaGrj0Y9lWgP2lEFaTr8nipp6BvSg/5cM4Y+VAO2pgFKK+gOYibnk+24YvbgWMJKeL/WiMYChU4nl+27HUa7gQSPW+0NHq/SAo7FjVoSldsyiBB1+GqXHmj91pkLcz9VDzb4PBVsrttYiMvSNESiFVE3E/05sg66C+/Ro2a5bk+cIOQy4PjxeWwrPp1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eHRKuuJbTJIsdb4W8QWkNCJKGYVHH2CCSUkYJKuLSdI=;
	b=MY1kgQ4YRk9xPKZpOepQFbeHrDBp7QRAJWoAQuMVYLp3eTQpmRUkL1BLLFpj/RB5KjuQKWvuQILZPgVTWWdpKJbwsMJ95Q0cb0FFoMjZVibb5kFQTiq/dKoecCyY4E1qoaJUn4J4kkKEaPLjKZlyoMdoTh7O8qHR5kdsmLY87xPoyT8nJC95LsNoOTedNqHCjjOk+GWMNW710cmFMj3XPGUFCF+0bDZ6TzANSeCVjzvY+sMoPITTZpzY02Ci6r7tDtBd+QZu8+US9G7kiL1Oc70n8i0EOr9CxfyXtUuvsqcvnw7MtK3NXZ3Blm4xdBct3NRhSMX+Hq7HJ1vc+c4DnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eHRKuuJbTJIsdb4W8QWkNCJKGYVHH2CCSUkYJKuLSdI=;
	b=WnfQQJTgWi8Fc7Y5RYHDTDy4nlMkbzY82MbA74AU6G+CoNjODadsUMHPPO+E7PwyRBb3kFs4dy52DAGV2hcMZyPmy/+kgXcWFixa+8dFoPHZpdNq5J42YwahS+BYY8bSUeZLoMwuuvgOB94Re8Nwa2fzuXrx51li51HvLtF7OYw=
Received: from DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) by
	DM6PR11MB3305.namprd11.prod.outlook.com (2603:10b6:5:5f::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2814.16; Tue, 17 Mar 2020 03:30:41 +0000
Received: from DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c]) by
	DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c%4]) with mapi id 15.20.2814.021;
	Tue, 17 Mar 2020 03:30:41 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?gb2312?B?u9i4tDogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGdsaWItMi4wOiBDb3JyZWN0?=
	=?gb2312?Q?_multilib_conflict?=
Thread-Index: AQHV9/O+5EVbjdVU4Ua2YQSp4M5BtahMJrIS
Date: Tue, 17 Mar 2020 03:30:41 +0000
Message-ID: <DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
References: <20200311222249.29880-1-jpuhlman@mvista.com>,
	<20200311222249.29880-2-jpuhlman@mvista.com>
In-Reply-To: <20200311222249.29880-2-jpuhlman@mvista.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Qi.Chen@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b784b57b-4ab9-4cf4-7272-08d7ca2391a9
x-ms-traffictypediagnostic: DM6PR11MB3305:
x-microsoft-antispam-prvs: <DM6PR11MB3305158B94B191D950FBB37FEDF60@DM6PR11MB3305.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(136003)(346002)(396003)(39850400004)(199004)(9686003)(55016002)(71200400001)(224303003)(966005)(478600001)(81156014)(81166006)(66446008)(52536014)(66946007)(76116006)(64756008)(91956017)(186003)(26005)(66476007)(5660300002)(66556008)(2906002)(316002)(86362001)(6506007)(7696005)(110136005)(8936002)(19627405001)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB3305;
	H:DM6PR11MB3498.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTxXE+rU8lN8acxbc3i3UvZ2BmxRjVMl2DPKL330VkDqIzEgi9CqN9hTNchHmHqNezKFFBGdCAS7tRWQ0ozDPlupK8VqCz74vu59Xy5W55twkpsuV5uXnHHCBSUx6Xm+wqg5pYzTr/yVWy3lBrMyKbtTqUICj2Q8hUa1J1LRTC4MwNjVm41Xg8raWZagt5oe6cx+h8o7Uauty/kjszCqNHbi9iGlGAxHu8N0JqgMFqik34RXEtax4llTv42lBG/jTWnJe0UlzYA1S8OB7p5kLEAB0hbGmqcoKIxSDghIgPwPzDx6jtXeuO2NkEcnKwRWHWVTUyp4swUR4EkJdlSC064dFfCsmM+zgRPJmzZ0A0CRZ7+ZxMNmjZO3Gc+js+FrLt+SYgnoUiI64nj3vBfQPLcadRzVDWT1uW5SD/z5EYV7Ds90VS3fUIeyrni9NWri5hdqt0q4cN4sOVgc9tP44LouEO0hUdY7cQCNCj4CRW+nh38usLc6Kb/PKpxFU/S90QUKkts6rVtd9pIgPr800A==
x-ms-exchange-antispam-messagedata: mAPn0C1OX292+CVShwfSMVtoO3nFFnUZ5808Y7Gky1vuzcJLmuKQWTCMQtSu+2r9/Nom87d2YNUAOyam1GtuLyT0tUrf7Xm0q7eEuduy6KAIkrptgZevpciJWBRVE6Um7JuYlDNhJ/EVm+oXWlvyWw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b784b57b-4ab9-4cf4-7272-08d7ca2391a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 03:30:41.1422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rl6BaJItw/nWUBV2NS6K/LLnDWhmGelTrjO0UMvv7N4G5Ud376nOU4fLjk2FD8VZ4IGkiB1tuSAKeN4/HKw6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3305
Subject: =?UTF-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSBnbGliLTIuMDogQ29ycmVjdCBtdWx0aWxpYiBjb25mbGljdA==?=
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
X-List-Received-Date: Tue, 17 Mar 2020 03:30:42 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3498030B61816C49B946EA35EDF60DM6PR11MB3498namp_"

--_000_DM6PR11MB3498030B61816C49B946EA35EDF60DM6PR11MB3498namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBpcyBjYXVzaW5nIHJlZ3Jlc3Npb24gaW4gY2FzZSBvZiBxZW11YXJtNjQgbXVs
dGlsaWIgZm9yIG1lLiBUaGUgc3RhdGljLWxpbmsudGVzdCBmaWxlIGlzIG5vdCB0aGVyZSwgcmVz
dWx0aW5nIHRoZSBgbXYnIGNvbW1hbmQgZmFpbHVyZS4gSSd2ZSBzZW50IG91dCBhIHBhdGNoIHRv
IGZpeCB0aGlzIHByb2JsZW0sIGJ1dCBJIGRvbid0IGtub3cgd2hhdCdzIHlvdXIgZW52aXJvbm1l
bnQuIFNvIHBsZWFzZSBoZWxwIHJldmlldy4NCg0KUmVnYXJkcywNCkNoZW4gUWkNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiC0+rHtIEplcmVteSBBLiBQdWhsbWFuIDxqcHVobG1hbkBtdmlz
dGEuY29tPg0Kt6LLzcqxvOQ6IDIwMjDE6jPUwjEyyNUgNjoyMg0KytW8/sjLOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPg0K1vfM4jogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGdsaWItMi4wOiBD
b3JyZWN0IG11bHRpbGliIGNvbmZsaWN0DQoNCkZyb206IEplcmVteSBQdWhsbWFuIDxqcHVobG1h
bkBtdmlzdGEuY29tPg0KDQpTaWduZWQtb2ZmLWJ5OiBKZXJlbXkgQS4gUHVobG1hbiA8anB1aGxt
YW5AbXZpc3RhLmNvbT4NCi0tLQ0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5j
IHwgMyArKysNCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWIuaW5jDQppbmRleCAyM2MzNDdkYmY3Li5lZGVjYzUxZmRiIDEwMDY0NA0K
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMNCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jDQpAQCAtMTI4LDYgKzEyOCw5IEBAIGRvX2luc3Rh
bGxfYXBwZW5kX2NsYXNzLXRhcmdldCAoKSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgcm0g
JHtEfSR7ZGF0YWRpcn0vaW5zdGFsbGVkLXRlc3RzL2dsaWIvZ2RidXMtc2VyaWFsaXphdGlvbi50
ZXN0DQogICAgICAgICAgICAgICAgIGZpDQogICAgICAgICBmaQ0KKyAgICAgICAgaWYgdGVzdCAi
eCR7TUxQUkVGSVh9IiAhPSAieCI7IHRoZW4NCisgICAgICAgICAgICAgICAgbXYgJHtEfSR7ZGF0
YWRpcn0vaW5zdGFsbGVkLXRlc3RzL2dsaWIvc3RhdGljLWxpbmsudGVzdCAke0R9JHtkYXRhZGly
fS9pbnN0YWxsZWQtdGVzdHMvZ2xpYi8ke01MUFJFRklYfXN0YXRpYy1saW5rLnRlc3QNCisgICAg
ICAgIGZpDQogfQ0KDQogIyBBcyB3ZSBkbyBub3QgYnVpbGQgcHl0aG9uMyBmb3Igd2luZG93cywg
bWFrZXMgbm8gc2Vuc2UgdG8gc2hpcCB0aGUgc2NyaXB0IHRoYXQncyB1c2luZyBpdA0KLS0NCjIu
MTMuMw0KDQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K

--_000_DM6PR11MB3498030B61816C49B946EA35EDF60DM6PR11MB3498namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This patch is causing regression in case of qemuarm64 multilib for me. The =
static-link.test file is not there, resulting the `mv' command failure. I'v=
e sent out a patch to fix this problem, but I don't know what's your enviro=
nment. So please help review.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chen Qi<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-core-bounces@lists.openembedded.org &lt;openembedded-core-bounces@lis=
ts.openembedded.org&gt; =B4=FA=B1=ED Jeremy A. Puhlman &lt;jpuhlman@mvista.=
com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA3=D4=C212=C8=D5 6:22<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-core@lists.openembedded.org &lt;ope=
nembedded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [OE-core] [PATCH 2/2] glib-2.0: Correct multilib confl=
ict</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Jeremy Puhlman &lt;jpuhlman@mvista.com&gt;<b=
r>
<br>
Signed-off-by: Jeremy A. Puhlman &lt;jpuhlman@mvista.com&gt;<br>
---<br>
&nbsp;meta/recipes-core/glib-2.0/glib.inc | 3 &#43;&#43;&#43;<br>
&nbsp;1 file changed, 3 insertions(&#43;)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc<br>
index 23c347dbf7..edecc51fdb 100644<br>
--- a/meta/recipes-core/glib-2.0/glib.inc<br>
&#43;&#43;&#43; b/meta/recipes-core/glib-2.0/glib.inc<br>
@@ -128,6 &#43;128,9 @@ do_install_append_class-target () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm ${=
D}${datadir}/installed-tests/glib/gdbus-serialization.test<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;x${MLPREFIX}&=
quot; !=3D &quot;x&quot;; then<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; mv ${D}${datadir}/installed-tests/glib/static-link.tes=
t ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# As we do not build python3 for windows, makes no sense to ship the =
script that's using it<br>
-- <br>
2.13.3<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR11MB3498030B61816C49B946EA35EDF60DM6PR11MB3498namp_--
