Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD01C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 08:00:30 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com
 [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web08.4733.1644566428798953341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 00:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=nhlretLL;
 spf=pass (domain: bmw.de, ip: 207.54.71.69,
 mailfrom: prvs=034b4490f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1644566428; x=1676102428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oGVZpmehhNXWANTod2lUgxIZPZpSJRSoYWBKgyi3kds=;
  b=nhlretLLnvxARtDBlfBD1QRdxBpJgTr0CSp88vjNwqjqcOmNrL8OHs6P
   DukdNx51eQRoLf5BF+GhhKtM5m8K9S6wBnITYwxub3CbInUBMP0cPyh0O
   BEPEgKIgpbXyWLw6dHNtbDwSbWUnaa5mLavzyEtKObZlsBZiSxg0yhhEE
   8=;
IronPort-SDR: 
 XmyQDEZu8znhjGtnViX7XcBVMtSXYXOr2bT+HMTouB9aKTJSo58DQMjX2fCKF056za8YCHQNXl
 Tp+CV391N1b302Eslyckggsikn61NvtTpPmR8Ho1XMIOJmtgGsHYXEQW+geLy1gV7A0GRcsv6K
 81XDYC/K5EZDdE4WpJjW3peKy9dEGQ7qLnvh43kJP+B6lbSdpmDVVI/uGO/qRdqjMFF7oy6/FX
 R5FDaCwl4QZnqkJ+m17UukY7bpOYfPX3d+N4anlqb+CZsfc9rv4WXsZihV8GbnUafYAnKceaxb
 H213kkQLYYlw8O6eENWFSK47
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Feb 2022 09:00:25 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
 11 Feb 2022 09:00:25 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb4.muc with ESMTP/TLS; 11 Feb 2022 09:00:25 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Fri, 11 Feb 2022 09:00:25 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Fri,
 11 Feb 2022 09:00:25 +0100
From: <Mikko.Rapeli@bmw.de>
To: <bluelightning@bluelightning.org>
CC: <openembedded-core@lists.openembedded.org>, <sanakazisk19@gmail.com>,
	<ranjitsinh.rathod@kpit.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Thread-Topic: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Thread-Index: 
 AQHYHZe441HnQYeLLEqDuYqPBGkeZayLE8mAgAAR5wCAAAOIAIAADUeAgAASjACAAl+2gIAARiOA
Date: Fri, 11 Feb 2022 08:00:25 +0000
Message-ID: <YgYXl34nOhA1c7Ea@korppu>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
 <YgPPaRecZGTG2MF9@korppu>
 <6b2b59da15e0889c58c2a79515870994aa29a5c8.camel@linuxfoundation.org>
 <1811908.CQOukoFCf9@linc>
In-Reply-To: <1811908.CQOukoFCf9@linc>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBC8EBA13579DD4E8BFAD6AA890E28A6@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 08:00:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161635

Hi,

On Fri, Feb 11, 2022 at 04:49:21PM +1300, Paul Eggleton wrote:
> FWIW I'll just chime in here as the original author[1] and say I agree wi=
th=20
> Richard. If folks are needing an alternative SBOM generation mechanism to=
=20
> SPDX, or have other use cases for extracting build information, then I'd=
=20
> prefer we take a step back and design such a thing properly. The original=
 idea=20
> was (1) to expose changes in the output that might not readily apparent=20
> otherwise, and (2) expose selected "input" values that would (or could)=20
> materially influence the output, so you hopefully have a ready explanatio=
n for=20
> why an image / package increased in size or dependencies got added etc.=20

First of all, thanks for buildhistory, Paul!

> I will accept that over time buildhistory has added things here and there=
 that=20
> further the idea of using it for SBOM, folks no doubt have been using the=
se=20
> for such purposes, and I'm not 100% opposed to making small additions whe=
re=20
> they make sense. However, even with this proposed extension, buildhistory=
 is=20
> still not capable of recording sufficient information that (I believe) is=
=20
> expected in a modern SBOM - for example, the list of patches applied / CV=
Es=20
> resolved as a result - and I don't think it would be wise to extend it to=
 do=20
> so. We certainly don't want to give folks the idea that buildhistory is g=
ood=20
> enough to resolve their SBOM requirements when we haven't designed it to =
do=20
> so, particularly as for many folks there are legal and regulatory concern=
s=20
> involved.

Maybe I'm "abusing" buildhistory then. The way it enables to have a git rep=
o
view with full history of releases on metadata available in SW builds is
really invaluable. We seem to be abusing it to export various bitbake recip=
e
variables from product configuration so that we can later on do some QA che=
cks
on them and record the details in nice git history view.

There could be other ways to implement the same use cases. We could have re=
al
QA checks in the bitbake builds which make sure certain recipe variables
are correctly filled. We could export them into image manifest files or eve=
n SDPX
to record the details per release. Then we could manually diff the files be=
tween
releases to check for delta. Or a custom data format, maybe in json.

Yocto CVE checker uses a custom text format, a bit similar to buildhistory =
as output.
There is the json patch from Microsoft in review.

Currently I don't see SPDX output replacing buildhistory and CVE checker ou=
tput completely.

Then there is the current discussion about ABI dumps and how to store and e=
xport them
and buildhistory was at least initially mentioned there.

Gah, now I thought about saving SPDX, CVE checker and ABI dump output in bu=
ildhistory too.
Would actually be nice. Sorry, yet another use case where easy access build=
 metadata
to compare over time and releases would be really handy. This never ends.
You've created a monster :)

-Mikko=

