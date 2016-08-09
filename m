Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2DC771F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 11:48:45 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f65so27652957wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m982aFUfdFRKi0HMqHu6VBjI76/bPZ6eU5JACQ9naRk=;
	b=2QRzjK6mellT91V8wO+YAZaFLyg1CIhS5P0P0NIdNBSgKCq8pPbf/CITInpdX50jLF
	/pozfm+BpmSBpVdjczgyDxENJFyjZWPdNDeWhubeTJZdQh+pQYYZ/EAelIMECEVZyFGd
	5hQj9IvB1pXXeGSjMGIe9A56omthveVaUxqIsdL3dD31Hl8cuNzYMktP9+sanA8q1KVF
	vEXaSIwQRBEYmousHYtBFNKPoncyYa/DA7laMj0quqZO590knHNUfNG3O43GSfJoe8tv
	X7pnnRIcmqW5vssW+DZXlW5xFkf06IlboxSgnl6Ee2+ipHrnMRAmPBvm5J/RoTRbRsVD
	/JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m982aFUfdFRKi0HMqHu6VBjI76/bPZ6eU5JACQ9naRk=;
	b=GvIMzyjdbliLzMDS5V1RE+S1snZ04PlZ2ROl+hmRadGsQddXHaWAIL1VfBt40mDB8i
	18eEFEdMobQu3dc/46Yn61NRMlyetJZU4mXimUUe9qgLCTs57ztx7gPcsP9qnYctwiY0
	wTqgyqvyFO0XMFpXD8NBMFIgOKY+m2FS3CXdoRcW2V53vNu9bPZy4R0bjXNH9z8mD+50
	F4y2VA1m1xdu51N3S0LtXFupsCrfbU2wxTM9SpCad69asLOnwCVCRSWTv6Cf934ef2LX
	Xgjslksz+2efLRaPSJzpOYDviX3hIpWxRmGSgJf9xH5sKWlADlSSs062EXyPgD9sfPZu
	5yuQ==
X-Gm-Message-State: AEkoouthLguJoQ4QZ2jByebzD+opEi6mu6p8S0w/NmCIwr73hSe0YNxF8R98rtbYMwkmfg==
X-Received: by 10.25.205.200 with SMTP id d191mr31556975lfg.212.1470743324878; 
	Tue, 09 Aug 2016 04:48:44 -0700 (PDT)
Received: from localhost.localdomain ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f3sm6554974lff.21.2016.08.09.04.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 04:48:43 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: ross.burton@intel.com
Date: Tue,  9 Aug 2016 13:48:35 +0200
Message-Id: <1470743316-19724-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
References: <CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [krogoth] [PATCH 1/2] systemd: Create missing sysusers offline
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
X-List-Received-Date: Tue, 09 Aug 2016 11:48:46 -0000

From: Khem Raj <raj.khem@gmail.com>

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

(From OE-Core rev: d18957925c6c073b7194e3a233efea24e436f74e)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd36a447d0da53e713d992b17ce86dd31ea63c67)
Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
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
2.7.4


