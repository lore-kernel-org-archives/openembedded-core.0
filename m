Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIF2h-0001da-JJ
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 09:33:55 +0200
Received: by wyg19 with SMTP id 19so6024158wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 00:27:56 -0700 (PDT)
Received: by 10.227.38.27 with SMTP id z27mr686779wbd.30.1319441276213;
	Mon, 24 Oct 2011 00:27:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fw16sm29572389wbb.13.2011.10.24.00.27.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 00:27:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 24 Oct 2011 09:27:50 +0200
Message-Id: <F930E711-421C-439B-AAA8-EEBA0371ED86@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: serial-console: IMAGE_FEATURE, MACHINE_FEATURE or DISTRO_FEATURE?
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
X-List-Received-Date: Mon, 24 Oct 2011 07:33:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Otavio is cleaning up systemd in meta-oe to work with his initramfs =
setup and we stumbled onto a challenge that we'd like some more feedback =
on.

The old sysvinit recipes always hardcode a serial getty into inittab, =
systemd installs a getty@<port>.service file instead. Otavio doesn't =
need (or want) a getty on serial in his setup, but I need (and want) it =
on all my setups. So we agreed that it needs to be a feature :)

I nitially suggested MACHINE_FEATURE, which Otavio implemented here: =
http://patchwork.openembedded.org/patch/13713/ , but I'm having second =
thoughs about it and am leaning toward an IMAGE_FEATURE instead. Since =
this involves *_FEATURE and we want systemd to move into oe-core =
eventually I'm moving the discussion from OE-devel to OE-core. Not much =
discussion has been going on, so I hope we'll get some more feedback =
here. I'll try to buttonhole some more OE developers at ELC and report =
back as well.

regards,

Koen=


