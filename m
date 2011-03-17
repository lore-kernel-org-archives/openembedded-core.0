Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q0KEl-0004Md-53
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 21:56:03 +0100
Received: by wwb17 with SMTP id 17so3597745wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 13:54:15 -0700 (PDT)
Received: by 10.216.69.7 with SMTP id m7mr209545wed.73.1300394890271;
	Thu, 17 Mar 2011 13:48:10 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	n18sm1279565wee.16.2011.03.17.13.48.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 13:48:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Mar 2011 21:48:09 +0100
Message-Id: <ADFC9307-B4A2-44E9-BD31-E1BA3310E468@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1082)
X-Mailer: Apple Mail (2.1082)
Subject: HEADS UP: meta-oe structure changed
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
X-List-Received-Date: Thu, 17 Mar 2011 20:56:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

To future proof meta-oe all the metadata has been moved into a 'meta-oe' =
subdir. You need to adjust you bblayers.conf like this:

=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/commit=
/?h=3Doe-core&id=3D2c811815f70e1f6aac1b495e49c8e50c0c5d19bd

regards,

Koen=


