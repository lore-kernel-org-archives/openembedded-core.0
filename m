Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RVhum-0006Q4-LB
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 12:01:24 +0100
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id C5DAC144BB
	for <openembedded-core@openembedded.org>;
	Wed, 30 Nov 2011 11:35:57 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhYbANEF1k5T4zgTPGdsb2JhbAAMOKsbAQEBATeCYzxBNAIyJwgBAYgLt1yIC4MVBJRXkhE
X-IronPort-AV: E=Sophos;i="4.69,596,1315173600"; 
   d="scan'208";a="5234862"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb5.telenor.se with ESMTP; 30 Nov 2011 11:35:57 +0100
Message-ID: <4ED6070C.20904@emagii.com>
Date: Wed, 30 Nov 2011 11:35:56 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@openembedded.org
Subject: Adding kernel patches using "git am"?
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
X-List-Received-Date: Wed, 30 Nov 2011 11:01:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Is there a reason for using "patch" instead of "git am" on let's say the 
kernel.

If I want to do some modification, of the kernel, I can like Graeme 
description at
http://www.slimlogic.co.uk/2011/05/openembeddedangstrom-kernel-workflow/   
do
bitbake -c configure virtual/kernel

and then have an initialized git tree ready to be modified.

"git am" is of course more sensitive to the patch quality than "patch"
but that has some advantages as well.

It also makes the recipe more complex at this stage.

--
Best Regards
Ulf Samuelsson
eMagii



