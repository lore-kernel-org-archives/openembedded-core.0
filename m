Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SpNgj-0003aS-PN
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:00:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2012 10:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="171072085"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2012 10:49:01 -0700
Message-ID: <4FFF0E0D.3060304@linux.intel.com>
Date: Thu, 12 Jul 2012 10:49:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1342114502-31881-1-git-send-email-sgw@linux.intel.com>
	<1719877.VOngMK1fKZ@helios>
In-Reply-To: <1719877.VOngMK1fKZ@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Update proto -> protocol for recipes
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
X-List-Received-Date: Thu, 12 Jul 2012 18:00:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2012 10:41 AM, Paul Eggleton wrote:
> On Thursday 12 July 2012 10:35:02 Saul Wold wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
>>   .../installer/adt-installer_1.0.bb                 |    2 +-
>>   meta/recipes-devtools/opkg/opkg_svn.bb             |    2 +-
>>   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
>>   meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
>>   meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
>>   .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
>>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +++---
>>   9 files changed, 11 insertions(+), 11 deletions(-)
>
> I don't think we can do this for the svn recipes until the minimum
> bitbake version has been bumped, since older bitbake versions won't
> support the "protocol" parameter. For git, I'm not sure 'proto' has
> ever been valid at least for fetch2.
>
Yes, you are correct, we need to wait for the bitbake rev to occur, 
should have thought about that.  I was using the lastest version in poky 
which also complained about the git proto, so they where just being 
ignored in the past.

Sau!

> Cheers,
> Paul
>



