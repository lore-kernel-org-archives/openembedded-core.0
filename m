Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdneA-0007tf-8d
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:45:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Dec 2011 10:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88662779"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by azsmga001.ch.intel.com with ESMTP; 22 Dec 2011 10:38:34 -0800
Message-ID: <4EF37929.6050702@linux.intel.com>
Date: Thu, 22 Dec 2011 10:38:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <2359656.ub2hYRIHg6@helios>
In-Reply-To: <2359656.ub2hYRIHg6@helios>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Internal compiler error
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
X-List-Received-Date: Thu, 22 Dec 2011 18:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 10:33 AM, Paul Eggleton wrote:
> Hi Nitin/Khem/all,
>
> We saw a failure on the Yocto Project autobuilder recently which appears to be
> the result of an internal compiler error [1] (note this is with the edison
> branch of Yocto, so it's somewhat older than what we have in master). Some
> searching brought up a Linaro gcc bug that looks remarkably similar [2].
>
> Do you guys know anything about this? Do we need to bring in the fix from the
> bug report above?
>
> Cheers,
> Paul
>
> [1] http://autobuilder.yoctoproject.org:8010/builders/nightly-
> arm/builds/232/steps/shell_81/logs/stdio
> [2] https://bugs.launchpad.net/gcc-linaro/+bug/723185
>

There also seems to be a gcc patch for qt4-x11-free in master:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7022a8f8045bdf82b9209b8cd62fb09c4a7a24f8

Does this address it?

Sau!


