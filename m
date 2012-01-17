Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnFYI-0003vt-B7
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:22:42 +0100
Received: by wibhr14 with SMTP id hr14so8545wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 12:15:05 -0800 (PST)
Received: by 10.180.104.5 with SMTP id ga5mr25783864wib.21.1326831304731;
	Tue, 17 Jan 2012 12:15:04 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d9sm18833975wiy.2.2012.01.17.12.15.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 12:15:04 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 17 Jan 2012 21:14:59 +0100
Message-Id: <0AB83639-9F7B-450B-9F50-5D1951F2F5C2@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: How to avoid spurious RPM dependencies?
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
X-List-Received-Date: Tue, 17 Jan 2012 20:22:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'm running into a problem with vim that seems to be caused by overeager =
rpmdeps:

| error: Failed dependencies:
|       /bin/csh is needed by vim-7.2.446-r10.3.armv7a
|       /usr/local/bin/python is needed by =
python-imaging-1.1.7-r0.armv7a

For vim I thing it's being caused by this:

./usr/share/vim/vim72/tools/vim132:1:#!/bin/csh

What's the best way to stop rpm from wanting csh? Python-imaging is =
actually broken:

./usr/bin/pilfile.py:1:#! /usr/local/bin/python
./usr/bin/pilprint.py:1:#! /usr/local/bin/python
./usr/bin/pilconvert.py:1:#! /usr/local/bin/python

Is #!/usr/bin/env python still the preferred shebang?

regards,

Koen=


