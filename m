Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFA9C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 19:15:53 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.52502.1673205345682145665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 11:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id A735120B8762;
	Sun,  8 Jan 2023 11:15:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A735120B8762
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/3] baremetal-helloworld: Move from skeleton to recipes-extended matching what rust-hello-world is doing
Date: Sun,  8 Jan 2023 12:15:24 -0700
Message-Id: <20230108191525.1312582-2-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108191525.1312582-1-alejandro@enedino.org>
References: <20230108191525.1312582-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 19:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175637

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-example}/baremetal-helloworld_git.bb                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-skeleton/recipes-baremetal/baremetal-examples =3D> meta/rec=
ipes-extended/baremetal-example}/baremetal-helloworld_git.bb (100%)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal=
-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-he=
lloworld_git.bb
similarity index 100%
rename from meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-=
helloworld_git.bb
rename to meta/recipes-extended/baremetal-example/baremetal-helloworld_gi=
t.bb
--=20
2.34.1


