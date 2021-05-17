Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.19579.1621260898671917955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=N5/GoWL0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id t193so4750887pgb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iWfYSP6zs7jy4uwBJP0o9YzakWk68ejy2Tlh2UMaX9s=;
        b=N5/GoWL0t0vixJlu7drUmy5M0+EGRChSHAw3cknYLT2pwwyFkNBf+wWmqmpgrD4814
         p+MvckpGjJHRSue92kFGQYaq1MWXIjne+ExKSi+8NaR6pgDAh3XZuae0++hhkM1iXn4z
         wu/vC/TI+sgPGHU8guM0k74Ebt9P+TXFoUEUI5PMKSu8771NLPIRVdk7xEuq506FX7YX
         lFEB061ek/k5j/1160f3CgzExZBJiRTaB9jyii8wlxxQKwa2wLQOcg6kQa/GrItNYWDQ
         iz0VRZoHoT3n7wX6voFw7W0NWcR6zPWavDHZWlIGoYB1WNMgTZhscZN5MeB3fKstXgHo
         oqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWfYSP6zs7jy4uwBJP0o9YzakWk68ejy2Tlh2UMaX9s=;
        b=KTY6r8uvCBxPB6qM0UPVcMMDKiKH6bg6rKX55kUv1Qd9USCOhejEQ6FMXgnNbFY6u/
         j+WKB4o/JYvBHU/Giqzc//qKX1zOg5LsubnG85vQG99s8D0iVvC3dwGOAuKsx1yBJ/5p
         HkYdc9dk7nJXfHPp1SNfj2fCvuDCfpmnDuA6xkmPFGYu5pehmkt0XKBJIM1S02i/wudG
         NO7brxOltJ+oVkbM7gS2jaf0h2mGgD5kID8Q26CuGi7y/hL+SFvZctj9Obs/n3iKtcR6
         e/ZTVQZ1Zia79nRLpE6+/DLr4pXVie0oitvnSqTmgW9/oNJUuuZXJ7gY9VFchYQLVVoU
         8yzA==
X-Gm-Message-State: AOAM530rLLRlIrbkibW0rgb0bHYcjNguJBJ0yVWlTqBUnhRLKiHnyXSF
	4deDpTMF+tSStyQKMJeFGz4kiWqwOYmbANsB36Q=
X-Google-Smtp-Source: ABdhPJxk7Is5NVs1x4Sbu2+jyspypGPCIyduHk6390jASm/yWZvZH/8sg1nbZMGeGyM29VJSWdA2nA==
X-Received: by 2002:a65:6844:: with SMTP id q4mr61815192pgt.224.1621260897671;
        Mon, 17 May 2021 07:14:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/35] lsb-release: fix reproducibility failure
Date: Mon, 17 May 2021 04:13:33 -1000
Message-Id: <a5f34c7a95d227610ed9b6047ed53f43f84cbba9.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

Make sure help2man output is reproducible. Fixes:

| .\"·DO·NOT·MODIFY·THIS·FILE!··It·was·generated·by·help2man·1.022.	.\"·DO·NOT·MODIFY·THIS·FILE!··It·was·generated·by·help2man·1.022.
| .TH·FSG·"1"·"April·2021"·"FSG·lsb_release·v1.4"·FSG	.TH·FSG·"1"·"May·2021"·"FSG·lsb_release·v1.4"·FSG
| .SH·NAME	3 	.SH·NAME

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49371207a7f1fe3d3feb7b8b9aabb62b43ae34d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../help2man-reproducibility.patch            | 27 +++++++++++++++++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch

diff --git a/meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch b/meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
new file mode 100644
index 0000000000..f32cd18370
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
@@ -0,0 +1,27 @@
+lsb-release maintains it's own copy of help2man. Include the support
+for specifying SOURCE_DATE_EPOCH from upstream.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff --git a/help2man b/help2man
+index 13015c2..63439db 100755
+--- a/help2man
++++ b/help2man
+@@ -173,7 +173,14 @@ my ($help_text, $version_text) = map {
+ 	or die "$this_program: can't get `--$_' info from $ARGV[0]\n"
+ } qw(help), $opt_version_key;
+ 
+-my $date = strftime "%B %Y", localtime;
++my $epoch_secs = time;
++if (exists $ENV{SOURCE_DATE_EPOCH} and $ENV{SOURCE_DATE_EPOCH} =~ /^(\d+)$/)
++{
++    $epoch_secs = $1;
++    $ENV{TZ} = 'UTC0';
++}
++
++my $date = strftime "%B %Y", localtime $epoch_secs;
+ (my $program = $ARGV[0]) =~ s!.*/!!;
+ my $package = $program;
+ my $version;
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 3e8f7a13ec..bafc18fcc0 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
            file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
            file://0001-Remove-timestamp-from-manpage.patch \
+           file://help2man-reproducibility.patch \
            "
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
-- 
2.25.1

