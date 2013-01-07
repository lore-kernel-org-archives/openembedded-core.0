Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TsMqV-0006HI-G6
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 01:15:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07LarJV007405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jan 2013 13:36:55 -0800 (PST)
Received: from [128.224.18.191] (128.224.18.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 7 Jan 2013 13:36:53 -0800
Message-ID: <50EB3FF4.60601@windriver.com>
Date: Mon, 7 Jan 2013 23:36:52 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: alsaconf and bash
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
X-List-Received-Date: Tue, 08 Jan 2013 00:15:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
in alsa-utils_1.0.25.bb, I see this comment:

# We omit alsaconf, because
# a) this is a bash script
# b) it creates config files not suitable for OE-based distros

Trying out on master, I get a do_rootfs error because bash is not a 
rundep of alsa-utils, and there is nothing in the alsa-utils recipe that 
actually does the above mentioned removal of the alsaconf script. 
Looking in the git log, I only see that the comment has suddenly 
appeared in an older alsa-utils recipe and has been carried along since 
with every update to the recipe, and not left over there as an artifact 
of some older commit as I expected.
Can anyone shed some light on this?

Thanks,
Florin


