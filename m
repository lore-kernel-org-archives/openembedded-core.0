Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0205CCD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 11:01:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17044.1781780479612142689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 04:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ePdAihp0;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6c101aeafso5188285ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780479; x=1782385279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nntNNKpgSL0O9JUDnsTFUr4gaRxI/DtgTaw2/DozeE=;
        b=ePdAihp0NghzFSGLqbinVLtTYVSPV3Jn+ZUGNANi62pVtlicx28KUHZQoq3d/QgHnr
         n9O8lO+dzT4ADifu3Id2WwV0gSa+Jzs52botc7MUmNuaCUaEGausedRAZPIkZ3dtAynv
         STTlJL+AgI2Cn29uEw56JBQ6kSjGhFf+UOfoiH8ZeR8XDOyv661Ngm8bkYIxJUumAkQa
         fnbXH+jC4SvElzTU0VrCktMYo8YDllRDu0D8Ytwa8vFHKN6irHKzPy3nmXrYi5nDT83Z
         YtXNoAPurFK2fTJVhoOFeh0YbRPFQOtCRY2b1oRqKRZ8hna0TgTtZhERIziDhq3VyZXL
         8Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780479; x=1782385279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nntNNKpgSL0O9JUDnsTFUr4gaRxI/DtgTaw2/DozeE=;
        b=TKadgs9JFsJ3JTNHh/u1ObjwNiHnQG6+yMBjRnHvv9/ZHJ3ipJO/UGOhLKmllgV+Vd
         ma8EL4JmNDc4pumotA5HRjPpkdp8gJmdBbIlk3vn8h0XTM9UeQKu1F4DdtRX99Ouu1iX
         /mUY+r0FvmHKhp3bGUsWQHyHc1CeEikVPkT7pf/s+kbdhGgKinNXHZYBAJn/gnkkeRTZ
         /+qnvZ3i5I6zmXe9VoOfENCjdb0vT/Sh53OjDMZVctGp0OELuyGPncBDbrE8q8kfs7i9
         M5dtAIbvwjqzcuCRjPk8Qe9HOnz84cMbcz7KZJERDjjbD2eFLxB+fsRx5Z2bxA4i3+EE
         MqOg==
X-Gm-Message-State: AOJu0Yy0/3FPF/UEjIs9a+JLXWnPPXTlushG0a153ob5zxulLV6vrrRB
	EV8FDL24Cvg4XN4Rzr/TwDvmvddNx/tYKpXSAZ3b7R0F4diqgvfHNnJAg7e0poU8ak8=
X-Gm-Gg: AfdE7cnSyd/+iAhGe3s43Od1VIYijTiwpgm1z12GuNIIszWbpqky/EIHGd5vcee056V
	4WPI7zU+3yOQKbi60ABDYOuMsVZMRI2D83s0WtA+Fe3URlwtTM9FFHh9so5RGyF2qzz/Xp/kMRZ
	FaYv+gAZb5nZznMQErTFZNcwxQLY53nvkadJiVOyp/LQwQ5cB2Ju+jiC6/79z3Bifll13biCw5F
	KCjfKMRnNyzVVSVfMYFXJXC/XDcyT0g+JbzIaRF+jouHmHmNnpKJBS8nMxntm5RBfh8FC1S40lm
	q6qqkWFCyV5o5LXg+ijKaj8sQY3ay9HW3wf60eu6UxRH1MpgmlzsLWD/kOVrZWYcucOQs/imF3U
	PscMx98OulS5PrW7jnoRCFRAzGy1M3jod4O1eUNLDnEtHX9yyCoz8NJAFxH5gAi3pCbPqW4RLkE
	D5rbN2Fq1/5wprqwQ+d7A1u+iQm8IUsLdwCMA7TEaTVofwAD88WpwCueX2bORNhzE+ig==
X-Received: by 2002:a17:902:f687:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c6e472f354mr36995115ad.1.1781780478831;
        Thu, 18 Jun 2026 04:01:18 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.90.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c700bee8d0sm12281085ad.9.2026.06.18.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:01:18 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH] sudo: fix pam-wheel sed pattern for updated sudoers format
Date: Thu, 18 Jun 2026 16:31:11 +0530
Message-Id: <20260618110111.3484982-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 11:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239075

Upstream sudo's plugins/sudoers/sudoers.in changed the commented-out
wheel group entry from:

    # %wheel ALL=(ALL) ALL

to:

    # %wheel ALL=(ALL:ALL) ALL

(an explicit runas group spec was added). The do_install:append() sed
that enables the wheel group when DISTRO_FEATURES contains 'pam' and
PACKAGECONFIG contains 'pam-wheel' still searched for the old pattern,
so it silently failed to match: the wheel group was left commented out
and never granted sudo access even though pam-wheel was enabled.

Update the sed pattern to match the current upstream wording. The
trailing "ALL" anchor keeps it specific to the plain entry and still
correctly leaves the separate "NOPASSWD: ALL" wheel line commented.

Verified with a sudo build (DISTRO_FEATURES += pam, PACKAGECONFIG +=
pam-wheel): the installed /etc/sudoers now has

    %wheel ALL=(ALL:ALL) ALL

uncommented, while "# %wheel ALL=(ALL:ALL) NOPASSWD: ALL" stays
commented.

[YOCTO #16321]

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 7dfa0cef6c..489c0db09d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -37,7 +37,7 @@ do_install:append () {
 		install -D -m 644 ${UNPACKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 
-- 
2.34.1


