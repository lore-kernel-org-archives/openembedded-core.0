Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13831.1795510051713318249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=s6+ZBI12;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso3877621c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510051; x=1796114851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWNObwyxfe+vx9nIw6Tl83xqFTwauAXFOQIZ7+m0USk=;
        b=s6+ZBI12W/SuysJrF5xF0Q4Ly3YHWfSJ/RStD6FPVi6cDmmWfK7zvcdUyODWT74wGx
         UmzJDdrQmtGVDSlJU2ApJBgJ2XqcpCbM/Jo/JiZ5qI2igXJpheMk6AudtyBFxOizlBth
         txwwAMHbXYTAWgpO/R4P80VddoAb97dU+jN5HUWPblLyozP4LqT9d0QQPlqfBxjyLnBo
         oIlU5J61Fdxxr1HNF2N2sbiSdYmWnV79ay9Zd/GKP9exlN4HfRl6Oz4g8K6k7LPvG9wR
         rPAsYEiCG55vp92S1C6Lq33dQ8poguHm6V+mLWpPLdNVtGRgKm9ScvkiTv4AS4EMhs0E
         FjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510051; x=1796114851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWNObwyxfe+vx9nIw6Tl83xqFTwauAXFOQIZ7+m0USk=;
        b=eJ7AJ+NcemC4++c/HS2VZ5tjtZPuX8IZ7Q/7UgGblZmmr6FTwfVh5iH1dkg/mk2aDi
         vye4o+or5y5hOdmXky20wTXEUPXuO4ipg6o6fd/9ABOz3dqoOoQ8JQBpWXprBI8XaDek
         /hHDIAMv59r4f4Vq8kyIZl31fQaV86S66KHoBXe7+ekbSbCMnxWOgGKCfK17nHRJC+mW
         ZybnQLYcfpoy8glJYxJdm/Krsscd/n/U3ak7oJb6JIF+6VkP9Vdf/fgdWYr935UrYCGW
         QCbD5zKaLytEht0KKxRVu8Q5cNAIkwOyI95Ol+CXv+QkUY9piahMgB0dtt8e6y81/xU2
         jEtg==
X-Gm-Message-State: APuU4Z80umlArQ336kad90QGSBi32HSGo02npiBov3+jXXA/VNc0IkRn
	HXoWJEN5OgcfYmvAzSYC7Qn2LEkulx6DPtK+mA8DSPuCuYigDQRJeyzPBIkRn03Z
X-Gm-Gg: AZFdTZfKsYcB/dXykhUenJbDxvKO0szlO9H/PqNXbBMnMrGbxumk729WQItugPfB0eU
	E6jIfAU6lrAo/BlYASwST8wgX7qx1fzY7gX09nUp941UMHWDfBb/JjM0OBQCcQRqYa6+jvq/46e
	IhL3/0ciKRUsRPOjBZPVxz1ae0F62l2UZiSdzQCCUCKekd3GGjTnZj19rAt/FLnC3Ax+sro/BcV
	bq2QDqepGRG1eGiT4UTVFmc/1nn+HhIA7clGamsDsERQTmN56p0RiY7jLtdrHmgI3okHrwAiAgz
	lgYguIdiWWWp3C3U0b9rplkm6lhdUcc3wpeUneo69kMltktmEQlf1ixgndY3fZpB4/YCX7WdOcX
	WX2usNbGTQlOzrOyhraY4jmUfzQfeTdkONF2r+LM2LDvoe0GN1vIBLE/EtWYAH6ZV2ZFpSKaA39
	XlXNLQX3ThphmupUP4hmYo3gVcbnJEU8+F2VoQDE++BGxbQnjekMNpwRFUhSCoaizQg5+HZYdrU
	ovvAGVX6PRo7+oedTYmUzrORhpT4m7fZpV39/IgLqqvqGGdt10Uyq2Do+7Ay4R4jLjs7V2Ydd2S
	UC/VIYKq2Bunv3ZTr5ddROmnifgPeIy7vZNVV8CHgxShKsM2Me3FWiYPO7uLuF5WLflXhn26C3q
	9+/9va7k+HCWLRp4uSEL514nPJ6ZS6Y112poAYUzuQXHKfrfELyaBYcvv/qZw75fzVzwBIE+w6a
	sG+AySm8NoJY0dB2pUVF46zyOAIUu8A2RFF/lKa0clyKVQnr6pFL4HfWeDcxBOvBc/DrWh3YxDt
	zJ0YHk6LtiWAINrlf52EqI2GOu+7sqbQN1TwteEOHHuNnViV5mLgN2Ji1x136DsaIbzodtoZvV5
	Vjku
X-Received: by 2002:a05:701b:42c6:10b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b55690919bmr16610246c88.31.1795510050843;
        Tue, 24 Nov 2026 00:47:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm38101035c88.13.2026.11.24.00.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:47:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] ptest-perl: Run do_install_ptest_perl before do_populate_sysroot
Date: Tue, 24 Nov 2026 00:47:27 -0800
Message-ID: <20261124084727.2388995-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250978
Content-Type: text/plain; charset="utf-8"

do_install_ptest_perl changes ${D} after do_install, but it is only
ordered before do_package, so do_populate_sysroot can stage ${D} at the
same time. Recipes that remove files from ${PTEST_PATH} in it then fail
at random, e.g. libnet-dns-perl, which deletes t/00-install.t:

  cpio: ./libnet-dns-perl/ptest/t/00-install.t: Cannot stat: No such file or directory

Order it before do_populate_sysroot too, as ptest.bbclass does for
do_install_ptest_base.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/ptest-perl.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-perl.bbclass b/meta/classes-recipe/ptest-perl.bbclass
index a4a9d40d52..64c1590597 100644
--- a/meta/classes-recipe/ptest-perl.bbclass
+++ b/meta/classes-recipe/ptest-perl.bbclass
@@ -23,7 +23,7 @@ FILES:${PN}-ptest:prepend = "${PTEST_PATH}/t/* ${PTEST_PATH}/run-ptest "

 RDEPENDS:${PN}-ptest:prepend = "perl "

-addtask install_ptest_perl after do_install_ptest_base before do_package
+addtask install_ptest_perl after do_install_ptest_base before do_package do_populate_sysroot

 python () {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
