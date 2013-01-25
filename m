Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1Tyt8E-0000PT-Ac
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 00:56:26 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so535787pad.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 15:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=NbmtgvQSDYJL76BkamMOIMgxgnT9xaO5Q8Vd88DDIYE=;
	b=gsuHr5QSCT29RHWjRoZm9fvDLU/y3NfpkLm9vm8Ju8jG/ACPITkKEz+CxxRKBeHAjX
	bOK52JO1KehRGDDYh3NaFG2folVI1nUpZ86OVRYg4132IeY9lnajzGTLDXUoNn7JjIDh
	BR04pqgL/PVLIFpFxWU/WFpb8g++xMWggqjUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=NbmtgvQSDYJL76BkamMOIMgxgnT9xaO5Q8Vd88DDIYE=;
	b=HM6nLcuRKWzge1VJeRX25scAk520jzF41/DpnX/n8jGnl6fEC6c8Qo+EeTF5hK0Xvq
	HmLtLUYFNGTTWlzFRiU1LuagBdtYG/p5+KVG7ne+h+dKCMpwrKdCQGA2pMv11hh2gB4J
	ckt6jd+E+o0XKPkPFfEUExtMJjjTqWZt9nzMfJOW9V1pMIybx/qJ55IYvIGLLsBNo7z9
	oV9a28LjNCvZJk6ICLM9GMBl+K629QJMs429LC1wyjb+rRU732NgAC6mhRDML9X8cvO2
	S/GQ1H8hVL9Cf7NTD2EztY9yIYljSh/5AwIoRGYLrEp7THJB4LLVLX0G63bZuSPN+jre
	qyWg==
X-Received: by 10.66.82.198 with SMTP id k6mr17229771pay.53.1359157250687;
	Fri, 25 Jan 2013 15:40:50 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ho4sm1463156pbc.54.2013.01.25.15.40.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 15:40:49 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Fri, 25 Jan 2013 15:39:37 -0800
Message-Id: <1359157177-1411-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm+jhwcnxu+tcVqUh4xGJs/Hizvg2NaR2tCIC/7dECndMZxbr2yq0K3SUVzEkcZqPIBAo0Q
Subject: [PATCH] poky-tiny: Add pulseaudio to DISTRO_FEATURES_BACKFILL_CONSIDERED
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 23:56:26 -0000

This is to ensure it won't be included in DISTRO_FEATURES, we have
considered it and it's not appropriate for the poky-tiny release.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index 761844f..4ab488d 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -86,6 +86,7 @@ DISTRO_FEATURES_USB = "usbhost"
 #DISTRO_FEATURES_WIFI = "wifi"
 # This is needed for DISTRO_FEATURES_BACKFILL
 DISTRO_FEATURES_INITMAN = "tiny-init"
+DISTRO_FEATURES_BACKFILL_CONSIDERED = "pulseaudio"
 
 DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
                    ${DISTRO_FEATURES_NET} \
-- 
1.7.9.5



