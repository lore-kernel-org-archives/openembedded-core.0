Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 690D37706A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:42:27 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ma7so89697407igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b9u8TXo0p4hkV0Bd7p0PcDk9sobzoHYKc1w1SyJFurU=;
	b=QlX2zwggb23o/6s1OB0vlp1NjUEX27jXB3oazKjhzpQ9dIvhFPcWx5mJpOMoCVRVXV
	DJ/GkwMlgspYsUX33ZibriffIM1c0XtP6aFArKdkG9T6m+JlOkK30yYTvl9oTj1VTSnZ
	rZWzzzlwofRkdDTsT9KgGaiUGCT3Dr4F/jiXJSSPXi0WzH+SLFygKd4RmuoUDSyD3sq6
	QYVLR5s0aic06bMSlENXJxY5l+dnJFnHyIUgj3wp1xNL0Ox0aFL2iPTYTR9qYz4TD0XO
	Vy489vTCn/CfvIp0eDQJB74KezkQIQabYrq48yPSQ7FIifoURixfjZvP79ehEL+Z+nzq
	LxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b9u8TXo0p4hkV0Bd7p0PcDk9sobzoHYKc1w1SyJFurU=;
	b=kOazxlRYT4Zc23+lDMeD9jUpOmadYY1WIC0ab9/QaDNUICKHMbvrIOAaJPLK0m4IZo
	aNDMG2bWLFqpACMK2xx1BzrDVSwEe2QKDqa053qRRxHrVJVrbrUUuTicro1ALv5ldrqE
	0z14Af7sZO0I+iaIDKp7T4OOPt/svXXTFb6KbJNz+Ru6K5NTimydGm0ehY7P/Yx+ggZ9
	Jt5G5vqz2nGeF9Tq9XD+gTlHfMXKhBvHJl0y9dL8I/EtBsJneedDoPK2iRRswBTT/cl/
	XJPB0VSAnVB1dHSycmbhprQRdoq12i5Bgvx2rjTtn7sNiIbftjatwDE0vXiMEH9BXjuV
	uBvg==
X-Gm-Message-State: AD7BkJJCSbJaVQWCfamOTdSdzixUMHI/64/7WGZN5nw4C0Upd76e3y/KGnIsN6BL9j7zd2HZ
X-Received: by 10.50.79.168 with SMTP id k8mr11601360igx.55.1459777311191;
	Mon, 04 Apr 2016 06:41:51 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56B6F.dip0.t-ipconnect.de.
	[87.165.107.111]) by smtp.gmail.com with ESMTPSA id
	g67sm11657048ioe.34.2016.04.04.06.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:41:50 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:41:39 +0200
Message-Id: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1459776943.git.patrick.ohly@intel.com>
References: <cover.1459776943.git.patrick.ohly@intel.com>
Subject: [PATCH 1/5] bluez5.inc: remove obsolete workaround
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
X-List-Received-Date: Mon, 04 Apr 2016 13:42:27 -0000

Bluez 5.37 itself correctly installs bluetooth.conf, and honors
the path settings in dbus-1.pc.

Removing the obsolete workaround is necessary for compiling
"stateless" (= read-only system configuration moved out of /etc).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 5232523..a508229 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -60,8 +60,6 @@ do_install_append() {
 	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
 	fi
 
-	install -m 0644 ${S}/src/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-
 	# Install desired tools that upstream leaves in build area
         for f in ${NOINST_TOOLS} ; do
 	    install -m 755 ${B}/$f ${D}/${bindir}
-- 
2.1.4


