Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4930EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 08:25:58 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web11.2914.1689927950751260533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 01:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=EQU4n3Ty;
 spf=pass (domain: amazon.de, ip: 99.78.197.217, mailfrom: prvs=559d59100=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1689927950; x=1721463950;
  h=from:to:date:message-id:references:in-reply-to:
   mime-version:subject;
  bh=PjlYHbpOEJEf/Usi6u1Shb2dlYenXcWyCjWdbLjad2s=;
  b=EQU4n3TyANBQisMT9oZ0FfVqs79GzGNZl5Ylmr3+wLGddmBLFekL51Pv
   SGtx7TqIGtJ6bXWYoSXlqaK6HTxwobNjPXMLxrcMolIsMS6uFWPv+KquL
   ZYLgD6yW44vD0Rs930CmQuWqSWjOTK4wlZIKfOg81MIw8dG4OAgfdZUsl
   Q=;
X-IronPort-AV: E=Sophos;i="6.01,220,1684800000"; 
   d="scan'208,217";a="227903776"
Subject: AW: [OE-core] kirkstone boost upgrade?
Thread-Topic: [OE-core] kirkstone boost upgrade?
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:25:48 +0000
Received: from EX19D016EUC003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com (Postfix) with ESMTPS id B61A38A5CD;
	Fri, 21 Jul 2023 08:25:47 +0000 (UTC)
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19D016EUC003.ant.amazon.com (10.252.51.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 21 Jul 2023 08:25:46 +0000
Received: from EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6]) by
 EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6%3]) with mapi id
 15.02.1118.030; Fri, 21 Jul 2023 08:25:46 +0000
From: "Roos, Thomas" <throos@amazon.de>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Index: AQHZu464cBJ3VPLf9UmQh2Hc/UVYdq/DvCgAgAAlz6U=
Date: Fri, 21 Jul 2023 08:25:46 +0000
Message-ID: <11b360cb14ab463b88b5cec298e0b2c6@amazon.de>
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de>,<f8527dac-70d8-488f-dbcb-78d29acd8e01@gmail.com>
In-Reply-To: <f8527dac-70d8-488f-dbcb-78d29acd8e01@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.50.216]
Content-Type: multipart/alternative;
	boundary="_000_11b360cb14ab463b88b5cec298e0b2c6amazonde_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 08:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184675

--_000_11b360cb14ab463b88b5cec298e0b2c6amazonde_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vyacheslav,
I think it's this error: boost beast "Fixed WebSocket handshake response on=
 failure."
Fixed in 1.79.
My question was what is the policy of upgrading boost in an LTS branch? I g=
uess there is no change?
I totally agree that there are breaking changes - I had experienced a lot i=
n the past...
Cheers, Thomas

________________________________
Von: Vyacheslav Yurkov <uvv.mail@gmail.com>
Gesendet: Freitag, 21. Juli 2023 08:07:32
An: Roos, Thomas; openembedded-core@lists.openembedded.org
Betreff: RE: [EXTERNAL][OE-core] kirkstone boost upgrade?


CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you can confirm the sender and know the=
 content is safe.


I would be cautious with boost upgrade in stable branch.

Boost is known for having breaking changes almost each new version. I only =
had a glance at 1.79-1.81 https://www.boost.org/users/history/ and there ar=
e a couple of them.

Are you affected by some particular bug or vulnerability in 1.78?

Vyacheslav

On 21.07.2023 06:49, Thomas Roos via lists.openembedded.org wrote:

Hi,
we are hitting an issue with boost version 1.78 and like to ask if and how =
there is a boost upgrade on kirkstone branch?
Cheers, Thomas



Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094





Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094




--_000_11b360cb14ab463b88b5cec298e0b2c6amazonde_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hi <span>Vyacheslav</span>,<br>
I think it's this error: boost beast &quot;Fixed WebSocket handshake respon=
se on failure.&quot;<br>
Fixed in 1.79.<br>
My question was what is the policy of upgrading boost in an LTS branch? I g=
uess there is no change?<br>
I totally agree that there are breaking changes - I had experienced a lot i=
n the past...<br>
Cheers, Thomas<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Vyacheslav Yurkov &lt;=
uvv.mail@gmail.com&gt;<br>
<b>Gesendet:</b> Freitag, 21. Juli 2023 08:07:32<br>
<b>An:</b> Roos, Thomas; openembedded-core@lists.openembedded.org<br>
<b>Betreff:</b> RE: [EXTERNAL][OE-core] kirkstone boost upgrade?</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"WordSection1">
<table class=3D"MsoTableGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"border-collapse:collapse;border:none">
<tbody>
<tr style=3D"height:15.25pt">
<td width=3D"711" valign=3D"top" style=3D"width:842.35pt;border:solid #ED7D=
31 1.5pt;padding:0in 5.4pt 0in 5.4pt;height:15.25pt">
<p><strong><span style=3D"background:#FFFF99">CAUTION</span></strong><span =
style=3D"background:#FFFF99">: This email originated from outside of the or=
ganization. Do not click links or open attachments unless you can confirm t=
he sender and know the content is safe.</span><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
</div>
<br>
<div>
<div class=3D"moz-cite-prefix">I would be cautious with boost upgrade in st=
able branch.<br>
<br>
Boost is known for having breaking changes almost each new version. I only =
had a glance at 1.79-1.81
<a class=3D"moz-txt-link-freetext" href=3D"https://www.boost.org/users/hist=
ory/">https://www.boost.org/users/history/</a> and there are a couple of th=
em.<br>
<br>
Are you affected by some particular bug or vulnerability in 1.78?<br>
<br>
Vyacheslav<br>
<br>
On 21.07.2023 06:49, Thomas Roos via lists.openembedded.org wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:ef85e3d213644b25adceed1a851ac01b@amaz=
on.de"><style type=3D"text/css" style=3D"display:none;">P {margin-top:0;mar=
gin-bottom:0;}</style>
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hi, <br>
we are hitting an issue with boost version 1.78 and like to ask if and how =
there is a boost upgrade on kirkstone branch?<br>
Cheers, Thomas<br>
</p>
</div>
<br>
<br>
<br>
Amazon Web Services EMEA SARL <br>
38 avenue John F. Kennedy, L-1855 Luxembourg <br>
Sitz der Gesellschaft: L-1855 Luxemburg <br>
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284 <br>
<br>
Amazon Web Services EMEA SARL, Niederlassung Deutschland <br>
Marcel-Breuer-Str. 12, D-80807 Muenchen <br>
Sitz der Zweigniederlassung: Muenchen <br>
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094
<br>
<br>
<br>
</blockquote>
</div>
</div>
<br><br><br>Amazon Web Services EMEA SARL
<br>38 avenue John F. Kennedy, L-1855 Luxembourg
<br>Sitz der Gesellschaft: L-1855 Luxemburg
<br>eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284
<br>
<br>Amazon Web Services EMEA SARL, Niederlassung Deutschland
<br>Marcel-Breuer-Str. 12, D-80807 Muenchen
<br>Sitz der Zweigniederlassung: Muenchen
<br>eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 2422=
40, USt-ID DE317013094
<br><br><br>
</body>
</html>

--_000_11b360cb14ab463b88b5cec298e0b2c6amazonde_--


