Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7CBC5475B
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 16:55:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.45894.1708361735159043229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 08:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=RoPbvOe+;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4B76F9C4957;
	Mon, 19 Feb 2024 11:55:33 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1g0Fz5GB-NIO; Mon, 19 Feb 2024 11:55:32 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8E8AD9C3422;
	Mon, 19 Feb 2024 11:55:32 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8E8AD9C3422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708361732; bh=jhTPGeN+ljb4EElOdjfw4JeJ8H9lsAMLDgVrNjEhupM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RoPbvOe+AJWogGtqSto/OsBRSwUe8IsFrJGnerOE5KNQlpRoMspS1iZm00o/KLJ9T
	 Nt3kfePPSUmmcO67bCPXQC14vIPS5SVY2f6ki+gUx/5WoLEmPZft7BISNshbcN/Xuo
	 rKlhtpxXE5xQ6Shw4s5i62V8UaOcvDonEJgyhDq5pwgjJxLcHbj9WVphFOekDnBuoq
	 rxXRsIsPQDV3edoXHcFiu5FV4OAgPRzD/8itpiCgYbMj+dq2XvGaYuKiuMhNORZw0U
	 wePbo6UDUm86HZ5GBRJcwG6omyeFMy+OJUypcLWHjPo8fW6l/8GDWS9L1RHjPRkRnb
	 ScclOWATXxVCQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id plFApMFVZ7YB; Mon, 19 Feb 2024 11:55:32 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D5E669C2A2B;
	Mon, 19 Feb 2024 11:55:31 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com
Subject: [PATCH v2 0/5] devtool: ide: Improve VSCode support
Date: Mon, 19 Feb 2024 17:55:20 +0100
Message-Id: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195885

These patches improve the VSCode support in devtool ide-sdk from Adrian
Freihofer.

I added a generic C++ configuration for the VScode extension while
awaiting for autotools support.

A refactoring is proposed for the meson class. Without absolute compiler
paths, the linter inside VSCode will not be able to find the
cross-compiler. Let me know if you have any concerns about this
refactoring.

The other bug fixes are relatively minor and make the tool work for some
edge cases.

v2:
 - Added signed-off-by mentions
 - Removed duplicate topdir exception fix
 - Added a condition for the generic C++ configuration (matching autotool=
s)
 - Kept the source mapping for debug source as it was required to not ope=
n the
   local files instead of the read-only files in the editor on some
   configurations



