Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNmVv-0005py-S5 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:19:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8ECkT2032643
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:12:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31738-10 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 14:12:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8ECalL032637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:12:37 GMT
Message-ID: <1320761558.10843.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 14:12:38 +0000
In-Reply-To: <4EB90155.3070705@hale.at>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
	<4EB90155.3070705@hale.at>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on	non physical disks
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
X-List-Received-Date: Tue, 08 Nov 2011 14:19:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
> > From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> >
> > tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies 
> > buildstats to not collect diskio statistics when we encounter a case where 
> > the os.major/os.minor is not represented with an entry in /proc/diskstats.
> 
> A similar issue exists for building on a btrfs partition.
> I posted a message on Oct 28 concerning buildstats on btrfs volumes.
> The problem there is, that btrfs's stat() reports fake device ids that
> cannot be found in /proc/diskstats.

Did this patch help address that problem for you too?

Cheers,

Richard



