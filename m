Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB1B731AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:06 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id oj9so1833520obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DCPHk0cfhiq23pOH36iEBPvxwZIUoFmebYA19OldaP4=;
	b=plApyLDhpRwdpOW942L6EyhU9e/IqjjjUvS/b+s4Kb+upMhS0XvJcDj5HYWtmLjYNn
	MLTCFwef5bSqvSq7C6IlTIUfPiBx8GP3boLvYiN1idq0FzQM0Fon5E/hVYfNKTzgPpl7
	JOIJkGtb4tb2VfL8tlYar/4hGYAk2sznmFRgpvuasCopu1nbGYb0eTFWF6lIlCukIjfw
	0bdZHkUSfUkVo9IknW9dYeMY3oWHYfalAIXwB2ZA+bM8cQiBXSqXMV99qAka2fd0Yjdl
	6vFhcj/Pq6VJCA/cCocTjAewbiJ5c6XYSUu/Y3GdTNEEdkB74MbE5O/gLZHwiEIly/de
	IfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DCPHk0cfhiq23pOH36iEBPvxwZIUoFmebYA19OldaP4=;
	b=GZFKiRuVuMmey/QkkNqVoSEd+ZDtQWAej++DkJk0vr2n43jVxK7DSCocC115AG68aI
	O+bpZd34n++XH1/wS0q+pNWO4DLnuVKR9l+ir4ETFmvabyQFkS599x6HwnnoObuXMvQN
	hVTVBca5cxuh/6tiyxGDgLxM9/eeukFSF64s76C7wFhkeCb5GiZLQ6XByXaYeI3XjPMd
	gZm3e+fGXxggg2MLjN7Aet63gTK38KyUf/sG7O+oS3thRnqWtTjZmYce6emcUSAU8y4g
	3iXqWv7cFGibhI7O7RL/vmsR7jv6wHF7rdHQBJFW+reT5r+Ld/7jFaWoIG4QiBvi7PX9
	Ud7A==
X-Gm-Message-State: ALoCoQms+hJFyfuZ8rSUAmrq8Ee0GPhRsl5hndEp2zNVMdpiSRRLN/Ynlf55StiO9PKkDgqjNDGQGVPf70ghqxwnrSIxKAeBgQ==
X-Received: by 10.182.28.7 with SMTP id x7mr30391515obg.13.1453344247821;
	Wed, 20 Jan 2016 18:44:07 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:06 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:16 -0800
Message-Id: <1453344203-7118-19-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 18/25] gstreamer1.0-plugins.inc: drop obsolete lib-link.m4 workaround
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:07 -0000

There is no lib-link.m4 in any of the gst-plugins-XXX sources (and
there hasn't been for a long time). Drop the obsolete workaround.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index a552653..f179ce9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -54,10 +54,3 @@ def get_gst_srcuri(d):
     else:
         s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
     return s
-
-delete_liblink_m4_file() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm "${S}/m4/lib-link.m4" || true
-}
-
-do_configure[prefuncs] += " delete_liblink_m4_file "
-- 
1.9.1


