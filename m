Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF4279C42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 189-v6so10469886wmw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=W6+v+y5AY4n5PtZ0pIKNKMk/UdpLwEAECFpjByJbMsc=;
	b=eQEb9wE9P5ZxDeuIzv15VBl+n67Wl9U6Audd12U57/kiRQOYL8k2XsuXkbehH/ijFd
	z1qXTxzn7ow53stRIK8dxuj8XTiKlX0/Dba2IccqYGGaRMajTWLaCI94vPcV2yZp35d0
	TWeTX0yK2rarXPU6BtQETCqy3JVr6Hl6/vMIW/eROacCWxtMkBjDlpkgfWiuu1oofRUJ
	M/hmCbmwEe9DnioXY2OodLj/6xPknVLHD2uE8zDpByVtchmmPEu8zQjHNyvJ7rHTz6QO
	GDFw7hm7+24zy/TtOV0w2D7BmkQCiOhgCgc+bmqMGBkGQcnjMeCkAsXg1mMP1913ADVd
	cZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=W6+v+y5AY4n5PtZ0pIKNKMk/UdpLwEAECFpjByJbMsc=;
	b=giw0dOjcxkBlNcHBvM1FHvmCiYATPnpO6MiC2GvLlXY0r/CGK7wi4eeTFNSp8BMeb9
	4hL4kL+qId8YHA+ol5eXrDD4qI8S07dYpmi9BYuJP/DrKLcHw9Ybtz/dglVBfmCjxHja
	7M/PgzJO2+fpweRAVmFx7A5evJJKOAQehEnOfuwOZyWU4r+3KRPnNFBt9rvtJAgS/JJb
	lp7T0+aWdibgI738PCkXsxPpOtSpYXtdkECfkwq4HL7RcDy4oiMrhnZ3Fj/t9uZ26nZj
	RUET7tSsHux8nD0lnAel03ff234Wm7HZwzXmdgki8QMHZFjjOa+cH1k+SYidUJpSsGe7
	uxOQ==
X-Gm-Message-State: ABuFfogAGBnLZCEaKZuwKsvAPoQWHPZjnJ8M2W+SimgC+LZ71jsHH+KF
	aTJlhZu38YW8pM4uCktIOH/m+Av1aMo=
X-Google-Smtp-Source: ACcGV63EOYvGqofWKL5MOK0JkUbkzu1jLnyjuzk26qPr6XCewB6Hbx8HyvRfeXMkizMXutFFV0BoUw==
X-Received: by 2002:a1c:9e93:: with SMTP id
	h141-v6mr16949476wme.56.1540217143167; 
	Mon, 22 Oct 2018 07:05:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:11 +0100
Message-Id: <1540217112-24479-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 12/13] tzcode: update to 2018f
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:42 -0000

 Changes to code

    zic now always generates TZif files where time type 0 is used for
    timestamps before the first transition.  This simplifies the
    reading of TZif files and should not affect behavior of existing
    TZif readers because the same set of time types is used; only
    their internal indexes may have changed.  This affects only the
    legacy zones EST5EDT, CST6CDT, MST7MDT, PST8PDT, CET, MET, and
    EET, which previously used nonzero types for these timestamps.

    Because of the type 0 change, zic no longer outputs a dummy
    transition at time -2**59 (before the Big Bang), as clients should
    no longer need this to handle historical timestamps correctly.
    This reverts a change introduced in 2013d and shrinks most TZif
    files by a few bytes.

    zic now supports negative time-of-day in Rule and Leap lines, e.g.,
    "Rule X min max - Apr lastSun -6:00 1:00 -" means the transition
    occurs at 18:00 on the Saturday before the last Sunday in April.
    This behavior was documented in 2018a but the code did not
    entirely match the documentation.

    localtime.c no longer requires at least one time type in TZif
    files that lack transitions or have a POSIX-style TZ string.  This
    future-proofs the code against possible future extensions to the
    format that would allow TZif files with POSIX-style TZ strings and
    without transitions or time types.

    A read-access subscript error in localtime.c has been fixed.
    It could occur only in TZif files with timecnt == 0, something that
    does not happen in practice now but could happen in future versions.

    localtime.c no longer ignores TZif POSIX-style TZ strings that
    specify only standard time.  Instead, these TZ strings now
    override the default time type for timestamps after the last
    transition (or for all time stamps if there are no transitions),
    just as DST strings specifying DST have always done.

    leapseconds.awk now outputs "#updated" and "#expires" comments,
    and supports leap seconds at the ends of months other than June
    and December.  (Inspired by suggestions from Chris Woodbury.)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2018e.bb => tzcode-native_2018f.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018e.bb => tzcode-native_2018f.bb} (70%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018e.bb b/meta/recipes-extended/tzcode/tzcode-native_2018f.bb
similarity index 70%
rename from meta/recipes-extended/tzcode/tzcode-native_2018e.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018f.bb
index 9a4e465..816e34d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018e.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018f.bb
@@ -11,10 +11,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "97d654f4d7253173b3eeb76a836dd65e"
-SRC_URI[tzdata.sha256sum] = "6b288e5926841a4cb490909fe822d85c36ae75538ad69baf20da9628b63b692e"
-SRC_URI[tzcode.md5sum] = "c4d7df0fff7ba5588b32c5f27e2caf97"
-SRC_URI[tzcode.sha256sum] = "ca340cf20e80b699d6e5c49b4ba47361b3aa681f06f38a0c88a8e8308c00ebce"
+SRC_URI[tzdata.md5sum] = "e5e84f00f9d18bd6ebc8b1affec91b15"
+SRC_URI[tzdata.sha256sum] = "0af6a85fc4ea95832f76524f35696a61abb3992fd3f8db33e5a1f95653e043f2"
+SRC_URI[tzcode.md5sum] = "011d394b70e6ee3823fd77010b99737f"
+SRC_URI[tzcode.sha256sum] = "4ec74f8a84372570135ea4be16a042442fafe100f5598cb1017bfd30af6aaa70"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


