Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0025B79670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 07:20:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b11-v6so2084637pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=45m45YkoTerN/hE/beVDBHtjoyZVsmp+L9dlTAjtC6E=;
	b=rI2eojqQ9jz4E7M7Z6UR3IDaS8nY1FEgzdc99vlrNA8aTaSVcexNLXfANwEaDrgOWW
	YL0UzW+ps4izxA2kP/A++dnHNZP60oLJmzW0XzGdn6AHyAFU1VueWoef92FFpwv/qicK
	4RVq1mLcAQ68/XlBSr/GIxdvmOykPAi+TBEsycPawHio+VpFscTGGDBO2+pS7fhFTadZ
	q3ljQxbxaTkAPKoHzJLpDsast9M/jqOrcokjtYLEjB0EkPzi7ZQZSTxqARuzceeTcalm
	S1BK+49Ae3NszKLeE26il3XkIBixyCKxMTUlSwnvW39EsyStkDDj+AxL9hoFACz80BQP
	8egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=45m45YkoTerN/hE/beVDBHtjoyZVsmp+L9dlTAjtC6E=;
	b=ejBQFUDxfqKlvuoYd/EB7a9C0j0kt/ll3FaguXciKR+PJuVKo0r716m2qk4UHbzlfz
	TbIzE76pMuG2uERJ7a7wPkAxe8HlUAh0pKrYAJotcOhvKUlXVsFD/I2DD4yaiFcgYirW
	2eLCVXXbNtA/uaiXL4/hjo8JtJ5XdyMCyQErXO9kGxR0WQH2QAKFIqUNUyy4bnqI6NRg
	GS+C9at7YtNHx3hn+1CUm/GWTZOWCappftv4mHqHshl5lTKaDvv7BsraPBwTgMkZN5ie
	YCFMn9p/HqYITEN3e7cyNuam02kMeMyf/2IUBcJEZ3MpqFKmQfnm08tTavmSY80s9wE3
	igGg==
X-Gm-Message-State: AGRZ1gI58Fluph66ZHc+gQ6N058AY/HR5clvqWAmGljS+d4vrcWsQBH6
	t+A1wS1gibGZbwr46qQgFE0=
X-Google-Smtp-Source: AJdET5eNgVw4F4amUbawnwrHy9wfGSHHwEEaFJj5of/ReYRTeOXWGOKxs+XpuL66lrDuDM8gcvEcrQ==
X-Received: by 2002:a63:700e:: with SMTP id
	l14-v6mr379721pgc.359.1540452059989; 
	Thu, 25 Oct 2018 00:20:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([185.7.230.213])
	by smtp.gmail.com with ESMTPSA id
	q26-v6sm8922130pfi.165.2018.10.25.00.20.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Oct 2018 00:20:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 08:20:55 +0100
Message-Id: <1540452055-22743-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] os-release: add more variables to list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2018 07:20:59 -0000

If someone extends the OS_RELEASE_FIELDS in a bbappend, it will cause the hash to change which is
caught by the yocto-check-layer

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 7f3d9cb..88bf8f8 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -12,7 +12,7 @@ do_configure[noexec] = "1"
 
 # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
-OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME BUILD_ID HOME_URL BUG_REPORT_URL SUPPORT_URL CPE_NAME"
 
 ID = "${DISTRO}"
 NAME = "${DISTRO_NAME}"
-- 
2.7.4


