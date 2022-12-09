Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AADC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 07:31:07 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.7799.1670571061510397044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 23:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eA9uVlmz;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670571062;
  x=1702107062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L6DSY6McbsE6F3VIs0qQzWrBg2tC472zPUacLSDDk7M=;
  b=eA9uVlmzO1KHc7/gB41612Bq9BbeA03tLw4pgVfk5M46C2gj1hF19xab
   QfKU+cmgsOl3VeT7KvJospl6qX3XURwqmevc460n7R0/zH6cMdl3Uae/L
   tqhsh8kX9Eq/t+1oWc8Op23Q5XsaO9oScjWzQDE08RhI5WMiXKp6ljmo/
   hXx8AYd9go6c7lAnHBvv1JFRpKHaGXTK6OQrIPkpmXlnUM58lvOCr5VUC
   TIjrNw2UUGE0tDSQRIJ2+ZiYAgdeaiU2RyTfSUy6kjbp1H5sRw/vX/96G
   yLS5nsYHI+Ix8vlXhx+hLqsT2IgKloCraZ8h258N87diWAqAUWa3NozfG
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Manoj Saun <manojsingh.saun@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"narpat.mali@windriver.com" <narpat.mali@windriver.com>,
	"hari.gpillai@windriver.com" <hari.gpillai@windriver.com>
Subject: RE: [OE-core] [meta-core][PATCH 1/1] libksba: fix CVE-2022-3515
Thread-Topic: [OE-core] [meta-core][PATCH 1/1] libksba: fix CVE-2022-3515
Thread-Index: AQHZC5VCHpfxuTSUY0yBN2gsPLGE/q5lJ2yg
Date: Fri, 9 Dec 2022 07:30:58 +0000
Message-ID: <dfdfacc4e5204530b07e1817dcd21e9c@axis.com>
References: <20221209061130.3794053-1-manojsingh.saun@windriver.com>
In-Reply-To: <20221209061130.3794053-1-manojsingh.saun@windriver.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174435

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Manoj Saun
> Sent: den 9 december 2022 07:12
> To: openembedded-core@lists.openembedded.org
> Cc: archana.polampalli@windriver.com; narpat.mali@windriver.com; hari.gpi=
llai@windriver.com; Manoj Saun <manojsingh.saun@windriver.com>
> Subject: [OE-core] [meta-core][PATCH 1/1] libksba: fix CVE-2022-3515
>=20
> libksba: integer overflow may lead to remote code execution.

May I suggest using the above as subject instead of the current subject?=20
E.g.:

  libksba: Avoid integer overflow that may lead to remote code execution

It is much more informative about what the commit actually does than the=20
CVE number. The CVE reference below should be enough for anyone looking=20
for more information.

>=20
> Reference:
> https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html
>=20
> Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dl=
ibksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b]
>=20
> CVE: CVE-2022-3515
>=20
> Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>

//Peter


