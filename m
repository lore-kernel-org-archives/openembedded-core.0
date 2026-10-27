Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26900.1793128629456081482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 12:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=roJ6c8j2;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so408402eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128629; x=1793733429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uIouDw1lFINwyJnDl6a+0pj9BekzRJItYgGGX3P1z2k=;
        b=roJ6c8j2V8LHU/vuNbXNq97LtaSrHXM24KQUsagxzg8ebF7dWS5wHiQo/gRyqRzrzV
         tE3ZqK8yYAiCrfZNDjDRzAPSrrVjNnV4ou0jg++EJ37H6w7aVheTfDkQUtMfLAijTaMl
         PeaF4s7T77mcX2iBmW8g3YY7pZhkDGxOZZXLtnygj8a1FA8ZcTOwJK9DjGPUQRFueWRB
         RG1brd+cQWSJBTYj5qTgrjJwJhCnaxjrZ2eiYCzFQM+GBWyGxiFB5xMt0x6VdEQ6yEdP
         0KQ+WeDeyYdvoXQUZSV0avArgi1CIxQ9FS7kLsdksaGjPP953mqQVsrcdt+P/hRdpGBs
         JNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128629; x=1793733429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uIouDw1lFINwyJnDl6a+0pj9BekzRJItYgGGX3P1z2k=;
        b=1juqT6JfoqgMI3jqVcsY2nT2eKHWJ+bCqKfIt7LnOVSxACfFwBXzXmfOsZIUpO8J12
         KX+QZGaqKLLoRYbK7T5YXguVzt2sYO+ZEZ8fqnzyQRVXMOZmdG+mzIIjS4Bk1g3j+Z3a
         Vhto6UM0QRXbe+6hUE2YNST5KF2zpWir1BIhJa3eXurPF6cHT6/vx263+z8VD8m/vKOE
         x0f7VS0a+XluBeJATXYE1tbNUBfLmKXRC/cq5yqX+9tvXVaRi3nciAXmGfRg6qmNxaI4
         FKqnQWwemSJKStIALLSFMcB2CmMqFLC2G9TiGPDoC7q3L9wK2SWkVzBr5EH4Fsq94YnR
         Vhow==
X-Gm-Message-State: AFq9FYJfpKmgcIly4N1Upv9E4peyTuuTihBFzfPhBjS6ytuDpZpQc/n+
	tV8+CJf5ArINYdZ8Ejndu6Qfn/DSB+Wat23dmFQ+RW7jbvEWEZqer5qR7T4JrUoXPW4=
X-Gm-Gg: AYBFou2IAzm09nUCoKVQe9sxTf6ZhpIv6SA2lMWIWRdmhk1Iw+OBpudRPFONeYex15c
	BqFuSY5Tm0KSM1aCnQoF58GIVKMmxPgGV85+2aWTcPkji7rTZsPSBGbPtnAYgmNolkijjTTCcVB
	bgJzyVn9e0vqU1E/Gx3XsvpSQM+1Zz4vjJxwlj2Ydy3AWvG0nOQmMIa8qvUXqvM2PMbS6+uwlp8
	5H1qTQyFYbKOqE6BdleDWueYTc/S99qJXN/M2NO0eVL9eDETWCOdRlQPXuNGqjJlLnR9IYtZi+u
	CE2kWSW9/YItNrUdVhhg8Dp+dwW43KUETqK+BZ65EKanUEjzSuKRUm2FQkvdx3VVrlZQB104/0z
	7bJjueq2c7e84WnYzfmrmHlNHuQqEzP05RTDMEXrqMoOw6xSbr5pOSc0W1enRLWt8kSSv+zyVEy
	upjdW0KKA7aXqEgIW8DdFkUqSQRddc1pWhe1pP+2xKwOheEixUYg4d0nCNewikIXSGcfURe8wtm
	xdeQsINAYC9gZKz/GqwTyAS+ZGAXAaNGbvUPQZvD+4QJs82OgXtw+D7y+QK5DbIIXSjzhGZoZm6
	zami/LnQE7AM8NJfyvfRuuCI1pASFfg2pqBtBpBURlAK5fHKOaAtgLJAw09tDc5y0HFOzfOloku
	XPz5o8BivnPQYhjYYoPrU90CPPkSpkB8OScnOGi37INyUrU0TwmY0+ayUaY9jYV9S6RSc0MJADw
	c/Pu98dkwa5z/46cF0z6brL9fVA+mm2hjpSHkRb3VjIg84a24lamoKvijJjylSOnxCjOPgzOTOb
	XwkhI47NH3Di+gK75cyiPDgaVBstrY=
X-Received: by 2002:a05:7301:52c4:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a204757e8mr387464eec.27.1793128628561;
        Tue, 27 Oct 2026 12:17:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm29759501eec.7.2026.10.27.12.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:17:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] python3targetconfig: Do not add the current directory to PYTHONPATH
Date: Tue, 27 Oct 2026 12:17:05 -0700
Message-ID: <20261027191705.1880728-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 19:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248761
Content-Type: text/plain; charset="utf-8"

setup_target_config prepends the sysconfigdata directory as

  export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH

PYTHONPATH is normally unset in tasks, so this leaves a trailing empty
entry, which python treats as the current directory. The tasks run in
${S}, so any top level module in the source tree shadows the modules the
build tools import. wxPython ships a build.py there, and pyproject-build
then fails before it starts:

  File ".../recipe-sysroot-native/usr/bin/pyproject-build", line 5, in <module>
    from build.__main__ import entrypoint
  ModuleNotFoundError: No module named 'build.__main__'; 'build' is not a package

Currently, the wxPython recipe is unable to use
python_setuptools_build_meta class even though it should
It keeps using setuptools3 bbclass and disables QA warnings for
pep517-backend

Fix it by only adding the separator when PYTHONPATH already has a value.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 3b9333a4be..08be22ae65 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -14,7 +14,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
         export _PYTHON_PROJECT_BASE="${B}"
-        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
+        export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata${PYTHONPATH:+:$PYTHONPATH}
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
 
