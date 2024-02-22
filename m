Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F12C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:30:26 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.9901.1708597817408732835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=wR+ub3uU;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C630A9C45BF;
	Thu, 22 Feb 2024 05:30:15 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id jQB9M7IvrHC4; Thu, 22 Feb 2024 05:30:15 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3BA039C489C;
	Thu, 22 Feb 2024 05:30:15 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3BA039C489C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708597815; bh=WQ9u4J40Mq8ChFsEajT/cADULlhQasmSgS59EF/6t6c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=wR+ub3uUb9hr6a4ixjX2QOsisOqaB1RF1GAgY+KheuwpkDSwXVejW7z1V0OqTC91Z
	 LDZN8iVDUIc1p1z6UUwpVPdONfzEvIX0bCzxwa58WfQK/8xvx7hvmzdFIJuDXu0PF/
	 1NSc6+EB2fizz7e2SbwPinzV5DpICBvtUGfI5rhQ6cJ7Bm32fR6c/c9p1jbG1XIbyT
	 L7MrB56PMVoPYHMF05ppzKwYTKncxh/zMHpoK4lrroQkz6QyXBc6fLShV66OwHhS19
	 UieGB4Ql4lvB5QfYzarBpVeCWM6stMCYWLHeQOYAED/BwEirP31nQezTwE0nsWcbIB
	 4iKmQrymZdGnA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id M4RgKhXwexz0; Thu, 22 Feb 2024 05:30:15 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 69CAF9C45BF;
	Thu, 22 Feb 2024 05:30:14 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	richard.purdie@linuxfoundation.org
Subject: [PATCH 0/2] devtool: ide: define compilerPath instead of using absolute paths for meson
Date: Thu, 22 Feb 2024 11:29:54 +0100
Message-Id: <20240222102956.346542-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196008

A feature in vscode-cpptools was just added that allow us to pass the abs=
olute
compiler path through the devtool ide-sdk generated configuration. We can
revert the meson.bbclass modification to avoid any potential issues with =
using
absolute paths in meson.cross.



