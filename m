Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 418DD7FCE5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:18:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id az9so4533350plb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rimGlRafE8ivv54QwgBig6t10ko57CXjagQgN53FVHo=;
	b=iFaGpyMyvIDQgoTip5sVlXQ9UDM8uWMF/nN3nPz4me23CmP9N1ZTwHRn4NBGcn6ZrU
	9pjcD5m18A0vqYraYjfTyoD6CmVRaz8C90RZ6yG8HgAz1rbBaNjn2oByGg81JD7ewbtX
	w60t+4Q4d14+Qdf5fHOtrZrknftdI6g0f53g1l5JeFTdCzZc5Z/FxNJWOWauZibtI63F
	kBU+k5EDUnDSioyCLZCESaJGi+ah1QueJovRHQUGaWptDnlRegDyKcYT23DE4VG8tPwJ
	fQKlIWSACWEJSCzYaOMDpQqAa/HQxwQRD4NbQ4HnoWzW9fpqYM1iDPYUu5nOm8isq/0V
	u5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rimGlRafE8ivv54QwgBig6t10ko57CXjagQgN53FVHo=;
	b=HLNMK9RGrCjs5waVEn4lgkdZ0lHqDT3rLutIC1CkM+dCOXzxEysE8s0j1GKWYLf++K
	rKHtotZsBgna0WWoVKE36bHMR9Y7vHyGPDrd4r5fFp3EsN/xe4gKnqJtMTfzKRX1aShU
	IMLTLO967VmQLkKvKRtQ684QbAdu9bQFGYAzvbdSOAbbvFzhNBQ/QuT2szb/Me4s491+
	24Onn0V/7hc1IIqxigCSiWnrz/m/QuXFEDeoPJBSa5TVFG0eXPa61+iQECx3ZiVGoLqa
	IYHwLv1NiZ+PDJK2Mmyz4CCY0IQ6sIuQyMczDRZSPd3UIaMv0aGQ8+OiSTzfdPgkFFwB
	tmww==
X-Gm-Message-State: APjAAAWP3ek3Y/isFAIlzFxb7Bzkumya+hk6d/KkJH8E/+9Rgs1NgFPQ
	SvgUjnGuvhVIgc1aX0Z7g05/Bel+
X-Google-Smtp-Source: APXvYqwDfm2oR0P3szbzVOxYKxDZje1F6Zf21JuDeH8FPQcywJmz3lMIXawlIvQZQGe1m2ItCFFTug==
X-Received: by 2002:a17:902:9687:: with SMTP id
	n7mr20185762plp.335.1574525930134; 
	Sat, 23 Nov 2019 08:18:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id u7sm2647804pjx.19.2019.11.23.08.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:18:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:18:41 -0800
Message-Id: <1574525924-20765-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
References: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 4/7] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Sat, 23 Nov 2019 16:18:49 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Older versions break opkg-build when reproducible builds are enabled.
Rather than trying to be selective based on which features are enabled,
lets just make this a minimum version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sanity.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 705062b..9d0c784 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -523,6 +523,7 @@ def check_wsl(d):
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
+# Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
 def check_tar_version(sanity_data):
     from distutils.version import LooseVersion
     import subprocess
@@ -532,7 +533,9 @@ def check_tar_version(sanity_data):
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.24"):
-        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
+        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+).\n"
+    if LooseVersion(version) < LooseVersion("1.28"):
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.7.4


