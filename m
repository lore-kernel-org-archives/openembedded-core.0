Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web12.458.1587606806090266355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 18:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wfe0vZfd;
 spf=pass (domain: windriver.com, ip: 40.107.236.54, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGIEfawWOpWDeEnQWSStIPCwxhCvCy4g9/QK5v3JCp8lz9YXgAMTZb/ATe0GGx4UXZw8zXiwGZH6vwL6T6yfj9h0E1uE3s5Om0xGRXeyO/0R5Bti4/GGXiqi43FFz0284fBiec980pZNakhxWE9VLky1uSeR/Az0+x37DTvNC6ickGwMRYKCqxqE8/p0607qvnMaMGJEdnn2+PazFoGKGfx/1EFATpqjoOFqmyWcx1+yixFMNc5MFXkxr+AszrKEJiqh6RH+NOio7zfqwbX+OVGcYlr9dwjhG16VEK3g/jRo4epyfghFvExRErhRAGTFw6l1biEMiHZmypM2J15u/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/ds0ynqIgq1Xl5Go9RuKpGPffcGN85zMZiu/gQ299g=;
 b=BE0SkBu5DfJhUaJzPIlAOOHGzShSzbIct7MQBlnXnC/BNdpp//lj9tGahyJuUn0IjB2n66G+jJAHD/vyS4VFXTl3odZ8LIxrnnmKk3utYyv58wyzBOepwJv1ykZPkWYRSYecFiOh5OYJv0wsNm06j8Lf3o//05u4Qq4HY1HgmPPTJUralLowYY96Md5VRMXlNr73S9528dFjFducFn7gb3B4UJLyPB56DzATXKUQ8/6IRrGV4NLJjZp/I17rg/6hO4Jjq5MOJLQKs2RUfogdAsPQrKk3aBOxN7w+/EVgvF/w6usQYpw+zDUQ20zg12pA66TwzWsPFzI5AsJvsJjZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/ds0ynqIgq1Xl5Go9RuKpGPffcGN85zMZiu/gQ299g=;
 b=Wfe0vZfdpkbziWDqIb63ShcDqtzc9N5KqIyEZPj0s8sli4UturbLo80vhFxIcSiHJ5nkKhn/zAXqp3iXtT/y9QA9H0LxDSoDyOIB1QB008uhIOm5NzRKVCEfZjJFoPzcCRSYjkGQYZPqDh9dRzSlUJE1O3hHugyQ4V++72za11U=
Received: from DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) by
 DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Thu, 23 Apr 2020 01:53:24 +0000
Received: from DM6PR11MB3498.namprd11.prod.outlook.com
 ([fe80::fd59:e51:ca3e:2cc9]) by DM6PR11MB3498.namprd11.prod.outlook.com
 ([fe80::fd59:e51:ca3e:2cc9%6]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 01:53:24 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] toolchain-shar-extract.sh: remove legacy .o files
Thread-Topic: [OE-core][PATCH 1/2] toolchain-shar-extract.sh: remove legacy .o
 files
Thread-Index: AQHWGPyOpz0WSK+KAkiHIVm86ECuf6iF8cgZ
Date: Thu, 23 Apr 2020 01:53:24 +0000
Message-ID: 
 <DM6PR11MB3498E67CB51C0B4DD48E2E6EEDD30@DM6PR11MB3498.namprd11.prod.outlook.com>
References: 
 <20200422072838.27867-1-Qi.Chen@windriver.com>,<127a7d4591d9071eed0dafddb69bf8dc180cfba9.camel@linuxfoundation.org>
In-Reply-To: 
 <127a7d4591d9071eed0dafddb69bf8dc180cfba9.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Qi.Chen@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fc40c49-3060-47f5-8b6e-08d7e7291bde
x-ms-traffictypediagnostic: DM6PR11MB4754:
x-microsoft-antispam-prvs: 
 <DM6PR11MB4754BD76D208DDBECE3755BBEDD30@DM6PR11MB4754.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3498.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(136003)(346002)(366004)(39850400004)(396003)(5660300002)(9686003)(52536014)(110136005)(316002)(55016002)(186003)(8676002)(76116006)(66946007)(8936002)(71200400001)(26005)(19627405001)(6506007)(7696005)(2906002)(33656002)(91956017)(53546011)(86362001)(66556008)(64756008)(66446008)(66476007)(81156014)(478600001)(142923001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zfaT0GCrf3/QHzUH5XKTgaChVlqJQ1FUOxgJ6wPSEuprEUBxz9COkGmJRhAchM8Xn6HKOewFqYFcX4L7yzYvdMK5etP3rThYLeIUgnjKCmFzCMkgOEr3XjEFcJVLmJIr3/uJ1Wi9XoKyCsk1FY5ouG68IxNysYphG1MTkWB4UVLhOhQ8QMEpsB8PJ6ZllmQHMBvGrjruumGs5iBi4F5DjELchAEhQi8F5k/pW8Hzwt3yhpM5co2rCKICnbRBhrMIx5rhab7nYgSHIU+/BsT5/R2dwNLWqhsZ2f44EEZcMurCH8g1OXHtQ4Pj5BYZuv0WyTHl4H+dVMa0yQlGtQlK/J96PQWNSt+vf1Mx2XN8XXkX03Gii/Zs9SRc1v/kBy9vWcG5og1nAuLjwecpcinq6F6qkK5rTdYRxHQMI3bERdrr+N1Yq368qs41/kTnweH9L2t878F6nSBvZXEIaveOKt2RNX6M9e+ct2e3rEhPpxEk+2CSErzlHKaMPigVWZWg
x-ms-exchange-antispam-messagedata: 
 P1bXqVViVOUQe3UNZTmP5nxbYFmPlEAfnCs/cQ+fhyJ7oHu1II8nAi6CWnOJGdsxauieHwS/Y41tkpLvSw9bdIdLIyW2r0H9IapxZKF702Wp+wVba5wD2qU6qLOqPqRo69hYOKnkKktmQxUCVtHNDw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc40c49-3060-47f5-8b6e-08d7e7291bde
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 01:53:24.1530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bo1bhobsFjyVNYfkbw+K6ZsjPKOsDWWpjf2nloXyOeRqyAqlRm3adFs0cgyy4v9jiW2VGUPeeFaEHpPygT4DPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3498E67CB51C0B4DD48E2E6EEDD30DM6PR11MB3498namp_"

--_000_DM6PR11MB3498E67CB51C0B4DD48E2E6EEDD30DM6PR11MB3498namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the suggestion. I'll send out V2.

Regards,
Chen Qi
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, April 23, 2020 7:19
To: Chen, Qi <Qi.Chen@windriver.com>; openembedded-core@lists.openembedded.=
org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] toolchain-shar-extract.sh: remove legacy =
.o files

On Wed, 2020-04-22 at 15:28 +0800, Chen Qi wrote:
> We want to make sure `make scripts prepare` succeed inside SDK. However,
> the legacy .o files under scripts/kconfig will introduce build error
> on some hosts, thus removing them.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/files/toolchain-shar-extract.sh | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-=
shar-extract.sh
> index 04527f891f..61911e72c9 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -286,6 +286,9 @@ if [ -e "$post_relocate" ]; then
>        $SUDO_EXEC rm -f $post_relocate
>  fi
>
> +# Remove legacy .o files to avoid kernel build failure
> +rm -f $target_sdk_dir/sysroots/*/usr/src/kernel/scripts/kconfig/*.o
> +

We should be removing these at SDK construction time, not at extraction
time, then the SDK is smaller and we don't have special cases in this
extraction script...

Cheers,

Richard


--_000_DM6PR11MB3498E67CB51C0B4DD48E2E6EEDD30DM6PR11MB3498namp_
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
Thanks for the suggestion. I'll send out V2.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, April 23, 2020 7:19<br>
<b>To:</b> Chen, Qi &lt;Qi.Chen@windriver.com&gt;; openembedded-core@lists.=
openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] toolchain-shar-extract.sh: remove =
legacy .o files</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2020-04-22 at 15:28 &#43;0800, Chen Qi wro=
te:<br>
&gt; We want to make sure `make scripts prepare` succeed inside SDK. Howeve=
r,<br>
&gt; the legacy .o files under scripts/kconfig will introduce build error<b=
r>
&gt; on some hosts, thus removing them.<br>
&gt; <br>
&gt; Signed-off-by: Chen Qi &lt;Qi.Chen@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/files/toolchain-shar-extract.sh | 3 &#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 3 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolcha=
in-shar-extract.sh<br>
&gt; index 04527f891f..61911e72c9 100644<br>
&gt; --- a/meta/files/toolchain-shar-extract.sh<br>
&gt; &#43;&#43;&#43; b/meta/files/toolchain-shar-extract.sh<br>
&gt; @@ -286,6 &#43;286,9 @@ if [ -e &quot;$post_relocate&quot; ]; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $SUDO_EXEC rm -f $post_reloc=
ate<br>
&gt;&nbsp; fi<br>
&gt;&nbsp; <br>
&gt; &#43;# Remove legacy .o files to avoid kernel build failure<br>
&gt; &#43;rm -f $target_sdk_dir/sysroots/*/usr/src/kernel/scripts/kconfig/*=
.o<br>
&gt; &#43;<br>
<br>
We should be removing these at SDK construction time, not at extraction<br>
time, then the SDK is smaller and we don't have special cases in this<br>
extraction script...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR11MB3498E67CB51C0B4DD48E2E6EEDD30DM6PR11MB3498namp_--
