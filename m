Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1498.1795801857759245988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ePwWnhkM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so80462505e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795801856; x=1796406656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5ViKgSaSaHfP3NDZkBbw/HFils9ks/dEC6ihDtnjVU=;
        b=ePwWnhkM8gAzSnSMvhE1RBrymk8m2JnTQTlqzZE48FFOcjJPpZEahEiektAlGytSmg
         KAEmQA8mYdOCeNA7PLcDvB2ztZkQ1FkiML9i69T50NCOJaBHeegbj2v5G5HEmyR7VKcf
         eImYHBoyOogCHHqlXpkn6S+bLsnxTEB4NmI4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801856; x=1796406656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/5ViKgSaSaHfP3NDZkBbw/HFils9ks/dEC6ihDtnjVU=;
        b=VD1aYR5tzfakQLZdlB34hQ4vqHv4lSPFnwUrLMNIcKiaeuS7+I6GY1cIVaEfsSGv+8
         QctFUjL3sTwnKgP6IiaUTDgcOkueFNPH6e0MLP+jJ5K5dDP8T1d2lCvVwUykrXUGcqdL
         iReuUKPQqs8OlBE354yJT7c+osk9DskapiDcBWSOqNpOyiP6m9i5X7knz+Ztrt8gmiNY
         aYZbs69YYulfSYK9idU1NclXqnkxpq81QJ5kL7fSD5X1WdBw/3ScW6vJpcZJsPBuE+Jx
         Zspz7FtB3CbznDfww07rDOn0x/XuJRD3k6CE20sIUQ60CXUtbPURBGqmC430Qb44+Ief
         3wHw==
X-Gm-Message-State: APuU4Z9zoIWhallSghemZg15HNNauMvVDyYTHYuCJ7o8eB4HcDogU7CL
	54s0WRaytYBkl7tPyL5KJpT0BqV2ffMplWH/A+tUsF3FARkRlcV42lLcgIJXqkCjegiOjlL3Mlf
	6sNcZwRs=
X-Gm-Gg: AZFdTZfvhPDTcGGa1kpLPzMx1Zrqlq8VcYyerw3j1xmSvO2WiaErREFx85oSB5fOt1A
	ieDPhPEIEEzl80Csg6P+Z6mohY/b08gPsi7OGCooORJtiVd5Hr0FBhpAzTkmqvTqP7apSjq/fYb
	gseg7OIL9k+v4vMRHPYLXOL863IPOouin3pqjV8FLf3ZrxN0cOdpI+SXeHWtyXLBjI3ucGTo2bE
	pVXgmJ4AdflOFs+SxJGef5alt4q2ea11vZAv+THmD0Wb0CTlqndoOUME2Qd6arKsumvuCFs9W4n
	gsRONQUbcjdHgfgjPTDXvcge/b6raCkp6Rr4p5XUZhxxX9mJlTyPnfO51lV9Ot+MG1VLdrZqQPP
	kcIQNtDWhZVn9cJVLiM5GuKwB+Q7NyMkNhOGUNPMnJRreGvr3/vUX1qEzxrXczMF7ebk1kSCO9M
	ZxqJoIgxck0cQW62+PXaNXMotDMs2P9BHp4EzVAZjAoQU6+3zmp0AJ82aP75uPyXG/hS9obS0O6
	TROe6t2vV/LsB7Oys4FxhkrV/Z42qZ1klh83QXZ8EC5jOv/DHbpI45nQZuF+UKppSxF4b6hdK1/
	EiCCV13kXCQA8u+yQeyNFBdcbF5RYoLkmvtMT4hdvbb/tXFGH3+0sdrQgw==
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr519761205e9.23.1795801855782;
        Fri, 27 Nov 2026 09:50:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47cb:b596:3be3:8f97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm1105410965e9.14.2026.11.27.09.50.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:50:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake/base: Implement RECIPE_HOSTTOOLS
Date: Fri, 27 Nov 2026 17:50:53 +0000
Message-ID: <20261127175054.2271255-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251444
Content-Type: text/plain; charset="utf-8"

Being able to have hosttools added within specific recipes would be useful rather than
always in the global hosttools directory. Add support for this, impementing it within
the TaskStarted event.

We need to use a lockfile to ensure the function doesn't race against other tasks
also trying to create the same thing.

This directory builds on top of HOSTTOOLS which is left as existing so that we don't have
to do any work for recipes which don't need specific additional tools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 11 ++++++++++-
 meta/conf/bitbake.conf           |  1 +
 meta/conf/layer.conf             |  2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 9553f004325..3163db55195 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -153,7 +153,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
                 notfound.append(tool)
 
     if notfound and fatal:
-        bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
+        bb.fatal("The following required tools (as specified by %s) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % (toolsvar, " ".join(notfound)))
 
 # We can't use vardepvalue against do_fetch directly since that would overwrite
 # the other task dependencies so we use an indirect function.
@@ -289,6 +289,15 @@ def buildcfg_neededvars(d):
     if pesteruser:
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
+addhandler base_task_eventhandler
+base_task_eventhandler[eventmask] = "bb.build.TaskStarted"
+python base_task_eventhandler() {
+    if d.getVar('RECIPE_HOSTTOOLS'):
+        toolsdir = d.getVar('RECIPE_HOSTTOOLS_DIR')
+        with bb.utils.fileslocked([toolsdir + ".lock"]):
+            setup_hosttools_dir(toolsdir, 'RECIPE_HOSTTOOLS', d)
+}
+
 addhandler base_eventhandler
 base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed bb.event.RecipePreDeferredInherits"
 python base_eventhandler() {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d353a7cd2c3..31b3f6243b6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -524,6 +524,7 @@ export PATH
 
 # Directory with symlinks to host tools used by build
 HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
+RECIPE_HOSTTOOLS_DIR = "${WORKDIR}/recipe-hosttools"
 
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 67fef791545..04bceadddee 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -138,7 +138,7 @@ DUMMY_PACKAGE_ARCHS_TARGET += "sdk-provides-dummy-target"
 # We need to keep bitbake tools in PATH
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
-PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
+PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${RECIPE_HOSTTOOLS_DIR}:${HOSTTOOLS_DIR}"
 
 # Only OE-Core should set/change this
 BB_GLOBAL_PYMODULES = "os sys time"
