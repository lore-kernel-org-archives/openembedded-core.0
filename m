Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D30D5AE7B
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:59 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3006.1765620118797471393
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoAVCGZp;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo2294862b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620118; x=1766224918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzWslr2ngHUu+NJfVzAGUZMi7EVQx88Qc3VaofcB4Ko=;
        b=CoAVCGZpJf3rL3lo6tOHJOJHfOOHkUGZE7gk8SxyW9FEJO0sbFH1iYOPkyIOVoAq+2
         kwwiFy4wW0w52Nq4rmOcHaxRyeR2SMC6nI9/Qmftcq697kjw4aBLvaHU/wjSzzGv0ntS
         bNJJMdeDr5T9j7G/bS9yAr0a7dEioSRFKpNBuaX1YSFtH0CPIPM6kfDlWgS1doBcIFjX
         Mbu/OahFvh9qN7p5lEuU2UUdKSzNf+Wfo1HAXXFJwQ7QOtl0qNrCLlg7gAKuMpiOEL+e
         8GJ0OzwlII10MBh95FeTVBnviVW9vOoc2m1X8iUcgZUHx7kLF5M9c0mTHa4a3dN8+hc8
         yaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620118; x=1766224918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzWslr2ngHUu+NJfVzAGUZMi7EVQx88Qc3VaofcB4Ko=;
        b=emd0upT+UeqXAJlMEkM4EcGGVhnN9MkZJulJjXuR+WIqX0oQMsMNainHtMJqWTjkur
         KZYqAooLNGMTJGrya0arVLXrae5E395MjMh+g6WGeXT0UYNNydzghEUDzKVQhvGO6dYq
         DLXVbMmnahQJFEzA9U7p1e99cfwGM5Iz4TRUX3TiwzICfBSB5wK8Zq4rTSSWth/NyIUt
         iY0XcMHz3qlaKN96+W+BcyJ+V6TBPVQrzRDwJYh+KzJgpMdQ0ILSLiUNh+KEMCOGa+uQ
         Mugw0gXF0xpU1eth7rS2no/xj+8J4VR04oNx4RAfwfIcJn0J2vRvf9XnjTYYbFn+7lSQ
         BR3g==
X-Gm-Message-State: AOJu0Yy/upFdcgRY/jHh6pk1lpFKYzzMhDk/BXRICHm4PudgoGbmTMlm
	hGYKhghscNAbTLvW7PUecGIz1jwWusaCsrb4iKAt0nWcvpOefIjpsrXPuFPmDrqS
X-Gm-Gg: AY/fxX7st/2NKyffVIkgTxZt+Zc4oFvecCi2FaIR3tPf8LPMNdDCdyPzGExYCjrPF9g
	cuTTdRmlOmxZkKLp9v/0C/StEV0FjDmEmYq3dPhKQUbam7/r2uuYkjZFRu4UclffiXeR/+mWdJR
	xAi/kk/V0Yz6wOV7d0ie3II60Ho0XXYrPzPca8SfGyeo3RxkHMmyCvikq0Mm1GgMaccpHpDKoqC
	45TT9AOHP6xzjCa4D5hHatuvcGHstf5sDZz77lLr5ybG0FXDjOX83WFkUZ6arU040tPr9NITvbJ
	M/WbxIINZ54iev9PXEIeunioGpY16bd2Qc/Ghplw15DNmxXC4sqaEOZsgDN03uqLMpq2dtQbfkA
	vlbWeoks8FpiVfXowXUoiO2xb6XQ1vSj7jYcPGFBQAw8/1ArM1JxvH8f1bgRvOBvxkJ0MjxgOMU
	AIRz+pf30FFoaB4rPKhnr7BOiGny41NLMdYHw=
X-Google-Smtp-Source: AGHT+IGeVzFjdtjiFoiUrAxxG+74CDIjndw2Fb4VtG06WqLniyUvz0nNaQvzXE7lcQuuiYEAZBif1g==
X-Received: by 2002:a05:6a21:9986:b0:35f:30ff:89db with SMTP id adf61e73a8af0-369adfb32camr4787470637.19.1765620117867;
        Sat, 13 Dec 2025 02:01:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 50/67] lib/configfragments: when disabling fragments, treat fragment names as prefixes if they end with /
Date: Sat, 13 Dec 2025 15:29:14 +0530
Message-ID: <20251213095931.2571498-50-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227668

From: Alexander Kanavin <alex@linutronix.de>

This allows disabling classes of fragments without knowing their full names, e.g.
instead of

$ bitbake-config-build disable-fragment machine/qemuarm

one can issue

$ bitbake-config-build disable-fragment machine/

to match and disable everything that starts with 'machine/'.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 573695d2ff3e0d47c6ef91418e5002df017bb7bc)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index de521f0c14..47605f3ddb 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -161,16 +161,16 @@ class ConfigFragmentsPlugin(LayerPlugin):
         def disable_helper(varname, origvalue, op, newlines):
             enabled_fragments = origvalue.split()
             for f in args.fragmentname:
-                if f in enabled_fragments:
-                    enabled_fragments.remove(f)
-                else:
-                    print("Fragment {} not currently enabled in {}".format(f, args.confpath))
+                for e in enabled_fragments[:]:
+                    if (f.endswith('/') and e.startswith(f)) or f==e:
+                        print("Removing fragment {} from {}".format(e, args.confpath))
+                        enabled_fragments.remove(e)
             return " ".join(enabled_fragments), None, 0, True
 
         self.create_conf(args.confpath)
         modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_helper)
-        if modified:
-            print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
+        if not modified:
+            print("Fragment names or prefixes {} matched nothing in {}.".format(", ".join(args.fragmentname), args.confpath))
 
     def do_show_fragment(self, args):
         """ Show the content of a fragment """
@@ -210,7 +210,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
 
         parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
         parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
-        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
+        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment, or a name prefix (ending with "/") to match', nargs='+')
 
         parser_show_fragment = self.add_command(sp, 'show-fragment', self.do_show_fragment, parserecipes=False)
         parser_show_fragment.add_argument('fragmentname', help='The name of the fragment')

