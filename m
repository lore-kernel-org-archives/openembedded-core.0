Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHi1-0008Vl-54
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:30:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Oct 2012 18:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="210209927"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by azsmga001.ch.intel.com with ESMTP; 27 Oct 2012 18:16:55 -0700
Message-ID: <508C8787.8030205@linux.intel.com>
Date: Sat, 27 Oct 2012 18:16:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <cover.1351032844.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1351032844.git.peter.seebach@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2] [PATCH 0/1] insane.bbclass and friends: support n32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Oct 2012 01:30:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2012 03:55 PM, Peter Seebach wrote:
> This makes multilib_header, insane, and site config work for n32 MIPS.
>
> It turns out the previous patch only worked for part of the system; when I
> got to glib, the mips-linux siteconfig wasn't getting picked up for n32.
> So add a couple more references in siteinfo.bbclass to make that work.
>
> The following changes since commit 754ddbf1c57e6b9d0650498538840effebe4f7a2:
>    Ross Burton (1):
>          libical: remove
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/mips64
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/mips64
>
> Peter Seebach (1):
>    insane.bbclass and friends: Fix sanity checks and multlib headers for
>      n32
>
>   meta/classes/insane.bbclass                  |    4 +++
>   meta/classes/multilib_header.bbclass         |   32 +++++++++++++++++--------
>   meta/classes/siteinfo.bbclass                |    5 ++++
>   meta/conf/machine/include/mips/arch-mips.inc |    1 +
>   4 files changed, 32 insertions(+), 10 deletions(-)
>
>
Merged into OE-Core

Thanks
	Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


