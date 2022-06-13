Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629EDC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.6454.1655130124635342818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=f996429T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id e11so5885160pfj.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2xq3rFCfQqGKFz5yltjN2qYOZBP+cMGfm6SuXMcmDgA=;
        b=f996429TvZnzZAuULjuNyyYit4xylr/i8NwNox2X+Lu0FgHmuRh8cfBPxWXDtUDo3j
         STED+31z1ianhsSaY0awRcl8BsfnMYre4QRAxFlXDGYV+XD4Zi15tVq0OWBuM2fe2E2/
         U4oT+X6xOrAGMPpqUMHu/RVLbmiGc9tJdE6n6m1H9PheL/9HfK2edmcsSRD77kTVJX49
         q/FpoD4H3bXZMSr9MkbKEna+TX9H21IMcwUhyJqbT1SQl1P0qwXA+6EmZ1xZFZOQOqvW
         xFCmlfrrAOc7rAkdET+xZCHac4PwFR+UZQiprEVDdZgKwCNxnxqsRavk6FXa9QJdmWnl
         UlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2xq3rFCfQqGKFz5yltjN2qYOZBP+cMGfm6SuXMcmDgA=;
        b=Q+lYhIjBYv/NHD8vDNiCZwaZiivaVngJD3Uh7rZOJwmsk/b1gK9KbO/SNB9Mc81ovn
         zVds9Fzmyg/gwsjWNHnpmLF7JBZ/8jIkLUzEhKfSb7utqeCCr/d/EPrNxX5g/DtYT/if
         FTNSRL0n99OFkaYpYiF100erhTIlM0HOD8hiWr/LXcJUBinTcnT/+Bp1i5UGGvt2M+GX
         NzEqMtkZQFIG/sy03njXuvsA6FgxnJCvQ8iypa5oEfG0yCf0nDSuBQ2/RyVIeu2k21mT
         6DkMXAP604VUFJQc5Ow95lPlb96yPiB+Sjb/HVfnhDmBg2F6Up+PyXnBlDIChUEj5haC
         0ivg==
X-Gm-Message-State: AOAM531ZyZ5kW0Us/LagSKYe4B38Siz/1OmzBdas6QZWTk62UmmVJZ9/
	k36ZBDliJ8+ZilJ8TvPqjuH3c246sWf81Cn0
X-Google-Smtp-Source: 
 ABdhPJxobH/jqKp2P7dVld4xpGrCgMQe5bdVp3owaofxZsoPQfO4yjjwwo4qXebOWhVDEJvU1pjAoQ==
X-Received: by 2002:aa7:82ca:0:b0:51b:cf43:d00a with SMTP id
 f10-20020aa782ca000000b0051bcf43d00amr57427342pfn.58.1655130126319;
        Mon, 13 Jun 2022 07:22:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/20] sanity: Switch to make 4.0 as a minimum
 version
Date: Mon, 13 Jun 2022 04:21:33 -1000
Message-Id: 
 <4b694ded86877cce06af65a0f542027d7408c111.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166846

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We can't build glibc without make 4.0 and we don't work on older distros with
older versions of make without buildtools tarball so increase the minimum
version to 4.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9a449aeec72a698206323c3471c9268f949b1ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b416918013..eb0ca05804 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -432,8 +432,7 @@ def check_patch_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute patch --version, exit code %d:\n%s\n" % (e.returncode, e.output)
 
-# Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
-# Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
+# Glibc needs make 4.0 or later, we may as well match at this point
 def check_make_version(sanity_data):
     import subprocess
 
@@ -442,31 +441,8 @@ def check_make_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute make --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
-    if bb.utils.vercmp_string_op(version, "3.82", "=="):
-        # Construct a test file
-        f = open("makefile_test", "w")
-        f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
-        f.write("\n")
-        f.write("makefile_test_a.c:\n")
-        f.write("	touch $@\n")
-        f.write("\n")
-        f.write("makefile_test_b.c:\n")
-        f.write("	touch $@\n")
-        f.close()
-
-        # Check if make 3.82 has been patched
-        try:
-            subprocess.check_call(['make', '-f', 'makefile_test'])
-        except subprocess.CalledProcessError as e:
-            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
-        finally:
-            os.remove("makefile_test")
-            if os.path.exists("makefile_test_a.c"):
-                os.remove("makefile_test_a.c")
-            if os.path.exists("makefile_test_b.c"):
-                os.remove("makefile_test_b.c")
-            if os.path.exists("makefile_test.a"):
-                os.remove("makefile_test.a")
+    if bb.utils.vercmp_string_op(version, "4.0", "<"):
+        return "Please install a make version of 4.0 or later.\n"
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
-- 
2.25.1


