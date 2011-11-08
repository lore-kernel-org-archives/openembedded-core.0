Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNuk0-0005ci-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 00:06:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2011 14:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,479,1315206000"; d="scan'208";a="34657325"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 14:59:30 -0800
Message-ID: <4EB9B452.4050107@linux.intel.com>
Date: Tue, 08 Nov 2011 14:59:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320430778.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/5] Misc fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 23:06:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2011 11:20 AM, Otavio Salvador wrote:
> The following changes since commit e3c003282afb93ec52882496400b042620ab00ef:
>
>    rt-tests: update to 0.83 (2011-11-04 15:43:19 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (5):
>    libcap: fix sstate for native package
>    files/device_table-minimal.txt: add /dev/kmsg
>    dhcp: drop unused dhcp3.inc file
>    dhcp: rename dhcp4.inc to dhcp.inc
>    dhcp: move server configuration to dhcp-server-config
>
>   meta/files/device_table-minimal.txt                |    1 +
>   .../dhcp/{dhcp4.inc =>  dhcp.inc}                   |   10 +++-
>   meta/recipes-connectivity/dhcp/dhcp3.inc           |   49 --------------------
>   meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    4 +-
>   meta/recipes-support/libcap/libcap.inc             |   15 +++++-
>   meta/recipes-support/libcap/libcap_2.22.bb         |    2 +-
>   6 files changed, 24 insertions(+), 57 deletions(-)
>   rename meta/recipes-connectivity/dhcp/{dhcp4.inc =>  dhcp.inc} (91%)
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp3.inc
>
Merged to OE-Core

Thanks
	Sau!


