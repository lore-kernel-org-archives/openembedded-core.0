Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1dNu-0005pc-4h
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:11:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2012 05:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,773,1336374000"; d="scan'208";a="208754297"
Received: from unknown (HELO helios.localnet) ([10.252.121.76])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2012 05:59:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk
Date: Wed, 15 Aug 2012 13:59:43 +0100
Message-ID: <3038828.MQSsx4e3xZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <502B8554.7070504@communistcode.co.uk>
References: <2404459.dJBf5OQotX@helios> <502B8554.7070504@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 13:11:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 August 2012 12:17:40 Jack Mitchell wrote:
> > 1) Do we rename "task" to something a little more understandable to the
> > uninitiated, such as "package group"? The word "task" is already used in a
> > much more natural sense within bitbake as a unit of work. Historically I
> > believe we picked up this term from Debian but I'm not aware of
> > significant use by other mainstream distributions.
> 
> Do the 'tasks' do anything other than specify meta-data groups? If they
> don't include any glue or additional processes then I strongly agree
> that the name should be changed.

They don't, no. Usually they are just lists of packages, although sometimes 
there is some very basic logic to conditionally include/exclude some packages 
based on DISTRO_FEATURES, MACHINE_FEATURES, COMBINED_FEATURES etc. or allow 
substitution of default packages with others using variables.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


