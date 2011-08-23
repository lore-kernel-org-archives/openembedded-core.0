Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qvsko-0000Hk-7P
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 17:19:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2011 08:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,270,1312182000"; d="scan'208";a="10191175"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 08:14:15 -0700
Message-ID: <4E53C3C7.9090902@linux.intel.com>
Date: Tue, 23 Aug 2011 08:14:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313606178.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 0/2] Couple of fixes to help new users
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
X-List-Received-Date: Tue, 23 Aug 2011 15:19:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 11:37 AM, Paul Eggleton wrote:
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by.
>
> The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
>
>    kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/sanity3
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanity3
>
> Paul Eggleton (2):
>    image.bbclass, kernel.bbclass: create warning file about deleting
>      deploydir files
>    sanity.bbclass: add optional untested host distro warning
>
>   meta/classes/image.bbclass      |    2 +
>   meta/classes/kernel.bbclass     |    2 +
>   meta/classes/sanity.bbclass     |   48 +++++++++++++++++++++++++++++++++++++++
>   meta/files/deploydir_readme.txt |    8 ++++++
>   4 files changed, 60 insertions(+), 0 deletions(-)
>   create mode 100644 meta/files/deploydir_readme.txt
>

Merged into OE-Core

I know there is some additional fix for the image.bbclass, do we need 
one for kernel.bbclass also?

Thanks
	Sau!


