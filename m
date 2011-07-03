Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QdLoo-0002aG-Sp
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 14:30:35 +0200
Received: (qmail 24532 invoked by uid 1003); 3 Jul 2011 12:26:46 -0000
Received: from unknown (HELO ?10.1.0.61?) (philip@opensdr.com@87.192.231.145)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Jul 2011 12:26:46 -0000
Message-ID: <4E106004.7030103@balister.org>
Date: Sun, 03 Jul 2011 13:26:44 +0100
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
In-Reply-To: <7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and	openssh)
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
X-List-Received-Date: Sun, 03 Jul 2011 12:30:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2011 09:56 AM, Koen Kooi wrote:
>
> That's already the case now. The problem is the PROVIDES overlap since the Poky people decided a distro could only have one true ssh implementation instead of choosing it per image. So if your distro doesn't set the PREFERRED_PROVIDER_sshd you get those nagging messages during parsing that scare users and make consultants rich.
>

What's wrong with consultants getting rich?

Philip


