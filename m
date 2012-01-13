Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rliu4-0003MK-3O for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 16:18:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0DFBKWh022188
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 15:11:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21707-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 15:11:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0DFBDao022182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 15:11:14 GMT
Message-ID: <1326467476.15389.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2012 15:11:16 +0000
In-Reply-To: <998E113C-60A0-4034-AEC7-57D61F41915C@dominion.thruhere.net>
References: <cover.1326454446.git.dongxiao.xu@intel.com>
	<bc6335972ec83f47469f18ac973f057b3323b46d.1326454446.git.dongxiao.xu@intel.com>
	<998E113C-60A0-4034-AEC7-57D61F41915C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] packageinfo.bbclass: add a new bbclass to pass package information
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
X-List-Received-Date: Fri, 13 Jan 2012 15:18:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-13 at 13:05 +0100, Koen Kooi wrote:
> Op 13 jan. 2012, om 12:38 heeft Dongxiao Xu het volgende geschreven:
> 
> > packageinfo.bbclass is to pass the accurate package information to
> > clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.
> 
> How many classes for package/recipe info do we actually need?

I appreciate that the number of emails on the list on this topic make it
look like we have a lot of overlap.

If you look carefully at this patch you'll see that what this code does
is pull together information and generate a bitbake event containing
that information.

This is not something any other existing code does. It takes the data
from an existing data store and does not create any new one.

This is IMO a vast improvement over some of the earlier versions of
these patches so I'm planning to take this one.

Longer term we do need to reconcile buildhistory and packagedata as two
stores of very similar data but this patch doesn't complicate that
issue.

Cheers,

Richard





