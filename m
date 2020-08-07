Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.77])
 by mx.groups.io with SMTP id smtpd.web11.7622.1596811562315650729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 07:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=jfeax/NM;
 spf=pass (domain: kpit.com, ip: 40.107.138.77, mailfrom: amitanand.chikorde@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxUExcD+lzJOhlezeAoRKztzlfj7tartnqU+75wLWZH8FcURVTS16fubKKS15Q5jUw6uTyrhgnuHBQTOD8yeKUMJ+ZLQswdkNhf+4OHJveTPKKOjdOtXXcHJSDmMmdlhNWSZMYq9qUFScw7P7bcg3EDJJseAH2S8jKn5Zd4a/5mEPDnR5L71fIgWYZ8VcKbUKLaNSiUHwggy/tHRBs/k0N04O8stdkN4vQB98dKGZE6QN/J98fSC+iZJTGe+qlqKFRTNteV20CdTmB2INuvcPoTuco06i83v043ptkbsF6MixA5aQTMezeLcpdH0XJuzfDGN5Yw+uJz+fFt3Q8Pwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a1hF0MpP+cd8hFm551brqIdqdUEoIsr6hAnl6uwo3o=;
 b=ULUfJolZ34SJH/0mENdy34p3SrrIJ+4qYxa+hOCEUb/7g7PQFVwVwhyHbli5JTnSwiQf7m/lGso5tS6ZvH9pGbZX8qXLN9uRm2bU9Ye0Ki58rdanEnntOWvsjXaZ+7uDtd9qyudPuM52TXZ02xiXuWwA5ycgAc9uXi/qGttEbWrRbKFP8k6REJcB1pBlVr76jWhijlLGztKKbdQrFL0Q3iEcTfW2Sbm678GVGZNpHMb+qL+en/X/9Dm9fsJq9NtCOS1pQUz1wprGxkyX0eHNhxdP8pCnXkzkadW1cUbBk14jNz1rEGFFvNMLeMzCfURhbG2A5EETYZx1zEq4+AjmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a1hF0MpP+cd8hFm551brqIdqdUEoIsr6hAnl6uwo3o=;
 b=jfeax/NMAjPA4pgPOWO+mg9IKWrvLcVAmxj53a/T43ftmEsAYes45mSfgSdFFw5CYItRauNuumSFcfyT3JUSQqCpoD6VT+ZQlwPMVR2IKMAVy5hnpnCpfkFeR5UjrzjppnUdFphtaX8kncxji1BjaY4zdXExgu0/2FRLo++ndUI=
Received: from MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:63::10)
 by MA1PR01MB3115.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:43::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 14:45:57 +0000
Received: from MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::211f:4e7e:e90d:8928]) by MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::211f:4e7e:e90d:8928%4]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 14:45:57 +0000
From: "Amitanand N Chikorde" <Amitanand.Chikorde@kpit.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: fix codesonar warnings
Thread-Topic: [OE-core] [poky][master][PATCH] systemd: fix codesonar warnings
Thread-Index: AQHWbJjwVAIXmniG1Ead3kmfXxJ856ksXxUAgABW7Qo=
Date: Fri, 7 Aug 2020 14:45:57 +0000
Message-ID: 
 <MAXPR01MB34089A990650B474A09C851BFD490@MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1596790670-25319-1-git-send-email-Amitanand.Chikorde@kpit.com>,<57532ca51c2af5673966e242c4c5414441707429.camel@linuxfoundation.org>
In-Reply-To: 
 <57532ca51c2af5673966e242c4c5414441707429.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [157.33.189.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 198487d5-9f77-4786-dba8-08d83ae09857
x-ms-traffictypediagnostic: MA1PR01MB3115:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MA1PR01MB3115F69189ECC442E5FE36F9FD490@MA1PR01MB3115.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fLoU0U0eerCVTPl600YD4pma1s3P+ECaHLcoixTTBxEH/XvSdnEm0AsLOGuQJXVsPn0ZbLhTc3NRFXKVKxH+CFvdc0I5Ou36gUZNjS2D8i1VvrAFqpKgPZwZISlDpLb8Iiz1bemqLiarv+JTmBYSJLaOfW2iDQ1Q4dueVTpq9NHdhUYniYdDoQqWCYGoYHjBhq7pv57EyAc/appadI0bzSUpCPlFwSxldefM5OLLHqWSYJ+R6FNmYknxu+lCq6H8fcZHWCLBdAXt9yMSew2gceG5TKgdMe+WlPZCu9gU5j+NKlKlxx+DqcIIGP/au78Qr3WDwkDfH3dTWzfINdkUeMpnNDqiM4/JeNQaOx3ShvmKIHVvbjjZC38IKSdReE58bx5O8tAZbbBHTOBAHTAxrQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39850400004)(54906003)(4326008)(966005)(166002)(66446008)(2906002)(5660300002)(52536014)(76116006)(33656002)(110136005)(186003)(316002)(7696005)(91956017)(66556008)(71200400001)(6506007)(478600001)(86362001)(64756008)(8676002)(19627405001)(83380400001)(53546011)(66946007)(66574015)(66476007)(9686003)(26005)(55016002)(107886003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 iHJnrCzuHr30pDvt/hBz1AdLP/NDxwXqPzOFiixn8Xc/BAuOF7UmuxWb7RTsfLgBTKog6YG/o7GZqlLAELnMaqc3Hh+pNtH3oZ17FgeHI6zEnYAmcg7Z0K3ZN7bZO4qBFj8oQqP3pvLEppLb+3z6ZuOWh6QJidyZG9GnEnmG3M/Z0H3mti0DaChsaq5/K1PEpbRzhEXvKQPn5baOinN+2SUaKkXbEcONCNATlFaisFNJbZCmh1AB/DwtQCU3IbLskB2HF0O1FA7aFC42SvkCuYJLuME4fsfjMOqJBcn2fWYE8yvO8e59ppn/SiiS3ri+t4AeQYPaD0eVPhGytMbVaBuByKQUcyKZa6FBUpVF+bVnFZa+Hd0Wy1RHntvdHiBa7+1qy2pv2mGzcy/SozyJ4mXJL0GCnqXs6xzrQLcFA7csrh+oM4AkZ58QcvkXFrYAbnR3Glp+uoGTM/vLl2SgMaqeSeog+gCyz75CcDFuijGF5kPSFqYt/RE4Ym2by/OJTuQ+KSNkA7nXic23/ImuekKJqkppVEEgjHWwfTvc7RFxFD3JCd+jaNOBYNMzNzz16bua11DbVSAh8SXYlZVD3FrK0bgOXKwRCyCLZjXI9Lc7phfqy7PniZYzm6xt7bNZilu3adQU71REc0K0kalz6g==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 198487d5-9f77-4786-dba8-08d83ae09857
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 14:45:57.4026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +flSSJQq3S66GnuXdMID71VvsIRndexIBL7eo5CQgTyWahEY4Fun/AXZRB7+3P7/fPOKvFWHd4bXajRUSqVmHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB3115
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB34089A990650B474A09C851BFD490MAXPR01MB3408INDP_"

--_000_MAXPR01MB34089A990650B474A09C851BFD490MAXPR01MB3408INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

The patch is having 8 fixes of which only 1 is applicable to upstream syste=
md.

The applicable fix is up-streamed to systemd project ( pull request  https:=
//github.com/systemd/systemd/pull/16625 ), it is merged into upstream syste=
md master branch.

We need to upstream all of the systemd codesonar fixes.

Moved patch file to path "poky/meta/recipes-core/systemd/systemd/" and will=
 be sending the patch file to openembedded-core mailing list.


Regards,
Amit

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Friday, August 7, 2020 2:51 PM
To: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>; openembedded-core@l=
ists.openembedded.org <openembedded-core@lists.openembedded.org>; raj.khem@=
gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Anuj Chougule <Anuj.Chougule@=
kpit.com>; Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: fix codesonar warning=
s

On Fri, 2020-08-07 at 14:27 +0530, Amitanand N Chikorde wrote:
> Fixed below systemd codesonar warnings.
> 1. isprint() and isspace() is invoked here with an argument of signed
> type char, but only has defined behavior for int arguments that are
> either representable as unsigned char or equal to the value
> of macro EOF(-1).
>
> As per codesonar report, in a number of libc implementations,
> isprint()
> and isspace() functions implemented using lookup tables (arrays):
> passing in a negative value can result in a read underrun.
>
> To avoid this unexpected behaviour, typecasted char type argument to
> unsigned char type.
>
> 2. "seqnum" defined, not initialized & used in device-private.c
> Intialized "seqnum" at definition.
>
> Signed-off-by: Amitanand <Amitanand.Chikorde@kpit.com>
> ---
>  files/systemd_codesonar_warnings_fix.patch | 106
> +++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 files/systemd_codesonar_warnings_fix.patch

This patch simply creates a patch file. It doesn't get applied anywhere
and is in a generic files/ directory.

Shouldn't this go to upstream systemd?

Cheers,

Richard

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB34089A990650B474A09C851BFD490MAXPR01MB3408INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Richard, <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The patch is having 8 fixes of which only 1 is applicable to upstream syste=
md. <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The applicable fix is up-streamed to systemd project ( pull request&nbsp; <=
a href=3D"https://github.com/systemd/systemd/pull/16625" class=3D"external-=
link" rel=3D"nofollow">
https://github.com/systemd/systemd/pull/16625</a> ), it is merged into upst=
ream systemd master branch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We need to upstream all of the systemd codesonar fixes.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Moved patch file to path &quot;poky/meta/recipes-core/systemd/systemd/&quot=
; and will be sending the patch file to openembedded-core mailing list.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Amit<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Friday, August 7, 2020 2:51 PM<br>
<b>To:</b> Amitanand N Chikorde &lt;Amitanand.Chikorde@kpit.com&gt;; openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Anuj Chougule &l=
t;Anuj.Chougule@kpit.com&gt;; Aditya Tayade &lt;Aditya.Tayade@kpit.com&gt;<=
br>
<b>Subject:</b> Re: [OE-core] [poky][master][PATCH] systemd: fix codesonar =
warnings</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Fri, 2020-08-07 at 14:27 +0530, Amitanand N Chi=
korde wrote:<br>
&gt; Fixed below systemd codesonar warnings.<br>
&gt; 1. isprint() and isspace() is invoked here with an argument of signed<=
br>
&gt; type char, but only has defined behavior for int arguments that are<br=
>
&gt; either representable as unsigned char or equal to the value<br>
&gt; of macro EOF(-1).<br>
&gt; <br>
&gt; As per codesonar report, in a number of libc implementations,<br>
&gt; isprint()<br>
&gt; and isspace() functions implemented using lookup tables (arrays):<br>
&gt; passing in a negative value can result in a read underrun.<br>
&gt; <br>
&gt; To avoid this unexpected behaviour, typecasted char type argument to<b=
r>
&gt; unsigned char type.<br>
&gt; <br>
&gt; 2. &quot;seqnum&quot; defined, not initialized &amp; used in device-pr=
ivate.c<br>
&gt; Intialized &quot;seqnum&quot; at definition.<br>
&gt; <br>
&gt; Signed-off-by: Amitanand &lt;Amitanand.Chikorde@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; files/systemd_codesonar_warnings_fix.patch | 106<br>
&gt; +++++++++++++++++++++++++++++<br>
&gt;&nbsp; 1 file changed, 106 insertions(+)<br>
&gt;&nbsp; create mode 100644 files/systemd_codesonar_warnings_fix.patch<br=
>
<br>
This patch simply creates a patch file. It doesn't get applied anywhere<br>
and is in a generic files/ directory.<br>
<br>
Shouldn't this go to upstream systemd?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB34089A990650B474A09C851BFD490MAXPR01MB3408INDP_--
