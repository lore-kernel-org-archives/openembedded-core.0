Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYKWI-0002jt-3t
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 17:38:58 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 7CA7EC231
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 17:32:09 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnIcAF2U305T4zgTPGdsb2JhbAAMN4lNoR8BAQEBN4JjfTQCMicIAQG/DYgcgxgElGuSJA
X-IronPort-AV: E=Sophos;i="4.71,314,1320620400"; d="scan'208";a="1770495190"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb4.telenor.se with ESMTP; 07 Dec 2011 17:29:29 +0100
Message-ID: <4EDF9468.309@emagii.com>
Date: Wed, 07 Dec 2011 17:29:28 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: bitbake core-image-sato fails:
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
X-List-Received-Date: Wed, 07 Dec 2011 16:38:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Got the following error message when building core-image-sato:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies 
for task-core-x11-sato:
|  *     ofono *
|  * opkg_install_cmd: Cannot install package task-core-x11-sato.
NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
ERROR: Task 8 
(/home/ulf/projects/OE_atmel/sources/openembedded-core/meta/recipes-sato/images/core-image-sato.bb, 
do_rootfs) failed with exit code '1'

I then did

$ bitbake ofono

which built without problem.

Repeated

$ bitbake core-image-sato

which then succeeded.


-- 
Best Regards
Ulf Samuelsson
eMagii



