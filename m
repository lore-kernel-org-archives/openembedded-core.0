Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0197BC48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:04:39 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.19292.1708016670257451856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=SyOoGaXs;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C08979C473D;
	Thu, 15 Feb 2024 12:04:28 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id s6eCzPyiq6ko; Thu, 15 Feb 2024 12:04:28 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3BE4B9C4607;
	Thu, 15 Feb 2024 12:04:28 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3BE4B9C4607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708016668; bh=OhQaC7ySYlnOOLXtSHjhMyzrs/GgEdQUh86wRv9/3Bs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=SyOoGaXsn9ZuySaQaG9yPAluTG+HyoJnzNZjO77bnGnb06VW7NzsoufcOvXZoecNZ
	 8wwCO1bW2OX4Cx1xU5mCWLbfA9FlWKqAxPm/j6kD3DCWC6w5eOCvURztPvk3T8fcwI
	 /FUrxvxDviHU5wMTW9L9ZAu3m9VPnjZfjxPXrEKA5+Vcgqz0gSXQK69ufRqw1kxyMq
	 hf24qAeslltmyaTbItXWl7m54CgohNqV9TkCydH4oA9Z5aXai0Vu/NnkYnEpkjXOtk
	 w5a6rYqpNgB9lTRQpUfCWowS1PUAue4zM9UBIglQXpXImzhXpJYcnZetNgtLLbzRpT
	 CHwcGPZvZj7vw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BXm09E3LTh_I; Thu, 15 Feb 2024 12:04:28 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8A9339C32FC;
	Thu, 15 Feb 2024 12:04:27 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com
Subject: [PATCH 0/6] devtool: ide: Improve VSCode support
Date: Thu, 15 Feb 2024 18:04:16 +0100
Message-Id: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195549

These patches improve the VSCode support in devtool ide-sdk from
Adrian Freihofer.

I added a generic C++ configuration for the VScode
extension while awaiting for autotools support.

A refactoring is proposed for the meson class. Without absolute compiler
paths, the linter inside VSCode will not be able to find the
cross-compiler. Let me know if you have any concerns about this
refactoring.

The other bug fixes are relatively minor and make the tool work for some =
edge
cases.


