Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStyF-0003Xa-Pf
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:49:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 May 2012 10:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142863258"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2012 10:39:42 -0700
Message-ID: <4FAD4EDD.6040106@linux.intel.com>
Date: Fri, 11 May 2012 10:39:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336691544.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1336691544.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Performance improvement in install_sstatepkg
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
X-List-Received-Date: Fri, 11 May 2012 17:49:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2012 04:13 PM, Mark Hatle wrote:
> Significant performance improvement when large numbers of files are involved
> with install_sstatepkg.
>
> To reproduce the problem:
>
> bitbake perl
> bitbake -c clean perl
> time bitbake perl
>
> The following changes since commit 910452727fc277c1caec7612b36c37b58d845350:
>
>    eglibc: Add patch to fix /var installation location (2012-05-09 21:42:37 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/sstate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sstate
>
> Mark Hatle (1):
>    sstate.bbclass: Improve sstate_installpkg performance
>
>   meta/classes/sstate.bbclass |   28 +++++++++++++++++++++-------
>   1 files changed, 21 insertions(+), 7 deletions(-)
>

Nice catch!

Merged into OE-Core

Thanks
	Sau!


