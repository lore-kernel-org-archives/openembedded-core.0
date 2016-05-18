Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D01860107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:40:33 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yl2so3728514pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 21:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dQY4ffkPYc9gRVv78jHft9y5AZo7WDsdhvfIswNY+28=;
	b=LpulwWim+ud0Dm5RSf142fNGhBAv/kaciDG41pfUO/4Fu3bVOJ4ivnPyLVNDzIy2se
	Hd9g1Iu7bxbHUva5L/Xrz6Aew+BUcPwjoptfg6sgsbmrMKz+ZyaMgghh7xn3mVDmkt9F
	0JPGYALJHLb7CQEdsDiW37fre3xYL1KGYRTG6SnyICotMucWOZ1DJ9AzrfHMruBlb795
	uGWvzL364+YXBCjmz0XeWrZdl1O8UFB91IxUmC80vr0kV4iTdeDaZHyPxbjkkk9V94rh
	CDKx7zDpMVDqaAHB2nRvmKjml0kzZAFnSHhTtLqhh9+YtnjFeIApynF7SzywC3ejPy61
	JH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=dQY4ffkPYc9gRVv78jHft9y5AZo7WDsdhvfIswNY+28=;
	b=UFKUsMxAz1OsWRU8FGm8xv/35S7bLihzImmRdYWsfaIJ4PR/IerHmiDNi5cOdhlo35
	I0rRVkiO50TMFuihfYMSkj5vz4aXeLuRdCl9LstchGgTegCUk8MFC0o6bAgbA6xHUKMi
	2kr8Uj66ln5oOeusrqurjGy87I9E23M+5oKGcrIh2sOmQw/5fmOCJhL1IeQRKLby61+q
	RMwOizccJPA/i1EYe0tN2CSbiA2o3RQ9D7ezkiyL8i+NZxqQ7lV94qeTkPnOVZQETbJe
	OaZwrmYzKzs2b3nLcbqclITH/XjU+FZ5/0WY3kmnarV8xlNi45EQZfw/gk652ryOKYSw
	ooHQ==
X-Gm-Message-State: AOPr4FURlm0R5qDaxNp/bLsPhCP0CN7zTQWbDel5EpV5ccOQmKrf3MMKhzu6GSUaW+tsxg==
X-Received: by 10.66.158.98 with SMTP id wt2mr7691626pab.53.1463546434268;
	Tue, 17 May 2016 21:40:34 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id e2sm8324447pfd.20.2016.05.17.21.40.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:40:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 21:40:21 -0700
Message-Id: <85edcbf217242f13d1fa76bcf8258c153fc89db9.1463546289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463546289.git.raj.khem@gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] systemd: Create missing sysusers offline
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
X-List-Received-Date: Wed, 18 May 2016 04:40:34 -0000

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..a2d35f8 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -319,10 +319,16 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.8.2


