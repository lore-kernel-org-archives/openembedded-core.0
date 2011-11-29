Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RVKmB-00054r-PZ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 11:19:00 +0100
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 08570DAF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 11:12:20 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkIcAJ2v1E5T4zgTPGdsb2JhbAAMN4lKoUMBAQEBN4JjQD0WGAMCAQIBMScIAQG/T4gJgxUElFSJDIkG
X-IronPort-AV: E=Sophos;i="4.69,590,1315173600"; 
   d="scan'208";a="4578349"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb5.telenor.se with ESMTP; 29 Nov 2011 11:12:05 +0100
Message-ID: <4ED4AFF4.8020506@emagii.com>
Date: Tue, 29 Nov 2011 11:12:04 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Whitespace not allowed in COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 29 Nov 2011 10:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Have had a lot of problems trying to get a recipe running.
I finally discovered that "COMPATIBLE_MACHINE" is sensitive to whitespace.

Working:
COMPATIBLE_MACHINE = "machine1"
COMPATIBLE_MACHINE = "machine1|machine2"
COMPATIBLE_MACHINE = "(machine1)"
COMPATIBLE_MACHINE = "(machine1|machine2)"

COMPATIBLE_MACHINE = "machine1"
COMPATIBLE_MACHINE += "|machine2"

Not Working:
COMPATIBLE_MACHINE = " machine1"
COMPATIBLE_MACHINE = "machine1 "
COMPATIBLE_MACHINE = "machine1|machine2"
COMPATIBLE_MACHINE = "machine1 |machine2"
COMPATIBLE_MACHINE = "machine1| machine2"
COMPATIBLE_MACHINE = "machine1 | machine2"
COMPATIBLE_MACHINE = " (machine1)"
COMPATIBLE_MACHINE = "(machine1|machine2) "
etc.

This is a real PITA expecially since COMPATIBLE_MACHINE is yet to be 
documented in the manual


-- 

Best Regards
Ulf Samuelsson
eMagii



