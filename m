Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlNKK-0005aT-5r
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:44:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 08:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,262,1309762800"; d="scan'208";a="31185165"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 08:40:02 -0700
Message-ID: <4E2D8E52.4050205@linux.intel.com>
Date: Mon, 25 Jul 2011 08:40:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311384871.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1311384871.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] runqemu bugfix
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
X-List-Received-Date: Mon, 25 Jul 2011 15:44:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2011 06:36 PM, Scott Garman wrote:
> This fixes an issue Jessica Zhang reported to me today:
>
> Invoking runqemu outside of the build directory for an
> in-tree setup results in an empty TMPDIR because bitbake -e
> cannot be run to find it.
>
> A symptom of this problem is running runqemu and getting the
> following error:
>
> Error: Unable to find tunctl binary in<directory>
>
> Catch this case and report the error to the user.
>
> This fixes [YOCTO #1278]
>
> The following changes since commit eea4bd731ef286516ee1fb934fe2222a09c06e70:
>
>    mpc8315e-rdb: Set TARGET_FPU correct (2011-07-22 09:02:58 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/runqemu-fix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-fix
>
> Scott Garman (1):
>    runqemu: report error if TMPDIR cannot be determined
>
>   scripts/runqemu |   27 ++++++++++++++++-----------
>   1 files changed, 16 insertions(+), 11 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


