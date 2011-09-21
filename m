Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1R6Si2-0003aJ-I4
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:43:54 +0200
Received: (qmail 4342 invoked by uid 1003); 21 Sep 2011 19:38:31 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.170.211)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Sep 2011 19:38:31 -0000
Message-ID: <4E7A3D3A.1030007@balister.org>
Date: Wed, 21 Sep 2011 15:38:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.22) Gecko/20110906 Fedora/3.1.14-1.fc14 Thunderbird/3.1.14
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Fetch failure for source at kernel.org
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
X-List-Received-Date: Wed, 21 Sep 2011 19:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm finally trying to get started with oe-core. I'm using a setup 
created with the setup-script created by Koen. Everything looks ok until 
it tried to build cpufrequtils. The recipe tries to fetch the source 
from a git repo at kernel.org. Obviously, the fetch fails.

What is odd, in the "good old days" I would expect this config to fall 
back and use the Angstrom source mirror, but apparently this is not the 
case with oe-core.

Is this a bug or a feature? If this is a bug, is there a plan to fix it? 
If it is a feature, how are we supposed to do builds if servers go away? 
What do we do about GPL compliance?

Thanks,

Philip


