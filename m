Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TrAdh-0007af-4e
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 18:01:01 +0100
Received: (qmail 31341 invoked by uid 1003); 4 Jan 2013 16:45:55 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Jan 2013 16:45:54 -0000
Message-ID: <50E70742.6060201@balister.org>
Date: Fri, 04 Jan 2013 11:45:54 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4.6
Subject: Recipes with SRC_URI in .inc file and checksum in bb file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 17:01:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The specific case I am looking at is fftw in meta-oe, ,but I believe
this is a general problem.

The fftw recipe has a .inc file that includes the SRC_URI to a tarball
and bb files that build packages with slightly different compile
options. The tarball checksums are in the version specific bb files.

I am on the process of updating the fftw recipes to the most recent
version. Along the way I noticed it looks like the checksum test is
being ignored. The only way I can get it to fail is to remove all the
checksum entries from the bb files.

Something needs fixing and I'd like to know what we want in the recipes
before I submit the fixes, even if bitbake  is broken :)

Should the checksums move to the .inc file? (bad since that makes the
.inc file version specific). Should they be duped in each recipe?
(Annoying and doesn't really work) Maybe another version specific
include? (likely won't work, but could be fixed)

Philip


