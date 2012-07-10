Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sob0J-0008BW-7T for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 16:01:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ADoGFQ017533;
	Tue, 10 Jul 2012 14:50:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16817-06; Tue, 10 Jul 2012 14:50:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ADo9FX017527
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Jul 2012 14:50:10 +0100
Message-ID: <1341928210.24837.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nitin.a.kamble@intel.com
Date: Tue, 10 Jul 2012 14:50:10 +0100
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/15] commits related to automake update to 1.12.1
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
X-List-Received-Date: Tue, 10 Jul 2012 14:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 09:26 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This work is based on 1.3_M1 branch to get a stable base. These commits
> build core-image-sato-sdk & core-image-lsb images fine.

This is all well and good but its neigh on impossible for me to merge
this since many of the packages have been upgraded after 1.3M1. Please
rebase this on master.

I've attempted this on OE-Core's master-next branch but many of the
commits didn't apply and were dropped.

Cheers,

Richard



