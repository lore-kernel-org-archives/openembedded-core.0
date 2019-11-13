Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 30E927F43D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id w7so1184336plz.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FUk3AzkB2F09jCb63/59AC4IwKIqAnl7pNRftj64TY4=;
	b=rGcs/1OaIAEEs4GhbQ+/3rib2bqKYt/9gSUzsnhdzI6Tvte1F9LSN7J1XkLpj2DvOd
	Ue3b6x7WoNOAOzgz8U7EjKLGdSLBmUzISOmLePazIWNR1ZjFeL3c2EeV4hl0+girNuVz
	OQ/w+9CAdu86VbKbw1RtvFIsjBOlqTjma1myc7jNtWJdPXrEgm8CjuXyKqGSpyDvAsE7
	Ug8gFknlNNp+Ee26S6iFhcEeq9YLbqhhEUlrs4cMRlYUVb/4fPy05Z7FHXmvIpu+NQh7
	Ba6WISEydOYDmLnHxMMiCAwtIsFldAPdWS+AKCr0YxOeH7ZQCmsMkutXXk7EOJnIuWhd
	zhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FUk3AzkB2F09jCb63/59AC4IwKIqAnl7pNRftj64TY4=;
	b=E9SfxIShI1QTreNDooXkcvA9Bgg31hQLIOenhA+vIdFARDpWlsMcJRrVFvIqxiKGmF
	OMZxwTkNuLCyay1OkQeDiZXJYNQiw2VJXRaXesA3ul1mhNb5tg6kDDq+aGhGkQn+T9ik
	gDwgHY0GQ8a9acb5WSBpEeGxw60AvyQRAw9q1aVxNoq1IswK+PkPSF/yeykVYZ/Gw8oJ
	EwJqhPEMF8zUZfCLU2NUGb4zhXgwt1MnbgM3/lNOOVcZ8cRrsQDiV+NivDaVZMgupr1w
	uU2RdNSL91aWBRHJNqmMuy5b5jwJdCi8/P3snKUP3FljOH6c2FPApjv8tx+TwyJLjuyX
	uegg==
X-Gm-Message-State: APjAAAV6kIBrBErHeVRSzUCXi7T/M06svirNFRAskzCS5BMC21udprr+
	XZLrHnE7IDFH72RBm3t7Gpq3CurE
X-Google-Smtp-Source: APXvYqx2uhit4pO+BsWqpvo0ZINIzmhHrMOv9We8RlzkJbob/W1vIyGK6w+CjCewaTDrVIvM4Ve6Sw==
X-Received: by 2002:a17:902:44d:: with SMTP id
	71mr4426335ple.320.1573658390962; 
	Wed, 13 Nov 2019 07:19:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:08 -0800
Message-Id: <b6ef5f2c84b34622280112c48cb2efbc1467e3d0.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 05/25] package_rpm.bbclass: Remove a misleading bb.note()
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:50 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It should have been removed in 3db9d865 (classes/package_rpm.bbclass:
Enhance diagnostic messages) when it was split in two new notes.

Also change the casing of two other notes to align them with the other
notes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package_rpm.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1a64cb2..b1b13e2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -409,7 +409,6 @@ python write_specfile () {
             if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
                 bb.note("Not creating empty RPM package for %s" % splitname)
             else:
-                bb.note("Creating RPM package for %s" % splitname)
                 spec_files_top.append('%files')
                 if extra_pkgdata:
                     package_rpm_extra_pkgdata(splitname, spec_files_top, localdata)
@@ -418,7 +417,7 @@ python write_specfile () {
                     bb.note("Creating RPM package for %s" % splitname)
                     spec_files_top.extend(file_list)
                 else:
-                    bb.note("Creating EMPTY RPM Package for %s" % splitname)
+                    bb.note("Creating empty RPM package for %s" % splitname)
                 spec_files_top.append('')
             continue
 
@@ -510,7 +509,7 @@ python write_specfile () {
                 bb.note("Creating RPM package for %s" % splitname)
                 spec_files_bottom.extend(file_list)
             else:
-                bb.note("Creating EMPTY RPM Package for %s" % splitname)
+                bb.note("Creating empty RPM package for %s" % splitname)
             spec_files_bottom.append('')
 
         del localdata
-- 
2.7.4


