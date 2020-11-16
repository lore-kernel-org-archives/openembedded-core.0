Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.36524.1605540558857939207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=Runx9yw+;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1918; q=dns/txt; s=iport;
  t=1605540558; x=1606750158;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=GFhOCK+LCefsj7WQtymBHP4uQp7RCUGcqMNRM7aMLNU=;
  b=Runx9yw+6wwecM6OouWz0eUoPE8ll4XaJDYaul8XpgH0SNDFXSwUlD0I
   IkTFYk2XOfYk6b8MxiVihCzaHWgpH4IQ1u42xrB0FKlWjZezAF/ZuWJss
   E2N5/wCfkFfnBno304EZFejHE06vabHrfPjMaCcMxQ9/xSzd3wHMhjQRx
   4=;
X-IPAS-Result: =?us-ascii?q?A0CuCAAKmbJffZRdJa1iHgEBCxIMQIJyglQvOJVVlBSIG?=
 =?us-ascii?q?QsBAQENAQEtAgQBAYRKAoIeAiU4EwIDAQEBAwIDAQEBAQUBAQECAQYEFAEBh?=
 =?us-ascii?q?kiFcwEEAXkFCwIBCAQBHCUPIyUCBA6FKlIWIK9IdIE0hVeEaIE4jUAbgUE/h?=
 =?us-ascii?q?CM+ijQEl1qDKIFAm2wKIIJNmxUioXm0JQIRFYEzOCGBWXAVgyVPFwINnGiBK?=
 =?us-ascii?q?wIGCgEBAwl8iwYHgS4BgRABAQ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,482,1596499200"; 
   d="scan'208,217";a="606295780"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Nov 2020 15:29:15 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 0AGFTFZ5031288
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 16 Nov 2020 15:29:15 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-RCD-001.cisco.com
 (173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Nov
 2020 09:29:15 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Mon, 16 Nov 2020 09:29:14 -0600
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for arm64
Thread-Topic: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for
 arm64
Thread-Index: AQHWrejRVNz5C+744kaUUDNWNcIlOamwE3FkgA+MDTSAC1rm0YAAZ0qA//+ciY8=
Date: Mon, 16 Nov 2020 15:29:14 +0000
Message-ID: <1605540554704.91032@cisco.com>
References: <20201029114052.23141-1-dzagorui@cisco.com>
 <CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>
 <1642C502B17F26A6.28917@lists.openembedded.org>
 <1645CE4049F0E4CD.31324@lists.openembedded.org>
 <1605539690406.1214@cisco.com>,<CADkTA4PFtRR0sT+U1SRdwr-p266rgNj=Y1uF=R4Z9qoLuyaKoQ@mail.gmail.com>
In-Reply-To: <CADkTA4PFtRR0sT+U1SRdwr-p266rgNj=Y1uF=R4Z9qoLuyaKoQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.7]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_160554055470491032ciscocom_"

--_000_160554055470491032ciscocom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I expected that this would have been picked up after I acked it, but ther=
e was a release to do in the middle of it being submitted and now .. so thi=
ngs have been a bit slower.
>
> I'll put it in my local queue, that way if it doesn't get picked up, I'll=
 send it with my next pull request.
>
> Bruce

I see

Thanks,
Denys


--_000_160554055470491032ciscocom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<div style=3D"color: rgb(33, 33, 33);">
<div>
<div dir=3D"ltr">&gt;&nbsp;<span style=3D"font-size: small;">I expected tha=
t this would have been picked up after I acked it, but there was a release =
to do in the middle of it being submitted and now .. so things have been a =
bit slower.</span>
<div class=3D"gmail_default" style=3D"font-size:small">&gt; </div>
<div class=3D"gmail_default" style=3D"font-size:small">&gt;&nbsp;I'll put i=
t in my local queue, that way if it doesn't get picked up, I'll send it wit=
h my next pull request.</div>
<div class=3D"gmail_default" style=3D"font-size:small">&gt; </div>
<div class=3D"gmail_default" style=3D"font-size:small">&gt;&nbsp;Bruce</div=
>
<div><br>
</div>
<div>I see<br>
</div>
<div><br>
</div>
<div>Thanks,<br>
</div>
<div>Denys<br>
</div>
<div dir=3D"ltr" class=3D"gmail_signature"><br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_160554055470491032ciscocom_--
