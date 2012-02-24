Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0zwz-0007n0-Bt
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:33:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Feb 2012 10:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="70015856"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Feb 2012 10:24:37 -0800
Message-ID: <4F47D5E5.6050607@linux.intel.com>
Date: Fri, 24 Feb 2012 10:24:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330102968.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330102968.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/7] Pending patches - added even more patches
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
X-List-Received-Date: Fri, 24 Feb 2012 18:33:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 09:06 AM, Martin Jansa wrote:
> First 4 are the same, not resent (will try RP's suggestion for STAGING_DIR* variables first)
>
> sstate.bbclass: improve performance of sstate package creation - updated ' position
> shadow-sysroot: disable package creation - new patch discussed on #yocto
> gst-plugin-bluetooth: upgrade to 4.98 and add checksums - old one was missing SRC_URI
>    checksums so was failing to build
>
> The following changes since commit d3de5f7308b4a42b809884119a670af5bedde38f:
>
>    psplash: allow building multiple splash executables (2012-02-24 16:44:37 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Eric BENARD (1):
>    gdb-cross-canadian: build gdb with python support
>
> Martin Jansa (6):
>    bitbake.conf: use weak assignment for BB_CONSOLELOG
>    bitbake.conf: introduce SDK_NAME_PREFIX and NATIVESDK_* variables
>    gdb-cross-canadian: use NATIVESDK paths as it happens to be here
>    sstate.bbclass: improve performance of sstate package creation
>    shadow-sysroot: disable package creation
>    gst-plugin-bluetooth: upgrade to 4.98 and add checksums
>
These last three have been merged into OE-core

Thanks
	Sau!


>   meta/classes/sstate.bbclass                        |   39 ++++++++------------
>   meta/conf/bitbake.conf                             |   16 +++++++-
>   ...etooth_4.96.bb =>  gst-plugin-bluetooth_4.98.bb} |    3 +-
>   meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   23 +++++++++++-
>   .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
>   .../shadow/shadow-sysroot_4.1.4.3.bb               |    7 +++-
>   6 files changed, 61 insertions(+), 29 deletions(-)
>   rename meta/recipes-connectivity/bluez/{gst-plugin-bluetooth_4.96.bb =>  gst-plugin-bluetooth_4.98.bb} (77%)
>


