Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW6O7-0006oB-Nr for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 14:09:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1D2dZc015515
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 13:02:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14989-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 13:02:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1D2TO8015487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 13:02:30 GMT
Message-ID: <1322744558.17484.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 13:02:38 +0000
In-Reply-To: <CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net> <1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 13:09:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 10:59 -0200, Otavio Salvador wrote:
> On Thu, Dec 1, 2011 at 10:37, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
>         > A while back I've proposed to make .bbappend without
>         corresponding .bb
>         > only big fat warning, but not fatal to parse. Now you cannot
>         even build
>         > eglibc if there is libdrm bbappend you don't care at all
>         about..
>         
>         
>         You can do this by setting:
>         
>         BB_DANGLINGAPPENDS_WARNONLY
> 
> 
> This is even worse; you end up with a package without the changes done
> on the bbappend and as most bbappend files do not change PR, adding it
> later won't force a package update.

Which is why its off by default. My point is you can do with Martin is
suggesting, its just not without its drawbacks.

Cheers,

Richard





