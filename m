Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.8264.1620831546629957694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=H4jqybK+;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id c3so22452930oic.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iWfYSP6zs7jy4uwBJP0o9YzakWk68ejy2Tlh2UMaX9s=;
        b=H4jqybK+mK2CoSnfZ9DgPAhPlQKIkS9DT9fQl5Vy7YpoBX7vQ7htD8dRwZLzvDZ/4D
         LzO+1yNL8HxM5dymLSbGFjm6alwpdCfj2q7o2COG9E90ODYE4FAlqcrECGeEaJAlFhwz
         oK0AMzMvrF1YZwtMWkvKBhs4a2hC/rLfV/Pka/auPqvMVHAK+J+RfU7lqfRM0+6sdU44
         HWMMiIPZW9eZzus0q3KrpYtyVujgWqH9qXzEd5VLZlCgT88+QzC3R1hzUr6b8FC/1/Z0
         0VtMNQxwjQEQr5STXDn/ZgwwxFb3dLGsKNbDuxLDC4VcVCavaCgvBYGJbg4sdBL2tDdz
         PGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWfYSP6zs7jy4uwBJP0o9YzakWk68ejy2Tlh2UMaX9s=;
        b=CiPVqZbCdTa9zfYaQ2Shd7pmmGgKEW1vAYN8DEBiHO33430G2DfBhZBF6ChQ5/+Gu/
         zu/a7NnWkGlDwvYDwpFNK1+oGAB6IlaaCUAEBa5KTnTt4X8NetBE1H5/2hVEzUFe+/Nm
         5drkatataGPf4exYdZ5LLy2DMfMt4fFk3bu8o14etOv93um9enJPGjyioI+2ypfq2yUn
         8C5pepX11k2/q/njCncMXkzzHK5gOJ7hBQS133BwsjncPA1qA++yXAYgkQlvDzAfcxdn
         UBjiwIDUqJzJaYlWcPKUb6h+koUFZPiAe4t27cdHvLjbVAJvNMTi4IBImvD3nnxbLBa3
         J13g==
X-Gm-Message-State: AOAM530D0tcfm+UxxrRQLjHod/yTl5czJjcM7iIDUusvThN3MSmoODgy
	9cJLnjFb5+r98OXnQYKQU71RY15VW0tdise6oPk=
X-Google-Smtp-Source: ABdhPJySk4hXoOEscn6gfu8aEUJQxz7sv50LqM6FvXTMDr2EP0gxrevyI8aVWNLUh/EnMNs+XCcB/A==
X-Received: by 2002:aca:53d8:: with SMTP id h207mr8061995oib.177.1620831545552;
        Wed, 12 May 2021 07:59:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.59.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/22] lsb-release: fix reproducibility failure
Date: Wed, 12 May 2021 04:56:56 -1000
Message-Id: <daed7132094763c910c880b0d5b496032338e3c7.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
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

