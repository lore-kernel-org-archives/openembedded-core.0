Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7D71712AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 05:38:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s895cWiw004656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 22:38:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 22:38:31 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 13:32:35 +0800
Message-ID: <cover.1410240620.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] xinetd: add systemd unit file
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
X-List-Received-Date: Tue, 09 Sep 2014 05:38:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

root@qemux86:~# systemctl status xinetd
● xinetd.service - Xinetd A Powerful Replacement For Inetd
   Loaded: loaded (/lib/systemd/system/xinetd.service; enabled)
   Active: active (running) since Tue 2014-09-09 05:13:43 UTC; 15s ago
  Process: 124 ExecStart=/usr/sbin/xinetd -stayalive -pidfile /var/run/xinetd.pid $EXTRAOPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 126 (xinetd)
   CGroup: /system.slice/xinetd.service
           └─126 /usr/sbin/xinetd -stayalive -pidfile /var/run/xinetd.pid

Sep 09 05:13:43 qemux86 xinetd[126]: xinetd Version 2.3.15 started with lib...n.
Sep 09 05:13:43 qemux86 xinetd[126]: Started working: 0 available services

The following changes since commit 1894522f357fdf0b6adb2dcc14f12817628596bd:

  bitbake: tinfoil: add a means of enabling variable history tracking (2014-09-05 10:14:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/xinetd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/xinetd

Chong Lu (1):
  xinetd: add systemd unit file

 meta/recipes-extended/xinetd/xinetd/xinetd.service | 13 +++++++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      | 12 +++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service

-- 
1.9.1


