Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA797E65C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 4so340293pgm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q6q20kcbclYsy3wAcIU4/lPSMGZUUuwjVOB4ay7R/50=;
	b=chBJUDmaj4d6G/LPqvMejiu9M7IPoFLZq62grhU0yUoXj1OlnOsKL6paUlAJJ6y4zW
	fPuOxGiPyGhKr1d//hmxWCcC8PViUU6RQupBEgI1sGDVjd83Yo9yQei8fHhE+1kfxB/a
	dZrllalZmhjp3/zmI1ziuxArl9X05NXgEERouzHMWY3bokVSynpR5T0v58rUACk5O5du
	/VQ6V+bb/MVkW+q0LCYH1eJAg5his0dSPMu+hw0PPRJIvc4fW2QvK1MDlv7GRHJFPW11
	LGPtBYSSpEd3JlWxukJ2Gw4nTcdOkJj8DRpI3pqqqZFMLWd4k3b6romW4HiNgwXiUGgx
	zJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q6q20kcbclYsy3wAcIU4/lPSMGZUUuwjVOB4ay7R/50=;
	b=kOoZVp78Y6pXTnt3bCR0LKEG+zHeL9p/yd7W3OaEv1zBAIfy8XLU8GuCt2ctd1lEQI
	tXa5qDIoxXvcBlrDHp+sUxKZ0C8gvvYWxqaFk33vaTChgycAsCWUeKWfvk5EjJ5+/tly
	iPLwpQyxkCzxvr+Vxow11Sax9ut9tuz+6a4aBOfy4weMUd1nhpGhXfhL6T689jRxNsVO
	+qo8zIAyOF+pJfY8Uvh3PcyRlqtPcUSljag49awigEUVhqGGIANVCv8QRyycybR/I6F+
	Ob7TX31e+4hfEONXcDucsyHXdkayFkaM22SbcEjZzzWJuaPCP/EGVwtD6QpDDi5nVejk
	97AQ==
X-Gm-Message-State: APjAAAWE5pOsDNQ/enlIlso3lobBkmtO4Svy4muoy2kdsGg6QYXS3k87
	DJU7YqKIAj06yYFRq/aY34+3Nvd1/Kk=
X-Google-Smtp-Source: APXvYqzNlvhkm7bMuyB2y7ib4nCFk8OCwtcYj7oMFz7f8Go9x7wNHsGuRZm+Efu8drWcbbXrhMPqqg==
X-Received: by 2002:a65:5546:: with SMTP id t6mr751193pgr.441.1569293379086;
	Mon, 23 Sep 2019 19:49:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:45 -0700
Message-Id: <b129fe2da471b904a2c06391d2a2fc41f2ab4e8b.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 05/50] glibc: CVE-2018-20796 is same as CVE-2019-9169
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:38 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:
https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34141
https://www.securityfocus.com/bid/107160

(From OE-Core rev: 7e90506534ed2a70680382cf28614f02fdb98409)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
index bc40361..cf3744b 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2019-9169
+CVE: CVE-2018-20796
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-- 
2.7.4


