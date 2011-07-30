Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnBKw-0004oE-Ua
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 17:20:22 +0200
Received: by wwi18 with SMTP id 18so3733251wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 08:16:05 -0700 (PDT)
Received: by 10.227.37.149 with SMTP id x21mr3705378wbd.35.1312038965066;
	Sat, 30 Jul 2011 08:16:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h1sm2140168wee.1.2011.07.30.08.16.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Jul 2011 08:16:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 30 Jul 2011 17:15:58 +0200
Message-Id: <68349521-5BDC-4018-87E9-E965519D4FE7@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: do_package race with shadow and libc shlib renaming
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
X-List-Received-Date: Sat, 30 Jul 2011 15:20:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

About 80% of my builds from scratch this week show this:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for shadow:
|  *    eglibc (>=3D 2.12) *
|  * opkg_install_cmd: Cannot install package shadow.

Which implies that shadow gets packaged before eglibc finishes =
installing its shlib handler. I'm not sure that's the case since shadow =
is machine specific and eglibc isn't, but something is wrong. rebuilding =
shadow with -c cleansstate fixes it.

regards,

Koen=


