Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkYf6-0002a5-3L
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:10:36 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 10 Jan 2012 11:03:07 +0100
Date: Tue, 10 Jan 2012 11:03:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120110100306.GB3664@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Preventing RRECOMMENDS from installing
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
X-List-Received-Date: Tue, 10 Jan 2012 10:10:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Is there a simple way, in a bbappend-file to prevent packages in an
RRECOMMENDS from being installed? E.g. if package foo has:
RRECOMMENDS_${PN} += "bar"

I'd reluctant to rewrite RRECOMMENDS_${PN} completely, as foo sets
RRECOMMENDS using += (or =+), thus I'd like not to remove other packages
from RRECOMMENDS. 

If possible, I'd like to avoid patching the foo.bb-file, and just have a
foo.bbappend in my own layer.

I've unsuccesfully tried different variants using oe_filter_out, but
they don't seems to prevent bar from being installed.

Thanks in advance for any hints!

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


