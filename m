Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q714w-0003Hx-NO
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 09:53:34 +0200
Received: by wye20 with SMTP id 20so88011wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 00:51:29 -0700 (PDT)
Received: by 10.216.221.16 with SMTP id q16mr670509wep.71.1301989889067;
	Tue, 05 Apr 2011 00:51:29 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id c54sm2606893wer.30.2011.04.05.00.51.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 00:51:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 5 Apr 2011 09:51:26 +0200
Message-Id: <7AD8211B-5C4C-4A3B-8F7C-0A64D1481E07@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Best way to build avr-gcc for ARM?
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
X-List-Received-Date: Tue, 05 Apr 2011 07:53:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like to build an avr toolchain (avr-binutils, avr-gcc and avr-lib) =
to run on an ARM platform. What would be the best way to do this? I can =
manually change host and target in EXTRA_OECONF or I can use the =
canadian class. Which is best?
And if I want to target x86 on ARM does that change things?

regards,

Koen=


