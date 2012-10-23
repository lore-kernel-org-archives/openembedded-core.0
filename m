Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQld4-000112-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 23:03:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2012 13:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="209671147"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2012 13:49:46 -0700
Message-ID: <508702EA.6090800@linux.intel.com>
Date: Tue, 23 Oct 2012 13:49:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <cover.1351024134.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1351024134.git.peter.seebach@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Make n32 survive insane.bbclass and multilib_header
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
X-List-Received-Date: Tue, 23 Oct 2012 21:03:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2012 01:32 PM, Peter Seebach wrote:
> The multilib_header fixup has code in the generated header to handle
> n32, but doesn't detect n32 headers. Meanwhile, insane.bclass rejects
> n32 binaries for being 32-bit binaries in a mips64 build. Solution: Use
> an ABI suffix, and check for it in appropriate places.
>

How can I build test this, the same way as x32?

Sau!

> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
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
>   meta/conf/machine/include/mips/arch-mips.inc |    1 +
>   3 files changed, 27 insertions(+), 10 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


