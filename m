Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E6AC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 13:39:40 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.26174.1647265167999233992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 06:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YMJQMCp6;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647265168;
  x=1678801168;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=vnXCz/EZKJX27UPv3O195QHwmJiCggOavf1qRgLeJBw=;
  b=YMJQMCp6hRYZfBW+3SmWedaAhLClZv9RmgjWTFQWW6ubWahu2k8xQIJw
   dE9h9Iqu2RUKMqORkEGZwmCyK2QgyGFJCq28YZHvMnknH+1qYTmPiikeF
   6TRTy26M/QByXtydMOVcb8mUeWrFq4dwrbtFIexWFsUBVdl8XvYYOYNsq
   rc6svQ41PFjgKsNRWH7Rw29ovRaNHCVDgOZ96bshzRHITdYACZ7jnf0Os
   vCWoYVvjy5iVd5I7scauHjhGZ4bgFzOxvbXw0TemYPIBA8GpSQJAExPmT
   gspCOND4ifZylZJkTDog/bBW13GG/9z1jeDiig7KwbV/1hmg4M59uDDNj
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Subject: Building python3 without readline fails for Kirkstone
Thread-Topic: Building python3 without readline fails for Kirkstone
Thread-Index: Adg3qCNDhtoo90H9Tum4/+Umwa0ebw==
Date: Mon, 14 Mar 2022 13:39:25 +0000
Message-ID: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 13:39:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163138

We have readline support disabled for python3 for target. It works=20
fine for Hardknott and Honister, but fails for Kirkstone with the=20
following error:

  The necessary bits to build these optional modules were not found:
  _curses               _curses_panel

The problem can be recreated by adding the following to local.conf:

PACKAGECONFIG:remove:pn-python3:class-target =3D "readline"

and then building python3.

Any help to solve the problem would be appreciated.

//Peter


