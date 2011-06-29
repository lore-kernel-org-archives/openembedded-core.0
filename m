Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1Qbqcn-00007Z-TS
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 10:59:57 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id B60D213001F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 09:56:16 +0100 (BST)
Message-ID: <4E0AE8B0.6040804@slimlogic.co.uk>
Date: Wed, 29 Jun 2011 09:56:16 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
In-Reply-To: <BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Jun 2011 08:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/29/2011 09:50 AM, Anders Darander wrote:
> On Wed, Jun 29, 2011 at 10:24, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Op 29 jun 2011, om 00:41 heeft Khem Raj het volgende geschreven:
>>> If they are independent then may be the openssh recipe should be
>>> divided into openssh-ssh and openssh-rest so one can use openssh
>>> provided daemon or dropbear provided as they wish
>> Dividing the openssl recipe would gain us little and the gains would be only for the power companies since you'd have to build openssh twice to get both sftp and ssh. The decrease in build time for only sftp is neglible.
> Hm, speaking against what I've often been advocating (reducing build
> time by factoring out dependenies etc)...
>
> I think the simplest and most straightforward solution is to just
> split the packaging into
> openssh-ssh and openssh-sftp, where openssh-sftp packages just what is
> needed for handling
> the sftp-server in cooperation with dropbear. It could possibly also
> include the sftp-client if
> desired/needed.
>
> The openssh-ssh package could then depend on the openssh-sftp package;
> then there would
> be no difference today for the distros using the complete openssh package.
>
> I read the
>>> If they are independent then may be the openssh recipe should be
>>> divided into openssh-ssh and openssh-rest
> part as just splitting the package. But now when I re-read it, it could very
> well have implied creating two recipes; which I agree wouldn't be the best
> option.
>
The package in OE has been split for a long long time since I first
discovered about dropbear being about to use sftp-server.

Graeme



