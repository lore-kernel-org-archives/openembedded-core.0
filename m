Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.7315.1617200615069199081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qI51OJrQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200613; i=@fujitsu.com;
	bh=dUzvidUHGoLbTHbH7Z42S6RmAckkNHWAi8qD2sq4L8c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qI51OJrQZUt472PYWlxgKSC6PihKVYwJp8aHP8naUvecsiJ4N2/2vqL3SGa5zwZ6n
	 LrmhLnvmMAybUtriniGWTerLv0TyjYaRVgSLbUY0BlJqW0rwaGuPRnzTUqjwjEAnIX
	 IguyKMBHFQTrja6KandAVZmJ7ubqLaEBo9KrSSUV+ZNBHGclmvP0gpCzTfClBb5BS3
	 h6FuSQLW7L9DN5tcD2uxOV5OSXRN84PYzAtl+co01gQScA9SNJJMYM/tvE4aIMugXt
	 0h+AxGDbaeQqZwxRKR7N6gHCczb9Bki8I3zjOZhWZb1/zQEUS8VxOtDXaA8rbqcKO4
	 9arKHzYQfNCUQ==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 2E/C0-56778-5E584606; Wed, 31 Mar 2021 14:23:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRfdpa0q
  CwduzjBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJI7eYCx5wVBy9eZy1gbGBo4uRi0NIYCuT
  xPlt15ghnBOMEs/nzWTpYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQWxhAQuJC
  89XM4GUsAioSsy9Hw4S5hVwkng8dSMjiC0hoCAx5eF7Zoi4oMTJmU9YIMZISBx88YIZokZRYv
  blZhYIu0qi88NxtgmMvLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoSUQG5vqJVb
  pJuqlluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgQGV0rBgfYdjI9ef9A7xCjJwaQkyvvIPiVB
  iC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvghagnGBRanpqRVpmDjDQYdISHDxKIrwewGAX4i0uS
  MwtzkyHSJ1iVJQS51UDSQiAJDJK8+DaYNF1iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw70
  aQ7TyZeSVw018BLWYCWnzlUSLI4pJEhJRUA1P8gq1SSkwzgxNSflyTKNF2F5qS+nH+jq+/j/1
  2fvMsIKig7sJWzknGzzY2Z3xa9zzMIirr2PJaf+kDBksZtJaolSp8jp5mWvHIffaLZwEW64rU
  kvU+RtwT2ycqf87KiMnnz+Y5D34vWMjl8G87m/ChHbedbWtiJKJm83JYnr+VHvbwZGKG35PwL
  79CDIqsp6g9K7/qfmth/KOVvUJc098e4nUSW3vrkVud4iS2zwvf117o3PP1pM5uz7CFVYqGK+
  RLTrM163MX7193Izopfs4pm/RFmS0T0qMzTlu/uxFxwef9eVcna8NrMpfL5kpEdmYs2dA60by
  tTeuRQYahe8KaGavmrWA+eeNzsEzHsTIlluKMREMt5qLiRADwOwRtKQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1617200612!434105!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17416 invoked from network); 31 Mar 2021 14:23:32 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:23:32 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VENW8T001100
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:23:32 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:23:30 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gcr: upgrade 3.38.1 -> 3.40.0
Date: Wed, 31 Mar 2021 22:23:16 +0800
Message-ID: <1617200599-62127-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gcr/{gcr_3.38.1.bb => gcr_3.40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_3.38.1.bb => gcr_3.40.0.bb} (93%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.38.1.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
similarity index 93%
rename from meta/recipes-gnome/gcr/gcr_3.38.1.bb
rename to meta/recipes-gnome/gcr/gcr_3.40.0.bb
index 563087a360..64a1195aab 100644
--- a/meta/recipes-gnome/gcr/gcr_3.38.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -17,7 +17,7 @@ GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 
-SRC_URI[archive.sha256sum] = "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
+SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
-- 
2.25.1

