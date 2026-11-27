Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15251.1795783630731338019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 04:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=VZHcZCdw;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795783628; x=1796042828;
	bh=YRoeim333V2QGu7IrkC8kKMllLot9qBU2+8x2SZZdCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VZHcZCdwAFfIAWKqA3USRVBQX5z4xq7Loy0IpfovTCQnsIMBG8sFIfiswDTuzjBPY
	 lyk8SzyLkF/DvwSeYovOiTPvoy9RyaFRHh5q6HF2zNip+gzBHf6FGrFJkU7wnPEneO
	 ZF/DQLU6FihjZx1TjOQgRWMqcWn9rDyZK77PAR/VG2bLUOdpVSPDisxcS66WZmjVn7
	 9LQuSIcIXgII6KPm7QbkNfL4xCAfWrtviyhz1eeBiNV+IUv3/RGS5mR1zUMQq4U6C4
	 Yp7a64VSfM7L824FKxVKEzAwfbWjMR9FEzpF7enxPAm6rUu+cmtY0eofVFZNkr4ntI
	 PFLaKYwhjhdCg==
X-Pm-Submission-Id: 4jbY8S5XNLz1DFF9
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 2/2] documentation.conf: add do_rm_work_populate_sdk doc
Date: Fri, 27 Nov 2026 13:46:41 +0100
Message-ID: <20261127124657.769093-3-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127124657.769093-1-sean@geanix.com>
References: <20261127124657.769093-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251386
Content-Type: text/plain; charset="utf-8"

Document the task added to rm_work.bbclass for cleaning up the work
directories of the recipes do_populate_sdk depends upon.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 2a3c7f80a2..02de0b6a24 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -42,6 +42,7 @@ do_populate_sdk[doc] =3D "Creates the file and director=
y structure for an installa
 do_populate_sysroot[doc] =3D "Copies a subset of files installed by do_i=
nstall into the sysroot in order to make them available to other recipes"
 do_rm_work[doc] =3D "Removes work files after the build system has finis=
hed with them"
 do_rm_work_all[doc] =3D "Top-level task for removing work files after th=
e build system has finished with them"
+do_rm_work_populate_sdk[doc] =3D "Removes work files of the recipes do_p=
opulate_sdk depends upon"
 do_rootfs[doc] =3D "Creates the root filesystem (file and directory stru=
cture) for an image"
 do_savedefconfig[doc] =3D "Creates a minimal Linux kernel configuration =
file"
 do_sizecheck[doc] =3D "Checks the size of the kernel image against KERNE=
L_IMAGE_MAXSIZE (if set)"
--=20
2.56.0

