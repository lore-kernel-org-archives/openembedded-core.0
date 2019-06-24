Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 650337E624
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:37 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 81so6679018pfy.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kGIR8lHTjqs7u1eSfOMqO+cb41s1INhEXeSXRjcMHXY=;
	b=qV8ZhrWwbeagbS34UbeW+mA7+iAgZotr8WFO4TJHUWZikSHwVnw5Bb0KHNURyAFmcW
	TkJliKXg6aAT5dEVTCpehPlwyNB8nEwJgYo6B/45rJl6fvijQgufBb3nMli1f0uQPo/g
	lioGNteix9yusiSTUzH+D687oVcqEh+ujGh0/82X7xQGGpxUSUT1UhHHjXmqxZmE8i1U
	ujRWNekLm5idn41/R8ds+QMuDXKsgJAxhpA1yEIlgFUhmfwZ/Jo3bwCvd5IpxpidtP9z
	4t+xi2PM7cUbhyJLM7y88WdhPVPQSjHmdAr4fpNPgylPaxr1uYV9Aq1ezxSPYCCLuf3p
	5pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kGIR8lHTjqs7u1eSfOMqO+cb41s1INhEXeSXRjcMHXY=;
	b=XW7BW6j6V6rIwOto8QA9s2RRloyYclfsX67etp80DNTLohMnq+tkXHh9PvtiTzuDZl
	oBHr6lHazhfzpXTmwYUxZ81EPMxTBaz8RsVOmOidbOXlqbNYl2CWDZODBkIUXXJa2wd9
	+dH/tJ5AIdb4ozSu7XBqvBCogbg1uGusNKYZ/F1KChm3r+N1GTHuuZEuGhcEZ8Q8QEmk
	VDw3GvFjqLcwPoJFR/7KqEi/3pNYxvgaitrR07DdXlSCqhNJBuOZWxTjxanWjmARThr9
	e8ZtzHcAlRgRTV6cshBa+HKs2P7tS1CHnAg7iZ8eTPMA+VKexaXWO09tm0Bec2KUEvQc
	Bjvw==
X-Gm-Message-State: APjAAAXlIv+sdOaEd9M/ZdcdUJmk2JWKm6ViwWHiwyL9a14Ldbb/aMNz
	HKsLJtNLpxaERWFqOgsgTRgHaV2xJZA=
X-Google-Smtp-Source: APXvYqwV7WUsHunv4T9F8WFOZDPpXL8chDEDLr1d6NSA3sSgOHFGpq+Vw5D4zMTuCY/iDl55opidCA==
X-Received: by 2002:a63:5d61:: with SMTP id o33mr31021438pgm.114.1561348478319;
	Sun, 23 Jun 2019 20:54:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:16 -0700
Message-Id: <0371062b3291914c6fcf5962eb178f2045a73091.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 17/19] package.bbclass: Clean up writing of runtime pkgdata files
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:37 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This introduces a variable, PKGDATA_VARS, that contains the names of
the variables that are to be output in the runtime pkgdata files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 56 ++++++++++++++------------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4c0a859..eef1f7b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1343,6 +1343,8 @@ EXPORT_FUNCTIONS package_name_hook
 
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
+PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
+
 python emit_pkgdata() {
     from glob import glob
     import json
@@ -1447,48 +1449,26 @@ fi
                 total_size += fstat.st_size
         d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
 
-        subdata_file = pkgdatadir + "/runtime/%s" % pkg
-        sf = open(subdata_file, 'w')
-        write_if_exists(sf, pkg, 'PN')
-        write_if_exists(sf, pkg, 'PE')
-        write_if_exists(sf, pkg, 'PV')
-        write_if_exists(sf, pkg, 'PR')
-        write_if_exists(sf, pkg, 'PKGE')
-        write_if_exists(sf, pkg, 'PKGV')
-        write_if_exists(sf, pkg, 'PKGR')
-        write_if_exists(sf, pkg, 'LICENSE')
-        write_if_exists(sf, pkg, 'DESCRIPTION')
-        write_if_exists(sf, pkg, 'SUMMARY')
-        write_if_exists(sf, pkg, 'RDEPENDS')
-        rprov = write_if_exists(sf, pkg, 'RPROVIDES')
-        write_if_exists(sf, pkg, 'RRECOMMENDS')
-        write_if_exists(sf, pkg, 'RSUGGESTS')
-        write_if_exists(sf, pkg, 'RREPLACES')
-        write_if_exists(sf, pkg, 'RCONFLICTS')
-        write_if_exists(sf, pkg, 'SECTION')
-        write_if_exists(sf, pkg, 'PKG')
-        write_if_exists(sf, pkg, 'ALLOW_EMPTY')
-        write_if_exists(sf, pkg, 'FILES')
-        write_if_exists(sf, pkg, 'CONFFILES')
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
         add_set_e_to_scriptlets(pkg)
-        write_if_exists(sf, pkg, 'pkg_postinst')
-        write_if_exists(sf, pkg, 'pkg_postrm')
-        write_if_exists(sf, pkg, 'pkg_preinst')
-        write_if_exists(sf, pkg, 'pkg_prerm')
-        write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-        write_if_exists(sf, pkg, 'FILES_INFO')
-        for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
-            write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
-
-        write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-        for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
-            write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
-
-        sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
-        sf.close()
+
+        subdata_file = pkgdatadir + "/runtime/%s" % pkg
+        with open(subdata_file, 'w') as sf:
+            for var in (d.getVar('PKGDATA_VARS') or "").split():
+                val = write_if_exists(sf, pkg, var)
+
+            write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
+            for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
+                write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
+
+            write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
+            for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
+                write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
+
+            sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
         # Symlinks needed for rprovides lookup
+        rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
             for p in rprov.strip().split():
                 subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
-- 
2.7.4


