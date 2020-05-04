Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.6055.1588598984484594571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 06:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=cmZ+YCmc;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1054; q=dns/txt; s=axis-central1;
  t=1588598984; x=1620134984;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NGJhBnTR4TWaC/A9/uyqLTtK6uQ4DKDnaoTX/P2RCdU=;
  b=cmZ+YCmcZtb4mJ7hmGLoX1HEn2t8hYqgHiqKfBNSsxbkjjpZJMVIz0bC
   XfG2nIOVPNQEidJvB/o2QU1VLkAMN3RneYudyK49ehe75bNSLUPgo5DKR
   hLAghPI7RhuSWIKMlsHZjp+2uEZC6JeyJevDXaaXTtiBAsVdoan6I4HEG
   UJH53o4QxK/47dv9v6ZeszgZqN67+IINN7QlSyxiF/Z5TZqHGVkyh+cOX
   rc5VioQLZbiMj1KKiWQmGL7LoxgwIq5l4HRGPr8GtGVAQMfYdaG7C3efo
   YUSX+q62MJS4LdOic/n5oBYF/UnFmaEJAqSt4pXoGlWOX0ZF1vKuC7DQZ
   Q==;
IronPort-SDR: aHKxVSRfsInycViaO6yz+bDBiG3WclNXp64wvIP3TnnDlg9IuLcusrkKXnMYmY1aBTM4aF3kjC
 ndHtdS8LMPWKLdoNxm6rceZDHX6N2At8eC7bD+o1NFaESzzVrS+cvH+fvWH449YbYjAg4ZSEhC
 1LfeOezq3Tdzz9zLUzx1URh0Y7g9Rb81f2ldV7mOJ5cTx4bORcBC98OiLjafABf0FZ++Kk6Fyz
 yjV+TriXe1EFSDBuoxo9QwxO6jOnS3ZJ+sdjk6HzMsOQjPwLoJ3O4zPq1q1GJmF+A+/p46KCs/
 A2E=
X-IronPort-AV: E=Sophos;i="5.73,352,1583190000"; 
   d="scan'208";a="8354483"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] is there any value to FILESPATHPKG?
Thread-Topic: [OE-core] is there any value to FILESPATHPKG?
Thread-Index: AQHWIfy1rj8bNOU1X0emLwEZJe8Pb6iXzPAQ
Date: Mon, 4 May 2020 13:29:40 +0000
Message-ID: <e9cb896b5db64c9bbb464cd66ec2e344@XBOX03.axis.com>
References: <alpine.LFD.2.21.2005040611490.6242@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2005040611490.6242@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 4 maj 2020 12:14
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] is there any value to FILESPATHPKG?
>=20
>   not sure where i read this (YP overview manual?), but i recall
> something about the FILESPATHPKG variable being deprecated, and i see
> its only references are:
>=20
> $ grep -irw filespathpkg *
> meta/classes/utils.bbclass:    filespathpkg =3D d.getVar("FILESPATHPKG").=
split(":")
> meta/classes/utils.bbclass:        for pkgpath in filespathpkg:
> $
>=20
> so i'll leave it to someone else to decide if it still has value.
>=20
> rday

A quick grep through the Git logs for Poky and Openembedded=20
indicates that the only functions that depend on FILESPATHPKG,=20
is_machine_specific() and machine_paths(), have never been used=20
since their introduction. So I'd say it should be safe to remove=20
them.

//Peter

