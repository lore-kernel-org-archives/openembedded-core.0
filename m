Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQwOP-0008RX-S4
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 08:56:01 +0200
Received: by wye20 with SMTP id 20so2791412wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 23:52:54 -0700 (PDT)
Received: by 10.216.81.203 with SMTP id m53mr2316711wee.9.1306738373916;
	Sun, 29 May 2011 23:52:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm2816272wbb.52.2011.05.29.23.52.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 23:52:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 May 2011 08:52:51 +0200
Message-Id: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Any volunteers for fixing all the kernel version checks?
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
X-List-Received-Date: Mon, 30 May 2011 06:56:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

As some of you might have seen already: http://lwn.net/Articles/445223/ =
- linux 3.0 is going to happen.

This means all the crufty "is it 2.4 or 2.6" checks are going to need a =
rework :)=


