Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id AC8B3601DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 21:32:40 +0000 (UTC)
Received: by wgme6 with SMTP id e6so12778733wgm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mYBWw6HMuzBnNM520xiGXM6W0yIR/J/gV5lw6r9c13g=;
	b=oqhdMxU1klqSRbJ9oOikcTKAVTsL3Pa/bjW9f8tHBxphBTx6N/Px4TZqegZuG7ikls
	3VYKPCSIFuYp/0FIhR+C1qm+rwCDVyIJLqY/cy11ccpCuOyiPLttWJFWIVpxVDLTdnM6
	/3lJmCg4jmYrKC/RGMl6uh2eTPFOQpXmV/4k2rZphNuY3JcMiqkdVwAKDOtI+dPQ196l
	UMeHPPFTtkJ0K0vYOOXh8pa/+ngI1bskGzRfaUt7jrEFkJyxuN6KImB79Toz8eYxRIQm
	mSf9KouUdsf08ZpuXpKqdG3ROQ8Eh3AR/+lHVpWE3UgHEEn8HHQ0CDm2+E50TZru3CXN
	mX+w==
X-Received: by 10.180.87.201 with SMTP id ba9mr24010584wib.73.1432589561222;
	Mon, 25 May 2015 14:32:41 -0700 (PDT)
Received: from nbbrfq.cc.univie.ac.at
	(91-119-107-84.dynamic.xdsl-line.inode.at. [91.119.107.84])
	by mx.google.com with ESMTPSA id
	vz2sm15843221wjc.20.2015.05.25.14.32.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:32:40 -0700 (PDT)
Date: Mon, 25 May 2015 23:32:37 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20150525213237.GA7426@nbbrfq.cc.univie.ac.at>
References: <CAOMwXhN1Ww=T_OJC8e-VtzM_OozOQUjCU7cF1-shUMZ_kVG4Xg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhN1Ww=T_OJC8e-VtzM_OozOQUjCU7cF1-shUMZ_kVG4Xg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: busybox@busybox.net,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: adduser: add -k [was: Re: Post USERADD_PARAM action]
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
X-List-Received-Date: Mon, 25 May 2015 21:32:41 -0000
X-Groupsio-MsgNum: 65994
Content-Type: multipart/mixed; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2015 at 12:37:13PM +0100, Laszlo Papp wrote:
> Hi,
> 
> is it possible to do some post action after useradd_param is executed?
> 
> I would like to modify the created user's home directory, in this
> special case the profile. I see that the useradd util has this on
> desktop, but busybox does not have it, and very likely will not have
> it, at least not in the near future anyway:

mhm, why so?

The attached compiles for me.

cheers,

> 
>        -k, --skel SKEL_DIR
>            The skeleton directory, which contains files and
> directories to be copied in the user's home directory, when the home
> directory is created by useradd.
> 
>            This option is only valid if the -m (or --create-home)
> option is specified.
> 
>            If this option is not set, the skeleton directory is
> defined by the SKEL variable in /etc/default/useradd or, by default,
> /etc/skel.
> 
>            If possible, the ACLs and extended attributes are copied.
> 
> I would like to do something like this with the created user's home directory:
> 
> echo PATH=/sbin:$PATH > /home/foo/.profile
> chmod foo:foo /home/foo/.profile
> 
> But then again, for this, I need to make sure that the user is already created.
> 
> Ys, L.
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--cNdxnHkX5QqsyA0e
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-adduser-Add-k-path-to-skel.patch"

From 7b7a7422c1937bcb967d1e6b184d04b1cdc63d88 Mon Sep 17 00:00:00 2001
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 May 2015 23:25:19 +0200
Subject: [PATCH] adduser: Add -k /path/to/skel

function                                             old     new   delta
.rodata                                           157069  157133     +64
adduser_main                                         921     936     +15
adduser_longopts                                     103     110      +7
packed_usage                                       30230   30236      +6
------------------------------------------------------------------------------
(add/remove: 0/0 grow/shrink: 4/0 up/down: 92/0)               Total: 92 bytes

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 loginutils/adduser.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/loginutils/adduser.c b/loginutils/adduser.c
index 568a301..077e6e9 100644
--- a/loginutils/adduser.c
+++ b/loginutils/adduser.c
@@ -20,6 +20,7 @@
 //usage:     "\n	-D		Don't assign a password"
 //usage:     "\n	-H		Don't create home directory"
 //usage:     "\n	-u UID		User id"
+//usage:     "\n	-k		SKEL directory (/etc/skel)"
 
 #include "libbb.h"
 
@@ -39,6 +40,7 @@
 #define OPT_SYSTEM_ACCOUNT (1 << 5)
 #define OPT_DONT_MAKE_HOME (1 << 6)
 #define OPT_UID            (1 << 7)
+#define OPT_SKEL           (1 << 8)
 
 /* remix */
 /* recoded such that the uid may be passed in *p */
@@ -134,6 +136,7 @@ static const char adduser_longopts[] ALIGN1 =
 		"system\0"              No_argument       "S"
 		"no-create-home\0"      No_argument       "H"
 		"uid\0"                 Required_argument "u"
+		"skel\0"                Required_argument "k"
 		;
 #endif
 
@@ -150,6 +153,7 @@ int adduser_main(int argc UNUSED_PARAM, char **argv)
 	char *p;
 	unsigned opts;
 	char *uid;
+	char *skel = (char*)"/etc/skel";
 
 #if ENABLE_FEATURE_ADDUSER_LONG_OPTIONS
 	applet_long_options = adduser_longopts;
@@ -168,7 +172,7 @@ int adduser_main(int argc UNUSED_PARAM, char **argv)
 	/* at least one and at most two non-option args */
 	/* disable interactive passwd for system accounts */
 	opt_complementary = "-1:?2:SD";
-	opts = getopt32(argv, "h:g:s:G:DSHu:", &pw.pw_dir, &pw.pw_gecos, &pw.pw_shell, &usegroup, &uid);
+	opts = getopt32(argv, "h:g:s:G:DSHu:k:", &pw.pw_dir, &pw.pw_gecos, &pw.pw_shell, &usegroup, &uid, &skel);
 	if (opts & OPT_UID)
 		pw.pw_uid = xatou_range(uid, 0, CONFIG_LAST_ID);
 
@@ -250,8 +254,9 @@ int adduser_main(int argc UNUSED_PARAM, char **argv)
 				NULL
 			};
 			/* Be silent on any errors (like: no /etc/skel) */
-			logmode = LOGMODE_NONE;
-			copy_file("/etc/skel", pw.pw_dir, FILEUTILS_RECUR);
+			if (!(opts & OPT_SKEL))
+				logmode = LOGMODE_NONE;
+			copy_file(skel, pw.pw_dir, FILEUTILS_RECUR);
 			logmode = LOGMODE_STDIO;
 			chown_main(4, (char**)args);
 		}
-- 
2.1.4


--cNdxnHkX5QqsyA0e--
