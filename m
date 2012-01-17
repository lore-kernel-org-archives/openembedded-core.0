Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnAXE-0000AR-4g
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:01:16 +0100
Received: by werb12 with SMTP id b12so130443wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 06:53:39 -0800 (PST)
Received: by 10.216.136.23 with SMTP id v23mr5976271wei.48.1326812019113;
	Tue, 17 Jan 2012 06:53:39 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eb2sm17253604wib.0.2012.01.17.06.53.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 06:53:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 17 Jan 2012 15:53:32 +0100
Message-Id: <E37251D2-AC3E-44C0-BA37-7CD0579E6E3B@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: RPM and spaces in filenames?
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
X-List-Received-Date: Tue, 17 Jan 2012 15:01:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

With RPM packaging I'm getting these errors:

| Processing files: cloud9-0.5.1-r12.armv7a
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/Slush
| error: File must begin with "/": and
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/Slush
| error: File must begin with "/": Poppies.tmTheme
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/Brilliance
| error: File must begin with "/": Dull.tmTheme
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/All
| error: File must begin with "/": Hallows
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/All
| error: File must begin with "/": Eve.tmTheme
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/Pastels
| error: File must begin with "/": on
| error: Two files on one line: =
/usr/share/cloud9/support/ace/tool/tmthemes/Pastels
| error: File must begin with "/": Dark.tmTheme

Does rpm break with spaces in filenames?

regards,

Koen=


