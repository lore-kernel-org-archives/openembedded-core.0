Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958EBEB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:22:10 +0000 (UTC)
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
 by mx.groups.io with SMTP id smtpd.web11.8387.1689949321673821172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 07:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=BNYmQ6b7;
 spf=pass (domain: amazon.de, ip: 99.78.197.220, mailfrom: prvs=559d59100=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1689949321; x=1721485321;
  h=from:to:cc:date:message-id:references:in-reply-to:
   mime-version:subject;
  bh=wnidc8CofeFSQ8O7bwyMR+uiuUEf7pykyBLakH2vT1E=;
  b=BNYmQ6b7kopyxD0G8lEF2ZS0jjpUvLH5FNy+9u+iiVPiurcf5rVqo+jv
   Gv6A8orhfSe/tKDUQE2MfNcGsmWc8TQxU6g58eavYhB+HUebgi1BA78Ks
   ULG61TUPOtW/0CplAFkV9QlumWqf9QEBHhwf/YwXoTHPzaP3GstrqwdX9
   M=;
X-IronPort-AV: E=Sophos;i="6.01,220,1684800000"; 
   d="scan'208,217";a="17741589"
Subject: AW: [OE-core] kirkstone boost upgrade?
Thread-Topic: [OE-core] kirkstone boost upgrade?
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-245b69b1.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 14:21:58 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1e-m6i4x-245b69b1.us-east-1.amazon.com (Postfix) with ESMTPS id 4B147340072;
	Fri, 21 Jul 2023 14:21:56 +0000 (UTC)
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 21 Jul 2023 14:21:55 +0000
Received: from EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6]) by
 EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6%3]) with mapi id
 15.02.1118.030; Fri, 21 Jul 2023 14:21:55 +0000
From: "Roos, Thomas" <throos@amazon.de>
To: Ross Burton <Ross.Burton@arm.com>
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Index: AQHZu464cBJ3VPLf9UmQh2Hc/UVYdq/DvCgAgAAlz6WAADeaAIAALJuE
Date: Fri, 21 Jul 2023 14:21:55 +0000
Message-ID: <aec5abd544f84568b61ccd9ed7415bcb@amazon.de>
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
 <f8527dac-70d8-488f-dbcb-78d29acd8e01@gmail.com>
 <11b360cb14ab463b88b5cec298e0b2c6@amazon.de>,<76EB3148-B3B7-4D74-8F4B-5343A63C71F1@arm.com>
In-Reply-To: <76EB3148-B3B7-4D74-8F4B-5343A63C71F1@arm.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.51.153]
Content-Type: multipart/alternative;
	boundary="_000_aec5abd544f84568b61ccd9ed7415bcbamazonde_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184696

--_000_aec5abd544f84568b61ccd9ed7415bcbamazonde_
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

thank you, Ross - will try.
Cheers, Thomas

________________________________
Von: Ross Burton <Ross.Burton@arm.com>
Gesendet: Freitag, 21. Juli 2023 13:42:02
An: Roos, Thomas
Cc: Vyacheslav Yurkov; openembedded-core@lists.openembedded.org
Betreff: RE: [EXTERNAL][OE-core] kirkstone boost upgrade?

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you can confirm the sender and know the=
 content is safe.



On 21 Jul 2023, at 09:25, Thomas Roos via lists.openembedded.org <throos=3D=
amazon.de@lists.openembedded.org> wrote:
>
> Hi Vyacheslav,
> I think it's this error: boost beast "Fixed WebSocket handshake response =
on failure."
> Fixed in 1.79.
> My question was what is the policy of upgrading boost in an LTS branch? I=
 guess there is no change?
> I totally agree that there are breaking changes - I had experienced a lot=
 in the past...

If you can isolate the fix to a small patch that doesn=92t break anything e=
lse, then you can submit that as a patch.  If it needs to be an invasive up=
grade, that=92s less likely to happen.

Ross



Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094




--_000_aec5abd544f84568b61ccd9ed7415bcbamazonde_
MIME-Version: 1.0
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>thank you, Ross - will try.<br>
Cheers, Thomas<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> Ross Burton &lt;Ross=
.Burton@arm.com&gt;<br>
<b>Gesendet:</b> Freitag, 21. Juli 2023 13:42:02<br>
<b>An:</b> Roos, Thomas<br>
<b>Cc:</b> Vyacheslav Yurkov; openembedded-core@lists.openembedded.org<br>
<b>Betreff:</b> RE: [EXTERNAL][OE-core] kirkstone boost upgrade?</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">CAUTION: This email originated from outside of the=
 organization. Do not click links or open attachments unless you can confir=
m the sender and know the content is safe.<br>
<br>
<br>
<br>
On 21 Jul 2023, at 09:25, Thomas Roos via lists.openembedded.org &lt;throos=
=3Damazon.de@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; Hi Vyacheslav,<br>
&gt; I think it's this error: boost beast &quot;Fixed WebSocket handshake r=
esponse on failure.&quot;<br>
&gt; Fixed in 1.79.<br>
&gt; My question was what is the policy of upgrading boost in an LTS branch=
? I guess there is no change?<br>
&gt; I totally agree that there are breaking changes - I had experienced a =
lot in the past...<br>
<br>
If you can isolate the fix to a small patch that doesn=92t break anything e=
lse, then you can submit that as a patch.&nbsp; If it needs to be an invasi=
ve upgrade, that=92s less likely to happen.<br>
<br>
Ross<br>
</div>
</span></font>
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

--_000_aec5abd544f84568b61ccd9ed7415bcbamazonde_--


