Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW61W-00062Q-3M
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 14:13:42 +0200
Received: by wwb17 with SMTP id 17so3984267wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 05:10:18 -0700 (PDT)
Received: by 10.217.6.195 with SMTP id y45mr2583658wes.56.1307967016566;
	Mon, 13 Jun 2011 05:10:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k70sm2847509weq.6.2011.06.13.05.10.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 05:10:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 14:10:12 +0200
Message-Id: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: [RFC] qemu* kernel configs
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
X-List-Received-Date: Mon, 13 Jun 2011 12:13:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

After finding the bug Scott was running into with systemd-image (no =
DEVTMPFS support) I have a closer look at the qemarm kernel config and =
it looks dated to me. If we want to have tools like udev, powertop, =
iotop, latencytop working we need to revisit the config. =46rom a quick =
look I found the following items missing/incomplete:

* devtmpfs + devtmpfs automounting. Recent udev versions require it
* cgroups, systemd requires it
* process accounting, *top uses it
* fuse, gvfs requires it
* autofs4, systemd works a lot better with it

So what are people's thoughts on enabling the items that weren't set =
before and moving modules to built-in were needed? And if it's wanted, =
does anyone have a quickstart on how these changes should be done =
properly? My 5 minutes of google and 30 minutes of staring at the meta/ =
subdir didn't yield results.

regards,

Koen=


