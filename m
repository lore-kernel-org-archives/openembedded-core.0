Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Si859-0008Cs-Sv
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 19:55:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2012 10:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183786780"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 10:44:54 -0700
Message-ID: <4FE4AF16.9090709@linux.intel.com>
Date: Fri, 22 Jun 2012 10:44:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340034490.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1340034490.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Ensure -c menuconfig forces kernel rebuild
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
X-List-Received-Date: Fri, 22 Jun 2012 17:55:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2012 08:50 AM, Paul Eggleton wrote:
> Note: to have any effect, this change requires a patch just sent to the
> bitbake-devel list; without it -c menuconfig will behave as it did
> before.
>
>
> The following change since commit 6d761ae17ddbd3d936e7fe985b40825ad62b2418:
>
>    debian.bbclass: invoke target objdump (2012-06-18 13:20:29 +0100)
>
> is available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/menuconfig-rebuild
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/menuconfig-rebuild
>
> Paul Eggleton (1):
>    classes/cml1: ensure -c menuconfig forces a rebuild next time
>
>   meta/classes/cml1.bbclass |   16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
Merged into OE-Core

Thanks
	Sau!


