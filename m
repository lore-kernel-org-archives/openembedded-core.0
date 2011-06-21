Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZ163-0003Np-RO for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 15:34:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LDUsBK021019
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:30:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20904-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:30:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LDUlir021013
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:30:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
References: <1308658461.20015.24.camel@rex>
	<BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
Date: Tue, 21 Jun 2011 14:30:32 +0100
Message-ID: <1308663032.20015.29.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 13:34:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 15:02 +0200, Frans Meulenbroeks wrote:
> As I already asked before: what is the benefit having this in embedded
> systems?
> 
> If I am doing an embedded system I know the target hardware, and there
> is no need to have e.g. both 32 and 64 bit libs.

This has been mentioned before but there are embedded use cases where
the requirement is to have a low overhead OS using 32 bit libs and
binaries to save memory but the main application (like a database
server) runs in 64 bit mode with 64 bit libraries so it can take
advantage of system memory, extra instructions or so forth. This applies
to mips and powerpc as well as x86.

The implementation is fairly self contained so if you don't want
multilib, you shouldn't even be aware its there...

Cheers,

Richard



