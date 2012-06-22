Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Si5Ow-0005W3-7Q for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 17:03:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MErC4V002645
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:53:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02530-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:53:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEr2uQ002639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:53:03 +0100
Message-ID: <1340376783.394.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2012 15:53:03 +0100
In-Reply-To: <3297658.NN3oiPzfJJ@helios>
References: <3297658.NN3oiPzfJJ@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: removing buildhistory support for flat versioned package info
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
X-List-Received-Date: Fri, 22 Jun 2012 15:03:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-22 at 15:15 +0100, Paul Eggleton wrote:
> Hi all,
> 
> One feature carried over from packagehistory.bbclass into buildhistory.bbclass 
> was the ability for it to optionally output PE:PV-PR named package info files 
> and then create a "latest" symlink to the latest one, which was useful in the 
> absence of the integration with git which buildhistory now has. This can 
> currently be enabled by setting BUILDHISTORY_KEEP_VERSIONS to 1.
> 
> I suspect not many people even know this feature exists let alone use it, and 
> looking at the code it could be simplified a bit by not supporting it at all. 
> Are there any objections to removing it?

Speaking as the author of that original code, I'm probably fine with
that, things have moved on...

Cheers,

Richard



