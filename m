Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PsXVc-000649-Ke
	for openembedded-core@lists.linuxtogo.org;
	Thu, 24 Feb 2011 10:29:16 +0100
Received: by wwb29 with SMTP id 29so370166wwb.6
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 24 Feb 2011 01:27:17 -0800 (PST)
Received: by 10.227.127.199 with SMTP id h7mr518591wbs.35.1298539637181;
	Thu, 24 Feb 2011 01:27:17 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id y29sm257651wbd.16.2011.02.24.01.27.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Feb 2011 01:27:16 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Feb 2011 10:27:15 +0100
Message-Id: <597E8E15-FDC9-4CE7-A81F-78D436E362E4@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Mime-Version: 1.0 (Apple Message framework v1082)
X-Mailer: Apple Mail (2.1082)
Subject: Bitbake error when network is unreachable
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 09:29:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Due to a misconfiguration in my proxy setup bitbake failed to fetch some =
things. It took me a while to figure out that the proxy setup was =
broken, because the error bitbake gave me was:

'FetchError' object has no attribute 'startswith'

Is this a fetch2 integration problem?

regards,

Koen=


