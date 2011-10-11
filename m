Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDZsF-0001nT-14
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 12:47:51 +0200
Received: by ggnq1 with SMTP id q1so5509304ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 03:42:09 -0700 (PDT)
Received: by 10.223.91.87 with SMTP id l23mr40001752fam.5.1318329728460;
	Tue, 11 Oct 2011 03:42:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm36860599fai.16.2011.10.11.03.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 03:42:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Oct 2011 12:42:01 +0200
Message-Id: <DDA1B8C5-0867-406F-BB88-0D33B7501900@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: How to overlay files/fs-perms.txt?
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
X-List-Received-Date: Tue, 11 Oct 2011 10:47:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

In angstrom we have base-files overlayed to clean out /var and =
files/fs-perms.txt is getting in the way of that:

koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ grep =
localstate files/fs-perms.txt=20
${localstatedir}/cache	link	volatile/cache
${localstatedir}/run	link	volatile/run
${localstatedir}/log	link	volatile/log
${localstatedir}/lock	link	volatile/lock
${localstatedir}/tmp	link	volatile/tmp

In angstrom those aren't symlinks anymore, but tmpfs bind mounts managed =
by systemd.

So, how doI overlay that file in this oe-core layer universe?

regards,

Koen=


