Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RrVNP-0001XG-2R
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 15:05:03 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id AC318EB7D5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 14:57:11 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhoeAPhPJU9T4znVPGdsb2JhbAAMOIlSpR0BAQEBN4JjQD0WGAMCAQIBMRoNCAEBv0+IPQEDAgIECgIBDAQDBEcDAYJxGQQCCgINBwF0AQEBAQEBAYNLBJUaklI
X-IronPort-AV: E=Sophos;i="4.71,587,1320620400"; d="scan'208";a="1800138435"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.57.213])
	by ipb4.telenor.se with ESMTP; 29 Jan 2012 14:56:46 +0100
Message-ID: <4F25501F.9000606@emagii.com>
Date: Sun, 29 Jan 2012 14:56:47 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: bitbake -c clean <package> fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sun, 29 Jan 2012 14:05:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tried to test downloading "module-init-tools" from a new KERNELORG_MIRROR

First I attempted to just remove the source tarball from the downloads 
directory.
No download, but build completed.

The I tried to clean out the "module-init-tools" directory:

$ bitbake -c clean module-init-tools

and run bitbake console-image.
The build completed with no source tarball, after the clean.

Only when I cleaned out the build/sstate-cache directory,
was the file downloaded and built from a new tarball

Should not "bitbake -c clean" remove files in the cache?

If not, Is there another bitbake command which cleans out the cache?

-- 
Best Regards
Ulf Samuelsson
eMagii



