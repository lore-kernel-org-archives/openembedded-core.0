Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id F292773195
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n205so11551332wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=WtQMZZXgtpp3bD5nxp9tpl+hWYxbsc6LePQOBLFvbqY=;
	b=I8Uej7ihA3uIPbhZdOLFDCPb3EeViKRa6g9r1zIkmnnCo2l7+hV826Cb0e/jZkyx6m
	06sGiSYCKxGl65gHSralOblVYgwQBcqkaIeobE/xPMzo8P4V48KjShqyLxXoF20Rx3F+
	Qleob+IzeF9/iQS1QD+Nx7LKzs+96a8BxhAL7kgAsG0R4AqvNswV4TIeN3Q+JUBru8ZX
	94y5fE4lyGxxc09Dcjx5WQOSLLxi7ZPpYONNAKFfdVvMQC9lUqr4LEtJNdl9LGtFSPWJ
	c3nctwLlQxiTrmN86FRYmgoVDUXM84WQGiWoyJsdzo+WNOOYiIh8ckqwcQ7t/czyrDN3
	uXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WtQMZZXgtpp3bD5nxp9tpl+hWYxbsc6LePQOBLFvbqY=;
	b=f/LH/oQi/j+wtLD0bkc2DUGOD/c/1O45rs/0u3qd1iD8PRiB8UaCk9kT0gY9e4ZP0D
	RT/XP2k/jdXLo6Kbcc4lD7etJXyi+Bqsqi2k3lapuyTh02YqHMjl65bVyV5ZTW9/Pd8U
	biOtR//CY2hZ3m9Uqh8cPVBG/4nVSgFUBJBi478jiRVHGFYaliUy53atHhhafYuljN8g
	Ui6Lb9Aqs/u6facAxJEJPEb5KMTzngFVN2Vj8I9ijoJGaAqExeQzOLhcVRS+EBhG36Hh
	fibrs5swbxGfRnTGkdnmqkYX+9f23MQKq2VK55TWWdvrfP8Mykm1DsdftsHJet45IRXB
	TDFg==
X-Gm-Message-State: AD7BkJKoF9HezJxXaNDbhnb1Km20SuN/dBNnrSqYjOjc3BE46ipWW5k6YYMc99+KrDppkA==
X-Received: by 10.194.179.227 with SMTP id dj3mr20383755wjc.50.1457896518590; 
	Sun, 13 Mar 2016 12:15:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:17 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:32 +0100
Message-Id: <f86fa1672dd64ef5e26d830e73ba3f62c81a176f.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 34/42] alsa-utils: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:18 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
index af40488..49068f5 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
@@ -62,7 +62,7 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d */*/udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d */*/udev/rules.d ${systemd_system_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
 FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
-- 
2.7.1


