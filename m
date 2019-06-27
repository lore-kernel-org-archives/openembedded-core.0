Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id B62A97E7D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 12:28:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f17so5484349wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7wYww8GRT31Fph8YSKmj608/GkhJOJOjqKb6Xh2UcZM=;
	b=w3BzPGfwcYsrXG8eVYWDfILHwofZTIzITdom7J/GJxetPbhEsAmvoEBLXhV1uIGHGy
	CpHAhsdvkgfsbUyLGosR02SN1uJ52JuklV84GpmERVNvDOmZQxoM/73DeQYRfHz5PUIk
	NI4QCNo87zgEYPkVScLyvQ/x2fj6eZLPrhm0syd/ESkFkCKmDg8VPa3ZS0MxLp0tccgG
	nWBOZOESEj1ZPMBRYu18JYhdU+yBfuPAEeK5zduqW6TKO7F+pnJ1onpKDFpxZqccHRuN
	bX/rryjsmQT7H8tLBQM+VOeqL07o+w04lxUPpzBp3qeG9MVzI7eWju08Tz3xYWKtwJL/
	SpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7wYww8GRT31Fph8YSKmj608/GkhJOJOjqKb6Xh2UcZM=;
	b=IyLU8dEn8uAds+Byn5bctzZz/5gEp10NEjk7E/fE1fP4YLQWf/szASbdE8pimYBTiy
	Z5TlsPOa0QOG6zqNPEzRPzPuVCNusCubG/4r+gMbBM4bZ0yAsPopKb6qC7uhkTe69k/N
	dqa1xQY0H5dXe5IoFm32L8eILcrrdrWjPgzYLFopO+Vf8LCLe3gbHPUeFQf4spptFHMb
	oZHb7qNG+fFoV03J9JlMVpKIv6ZocZtJfnRKF4auMfT5DmBn2apOWuoSGqi2CN8S0r2j
	yJR7GOpr2fN5q+aNEk6T0v/RoOp9n+kkZb2JOIErgRLd6XA0rEnHCvf+itQNRdRhK5mN
	JNXg==
X-Gm-Message-State: APjAAAW/ICDenzPRXG3pCfSxRs3QdYqZoAzILDBZh3yVx0oe4UearUsJ
	IjHo6zbAlwENqWVnagGIwc5iFxAREFU=
X-Google-Smtp-Source: APXvYqyMgn2sAyXNIY0GVgsuswrHgKvj47v1DsdexkfoFbQYynXlOUhISxNHjio/+JvUhIt0Mw3yNA==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr3289191wmc.151.1561638539330; 
	Thu, 27 Jun 2019 05:28:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f2sm1371248wrq.48.2019.06.27.05.28.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 05:28:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 13:28:54 +0100
Message-Id: <20190627122854.28435-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190627122854.28435-1-ross.burton@intel.com>
References: <20190627122854.28435-1-ross.burton@intel.com>
Subject: [PATCH 2/2] buildhistory: report sysroot changes
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
X-List-Received-Date: Thu, 27 Jun 2019 12:28:59 -0000

Now that the sysroot is written into the build history, write it out.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 62c7a2e58ea..8af76c6b3a3 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -181,7 +181,7 @@ class ChangeRecord:
             diff = difflib.unified_diff(alines, blines, self.fieldname, self.fieldname, lineterm='')
             out += '\n  '.join(list(diff)[2:])
             out += '\n  --'
-        elif self.fieldname in img_monitor_files or '/image-files/' in self.path:
+        elif self.fieldname in img_monitor_files or '/image-files/' in self.path or self.fieldname == "sysroot":
             if self.filechanges or (self.oldvalue and self.newvalue):
                 fieldname = self.fieldname
                 if '/image-files/' in self.path:
@@ -571,6 +571,15 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
             elif filename.startswith('latest.'):
                 chg = ChangeRecord(path, filename, d.a_blob.data_stream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8'), True)
                 changes.append(chg)
+            elif filename == 'sysroot':
+                alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
+                blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
+                filechanges = compare_file_lists(alines,blines)
+                if filechanges:
+                    chg = ChangeRecord(path, filename, None, None, True)
+                    chg.filechanges = filechanges
+                    changes.append(chg)
+
         elif path.startswith('images/'):
             filename = os.path.basename(d.a_blob.path)
             if filename in img_monitor_files:
-- 
2.11.0


