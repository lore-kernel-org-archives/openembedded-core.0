Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E51BC352AA
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.2927.1649878211912139185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dWBl/XvA;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649878212;
  x=1681414212;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0S+J/Nmig4U3YR963J8/oakV9pkZYUjhaBOk7XEFB6M=;
  b=dWBl/XvAZoo1kKjScf04npM5sydYKBb89M2CLGjnZQJrwEAOJNMtwEVK
   40Rzm9MYnQOzUFhW6GwI/vhFB8a1AhpwQl09LOhUiXe2yk0Qff0TFB8pW
   SEMW6/e9B+ZPhXuGvq+Py2U4B196HK08G7OWwSTpuhV34kgQcEelG5Osc
   AgVOhu1qpGkcl1DgQywW4TyCbwbWJh+i/8ONqNuMeDNLXFh6Pt+sxmzW+
   YbsHz/mNWJ4FsldnA9h3XFOtzaaY3zZFrluu2Qp21nWHjfB+M0YF+tpQK
   /Zx/eH5ZvsckdTXJvrk12SskYExtEpDLukxs4G9F/PoO64YwJlxg+HA7Y
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] ncurses: use COPYING file
Thread-Topic: [OE-core] [PATCH 1/2] ncurses: use COPYING file
Thread-Index: AQHYT1k2gmHaYOzSgUC7LoVW6bJr8KzuOUlg
Date: Wed, 13 Apr 2022 19:30:09 +0000
Message-ID: <7c2d7899ef0a4d21993d2ac499d4bc5e@axis.com>
References: 
 <HE1PR0902MB18019A87B3863FB6ABCC662AA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
In-Reply-To: 
 <HE1PR0902MB18019A87B3863FB6ABCC662AA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164363

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> Sent: den 13 april 2022 19:09
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH 1/2] ncurses: use COPYING file
>=20
> which has the same info as the in-file header used in before

That's not quite true. Please drop the last three lines of the COPYING=20
file that contains editor configuration and a CVS $Id$.

Some of us use the output from LIC_FILES_CHKSUM to produce a combined=20
license text for our products and any non-license related information=20
that is included then becomes more or less problematic.

>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-
> core/ncurses/ncurses.inc
> index a0ecd8a80b..8d374a1522 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "The New Curses library"
>  DESCRIPTION =3D "SVr4 and XSI-Curses compatible curses library and termi=
nfo
> tools including tic, infocmp, captoinfo. Supports color, multiple
> highlights, forms-drawing characters, and automatic recognition of keypad
> and function-key sequences. Extensions include resizable windows and mous=
e
> support on both xterm and Linux console using the gpm library."
>  HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurses.html"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://ncurses/base/version.c;beginline=3D1;endline=3D27;md5=3D5526f2f3a=
29edc95
> 538b368a4771edda"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df852913c5d988a5f5a2f1df7ba7ee=
893"
>  SECTION =3D "libs"
>  DEPENDS =3D "ncurses-native"
>  DEPENDS:class-native =3D ""
> --
> 2.25.1

//Peter


