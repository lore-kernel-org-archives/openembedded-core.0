Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SvmQ2-0002xB-SU
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 11:37:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jul 2012 02:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="199878581"
Received: from unknown (HELO helios.localnet) ([10.252.121.40])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2012 02:26:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2012 10:26:04 +0100
Message-ID: <1649088.OayoHGzzEP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1343597225-9805-1-git-send-email-raj.khem@gmail.com>
References: <1343597225-9805-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm.bbclass: Accomodate dash when using arrays
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
X-List-Received-Date: Mon, 30 Jul 2012 09:37:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 29 July 2012 14:27:05 Khem Raj wrote:
> we were assigning local variable to an array coming through
> positional arguments. local is a non posix contruct thats
> also supported by dash luckily but operates differently in this
> case it exapnds the array before assignment. so
> 
> local pkgs="$@"
> 
> turns into pkgs=locale-base-en-us locale-base-en-gb
> 
> ant we see errors
> 
> run.do_rootfs.25593: 932: local: locale-base-en-gb: bad variable name
> 
> So lets not use defining and assigning local in one go
> first define a local and then the assignment

Oops, sorry about that.

However, in the other thread you said package_rpm.bbclass was "full of 
bashisms" - is there only this one?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


