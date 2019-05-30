Return-Path: <Rob.Walton@arm.com>
X-Greylist: delayed 106691 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 May 2019 02:03:31 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
	by mail.openembedded.org (Postfix) with ESMTP id 010537D2B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 02:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector2-armh-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=p4xKhCUf4laEYCx+5ZqsMQMnoknIdEA1qdwSHZQQxJQ=;
	b=4hDqnDFFec1q0HnrJAqtLQGZmuu0LKtelL9MngyBOhWUNEA1/SP8F0HiB3nbY4m1SifypLdFirX+blAtW+/avsG5j08ik3adIV0OynwiMoB3KFnVROTdKHLcctET8j8CmTGFa4Gk0mrmnQ0c5yJAwfvq4SkcaObscBiM3vC8YWk=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB3605.eurprd08.prod.outlook.com (20.177.115.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.18; Thu, 30 May 2019 15:32:57 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f]) by AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f%6]) with mapi id 15.20.1943.016;
	Thu, 30 May 2019 15:32:57 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
Thread-Index: AQHVEJwdeDxIADRRKEmYI513wzcNy6aDsycAgAAjOZI=
Date: Thu, 30 May 2019 15:32:57 +0000
Message-ID: <AM6PR08MB368544F652B109F91CEAF13F95180@AM6PR08MB3685.eurprd08.prod.outlook.com>
References: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
	<1558529060-79451-2-git-send-email-rob.walton@arm.com>,
	<f3c0ec27ac8d1d90468532152081c219ddf1061f.camel@linuxfoundation.org>
In-Reply-To: <f3c0ec27ac8d1d90468532152081c219ddf1061f.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rob.Walton@arm.com; 
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adba4bcd-2697-49ac-6224-08d6e5141786
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB3605; 
x-ms-traffictypediagnostic: AM6PR08MB3605:
x-microsoft-antispam-prvs: <AM6PR08MB3605E02AB47AA66A7D1F78CA95180@AM6PR08MB3605.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(40434004)(199004)(189003)(52536014)(86362001)(55016002)(25786009)(72206003)(14454004)(478600001)(71200400001)(186003)(102836004)(6506007)(53546011)(486006)(6606003)(446003)(71190400001)(5660300002)(229853002)(8676002)(76176011)(7736002)(6436002)(476003)(11346002)(53936002)(6246003)(26005)(66946007)(73956011)(19627405001)(8936002)(99286004)(2906002)(66446008)(81156014)(2501003)(68736007)(91956017)(76116006)(64756008)(66556008)(81166006)(14444005)(5024004)(54896002)(6116002)(33656002)(66476007)(256004)(316002)(3846002)(7696005)(66066001)(9686003)(110136005)(74316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3605;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ya9VXh9EllymZj1wZB1FzA8QE3isqWNdYQ3ENMavqcW6cFdVrmbE/eGuUdYn4X5vcBF9ojLubyPtnhOiA8BWTmK8i+v2e6tUrNyGtvBfy6syRBLd3afMkr8/meXgOewuV6NoUPfTT+72Pezp7Vud1V5Y5iiBNPX4JdLsGmA+R1A/Uu0yO3CiBaFPNSN85XQJQZ2jLdE93JVLx/U1G1d9OpJ4CxJv5sIeRG95JpKHforSFqWmbITtqEsP5B5j/gMDQXbYpFM53sEz6KsUlUUT/zqUNs6TqTgLmpdTEq8FJT3rmG+6ChgXhpF00X90H8MJzOZI+PoaZxe3KXStUw6Jt5+/5/TGExpc0yJmG5HZ6czstCJNuopvj0O2zfDVsNT8k/lnMo+lW6BBj9IK/1vVus5rY2VsQtuYRG30NLBnMvo=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adba4bcd-2697-49ac-6224-08d6e5141786
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 15:32:57.5463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rob.Walton@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3605
Subject: Re: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
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
X-List-Received-Date: Fri, 31 May 2019 02:03:32 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB368544F652B109F91CEAF13F95180AM6PR08MB3685eurp_"

--_000_AM6PR08MB368544F652B109F91CEAF13F95180AM6PR08MB3685eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,


Thanks for your comments. Sorry I missed the questions when I previously se=
nt it. Resent due to the fact I missed the "Signed off by" in the patch las=
t time around.


I agree with you in general about the scope creep, however the license.bbcl=
ass code is heavily coupled with this class, as it just greps the runtime d=
ir for all the 'lic_data' it deems appropriate. All that data appears to be=
 emitted here.


Might be nice if there was another bbclass which actually just emitted the =
'data for licenses' rather than the 'lic_data' being a subset of this packa=
ge data.


I'd be happy to propose that class for review. However, just looking at thi=
s function it already seems we've been "heading down a path" here for a whi=
le anyway? The content of one extra variable doesn't seem like the tipping =
point to me.

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 30 May 2019 14:18:36
To: Rob Walton; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.

On Wed, 2019-05-22 at 12:44 +0000, Rob Walton wrote:
> Emit the contents of HOMEPAGE in the extra pkgdata. This is useful
> information to have when creating license manifests.
>
> Signed-off-by: Rob Walton <rob.walton@arm.com>
> ---
>  meta/classes/package.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index 4c0a859..a08aefe 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1458,6 +1458,7 @@ fi
>          write_if_exists(sf, pkg, 'PKGR')
>          write_if_exists(sf, pkg, 'LICENSE')
>          write_if_exists(sf, pkg, 'DESCRIPTION')
> +        write_if_exists(sf, pkg, 'HOMEPAGE')
>          write_if_exists(sf, pkg, 'SUMMARY')
>          write_if_exists(sf, pkg, 'RDEPENDS')
>          rprov =3D write_if_exists(sf, pkg, 'RPROVIDES')

This isn't the first time this has been requested, back in 14/11/2017 a
similar patch had the reply:

"This was already proposed once and rejected as its using the interface
for something it really wasn't designed for"

You've also sent this patch once already and questions were raised
then.

I have to admit I don't like the license.bbclass code, its starting to
look like anything every legal department could ask for, meaning it
does no one thing well, just many things badly. I don't like that mess
starting to creep into the packaging code which does have a clearly
defined purpose and use.

Put another way, which variables do we draw the line at?

I worry about the path accepting this patch leads us down :(

Cheers,

Richard



IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM6PR08MB368544F652B109F91CEAF13F95180AM6PR08MB3685eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi Richard,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Thanks for your comments. Sorry I=
 missed the questions when I previously sent it. Resent due to the fact I m=
issed the &quot;Signed off by&quot; in the patch last time around.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I agree with you in general about=
 the scope creep, however the license.bbclass code is heavily coupled with =
this class, as it just greps the runtime dir for all the 'lic_data' it deem=
s appropriate. All that data appears
 to be emitted here.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Might be nice if there was anothe=
r bbclass which actually just emitted the 'data for licenses' rather than t=
he 'lic_data' being a subset of this package data.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I'd be happy to propose that clas=
s for review. However, just looking at this function it already seems we've=
 been &quot;heading down a path&quot; here for a while anyway? The content =
of one extra variable doesn't seem like the
 tipping point to me.<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 30 May 2019 14:18:36<br>
<b>To:</b> Rob Walton; openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [PATCH 2/2] package.bbclass: Emit HOMEPAGE pk=
gdata.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2019-05-22 at 12:44 &#43;0000, Rob Walton =
wrote:<br>
&gt; Emit the contents of HOMEPAGE in the extra pkgdata. This is useful<br>
&gt; information to have when creating license manifests.<br>
&gt; <br>
&gt; Signed-off-by: Rob Walton &lt;rob.walton@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/package.bbclass | 1 &#43;<br>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass<br>
&gt; b/meta/classes/package.bbclass<br>
&gt; index 4c0a859..a08aefe 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; &#43;&#43;&#43; b/meta/classes/package.bbclass<br>
&gt; @@ -1458,6 &#43;1458,7 @@ fi<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(=
sf, pkg, 'PKGR')<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(=
sf, pkg, 'LICENSE')<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(=
sf, pkg, 'DESCRIPTION')<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pk=
g, 'HOMEPAGE')<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(=
sf, pkg, 'SUMMARY')<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(=
sf, pkg, 'RDEPENDS')<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprov =3D write_=
if_exists(sf, pkg, 'RPROVIDES')<br>
<br>
This isn't the first time this has been requested, back in 14/11/2017 a<br>
similar patch had the reply:<br>
<br>
&quot;This was already proposed once and rejected as its using the interfac=
e<br>
for something it really wasn't designed for&quot;<br>
<br>
You've also sent this patch once already and questions were raised<br>
then.<br>
<br>
I have to admit I don't like the license.bbclass code, its starting to<br>
look like anything every legal department could ask for, meaning it<br>
does no one thing well, just many things badly. I don't like that mess<br>
starting to creep into the packaging code which does have a clearly<br>
defined purpose and use.<br>
<br>
Put another way, which variables do we draw the line at?<br>
<br>
I worry about the path accepting this patch leads us down :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM6PR08MB368544F652B109F91CEAF13F95180AM6PR08MB3685eurp_--
