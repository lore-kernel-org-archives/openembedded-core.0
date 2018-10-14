Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA69B603FE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 11:20:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 189-v6so16131445wmw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KzT4QfdjoyDbTa6Ua/RtGPq7QUllJ6ZzBaK2tFBTPmU=;
	b=gtXkosvDWevWYZN1dqWJctYpu/2QFlEdNV6juSxvUwGfchc5Hoqi1cKkKuEf516HR8
	e8/aT4QtT7RxfTwoLlB33L5r7kbIW/wUMrXpZP+1cOAoxp1tSJJKz6EpnRyyW01D2oor
	soEa0lpzSicq6bZQ18mA8y3iFJ8yqBNTcJTdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KzT4QfdjoyDbTa6Ua/RtGPq7QUllJ6ZzBaK2tFBTPmU=;
	b=HStYsIVQ0guq4anxKM+mPEuO6nnZzi/J2jy6J8yRCB7khW3IqxtQRx2lpPYxsmn5RE
	pMLKyoP28OlWARD7T6hB09TNcf8taU0ExJgTrf7k/fvZzV/B1+TwKFHtk+nz7gnP9l1T
	BQF+YIKAsCgKsyiBm7oigh5yRI37M30cHheDBjoah7Ef6b//rgKTR7dO1/98CRVkwbdO
	OSnN9ZVirq8Zr6WixhO/vNp5XVOVtq5EJrowwfwnVSryAJly4sHwXZJBx8LeNukXGUeZ
	NIxKFoOhMyhdHncqAkTUVGtKPYz/PkiDxWfh26lc29U8glh3XURYqdu5wbI8oLokHAOo
	Lpdg==
X-Gm-Message-State: ABuFfogH43R3o2vZr2lUz0KoPcYF70PI5kTc3pwDbY5LHlnlXLc1+ycL
	jn5sj5ts37lxo+/1R91eAP+G2Q==
X-Google-Smtp-Source: ACcGV63YCZd5qfzDl11i58ExddrK1r4QkcWeH0Kc78oCrdBpp6azbFS1sLYcptHsDRrbglDG4BVPlw==
X-Received: by 2002:a1c:aacd:: with SMTP id
	t196-v6mr9612482wme.121.1539516045996; 
	Sun, 14 Oct 2018 04:20:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p1-v6sm4219559wrs.40.2018.10.14.04.20.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 14 Oct 2018 04:20:45 -0700 (PDT)
Message-ID: <bda03d36ae78dfbe63c48b2747d223e5e1e1ec18.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 14 Oct 2018 12:20:43 +0100
In-Reply-To: <CA+chaQcLQSmXABciMyrUvnVrBoqLqr+jYH+tXV8oOgCGhFrSFA@mail.gmail.com>
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
	<CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
	<CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
	<f50185f96f49dd8e3e094549bcccdb9c100adbd0.camel@linuxfoundation.org>
	<CA+chaQcLQSmXABciMyrUvnVrBoqLqr+jYH+tXV8oOgCGhFrSFA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Sun, 14 Oct 2018 11:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-10-13 at 23:16 +0200, Martin Jansa wrote:
> I was checking my builds and here is what I've found.

Thanks for digging into this, it has highlighted a few important
issues. I've queued the patches.

> $ grep locale-base env.bash
> $
> 
> And in the build without the bbappend:
> 
> # $RDEPENDS_bash-ptest [3 operations]
> #   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
> #     " make"
> #   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-
> native data_smart.py:641 [renameVar]
> #     ""
> #   override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-
> nativesdk data_smart.py:641 [renameVar]
> #     ""
> # pre-expansion value:
> #   " make locale-base-fr-fr locale-base-de-de"
> RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
> 
> but also without the RDEPENDS_${PN}-ptest history:
> 
> $ grep RDEPENDS.*ptest env.bash
> #   override[bash-ptest]:rename from RDEPENDS_${PN}-ptest data.py:116
> [expandKeys]
> #   override[bash-ptest_class-native]:rename from RDEPENDS_${PN}-
> ptest_class-native data_smart.py:641 [renameVar]
> #   override[bash-ptest_class-nativesdk]:rename from RDEPENDS_${PN}-
> ptest_class-nativesdk data_smart.py:641 [renameVar]
> # $RDEPENDS_bash-ptest [3 operations]
> #   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
> #   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-
> native data_smart.py:641 [renameVar]
> #   override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-
> nativesdk data_smart.py:641 [renameVar]
> RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
> # $RDEPENDS_bash-ptest_class-native
> #   rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:641
> [renameVar]
> RDEPENDS_bash-ptest_class-native=""
> # $RDEPENDS_bash-ptest_class-nativesdk
> #   rename from RDEPENDS_${PN}-ptest_class-nativesdk
> data_smart.py:641 [renameVar]
> RDEPENDS_bash-ptest_class-nativesdk=""
> 
> $ grep locale-base env.bash
> #   " make locale-base-fr-fr locale-base-de-de"
> RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
[...]
> It just magically appears in pre-expansion value.
> 
> Shouldn't bitbake -e show that "locale-base-fr-fr locale-base-de-de"
> were appended (and in the build with bbappend that they were appended
> and then removed)? That would help me to find out what's going on
> much faster.

Agreed, bitbake needs to do better here. I had a quick poke around and
came up with this:

diff --git a/bitbake/lib/bb/data_smart.py b/bitbake/lib/bb/data_smart.py
index 7b09af5cf1b..4434142a02e 100644
--- a/bitbake/lib/bb/data_smart.py
+++ b/bitbake/lib/bb/data_smart.py
@@ -267,6 +267,16 @@ class VariableHistory(object):
             return
         self.variables[var].append(loginfo.copy())
 
+    def rename_variable_hist(self, oldvar, newvar):
+        if not self.dataroot._tracking:
+            return
+        if oldvar not in self.variables:
+            return
+        if newvar not in self.variables:
+            self.variables[newvar] = []
+        for i in self.variables[oldvar]:
+            self.variables[newvar].append(i.copy())
+
     def variable(self, var):
         remote_connector = self.dataroot.getVar('_remote_data', False)
         if remote_connector:
@@ -619,6 +629,7 @@ class DataSmart(MutableMapping):
 
         val = self.getVar(key, 0, parsing=True)
         if val is not None:
+            self.varhistory.rename_variable_hist(key, newkey)
             loginfo['variable'] = newkey
             loginfo['op'] = 'rename from %s' % key
             loginfo['detail'] = val


which now shows:

# $RDEPENDS_bash-ptest [8 operations]
#   append /media/build1/poky/meta/recipes-extended/bash/bash.inc:26
#     "make"
#   _append[libc-glibc] /media/build1/poky/meta/recipes-extended/bash/bash.inc:29
#     " locale-base-fr-fr locale-base-de-de"
#   _remove[libc-glibc] /media/build1/poky/meta/recipes-extended/bash/bash_4.4.18.bb:43
#     "locale-base-fr-fr locale-base-de-de"
#   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
#     "make"
#   override[class-native]:set /media/build1/poky/meta/classes/ptest.bbclass:13
#     ""
#   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:652 [renameVar]
#     ""
#   override[class-nativesdk]:set /media/build1/poky/meta/classes/ptest.bbclass:14
#     ""
#   override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:652 [renameVar]
#     ""
# pre-expansion value:
#   "make"
RDEPENDS_bash-ptest="make"

which is better but I'm confused why there are the "rename from" for
the overrides which aren't being applied (this is for bash, not bash-
native or bash-nativesdk).

So more investigation is needed...

Cheers,

Richard


