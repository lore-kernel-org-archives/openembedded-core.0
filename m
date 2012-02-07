Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>)
	id 1Ruj2A-00025P-I5; Tue, 07 Feb 2012 12:16:26 +0100
Received: by wgbdr13 with SMTP id dr13so6414658wgb.24
	for <multiple recipients>; Tue, 07 Feb 2012 03:08:24 -0800 (PST)
Received: by 10.180.79.229 with SMTP id m5mr9872705wix.6.1328612904477;
	Tue, 07 Feb 2012 03:08:24 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm31402117wib.4.2012.02.07.03.08.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:08:23 -0800 (PST)
From: Koen Kooi <koen@beagleboard.org>
Date: Tue, 7 Feb 2012 12:08:21 +0100
Message-Id: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-openembedded][RFC] meta-multimedia layer
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
X-List-Received-Date: Tue, 07 Feb 2012 11:16:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

During FOSDEM Paul Eggleton and I discussed moving a few multimedia =
recipes (libav, xbmc, faac, faad, etc) out of meta-oe into a new =
meta-multimedia layer hosted in the meta-openembedded git repo. This =
would allow e.g. meta-baryon to drop a number of recipes while avoiding =
the need to drag in the complete meta-oe layer.

Thoughts?

regards,

Koen=


