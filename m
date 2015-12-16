Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 502 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Dec 2015 14:57:56 UTC
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 749FF6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 14:57:56 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6FB29F81188; Wed, 16 Dec 2015 07:49:34 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D1A64F81188;
	Wed, 16 Dec 2015 07:49:33 -0700 (MST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56717A07.2010100@mlbassoc.com>
Date: Wed, 16 Dec 2015 07:49:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: Error building glib
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
X-List-Received-Date: Wed, 16 Dec 2015 14:57:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Using master as of 2015-12-16 (f1f3716776078d68bd9e3734bca881a486dc2ea3)
I get this error:

ERROR: Command Error: exit status: 1  Output:
Applying patch allow-deprecated.patch
patching file Makefile.am
Hunk #1 succeeded at 18 (offset -5 lines).
patching file gio/fam/Makefile.am
Hunk #1 succeeded at 13 (offset -10 lines).
can't find file to patch at input line 31
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: glib-2.36.0/gio/fen/Makefile.am
|===================================================================
|--- glib-2.36.0.orig/gio/fen/Makefile.am
|+++ glib-2.36.0/gio/fen/Makefile.am
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file gio/inotify/Makefile.am
Hunk #1 succeeded at 24 (offset -4 lines).
patching file gio/kqueue/Makefile.am
Hunk #1 succeeded at 28 (offset -4 lines).
patching file gio/win32/Makefile.am
patching file gmodule/Makefile.am
patching file Makefile.in
Hunk #1 succeeded at 840 with fuzz 1 (offset 368 lines).
patching file gio/fam/Makefile.in
Hunk #1 succeeded at 787 (offset 354 lines).
can't find file to patch at input line 111
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: glib-2.36.0/gio/fen/Makefile.in
|===================================================================
|--- glib-2.36.0.orig/gio/fen/Makefile.in
|+++ glib-2.36.0/gio/fen/Makefile.in
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file gio/inotify/Makefile.in
Hunk #1 succeeded at 798 with fuzz 2 (offset 389 lines).
patching file gio/kqueue/Makefile.in
Hunk #1 succeeded at 802 with fuzz 2 (offset 389 lines).
patching file gio/win32/Makefile.in
Hunk #1 succeeded at 800 with fuzz 2 (offset 395 lines).
patching file gmodule/Makefile.in
Hunk #1 succeeded at 785 with fuzz 1 (offset 366 lines).
Patch allow-deprecated.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /local/p0382_2015-12-16/tmp/work/cortexa9hf-vfp-neon-amltd-linux-gnueabi/glib-2.0/1_2.46.1-r0/temp/log.do_patch.7269
ERROR: Task 2389 (/local/poky-cutting-edge/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb, do_patch) failed with exit code '1'

Any ideas?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

