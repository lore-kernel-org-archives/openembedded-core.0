Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.80])
 by mx.groups.io with SMTP id smtpd.web08.1325.1610095206182267484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 00:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BlW4VOPp;
 spf=pass (domain: windriver.com, ip: 40.107.70.80, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUQEZdXbncdIGQlbgTJ+eEhCjVS80f0EnxqkfFg2Lg6Iic0CvLRENgJoV+UefJmGelhOLiERDnQk+yKO5f4SHd85BSHRLWx1KQMFTzp0xHJDGET/c+GcITMe/f1WGT8rTaURfuOGYFDCVy5lNlK+p/6U1uM9X36YJmkdRgdmHBg/8SM24YqevWt8TElPGGDAF/aZ7/TmCMZCooAkTaIY7WcTk7tpN3fzyB3Lxhwk28BOiVgSfstvcm+ae72oZDxY0EuQ3EOf1Y+hR6Q1wpEi6vyeeagD5FXh3v5D0Fpnf2HKb+xrvomFl0VpjzHCr+cKqKzTiAS7DX75cbOqv0IVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTpfUy03/pZ8viy25ZoSvHMiNsOxENIGXTe0FRy7vYc=;
 b=aMconDz5BWwbxlzfxLXjPdVz3fVgJmiC76UvM1hA6gTdSYw7dDfeNrDb6z82oJhnVSCbRR6gINpqOV/3H/6Tfz1IUwHXnaYPBx5VAJts5ODGYv6fXaMhuQko5MjldEsRbK/sMHzXpc9ReoiaZHIsriOqXSaA0oT9fMBfbVqM5u2Yw6QpqlOfrZLFtubMLxuWMd7u0PqnN1R75dqNfEdzrPC4HQqEXMuXBD7nIfnQVxcnF2Oi39ziSk5bDg/iUiERPRfaWL4PmZoZZarGeOSKGpDROpbOQXpdSZiemIkD4DaUgtnnzAlvXUhvikC/2hsko/DPgWwYjhXD5VOHplaLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTpfUy03/pZ8viy25ZoSvHMiNsOxENIGXTe0FRy7vYc=;
 b=BlW4VOPpzd7CxnGPlEghhWIAXRO1vRk3liYAUf15tnAsCBop1m34e1QC824pTdiPJhKxhsgmMLLfWyDhdyjFbZyTE2/eOZCdxfoy+Qxkwjk/pWakU74nJ+1F2957z1jLrkR1yR5Cyvw3kDx+1X5B9zHlQ1ktt1IAGrxB83XIL2s=
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 08:40:05 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f%6]) with mapi id 15.20.3742.008; Fri, 8 Jan 2021
 08:40:05 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: use the absolute path in service file
Thread-Topic: [OE-core] [PATCH] systemd: use the absolute path in service file
Thread-Index: AQHW5NttvQcCna6Bq02POcuBKQly1KocBwoAgADx210=
Date: Fri, 8 Jan 2021 08:40:04 +0000
Message-ID: 
 <CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0@CO1PR11MB5009.namprd11.prod.outlook.com>
References: 
 <20210107095630.32609-1-mingli.yu@windriver.com>,<b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
In-Reply-To: 
 <b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5ad6359-a87a-44b1-18aa-08d8b3b0ff3c
x-ms-traffictypediagnostic: PH0PR11MB5112:
x-microsoft-antispam-prvs: 
 <PH0PR11MB5112776BBD12E643307FEB27F1AE0@PH0PR11MB5112.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Nm8+fvRzkzfzY0gECuSxHgGeo4nogjSPkFrTyZbXH2Toyjv6xy0U82gBvm8hWX1SBI8JuACl/8VVcVWs9a/oanR206EHp9VMGq0nb+RxTfFfCe1qrzH3VN3SEAVgl7A/ijorA/sTy8stW2CCIfo90ebkvlC+0BJofirDONXdemPQEOS2a44kBnknovf8ZupzPfX8AKxUuOhfWTXq2chRvgQ36TlH2ypoXWy4t2+JgygWq/43/hxY6FmpTP9xazj2BnnLB+RK3dQUHLvC1AMlk0c8h4s4+BGNf20TBydYe+RWp8yqDIRMiUXYBlpgYy2mWfoyuEwmZqm7AYbykLA/xu77S2jYDw8lAZSWibJA3Xaam3InWuJwEq01veSeEABnpKZx6OaUwwf/fhaI8FP1MA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(64756008)(66946007)(66476007)(66556008)(66446008)(5660300002)(8676002)(52536014)(8936002)(33656002)(86362001)(478600001)(19627405001)(71200400001)(53546011)(6506007)(316002)(6486002)(186003)(26005)(6512007)(9686003)(83380400001)(2906002)(110136005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?SXKGYOR5V7NmuJ4q7dFxUsybq9e4j7ESc10WkQ7BDnaWq0neyMxgqllEzWMm?=
 =?us-ascii?Q?FE8iQFMNc0J0BdTN/f47o0RGn4SmfCwXdpXWMJaMYE2+zNzcpQH35a4e+iTj?=
 =?us-ascii?Q?U68x64Ir0bnSZDm/817/jn0fySzAfYn8iOHQ7P3Q0+SfQIDazYX1xk6gMbe9?=
 =?us-ascii?Q?9Ub4NbwAwzh965W8Bzs5npTOaRjKUSwUVJYZZBACpvmBa0m8Zjgvacq+1tem?=
 =?us-ascii?Q?nIznWk4wJq4g8E6Z9vS0EEuoyZ9fNdKsQfwUtf0CKj0o7S3hzsFw9lljXcC3?=
 =?us-ascii?Q?yIcI6ovS5EMTk6RC9qLwGyh5u/OSfMBDvkP+U2C5tiD+uSXMNouFUlUNOayG?=
 =?us-ascii?Q?+XhdnshtuPdkZfrxSaBXRYI5RN7irr9xQKy699URXKqkh2kEi+8zSCgglsCR?=
 =?us-ascii?Q?jg/9Sj7OIqr5HavdjLdhA2fsWxjxVxv8OkEa9zk7lAOILdWbAqYQ56i9/tym?=
 =?us-ascii?Q?Du7RFb6cLkP/6AEQ29/BMC/sKz6u0jAjdg8gSDd/8mykeLI8ddYZDDGT11ht?=
 =?us-ascii?Q?My5Qbe7fLm9+Rne4Y598E7OGA7nklzoHH40tJORiaXfGnn7N5+9wrTaQbPMc?=
 =?us-ascii?Q?T6REqK7aTog9Rc+0ZZOEmlFc0XGODj0inSJPw6GD8SlHBDAjxyJNHsvcNogf?=
 =?us-ascii?Q?LRDyvx0KtI74UpUDz63Wi2Pa33CUxF1ojj7RHGEorGQvBdVAlHVv84fc1Et3?=
 =?us-ascii?Q?+w9c6d0Nnbc8mU9fbD8eH0LIJKfBefHOPxhPOIABOxoOY1UC/aE1cenD5V1v?=
 =?us-ascii?Q?U5Pdj1YgDJ7G41BYD8O5Ttnb0WHff5g202pQO28/J20btCJ15e2FQ9kVwS8j?=
 =?us-ascii?Q?zhXsR0347lp55BhyotFbxsZkxelmIfCcMpkjqZQCI/4aMpTTineJvJBTr3eM?=
 =?us-ascii?Q?ZJcffBIpcc3HhIz08lwMljCBh9aBEkJmbCbAvfJ8/ZDkHijyIoC2WF4WFGWc?=
 =?us-ascii?Q?ocydlaAcPLv4J6OoZRbH4/mF38Oj+DovaqN+GXOLW/0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ad6359-a87a-44b1-18aa-08d8b3b0ff3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 08:40:04.9604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NLWsTsglLi2s4EYlspKqVxI1IaTVSLLJ/rKedMOoPqVJauBwPs7lNRfmKd4ZpWXxZQFj5YbWEsdQlDVfjPFsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0CO1PR11MB5009namp_"

--_000_CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi RP,

This is just configuration change which defines the absolute path for the c=
ommand to silence the warning when systemd-analyze verify the unit files an=
d the command may be installed in different place between OE and non-OE, so=
 it should be OE specific, will resend v2 to mark it is configuration speci=
fic.

Thanks,
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, January 7, 2021 19:29
To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: use the absolute path in service fi=
le

On Thu, 2021-01-07 at 17:56 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>  # systemd-analyze --man=3Dfalse verify /lib/systemd/system/systemd-kexec=
.service
>  systemd-kexec.service: Command systemctl is not executable: No such file=
 or directory
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../0001-service-use-the-abosolute-path.patch | 253 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_247.2.bb    |   5 +
>  2 files changed, 258 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-service-use-th=
e-abosolute-path.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-service-use-the-aboso=
lute-path.patch b/meta/recipes-core/systemd/systemd/0001-service-use-the-ab=
osolute-path.patch
> new file mode 100644
> index 0000000000..dc8e8b3052
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-pa=
th.patch
> @@ -0,0 +1,253 @@
> +From 98a60faaca7f1a6b753f73556705cc68aa19e383 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 7 Jan 2021 06:40:29 +0000
> +Subject: [PATCH] service: use the abosolute path
> +
> +Fixes:
> + # systemd-analyze --man=3Dfalse verify /lib/systemd/system/systemd-kexe=
c.service
> + systemd-kexec.service: Command systemctl is not executable: No such fil=
e or directory
> +
> +Upstream-Status: Inappropriate [OE specific]

At the very least you need to explain why this is OE specific and
doesn't affect upstream. I strongly suspect there is a different issue
at work here and it should be fixed differently.

Cheers,

Richard


--_000_CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0CO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi RP,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This is just configuration change which defines the absolute path for the c=
ommand to silence the warning when systemd-analyze verify the unit files an=
d the command may be installed in different place between OE and non-OE, so=
 it should be OE specific, will
 resend v2 to mark it is configuration specific.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, January 7, 2021 19:29<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] systemd: use the absolute path in ser=
vice file</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 2021-01-07 at 17:56 +0800, Yu, Mingli wrot=
e:<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; <br>
&gt; Fixes:<br>
&gt; &nbsp;# systemd-analyze --man=3Dfalse verify /lib/systemd/system/syste=
md-kexec.service<br>
&gt; &nbsp;systemd-kexec.service: Command systemctl is not executable: No s=
uch file or directory<br>
&gt; <br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;.../0001-service-use-the-abosolute-path.patch | 253 ++++++++++++=
++++++<br>
&gt; &nbsp;meta/recipes-core/systemd/systemd_247.2.bb&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 5 +<br>
&gt; &nbsp;2 files changed, 258 insertions(+)<br>
&gt; &nbsp;create mode 100644 meta/recipes-core/systemd/systemd/0001-servic=
e-use-the-abosolute-path.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0001-service-use-the-ab=
osolute-path.patch b/meta/recipes-core/systemd/systemd/0001-service-use-the=
-abosolute-path.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..dc8e8b3052<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute=
-path.patch<br>
&gt; @@ -0,0 +1,253 @@<br>
&gt; +From 98a60faaca7f1a6b753f73556705cc68aa19e383 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; +Date: Thu, 7 Jan 2021 06:40:29 +0000<br>
&gt; +Subject: [PATCH] service: use the abosolute path<br>
&gt; +<br>
&gt; +Fixes:<br>
&gt; + # systemd-analyze --man=3Dfalse verify /lib/systemd/system/systemd-k=
exec.service<br>
&gt; + systemd-kexec.service: Command systemctl is not executable: No such =
file or directory<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE specific]<br>
<br>
At the very least you need to explain why this is OE specific and<br>
doesn't affect upstream. I strongly suspect there is a different issue<br>
at work here and it should be fixed differently.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0CO1PR11MB5009namp_--
