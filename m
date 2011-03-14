Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pz9pS-0006lN-IB
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 16:37:06 +0100
Received: by wyb40 with SMTP id 40so4286984wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 08:35:25 -0700 (PDT)
Received: by 10.227.151.5 with SMTP id a5mr7387353wbw.124.1300116925478;
	Mon, 14 Mar 2011 08:35:25 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id x1sm6231200wbh.14.2011.03.14.08.35.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 08:35:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Mar 2011 16:35:23 +0100
Message-Id: <629947F1-FA71-48CF-91BF-CBA98C302DFF@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1082)
X-Mailer: Apple Mail (2.1082)
Subject: [RFC] Make GNU_HASH failures fatal
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
X-List-Received-Date: Mon, 14 Mar 2011 15:37:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

GNU_HASH QA failures are nearly gone in .dev, but still rampant in =
oe-core. I would like to propose making them fatal so they get fixed. =
The most worrysome offenders currently are gcc-runtime and perl.

regards,

Koen=


