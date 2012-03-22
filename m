Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfuo-0001Lu-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:46 +0100
Received: by wera1 with SMTP id a1so1696213wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=1cxpiXRRSVCiuFz5pxI1rRampDah53bdeikY5BQda3A=;
	b=N6Y3itBW0ksCqCAIEfH+gPmViMOr54eHtgTfwgnskYCqEnRcMWqIV7KGPKTgZOnPp2
	6CdRfQsmPnsWutJvEubk0B53tHoV074xUk4CwvKXlB+k2VrYvVYVVO5ckqnETUXYubJv
	AnPl+JXGojbNVveB+uA4k7o1AsWQU2f/cEnrHCInlXOmGSGjOa+qpgoxEMVh99FuJBiD
	wgu8pZHhO1oOOHyMlAJqcasp0vkXySDOVOtmm8Z740hLHLEi0sH9FmQGs+iIptX4WGQ/
	hOrrP2BO7iHmRCYrUmjRrDovsiadMLfBR0S5a+htuIJTzG+xdMlwwHaq4NebzGsDvsAk
	GUwQ==
Received: by 10.180.20.47 with SMTP id k15mr4052330wie.19.1332414112023;
	Thu, 22 Mar 2012 04:01:52 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:01:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:05:56 +0100
Message-Id: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH 1/7] bitbake.conf: add systemd_unitdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 11:10:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of oe-core's recipes need to know where systemd units are. Since the
directory might change in the future [1], we set the location once globally to
reduce maintenance efforts

[1] http://www.gossamer-threads.com/lists/gentoo/dev/245758

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 07982d7..52802f6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -39,6 +39,7 @@ export libexecdir = "${exec_prefix}/libexec"
 export libdir = "${exec_prefix}/${baselib}"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
+export systemd_unitdir = "${base_libdir}/systemd"
 
 # Linkage between native/cross/nativesdk layouts
 base_bindir_native = "/bin"
-- 
1.7.4.4



