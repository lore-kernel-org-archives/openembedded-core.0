Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFA4k-0002ZG-Re
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 22:11:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Apr 2012 13:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137231013"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2012 13:02:24 -0700
Message-ID: <4F7B5750.5050600@linux.intel.com>
Date: Tue, 03 Apr 2012 13:02:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333405435-10983-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1333405435-10983-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Tue, 03 Apr 2012 20:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2012 03:23 PM, Andreas Oberritter wrote:
> * Fixes communication between gdbserver and gdb-cross
>    by using the same expat settings for both recipes.
> * Adds missing build dependencies for expat/expat-native.
> * Adds missing glibc-thread-db runtime recommendation
>    to gdbserver, which was set only for gdb.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * Related mailing list thread:
>    http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019029.html
>
>   meta/recipes-devtools/gdb/gdb-common.inc           |    8 +++++---
>   .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    1 -
>   meta/recipes-devtools/gdb/gdb-cross.inc            |    2 +-
>   meta/recipes-devtools/gdb/gdb-cross_7.4.bb         |    1 -
>   4 files changed, 6 insertions(+), 6 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



