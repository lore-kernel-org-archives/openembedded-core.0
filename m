Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0492C611B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:43:02 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id j17so4829785pjz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BBE8rilfeDPja3nb1+wdmHEiXs5bvMYjr8zpshC35hg=;
	b=QBY2VwT+CwM3Hp+vBnbgW4qVePuBTtEd4V9MP6E3xi3/h3YbKVczpeQNG9mdMbP8ev
	fqgRkyQiZZK6afTtiDkpf1I0nzsin2AgDe9i4YXYTSZYZeFzYAf2jf78/EXiAAcFsra+
	U1BP6KNjly0Bu/s0sVkFw503x8BFSEAf191wKQBsFGrn9yIpSyiX8B/zhTmkjF/qHCTo
	IGpJVYS0DTMwC9yqoam1djl/5khqzWx7vtxW1RqVf1frFkPNkBxzG5jqZ89Z6ZPerjnk
	Ms6y4SW3tVnGVvoP4yfrHcETFO0LELatO7SpsWttdM0vvMlin4pFFGZvhw9ZZ2ZnwXiw
	ibMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=BBE8rilfeDPja3nb1+wdmHEiXs5bvMYjr8zpshC35hg=;
	b=gdMFxgI0uQZk1xqhnaKrZLdH1tHrICr0SG1v4q56D8Hqpthte+lNiG5zSKfdP3527+
	hdORZ3Zjm5d38HZBgdGaiX2M0TRi0NNeILiExrx0oJCzFJy52zCU9z9ju024iXZ5LR1R
	EnBDSyRKl+VxwgZrpgg+T5mXNvk6E7wNb6a1xmxUE0gyHRNO8Vyon2gQ7rkuhtphGnpD
	lkACr6M+EQdsz6HhJM1kH92vpWOfbxrg+nxAVVBeKnobPNrhPBsSO5VIVJ4nVhP0SxE+
	F6HNMYxTZ0YlIX6CRG1y+us2TIDsRhLXDS6qHxkmxGB7SXDE3m4lVkO9Egtsod6xZPYm
	cSNg==
X-Gm-Message-State: APjAAAU2pGab2NHMF/umo2qwifnmAhWiKAkGuIkw3uIvYmDllNtw/VLX
	QWJqg406X5V/O3wJtUg7ZLHzoxY+zYCzzg==
X-Google-Smtp-Source: APXvYqyUSV2LjUU+DGKGRMgztd7OzHBU7xg9PssY9nyzwrvwyDQox6MMkflnoyhs/jWr24l+Uh3yhQ==
X-Received: by 2002:a17:902:a706:: with SMTP id
	w6mr6592291plq.79.1581741783663; 
	Fri, 14 Feb 2020 20:43:03 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	r145sm8758027pfr.5.2020.02.14.20.43.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:43:03 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 6C69B2A04B2; Fri, 14 Feb 2020 20:43:01 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:42:48 -0800
Message-Id: <20200215044253.5596-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/6] bind: add mulitlib_header for platform.h
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
X-List-Received-Date: Sat, 15 Feb 2020 04:43:03 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-connectivity/bind/bind_9.11.13.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.13.bb b/meta/recipes-connectivity/bind/bind_9.11.13.bb
index 338d6c717a..4e64171cc1 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.13.bb
@@ -31,7 +31,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
 # don't report it here since dhcpd is already recent enough.
 CVE_CHECK_WHITELIST += "CVE-2019-6470"
 
-inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
+inherit autotools update-rc.d systemd useradd pkgconfig multilib_script multilib_header
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
 
@@ -105,6 +105,8 @@ do_install_append() {
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
 	fi
+
+    oe_multilib_header isc/platform.h
 }
 
 CONFFILES_${PN} = " \
-- 
2.13.3


