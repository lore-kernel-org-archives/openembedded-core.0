Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMM4A-0007Hb-1o for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 17:20:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HFHG6k017854
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 16:17:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17364-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 16:17:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HFHAJ7017848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 16:17:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305643637.2429.260.camel@phil-desktop>
References: <1305633118.2429.188.camel@phil-desktop>
	<1305633770.3424.229.camel@rex>
	<1305634164.2429.193.camel@phil-desktop>
	<1305641835.2429.228.camel@phil-desktop>
	<1305642925.3424.251.camel@rex>
	<1305643637.2429.260.camel@phil-desktop>
Date: Tue, 17 May 2011 16:17:09 +0100
Message-ID: <1305645429.3424.254.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] image-prelink: remove hardcoded path assumptions
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
X-List-Received-Date: Tue, 17 May 2011 15:20:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 15:47 +0100, Phil Blundell wrote:
> On Tue, 2011-05-17 at 15:35 +0100, Richard Purdie wrote:
> > The patch description and what it does don't quite match (the rm is
> > removed and options are added to prelink).
> 
> The added "-c ..." option is necessary in case ${sysconfdir_native} and
> ${sysconfdir} are not the same thing.
> 
> The "-N" tells prelink to not generate a cache file, which seems a
> better plan than having it generate one which we then have to delete.
> But I can drop that change, and/or send it as a separate patch if you
> prefer.

I'm fine with the change, I'd just like the commit message to match :)

Cheers,

Richard



