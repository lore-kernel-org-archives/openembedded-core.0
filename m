Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.41])
 by mx.groups.io with SMTP id smtpd.web10.8377.1592306857947062189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 04:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=VQnQ9n+6;
 spf=pass (domain: kpit.com, ip: 40.107.138.41, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehU12OVAB1z/Ny4XwioYEy5XBjU4gHo+zj/6i35IrdJWKCFYP+33a7ZnLsrHnhq+7b9ryWQIB4MpihYPR3UY+XO9eGWZ0xf9YuvURP36EDNQYL798wOcboAieOif0wVPkluxuK243Bh6yRQdA7PeNQyAv5oLoo6sQ30Hz6hKbk50QQM+CDrGNSbSlHMLEaFF+fS2uI9vrQGJtTSIwkoK7RO+SgmlUsYrinxg+tCztG8fy1cGXgS3XEOkfPJkOiQGRjh8JusTMS9bA86NuZzYuOrLGd0Cilc+F1mbsyWdvxVcO3ia8oLMvCdIZP0mDZHHrWyv+2y47aryxMCn5vJOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8+rKgRbFsrV8hl+lTW4kfql0yNpa0GLPO6tSU+64ng=;
 b=YyQtnsFBG3k6Xfujq+9DNApg08QRFTZgoSVUHhCRCHoCzOF0w9AjrhxcmytfDLL1lTYBQJE+SWLn3w70eFnAPqwvO8qGDb1gc9WitzgIrJJ7D2pMmPJZc0bQT9dgi7PJgIWEfiLtb86gfjGxrlvJ0+nrtxHLoglmSonlBFct6Kg3zh13eUn5agnuk7ZaSYaRgNvDoIXjJ6htZxPlaMAwzQU38yN74pYhPxxcukTvmq2v4C/00Lrz7V0ISDSUUev2xJHySUhS9KmNQs5mix1xXqAgIjX8ZD4yrGZ8XBEaI1tljutlufTPTBqCeNW+qqPhzIxNQO6YuFSJuolpdm9fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8+rKgRbFsrV8hl+lTW4kfql0yNpa0GLPO6tSU+64ng=;
 b=VQnQ9n+6tiK2/tzrAy63whO/zGkSAl/iu9Ij2GjrBQ0QgHthMHLSNSmFy3TxR8yj42PRzG4XI3HSn+K5FO75Wvl/6mynQ7R6U6d7NRCJqNQXBkM2miUF/XxxXUDV2Za9BBKMWfCqLUhBZgGDJ3FapJXbBi36W6s2ZmmJpdKrLqk=
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:70::20)
 by BM1PR01MB3972.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:79::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Tue, 16 Jun
 2020 11:27:29 +0000
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1]) by BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1%4]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 11:27:29 +0000
From: "saloni" <saloni.jain@kpit.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>
CC: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>, Nisha Parrakat <Nisha.Parrakat@kpit.com>, Aditya
 Tayade <Aditya.Tayade@kpit.com>
Subject: [meta-oe][master][PATCH] davici: Fix codesonar warnings
Thread-Topic: [meta-oe][master][PATCH] davici: Fix codesonar warnings
Thread-Index: AQHWQ8+0VIJLys6tmUqbNy+/iwC7MA==
Date: Tue, 16 Jun 2020 11:27:28 +0000
Message-ID: 
 <BM1PR01MB36650CAB8302C5A1D4ECCC50879D0@BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2409:4043:2c12:19ec:2177:964e:7e0c:4c0b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 238dafb8-8e78-40a9-7436-08d811e840fb
x-ms-traffictypediagnostic: BM1PR01MB3972:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB397261FB423015006232654F879D0@BM1PR01MB3972.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JxVpR1BRHYNp93QLP8QZJkVtolQGLLdXWERo5VLLhTJqgx4FjQVoSdK9is0EklgbOd59O/QFLL0bpOKyAGqXEZ6Lwj96cMDF8ql0/MqlcrAAaqF4eOXpLF81NobW18hwf8ithHT9jnye3z3/Du41+yhTyse/Icu3nng2GKGgR0glelGipY2poko5HBoGOZVC5LKqhJhBA4jTS25pbvmDDj1034lgVgkOOgxggEIxibb7NcsNXHkFnOXRaLn0viPBoRjMqOU4EJYTb7DQZz6uMT+iDK7xr4kXuE5xY0IYBkbpz0EZ06EOlrW4KbNgjC+tUhaWdgWv00UTe9xnCvl2LQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(8676002)(8936002)(66556008)(66476007)(66446008)(66946007)(64756008)(76116006)(2906002)(107886003)(52536014)(498600001)(86362001)(83380400001)(33656002)(19627405001)(66574015)(6506007)(7696005)(186003)(55016002)(9686003)(110136005)(4326008)(54906003)(5660300002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 cRuCgH1H22jvl7h11MlFDu54mXyZBrnt/rwmemvGp1m/Pjdw8lyRM6tojdlU4uuy1Dx7XBQ3fAKUNGJUu3BhmhDTSq2xOuS6WVKH9GMdP07B6Ge+ZVwcqIyUXYfBk5usJLPJKAnIK0fhOp55qbzXcXKVw6OGKNoNXFF0RlVjsYtVKeNdt0ncdfYSr6B7artnawe9ucg4YILwH4L2kHbMpmi6xOy66ZbxW+1kWn9h/KJj2HR+1JwGUSUE7FyXUHWWljd97wRYA9RrYjzMhaHfegAKyXafzQATiRZWIkw8ELmUw67HkxKKc9Xpav6JzEV4gyc4JRefQ4ggjATChfeUtR2Yjt/pWs+GSJFmetkSYob1H9ERZE2uKPz/1rggDGgT74NIehhEvzIvWGubqwo1Bx3FA+MjNOVCdugCSrw6DNlC5tNVHscTVOd/NXs3ir0bDAKnO+E1mPanvgNCokFcH9LFjx/4+YrrofazAj2D846nX0m8FtIKhzSSFR4Wkol6O6FIUgEfBAb3fnggySkb07R0nLl3sQ2JAYJzH90iLn6ulCdZfgCcDaUjUwAhDL6w
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238dafb8-8e78-40a9-7436-08d811e840fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 11:27:28.8993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jH0JAZh8a4q2ovzQvwPuQcFYHCmD4FZkt+KhE3SD9N8kU2kAltQuG60pHgJx4ZD3qj9VlDSrqDdLBzkrl3ONNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3972
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB36650CAB8302C5A1D4ECCC50879D0BM1PR01MB3665INDP_"

--_000_BM1PR01MB36650CAB8302C5A1D4ECCC50879D0BM1PR01MB3665INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,



Posting this on behalf of "Amitanand Chikorde <Amitanand.Chikorde@kpit.com<=
mailto:Amitanand.Chikorde@kpit.com>>"



From: "Amitanand.Chikorde" <Amitanand.Chikorde@kpit.com<mailto:Amitanand.Ch=
ikorde@kpit.com>>

Fixed below codesonar warning:
isprint() is invoked here with an argument of signed type char, but
only has defined behavior for int arguments that are either
representable as unsigned char or equal to the value of macro EOF(-1).

As per codesonar report, in a number of libc implementations, isprint()
is implemented using lookup tables (arrays): passing in a negative
value can result in a read underrun.

To avoid this unexpected behaviour, typecasted char type argument to
unsigned char type.

Upstream-Status: Pending
Signed-off-by: Amitanand Chikorde <Amitanand.Chikorde@kpit.com<mailto:Amita=
nand.Chikorde@kpit.com>>
Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../files/davici_codesonar_warnings_fix.patch      | 37 ++++++++++++++++++=
++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-support/strongswan/files/davici_codesonar_warni=
ngs_fix.patch

diff --git a/recipes-support/strongswan/files/davici_codesonar_warnings_fix=
.patch b/recipes-support/strongswan/files/davici_codesonar_warnings_fix.pat=
ch
new file mode 100644
index 0000000..2318479
--- /dev/null
+++ b/recipes-support/strongswan/files/davici_codesonar_warnings_fix.patch
@@ -0,0 +1,37 @@
+davici: Fix codesonar warnings
+
+isprint() is invoked here with an argument of signed type char,
+but only has defined behavior for int arguments that are either
+representable as unsigned char or equal to the value of macro
+EOF(-1).
+
+As per codesonar report, in a number of libc implementations,
+isprint() is implemented using lookup tables (arrays): passing
+in a negative value can result in a read underrun.
+
+To avoid this unexpected behaviour, typecasted char type
+argument to unsigned char type.
+
+Signed-off-by: Amitanand N. Chikorde <Amitanand.Chikorde@kpit.com<mailto:A=
mitanand.Chikorde@kpit.com>>
+Upstream-Status: Pending
+
+--- a/davici.c 2017-03-30 16:15:15.000000000 +0530
++++ b/davici.c 2020-05-29 11:40:45.983656217 +0530
+@@ -180,7 +180,7 @@
+        }
+        for (i =3D 0; i < inlen; i++)
+        {
+-              if (!isprint(in[i]))
++              if (!isprint((unsigned char) in[i]))
+                {
+                        return -EINVAL;
+                }
+@@ -1157,7 +1157,7 @@
+
+        for (i =3D 0; i < res->buflen; i++)
+        {
+-              if (!isprint(val[i]))
++              if (!isprint((unsigned char) val[i]))
+                {
+                        return -EINVAL;
+                }
--
2.7.4





Regards,

Saloni Jain

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BM1PR01MB36650CAB8302C5A1D4ECCC50879D0BM1PR01MB3665INDP_
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
<div>
<div>
<div>
<div lang=3D"en-US">
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">Hello,</span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">&nbsp;</span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">Posting this on behalf of &quot;Amit=
anand Chikorde
</span><span style=3D"color:black">&lt;<a href=3D"mailto:Amitanand.Chikorde=
@kpit.com" target=3D"_blank" rel=3D"noopener noreferrer">Amitanand.Chikorde=
@kpit.com</a>&gt;&quot;</span><span style=3D"color:black; font-size:12pt"><=
/span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">&nbsp;</span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black">From: &quot;Amitanand.Chikorde&quot; &lt;<a href=3D"=
mailto:Amitanand.Chikorde@kpit.com" target=3D"_blank" rel=3D"noopener noref=
errer">Amitanand.Chikorde@kpit.com</a>&gt;<br>
<br>
Fixed below codesonar warning:<br>
isprint() is invoked here with an argument of signed type char, but<br>
only has defined behavior for int arguments that are either<br>
representable as unsigned char or equal to the value of macro EOF(-1).<br>
<br>
As per codesonar report, in a number of libc implementations, isprint()<br>
is implemented using lookup tables (arrays): passing in a negative<br>
value can result in a read underrun.<br>
<br>
To avoid this unexpected behaviour, typecasted char type argument to<br>
unsigned char type.<br>
<br>
Upstream-Status: Pending<br>
Signed-off-by: Amitanand Chikorde &lt;<a href=3D"mailto:Amitanand.Chikorde@=
kpit.com" target=3D"_blank" rel=3D"noopener noreferrer">Amitanand.Chikorde@=
kpit.com</a>&gt;<br>
Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
---<br>
&nbsp;.../files/davici_codesonar_warnings_fix.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 37 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 37 insertions(&#43;)<br>
&nbsp;create mode 100644 recipes-support/strongswan/files/davici_codesonar_=
warnings_fix.patch<br>
<br>
diff --git a/recipes-support/strongswan/files/davici_codesonar_warnings_fix=
.patch b/recipes-support/strongswan/files/davici_codesonar_warnings_fix.pat=
ch<br>
new file mode 100644<br>
index 0000000..2318479<br>
--- /dev/null<br>
&#43;&#43;&#43; b/recipes-support/strongswan/files/davici_codesonar_warning=
s_fix.patch<br>
@@ -0,0 &#43;1,37 @@<br>
&#43;davici: Fix codesonar warnings<br>
&#43;<br>
&#43;isprint() is invoked here with an argument of signed type char,<br>
&#43;but only has defined behavior for int arguments that are either<br>
&#43;representable as unsigned char or equal to the value of macro<br>
&#43;EOF(-1).<br>
&#43;<br>
&#43;As per codesonar report, in a number of libc implementations,<br>
&#43;isprint() is implemented using lookup tables (arrays): passing<br>
&#43;in a negative value can result in a read underrun.<br>
&#43;<br>
&#43;To avoid this unexpected behaviour, typecasted char type<br>
&#43;argument to unsigned char type.<br>
&#43;<br>
&#43;Signed-off-by: Amitanand N. Chikorde &lt;<a href=3D"mailto:Amitanand.C=
hikorde@kpit.com" target=3D"_blank" rel=3D"noopener noreferrer">Amitanand.C=
hikorde@kpit.com</a>&gt;<br>
&#43;Upstream-Status: Pending<br>
&#43;<br>
&#43;--- a/davici.c 2017-03-30 16:15:15.000000000 &#43;0530<br>
&#43;&#43;&#43;&#43; b/davici.c 2020-05-29 11:40:45.983656217 &#43;0530<br>
&#43;@@ -180,7 &#43;180,7 @@<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; inlen;=
 i&#43;&#43;)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (!isprint(in[i]))<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (!isprint((unsigned char) in[i]))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
 -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; }<br>
&#43;@@ -1157,7 &#43;1157,7 @@<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; res-&g=
t;buflen; i&#43;&#43;)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (!isprint(val[i]))<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (!isprint((unsigned char) val[i]))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
 -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; }<br>
-- <br>
2.7.4</span><span style=3D"color:black; font-size:12pt"></span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">&nbsp;</span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">&nbsp;</span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">Regards,</span></p>
</div>
<div>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"color:black; font-size:12pt">Saloni Jain</span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
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

--_000_BM1PR01MB36650CAB8302C5A1D4ECCC50879D0BM1PR01MB3665INDP_--
