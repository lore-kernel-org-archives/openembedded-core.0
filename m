Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm6LN-00011y-PJ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 18:52:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 09:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188029615"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 09:41:50 -0700
Message-ID: <4FF320CE.8040508@linux.intel.com>
Date: Tue, 03 Jul 2012 09:41:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1207031150230.31710@oneiric>
	<4FF31B1B.2090105@linux.intel.com>
	<alpine.DEB.2.02.1207031222040.32125@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207031222040.32125@oneiric>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what's the easiest way to download *all* recipe-referenced tarballs?
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
X-List-Received-Date: Tue, 03 Jul 2012 16:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 09:24 AM, Robert P. J. Day wrote:
> On Tue, 3 Jul 2012, Saul Wold wrote:
>
>> On 07/03/2012 08:54 AM, Robert P. J. Day wrote:
>>>
>>>     followup to once upon a time post of mine, i'm prepping to give a
>>> tutorial in OE/yocto, and it would be nice if the client could, ahead
>>> of time, set up a premirror of every conceivable tarball that is used
>>> by any recipe in oe-core.
>>>
>>>     can that be done?  easily?  i can see configuring for a build,
>>> selecting a MACHINE, then doing "bitbake -c fetchall world", or some
>>> variation thereof.  but that would be MACHINE-specific.
>>>
>> We added a "universe" target for fetching and stats gathering, but
>> it's not appropriate for building,
>
>    that's fine, sounds like just what i'm after.
>
>> it should get everthing, unless there is a MACHINE-specific variable
>> in SRC_URI, which I don't think we have.
>
>    so you're saying that the selection of MACHINE in local.conf
> shouldn't make any difference, right?  great, i'll give it a shot.  uh
> ... any idea how much will be downloaded?  is there a list of the
> resulting tarballs somewhere?
>
about 4G with git trees and tarballs (yes lots of files)

Sau!

> rday
>


