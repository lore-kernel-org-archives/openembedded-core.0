Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjaeG-00065F-Vs
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:33:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2011 10:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="32604859"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2011 10:29:21 -0700
Message-ID: <4E271071.8010909@linux.intel.com>
Date: Wed, 20 Jul 2011 10:29:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311119488.git.josh@linux.intel.com>
In-Reply-To: <cover.1311119488.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix Pseudo on hosts with older compilers
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
X-List-Received-Date: Wed, 20 Jul 2011 17:33:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 04:57 PM, Joshua Lock wrote:
> The realpath_fix patch included an unitialised variable which modern GCC
> cleverly optimises away, however hosts with older GCC like CentOS 5.x weren't
> so lucky and... BOOM.
>
> See http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=4a646c8bbe73ca830cb8c2e80be4b457d925cdd4 for a more detailed description.
>
> The following changes since commit 6ca80453618fa308cc2d6329450aaf5dfdf2d610:
>
>    Fixed concurrency problem for ZIP packed recipes. (2011-07-19 18:03:04 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/pseudo
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/pseudo
>
> Joshua Lock (1):
>    pseudo: fix uninitialised variable in realpath_fix.patch
>
>   .../pseudo/pseudo/realpath_fix.patch               |    2 +-
>   meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


