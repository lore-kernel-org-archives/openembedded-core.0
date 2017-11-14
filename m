Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.201])
	by mail.openembedded.org (Postfix) with ESMTP id 788A57857A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:56:31 +0000 (UTC)
Received: from [216.82.241.196] by server-9.bemta-8.messagelabs.com id
	3E/38-02047-17A4B0A5; Tue, 14 Nov 2017 19:56:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRWlGSWpSXmKPExsXi5LtOQDffizv
	KoOU5r8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHp5U6mgmUsFf97rzA2MJ5h7mLk4hASWMUo
	cfFPIzuEs55R4s3F20AZTg42AT2JyZeeANkcHCJA9tV/oiBhYQETiQ2b17KD2CwCqhJtj86zg
	di8AjYSy9bNB4tLCMhLLP6+EyouKHFy5hMWEJtZQELi4IsXYOOFBFQkDi69zAhTv2nzWfYJjD
	yzkLTMQtKygJFpFaNGcWpRWWqRrqGlXlJRZnpGSW5iZo6uoYGFXm5qcXFiempOYlKxXnJ+7iZ
	GYJjUMzAw7mCcttv9EKMkB5OSKK/KZ/YoIb6k/JTKjMTijPii0pzU4kOMMhwcShK8IZ7cUUKC
	RanpqRVpmTnAgIVJS3DwKInwOoKkeYsLEnOLM9MhUqcYLTluPLz+h4nj2czXDcwc0662NjELs
	eTl56VKifOqgTQIgDRklObBjYNF1SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryVIFN4Mv
	NK4La+AjqICeggKZBfeItLEhFSUg2MgWa8zI80XF/vvOp+3lnz4iLZaVWMnRb2T2zzPx+Uf9X
	hE9Io7DhxmZzV433zP6bO914R+YDn9/Zsx/iHDreP8Fp8UORXnnx+z0I/o73Oou/+JO8Kf99U
	f2a63x+GwOacZ1HbdhhxXunt3vJ0l3f5okofa8aQ6w+cM/ZdyXS9+LVWaErWlBsKSizFGYmGW
	sxFxYkAmLPZRqUCAAA=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-13.tower-46.messagelabs.com!1510689391!79943362!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25559 invoked from network); 14 Nov 2017 19:56:31 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-13.tower-46.messagelabs.com with SMTP;
	14 Nov 2017 19:56:31 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 14 Nov 2017 13:56:28 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Tue, 14 Nov 2017 20:56:25 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 20:56:17 +0100
Message-ID: <20171114195619.30923-1-javier.viguera@digi.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
Subject: [morty backport][PATCH 0/2] tcf-agent fixes
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
X-List-Received-Date: Tue, 14 Nov 2017 19:56:32 -0000
Content-Type: text/plain

Hi all,

There are a couple of commits in master fixing the tcf-agent bootscript and systemd service files so the daemon is properly kill on reboot/shutdown.

These patches backport the fixes to Morty.

Regards,

Javier Viguera



--
Jan Kiszka (1):
  tcf-agent: Fix daemon termination

Martin Kelly (1):
  tcf-agent: kill with USR2 in systemd stop

 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init    | 12 +-----------
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service |  2 ++
 2 files changed, 3 insertions(+), 11 deletions(-)


