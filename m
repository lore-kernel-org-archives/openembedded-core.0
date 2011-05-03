Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QH3jV-0002FD-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 02:44:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 May 2011 17:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,306,1301900400"; d="scan'208";a="687220997"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2011 17:41:10 -0700
Message-ID: <4DBF4F26.90404@intel.com>
Date: Tue, 03 May 2011 08:41:10 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
In-Reply-To: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Tue, 03 May 2011 00:44:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Did you installed Nvidia proprietary driver? Any error mesg from the 
runqemu script?
I can't figure out one case that nfs root works and ext3 image doesn't...


Khem Raj wrote:
>
> Hi
>
> I am seeing qemu segfaulting when booting ext3 image. The same rootfs
> boots fine over nfs. It does not give any useful message
> as to what happened. I am using the runqemu script. Same used to work
> fine 3 weeks back. I tried to blame compilers but the behavior
> is same irrespective of gcc version I use or even eglibc/uclibc
>
> Its on x86_64/ubuntu 11.04 host.
>
> Anyone experiencing it ? bisecting can be a long excercise for this.
>
> Thanks
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


