Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DF8D1266F
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14083.1764566269966864716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yNGcacJS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oGTDnlxj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad858afb7-27f52e30-0969-42f6-a5fe-9ca4fc2395f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pv9TpbUNPGF90eW2WI+46ULzZPVUVT38xGSpDmYEVmo=;
	b=yNGcacJSqNpGfswKWjtPKXj9uZzmMg94kHHySXtR/T2r47pu4AYcpiuIqwcyhQkg
	ONHOrqLcfUz7l8QU2OxLtR6O0YHVIKLlIFW8oI1sFZBx6oxbY6navePn3ibQ+qj6c4H
	+wlm2u8F9jQqFNLjoBi9WQdbZ8vbXHtp2K92wd7A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pv9TpbUNPGF90eW2WI+46ULzZPVUVT38xGSpDmYEVmo=;
	b=oGTDnlxjMeiNRtyrqjd3vrhYzEUcGGkMOP3CKf90qPvGI9PeQO7d39LiBc7CMDg9
	urP1eUpnCFRJVyHyEE5LnJor3nRi4+AjOHdCiHahZtu/k7bbUm409U97BQ81SVNeE+Q
	hH+4t+yfOEqVGbKsPedQ1NKD8nSWFhR4GzPtAyZk=
Content-Type: multipart/mixed; boundary="===============0324163753900383766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.10.0 FAILED
Message-ID: <0101019ad858afb7-27f52e30-0969-42f6-a5fe-9ca4fc2395f8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227016

--===============0324163753900383766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.10.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pyproject-metadata' failed
NOTE: Reconnecting to bitbake server...
ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has already got an assignment.
Please either disable the fragment or remove the value assignment.
To disable the fragment, use 'bitbake-config-build disable-fragment machine/qemux86-64'.
ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py", line 262, in fatal
    raise BBHandledException()
bb.BBHandledException




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0324163753900383766==--

