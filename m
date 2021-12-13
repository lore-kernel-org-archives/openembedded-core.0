Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D52C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:31:11 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.11142.1639402269911478192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OiQLGskd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639402268; i=@fujitsu.com;
	bh=2G3Elcxpdmk5wm2vs/mn9Z/KEGoIWMonB/M9pzq5Up8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OiQLGskdLfeYYpTj770Hb8liLjEyMwiRsW3wka0iqzgVfDKrwlwli6xyBJyfDiDCG
	 82E85o3M6MAmYSJS3B3QhXu6iKDQctqXUls+SjS0HDG1k34Crs0/7jlMyx7/kFyPkx
	 6Y2YdAYAp+l7q74RMukOUAIpUxNHQNFrxt+Zm0tjrZUk+zLcIop0XG5kSbe8dSFNNh
	 rZ2xFa/oW+rifOPqcGaSGBbVVlCqKtnmFsxjVFwyNLAqvJH2qQ5YV+1LpDVEYTGy/H
	 pwPvaFW3dtbBG193muBaxZpdGebT5HtR/KaaZgRXQBORbmNSheVOJ4dtHdR4NXAAIY
	 m3DAF0ZfvArvg==
Received: from [100.115.66.58] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 2D/6A-24146-C1B47B16; Mon, 13 Dec 2021 13:31:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeJIrShJLcpLzFFi42Kxs+GYoivtvT3
  R4OM2bYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP/G5WCLZwVXS+tGhgPc3QxcnEICcxgkpg5
  dSYLhLOHUWLj54VMXYycHGwCuhLnHq9l72Lk4BAR0JO4+k8UJCwsYCGxePdnZhCbRUBVYsLJ1
  WDlvALuEpP+f2AHsSUEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULZpCREgKKErOny0OUV0i8Pn
  yJeQIjzywkHbOQdCxgZFrFaJdUlJmeUZKbmJmja2hgoGtoaKprbqhraGmgl1ilm6iXWqqbnJp
  XUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMppRi9307GF/0/dQ7xCjJwaQkyhvMuj1RiC8p
  P6UyI7E4I76oNCe1+BCjDAeHkgTvb3OgnGBRanpqRVpmDjCwYdISHDxKIrzunkBp3uKCxNziz
  HSI1ClGRSlx3hcgCQGQREZpHlwbLJouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmTXYEms
  KTmVcCN/0V0GImoMWMlZtBFpckIqSkGpgWizdZ1Yc3r3uWtuNGWc2Zaa11qXeXXm8I9NrjyXt
  P+cp/p22VfNWmmw7UFellef5Y+/rhgvzapZeKfIxf/i7+pL/Fm3mJ58wvgnwT5lWUvtwTLbxb
  2nNmX+46cbVZDD7M7FMZzv6dyinOwVtgO/PwwY/VLjl5gnF6/WsTfvxcJS//2EuxJXUDs8kKr
  iw9/9pl6zesWnR+vbDAjaT9kmpr7j+NnX34e9LB6RNu2je0i9jI3PbIYrvA9fLhZPEqMXP1uM
  vnUvU3n93RfWP53IwFOfHBNt0f/nV9Zy7Wf1RSwfrLMWjjDsmzjBYKyxXdlffUc+Z55M3p4/m
  elvby37dDDrbVk3k2+D18efb7p0NKLMUZiYZazEXFiQBiJ82dIQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-532.messagelabs.com!1639402267!8542!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15330 invoked from network); 13 Dec 2021 13:31:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:31:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BDDUoVe000748
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:31:07 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:30:49 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] vte: upgrade 0.66.0 -> 0.66.2
Date: Tue, 14 Dec 2021 06:30:44 +0800
Message-ID: <1639434644-2717-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:31:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159634

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-support/vte/{vte_0.66.0.bb => vte_0.66.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.66.0.bb => vte_0.66.2.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.66.0.bb b/meta/recipes-support/vte/vte_0.66.2.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.66.0.bb
rename to meta/recipes-support/vte/vte_0.66.2.bb
index 6676b7feeb..86674cc939 100644
--- a/meta/recipes-support/vte/vte_0.66.0.bb
+++ b/meta/recipes-support/vte/vte_0.66.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
-SRC_URI[archive.sha256sum] = "d0813ac00fb1d74d88851e765f755d496c83e097097358ea1baadb38b37b7b33"
+SRC_URI[archive.sha256sum] = "e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.25.1


