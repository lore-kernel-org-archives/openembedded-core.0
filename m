Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3064EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 04:49:37 +0000 (UTC)
Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
 by mx.groups.io with SMTP id smtpd.web11.725.1689914973077870214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 21:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=Mj5PqHMg;
 spf=pass (domain: amazon.de, ip: 207.171.188.204, mailfrom: prvs=559d59100=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1689914973; x=1721450973;
  h=from:to:subject:date:message-id:mime-version;
  bh=oS8z4NUh8DX08G/DlWqKa49GMKIt4PLUx0im6n8Nrb8=;
  b=Mj5PqHMg6X+YqRlMjBlp5AUcQB6Ewe42CKgzHta8Ro6lQObRjGyEsXYy
   r8uVSfOcIZNRHNODrnHIF4R9xaAaLdTTswSgKABlrxlepLkA10CcOa74o
   JUcompYRRKzKWCHOaKIwmpfwcd8WH8Txg+dsatI4LpWajNQ3FaAoUluIE
   Y=;
X-IronPort-AV: E=Sophos;i="6.01,220,1684800000"; 
   d="scan'208,217";a="661859043"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-9694bb9e.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 04:49:27 +0000
Received: from EX19D016EUC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-m6i4x-9694bb9e.us-east-1.amazon.com (Postfix) with ESMTPS id 03EEE807E6
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 04:49:25 +0000 (UTC)
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19D016EUC002.ant.amazon.com (10.252.51.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 21 Jul 2023 04:49:24 +0000
Received: from EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6]) by
 EX19D016EUC001.ant.amazon.com ([fe80::ffab:9491:d0b8:dbb6%3]) with mapi id
 15.02.1118.030; Fri, 21 Jul 2023 04:49:24 +0000
From: "Roos, Thomas" <throos@amazon.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: kirkstone boost upgrade?
Thread-Topic: kirkstone boost upgrade?
Thread-Index: AQHZu464cBJ3VPLf9UmQh2Hc/UVYdg==
Date: Fri, 21 Jul 2023 04:49:24 +0000
Message-ID: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.51.69]
Content-Type: multipart/alternative;
	boundary="_000_ef85e3d213644b25adceed1a851ac01bamazonde_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 04:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184666

--_000_ef85e3d213644b25adceed1a851ac01bamazonde_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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




--_000_ef85e3d213644b25adceed1a851ac01bamazonde_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hi, <br>
we are hitting an issue with boost version 1.78 and like to ask if and how =
there is a boost upgrade on kirkstone branch?<br>
Cheers, Thomas<br>
</p>
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

--_000_ef85e3d213644b25adceed1a851ac01bamazonde_--


