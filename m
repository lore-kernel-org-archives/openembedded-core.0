Return-Path: <Edson.Seabra@zpesystems.com>
X-Greylist: delayed 1022 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Jul 2016 18:41:10 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0127.outbound.protection.outlook.com [104.47.34.127])
	by mail.openembedded.org (Postfix) with ESMTP id 95BFA607A4
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 18:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ZPESystems.onmicrosoft.com; s=selector1-zpesystems-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MbhclVi2pI7anK7rgVZNhzIPgQBTav7QKP/PQczE0mc=;
	b=pbDNXfleo+rGVOnHvLMD+0NN/gIOqDFut7ESH9GQKLAFGZ79+FXEbi+Ds4gs0GH4r0MDg07ecBZ+cf3xcm1yF1d/4KZ6/NeI9KgGL1+kGsIw3i+vi2wcjPdZrxa/IxzRQ5eNRdlPl8oJ7PtE1gusaW8Uqy360bRTHGNGYH5Cawc=
Received: from BLUPR0201MB1553.namprd02.prod.outlook.com (10.163.119.28) by
	BLUPR0201MB1555.namprd02.prod.outlook.com (10.163.119.30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.549.15; Fri, 29 Jul 2016 18:09:52 +0000
Received: from BLUPR0201MB1553.namprd02.prod.outlook.com ([10.163.119.28]) by
	BLUPR0201MB1553.namprd02.prod.outlook.com ([10.163.119.28]) with
	mapi id 15.01.0549.016; Fri, 29 Jul 2016 18:09:52 +0000
From: Edson Seabra <Edson.Seabra@zpesystems.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: metadata_scm - get branch/revision from svn repository
Thread-Index: AQHR6cLvz/lcUNtpSE21NCMsHLO9lg==
Date: Fri, 29 Jul 2016 18:09:52 +0000
Message-ID: <BLUPR0201MB1553BE8DD545F0CC1F13E518F7010@BLUPR0201MB1553.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Edson.Seabra@zpesystems.com; 
x-originating-ip: [177.45.69.62]
x-ms-office365-filtering-correlation-id: 244e2ee5-0a47-415a-22e0-08d3b7db8997
x-microsoft-exchange-diagnostics: 1; BLUPR0201MB1555;
	6:vj/uC8kEg8uap+i56UKkUhe19FQD5HRke5WCGfRRHfE4mTVpRReHPozyvUhJx8mkyi8WrRFiwGjgxj1alZdFxz7j/52ihBQBsyaiF+ou6orLnq+rIBPN9hlR18bS6/Yr+ZzftHhpgw9FnBA4BYGMNNIkC+dOY2MX1jmulSCdQbxIw2BRN34ekAXqhQj4e1qlbNx2hNOt1SG/tQYRlfRYRV8OHoRtu6hYAvtT4lv3mxD7hbnLO7XS1aNbCE9rN5SQI9TVhV0ypqCWfZC7LB2Z1Ly+L8M1hZHfO9y40bUTNmFrU7RjWLA1mA+C1Cgw09FI;
	5:UmXDPE0pu3+0yhmGHU6bzOloGMYsbhGFkCFGAGq69n/rsEICwtmL7jxl6fFgv3EFkq4qDu+2OtVHyMYUmm9PSgLmkMcYxK49HNWvAZENinkHckxAaP5kur+Bu+JIYiQScWdWOz95eW1366/t6N6PBQ==;
	24:ZMgc0nfmTVD/6UBZsFluq5eoenLmq5oZeuO227pArmGxgv7CLlEl1apl6U5MuKqlI20EOg+17kEmK5lchIBbbmpxkbyy5PqANv3OXCjX5UI=;
	7:EqON4cDXpYgOvYHJtALYTXdPeMHoZbcB76eGW5PskM+GM1rY02AsSfVHVUrqxK8K7/2YKkpL5vjsUhXJU0RhPF0BU1r+jaJw0RiAS0VJmjkgWNxsvzu9WB1lPt0FVU1dKm3/Dmq5cNCOZILQBBIZDt2YAJC4Mofxxu3SQjTifDljNRLp9yygHqNDF+/hTUuKrKAK3kSijTThpNPabD/vIYTTfOhxK+bwuHVe/XmyGVDWyK+mUP4pOtgyOw15piov
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0201MB1555;
x-microsoft-antispam-prvs: <BLUPR0201MB1555F10212E118094566823DF7010@BLUPR0201MB1555.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(102415321)(6040130)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041072)(6043046);
	SRVR:BLUPR0201MB1555; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0201MB1555; 
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(7916002)(199003)(189002)(3280700002)(106356001)(189998001)(102836003)(586003)(11100500001)(229853001)(86362001)(8936002)(16236675004)(87936001)(3846002)(105586002)(10400500002)(122556002)(66066001)(110136002)(2351001)(76576001)(6116002)(107886002)(5002640100001)(106116001)(77096005)(450100001)(8676002)(3660700001)(81156014)(2906002)(2900100001)(19627405001)(7736002)(81166006)(558084003)(68736007)(19580405001)(19580395003)(99286002)(2501003)(50986999)(9686002)(101416001)(33656002)(97736004)(7846002)(54356999)(7696003)(74316002)(92566002)(99936001)(19625215002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0201MB1555;
	H:BLUPR0201MB1553.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: zpesystems.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: zpesystems.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2016 18:09:52.1974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 09cd24a9-c206-4d0b-8a25-3e9a321f0e90
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1555
Subject: metadata_scm - get branch/revision from svn repository
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
X-List-Received-Date: Fri, 29 Jul 2016 18:41:13 -0000
X-Groupsio-MsgNum: 85135
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_"

--_004_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_
Content-Type: multipart/alternative;
	boundary="_000_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_"

--_000_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


With this patch bitbake commands can display the branch/revision of layers =
under svn control.


Regards


Edson Seabra | Principal Engineer | M +1 510 590 0074


ZPE Systems, Inc. | 39420 Liberty Street,  #252B | Fremont, CA 94538

edson.seabra@zpesystems.com<mailto:arnaldo.zimmermann@zpesystems.com> | [ww=
w.zpesystems.com]www.zpesystems.com




--_000_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;back=
ground-color:#FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi,</p>
<p><br>
</p>
<p>With this patch bitbake commands can display the branch/revision of laye=
rs under svn control.</p>
<p><br>
</p>
<p>Regards</p>
<p><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt; color:#000000; ba=
ckground-color:#FFFFFF; font-family:Calibri,Arial,Helvetica,sans-serif">
<p></p>
<p class=3D"x_MsoNormal" style=3D"margin:0in 0in 0.0001pt; font-size:11pt; =
font-family:Calibri,sans-serif; color:rgb(33,33,33)">
<span style=3D"font-size:10pt; color:rgb(31,73,125)">Edson Seabra | Princip=
al Engineer&nbsp;| M &#43;1 510 590 0074</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0in 0in 0.0001pt; font-size:11pt; =
font-family:Calibri,sans-serif; color:rgb(33,33,33)">
<br>
</p>
<p class=3D"x_MsoNormal" style=3D"margin:0in 0in 0.0001pt; font-size:11pt; =
font-family:Calibri,sans-serif; color:rgb(33,33,33)">
<span style=3D"font-size:10pt; color:rgb(31,73,125)">ZPE Systems, Inc. |&nb=
sp;</span><span style=3D"font-size:10pt; color:rgb(31,78,121)"><span class=
=3D"contextualExtensionHighlight ms-font-color-themePrimary ms-border-color=
-themePrimary ident_670_718" tabindex=3D"0">39420
 Liberty Street,&nbsp; #252B | Fremont, CA 94538</span></span><span style=
=3D"font-size:10pt; color:rgb(68,84,106)"></span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0in 0in 0.0001pt; font-size:11pt; =
font-family:Calibri,sans-serif; color:rgb(33,33,33)">
<span style=3D"font-size:10pt; color:rgb(31,73,125)"><span style=3D"color:r=
gb(5,99,193)">edson.seabra<a href=3D"mailto:arnaldo.zimmermann@zpesystems.c=
om" target=3D"_blank" id=3D"LPNoLP">@zpesystems.com</a></span>&nbsp;| [www.=
zpesystems.com]<span style=3D"color:rgb(5,99,193)">www.zpesystems.com</span=
></span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0in 0in 0.0001pt; font-size:11pt; =
font-family:Calibri,sans-serif; color:rgb(33,33,33)">
&nbsp;</p>
<br>
<p></p>
</div>
</div>
</div>
</body>
</html>

--_000_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_--

--_004_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_
Content-Type: application/octet-stream;
	name="metadata_scm-svn_get_revision.patch"
Content-Description: metadata_scm-svn_get_revision.patch
Content-Disposition: attachment;
	filename="metadata_scm-svn_get_revision.patch"; size=3371;
	creation-date="Fri, 29 Jul 2016 17:58:06 GMT";
	modification-date="Fri, 29 Jul 2016 17:58:06 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9iYXNlLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvYmFz
ZS5iYmNsYXNzCmluZGV4IGMzYzI2NjkuLjU0MTY3MjggMTAwNjQ0Ci0tLSBhL21ldGEvY2xhc3Nl
cy9iYXNlLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2Jhc2UuYmJjbGFzcwpAQCAtMTY2LDgg
KzE2Niw4IEBAIGRlZiBwa2dhcmNoX21hcHBpbmcoZCk6CiBkZWYgZ2V0X2xheWVyc19icmFuY2hf
cmV2KGQpOgogICAgIGxheWVycyA9IChkLmdldFZhcigiQkJMQVlFUlMiLCBUcnVlKSBvciAiIiku
c3BsaXQoKQogICAgIGxheWVyc19icmFuY2hfcmV2ID0gWyIlLTE3cyA9IFwiJXM6JXNcIiIgJSAo
b3MucGF0aC5iYXNlbmFtZShpKSwgXAotICAgICAgICBiYXNlX2dldF9tZXRhZGF0YV9naXRfYnJh
bmNoKGksIE5vbmUpLnN0cmlwKCksIFwKLSAgICAgICAgYmFzZV9nZXRfbWV0YWRhdGFfZ2l0X3Jl
dmlzaW9uKGksIE5vbmUpKSBcCisgICAgICAgIGJhc2VfZ2V0X21ldGFkYXRhX2JyYW5jaChpLCBO
b25lKSwgXAorICAgICAgICBiYXNlX2dldF9tZXRhZGF0YV9yZXZpc2lvbihpLCBOb25lKSkgXAog
ICAgICAgICAgICAgZm9yIGkgaW4gbGF5ZXJzXQogICAgIGkgPSBsZW4obGF5ZXJzX2JyYW5jaF9y
ZXYpLTEKICAgICBwMSA9IGxheWVyc19icmFuY2hfcmV2W2ldLmZpbmQoIj0iKQpkaWZmIC0tZ2l0
IGEvbWV0YS9jbGFzc2VzL21ldGFkYXRhX3NjbS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL21ldGFk
YXRhX3NjbS5iYmNsYXNzCmluZGV4IDJlNmZhYzIuLjMyZmFkY2YgMTAwNjQ0Ci0tLSBhL21ldGEv
Y2xhc3Nlcy9tZXRhZGF0YV9zY20uYmJjbGFzcworKysgYi9tZXRhL2NsYXNzZXMvbWV0YWRhdGFf
c2NtLmJiY2xhc3MKQEAgLTE2LDcgKzE2LDggQEAgZGVmIGJhc2VfZGV0ZWN0X3JldmlzaW9uKGQp
OgogZGVmIGJhc2VfZGV0ZWN0X2JyYW5jaChkKToKICAgICBwYXRoID0gYmFzZV9nZXRfc2NtYmFz
ZXBhdGgoZCkKIAotICAgIHNjbXMgPSBbYmFzZV9nZXRfbWV0YWRhdGFfZ2l0X2JyYW5jaF0KKyAg
ICBzY21zID0gW2Jhc2VfZ2V0X21ldGFkYXRhX2dpdF9icmFuY2gsIFwKKyAgICAgICAgICAgIGJh
c2VfZ2V0X21ldGFkYXRhX3N2bl9icmFuY2hdCiAKICAgICBmb3Igc2NtIGluIHNjbXM6CiAgICAg
ICAgIHJldiA9IHNjbShwYXRoLCBkKQpAQCAtMjgsNiArMjksMzAgQEAgZGVmIGJhc2VfZGV0ZWN0
X2JyYW5jaChkKToKIGRlZiBiYXNlX2dldF9zY21iYXNlcGF0aChkKToKICAgICByZXR1cm4gb3Mu
cGF0aC5qb2luKGQuZ2V0VmFyKCdDT1JFQkFTRScsIFRydWUpLCAnbWV0YScpCiAKK2RlZiBiYXNl
X2dldF9tZXRhZGF0YV9icmFuY2gocGF0aCwgZCk6CisKKyAgICBzY21zID0gW2Jhc2VfZ2V0X21l
dGFkYXRhX2dpdF9icmFuY2gsIFwKKyAgICAgICAgICAgIGJhc2VfZ2V0X21ldGFkYXRhX3N2bl9i
cmFuY2hdCisKKyAgICBmb3Igc2NtIGluIHNjbXM6CisgICAgICAgIHJldiA9IHNjbShwYXRoLCBk
KQorICAgICAgICBpZiByZXYgIT0gIjx1bmtub3duPiI6CisgICAgICAgICAgICByZXR1cm4gcmV2
LnN0cmlwKCkKKworICAgIHJldHVybiAiPHVua25vd24+IgorCitkZWYgYmFzZV9nZXRfbWV0YWRh
dGFfcmV2aXNpb24ocGF0aCwgZCk6CisKKyAgICBzY21zID0gW2Jhc2VfZ2V0X21ldGFkYXRhX2dp
dF9yZXZpc2lvbiwgXAorICAgICAgICAgICAgYmFzZV9nZXRfbWV0YWRhdGFfc3ZuX3JldmlzaW9u
XQorCisgICAgZm9yIHNjbSBpbiBzY21zOgorICAgICAgICByZXYgPSBzY20ocGF0aCwgZCkKKyAg
ICAgICAgaWYgcmV2ICE9ICI8dW5rbm93bj4iOgorICAgICAgICAgICAgcmV0dXJuIHJldgorCisg
ICAgcmV0dXJuICI8dW5rbm93bj4iCisKIGRlZiBiYXNlX2dldF9tZXRhZGF0YV9tb25vdG9uZV9i
cmFuY2gocGF0aCwgZCk6CiAgICAgbW9ub3RvbmVfYnJhbmNoID0gIjx1bmtub3duPiIKICAgICB0
cnk6CkBAIC01MiwxNiArNzcsMzkgQEAgZGVmIGJhc2VfZ2V0X21ldGFkYXRhX21vbm90b25lX3Jl
dmlzaW9uKHBhdGgsIGQpOgogICAgICAgICBwYXNzCiAgICAgcmV0dXJuIG1vbm90b25lX3Jldmlz
aW9uCiAKLWRlZiBiYXNlX2dldF9tZXRhZGF0YV9zdm5fcmV2aXNpb24ocGF0aCwgZCk6Ci0gICAg
IyBUaGlzIG9ubHkgd29ya3Mgd2l0aCBvbGRlciBzdWJ2ZXJzaW9uLiBGb3IgbmV3ZXIgdmVyc2lv
bnMgCi0gICAgIyB0aGlzIGZ1bmN0aW9uIHdpbGwgbmVlZCB0byBiZSBmaXhlZCBieSBzb21lb25l
IGludGVyZXN0ZWQKLSAgICByZXZpc2lvbiA9ICI8dW5rbm93bj4iCitkZWYgYmFzZV9nZXRfbWV0
YWRhdGFfc3ZuX2JyYW5jaChwYXRoLCBkKToKKyAgICBsaW5lID0gb3MucG9wZW4oJ2NkICVzOyBz
dm4gaW5mbyAyPiYxIHwgZ3JlcCAiXlVSTDoiIHwgdHIgLWQgIlxuIiB8IHRyIC1zICIvIicgJSBw
YXRoKS5yZWFkKCkKKworICAgIGlmIG5vdCBsaW5lOgorICAgICAgICByZXR1cm4gIjx1bmtub3du
PiIKKyAgICB3b3JkcyA9IGxpbmUuc3BsaXQoIi8iKQorCisgICAgdHJ5OgorICAgICAgICBpZiB3
b3Jkcy5pbmRleCgidHJ1bmsiKSA+PSAwOgorICAgICAgICAgICAgcmV0dXJuICd0cnVuaycKKyAg
ICBleGNlcHQ6CisgICAgICAgIHBhc3MKKyAKICAgICB0cnk6Ci0gICAgICAgIHdpdGggb3Blbigi
JXMvLnN2bi9lbnRyaWVzIiAlIHBhdGgpIGFzIGY6Ci0gICAgICAgICAgICByZXZpc2lvbiA9IGYu
cmVhZGxpbmVzKClbM10uc3RyaXAoKQotICAgIGV4Y2VwdCAoSU9FcnJvciwgSW5kZXhFcnJvcik6
CisgICAgICAgIGlmIHdvcmRzLmluZGV4KCJicmFuY2hlcyIpID49IDA6CisgICAgICAgICAgICBy
ZXR1cm4gd29yZHNbd29yZHMuaW5kZXgoImJyYW5jaGVzIikrMV0KKyAgICBleGNlcHQ6CiAgICAg
ICAgIHBhc3MKLSAgICByZXR1cm4gcmV2aXNpb24KKworICAgIHRyeToKKyAgICAgICAgaWYgd29y
ZHMuaW5kZXgoInRhZ3MiKSA+PSAwOgorICAgICAgICAgICAgcmV0dXJuIHdvcmRzW3dvcmRzLmlu
ZGV4KCJ0YWdzIikrMV0KKyAgICBleGNlcHQ6CisgICAgICAgICBwYXNzCisgICAgcmV0dXJuICI8
dW5rbm93bj4iCisKK2RlZiBiYXNlX2dldF9tZXRhZGF0YV9zdm5fcmV2aXNpb24ocGF0aCwgZCk6
CisgICAgY21kPSJjZCAiK3BhdGgrIjsgc3ZuIGluZm98YXdrICcvXlJldmlzaW9uOi97cjE9JDJ9
Oy9eTGFzdCBDaGFuZ2VkIFJldjove3IyPSQ0fTtFTkR7cHJpbnRmIFwiJXMtJXNcIixyMSxyMjt9
JyIKKyAgICByZXZpc2lvbiA9IG9zLnBvcGVuKGNtZCkucmVhZCgpCisgICAgaWYgcmV2aXNpb246
CisgICAgICAgIHJldHVybiByZXZpc2lvbgorICAgIHJldHVybiAiPHVua25vd24+IgorIAogCiBk
ZWYgYmFzZV9nZXRfbWV0YWRhdGFfZ2l0X2JyYW5jaChwYXRoLCBkKToKICAgICBpbXBvcnQgYmIu
cHJvY2Vzcwo=

--_004_BLUPR0201MB1553BE8DD545F0CC1F13E518F7010BLUPR0201MB1553_--
