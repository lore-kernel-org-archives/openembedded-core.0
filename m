Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QJKjt-0004PW-AQ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:18:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 275452C5B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 08:16:00 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 9Ziva0VW-I-A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 08:15:59 +0100 (BST)
Received: from [10.131.0.186] (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 875B22C5A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 08:15:59 +0100 (BST)
Message-ID: <4DC794C4.1090307@xora.org.uk>
Date: Mon, 09 May 2011 08:16:20 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>	<1304787012.8459.1.camel@doubt>
	<4DC636EB.6080809@gmail.com>
	<251372F6-8F97-44DF-9F1A-432B84248191@dominion.thruhere.net>
In-Reply-To: <251372F6-8F97-44DF-9F1A-432B84248191@dominion.thruhere.net>
Subject: Re: [PATCH] package.bbclass: convert unpackaged file	message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Mon, 09 May 2011 07:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2011 08:11, Koen Kooi wrote:
> Op 8 mei 2011, om 08:23 heeft Khem Raj het volgende geschreven:
>
>> On 5/7/2011 9:50 AM, Darren Hart wrote:
>>> According to my discussion with RP, bb.note() is supposed to appear on
>>> the console. If it doesn't, that is a bug in bitbake, not the recipe
>> it does if we increase verbosity but it also dumps a lot of other information along. Default is to print errors and warnings which seems a sane default to me. May be there is another level which dumps notes on
>> top and then as you increase the level you get more info dumped would be
>> a good to have
> I still think that all unpackaged files are a bug, so it's more than a note anyway.
>
rpmbuild would agree with you there, so its not without precedence.

G



