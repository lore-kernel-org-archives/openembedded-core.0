Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.14808.1594710178294352226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 00:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=i1lUQke/;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=842; q=dns/txt; s=axis-central1;
  t=1594710179; x=1626246179;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U3RDE7ZSRa8/bwCgGqsPvs3s4oJzcuIqnrW+2vt/V1g=;
  b=i1lUQke/pErc2OyuhTFeaTGUp18CcODYUz9KPS6z8BFWFCWRSuFtYcZL
   hHMoaEoNiksAIuKFDFulpM3dw6O4RBHdXPN4Qcl7BYqkmeOdKuFtLouXc
   TmZCi5fdqy6hg65w2v0NEa8t052/8+b2OKOBYP1IecDdUkm7KM932I51Y
   GKejgjpOxIg/+dhHd0tsDdCYGrkaAsSJICBbBE5Lqwxns52jiwhpxID8Q
   brsVT3AZ9ZXkBctySb7vo9S2xB+tYAg3nv8iyOybsn9msNQcTeXJAmAKM
   ROLbW3qrraeYxSpN1MZrTeRaCT2HYJ04w2WZObGBVndUZLRUt4jv9trbS
   g==;
IronPort-SDR: 5fBLrMZruHm3VikW+39YlRMtmhPuwEWeVPZ4AnnhFql1NZXpTF31dP4BDmPHRbsAGIfYWqhzNH
 9xILP2EL36p8Qo8aDbPz4A6NBtVyVzY5AzGhVt3x3zSAjzpVFXxi7Q5/BiMpnoAm/rRn5IWiZI
 i8hCsip+0YsKZG9/NGvToyOHeG/+gqowwtj4nlqU5MUlns2NhuEQLXX1AksiKCFqJmNJUGbF2k
 drxLe+FgVvmjT1ZH/J9Qh/pIKu1zHCOkoVMkJAsEPfQDPOqL49LKkqE1ctSmR1tqltyF7nsuUR
 mM4=
X-IronPort-AV: E=Sophos;i="5.75,350,1589234400"; 
   d="scan'208";a="10469130"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Paul Barker <pbarker@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, tools-cfpbuild-internal
	<tools-cfpbuild-internal@axis.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir
Thread-Topic: [PATCH v4 01/12] Move rpm manifest to its own subdir
Thread-Index: AQHWUS9HKFExdm4B+0exxdD/0h6qFKj/GLQwgAA86oCAB2F99A==
Date: Tue, 14 Jul 2020 07:02:54 +0000
Message-ID: <1594710174328.5614@axis.com>
References: <20200703114402.8850-1-fredrigu@axis.com>
 <20200703114402.8850-2-fredrigu@axis.com>
 <1594291329382.85415@axis.com>,<CAM9ZRVtH5m14PHydagC1k9XnaEu=USX2oFRraGUvCh=911scxg@mail.gmail.com>
In-Reply-To: <CAM9ZRVtH5m14PHydagC1k9XnaEu=USX2oFRraGUvCh=911scxg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you, just let me know if I can make it any easier to review this,=0A=
I know it's a big patch.=0A=
=0A=
BR=0A=
Fredrik=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Thursday, July 9, 2020 6:19 PM=0A=
To: Fredrik Gustafsson=0A=
Cc: openembedded-core@lists.openembedded.org; tools-cfpbuild-internal; Rich=
ard Purdie=0A=
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir=0A=
=0A=
On Thu, 9 Jul 2020 at 11:42, Fredrik Gustafsson=0A=
<Fredrik.Gustafsson@axis.com> wrote:=0A=
>=0A=
> Hi,=0A=
> is there something I can do to make this series move forward?=0A=
>=0A=
=0A=
I guess it's waiting for at least one person to review it in detail.=0A=
It's in my backlog, I should get to it on Monday.=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
