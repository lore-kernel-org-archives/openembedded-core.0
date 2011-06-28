Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jic23@cam.ac.uk>) id 1QbU02-0007Fl-A3
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 10:50:26 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:48608)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1QbTwV-0005vF-DQ (Exim 4.72) for
	openembedded-core@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Tue, 28 Jun 2011 09:46:47 +0100
Message-ID: <4E0996DC.80900@cam.ac.uk>
Date: Tue, 28 Jun 2011 09:54:52 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110509 Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.1.2
Subject: Perl-native is turing up under build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/perl-native
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
X-List-Received-Date: Tue, 28 Jun 2011 08:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

It appears quite a few things expect it to be under ../usr/bin

Hand adding a link seems to make everything work, but obviously it would
be nice to fix the underlying issue. (and I'm not quite sure what that is!)

Jonathan


