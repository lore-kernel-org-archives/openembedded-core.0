Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1T3kPK-0000nS-Tt; Tue, 21 Aug 2012 11:05:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Aug 2012 01:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,801,1336374000"; d="scan'208";a="211524601"
Received: from unknown (HELO helios.localnet) ([10.252.121.105])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2012 01:53:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 21 Aug 2012 09:53:48 +0100
Message-ID: <1761512.HqMMdYPPnO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1570865.4gpYqKP9pu@helios>
References: <2404459.dJBf5OQotX@helios> <5032A1D3.8090600@windriver.com>
	<1570865.4gpYqKP9pu@helios>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] RFC: OE-Core task rework
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 09:05:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 August 2012 09:49:37 Paul Eggleton wrote:
> The main concern with LSB is that we have something called task-basic,
> which  seems to be intended for LSB but does not state as much, and I know
> at least one person has tried to use it and then been a little puzzled as
> to why rpm has been pulled in when ipk packaging has been selected. Just
> naming some of these tasks more appropriately would help avoid such
> situations. In the specific case of task-basic there may be a case for
> creating a similar but not LSB-focused task that pulls in real shell
> utilities in preference to the light versions provided by busybox.

Ugh, sorry. I meant task-core-basic here - not to be confused with task-basic 
in meta-oe [1].

Cheers,
Paul

[1] http://www.openembedded.org/wiki/Meta-oe_tasks

-- 

Paul Eggleton
Intel Open Source Technology Centre


