Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1QdOrU-0005Yf-Bj
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 17:45:32 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id 732E413003B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2011 16:41:47 +0100 (BST)
Message-ID: <4E108DBA.3070800@slimlogic.co.uk>
Date: Sun, 03 Jul 2011 16:41:46 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
	<4E106004.7030103@balister.org>
In-Reply-To: <4E106004.7030103@balister.org>
Subject: Re: Conflicting providers for ssh/sshd (dropbear	and	openssh)
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
X-List-Received-Date: Sun, 03 Jul 2011 15:45:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/03/2011 01:26 PM, Philip Balister wrote:
> On 06/29/2011 09:56 AM, Koen Kooi wrote:
>>
>> That's already the case now. The problem is the PROVIDES overlap
>> since the Poky people decided a distro could only have one true ssh
>> implementation instead of choosing it per image. So if your distro
>> doesn't set the PREFERRED_PROVIDER_sshd you get those nagging
>> messages during parsing that scare users and make consultants rich.
>>
>
> What's wrong with consultants getting rich?
>
I like this scheme :-)

Graeme



