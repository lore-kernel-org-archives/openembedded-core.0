Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuU6M-0002de-FT
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:52:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 12:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173627810"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 12:40:30 -0700
Message-ID: <50119D2E.2050301@linux.intel.com>
Date: Thu, 26 Jul 2012 12:40:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342827927.git.chris_larson@mentor.com>
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/3] A few random pending fixes
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
X-List-Received-Date: Thu, 26 Jul 2012 19:52:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 04:46 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> The following changes since commit ef637e417ae1c2dff7fc0ad6cb30989e72ac35ab:
>
>    grub-efi-native: remove help2man dependency (2012-07-20 12:32:13 +0100)
>
> are available in the git repository at:
>
>    git://github.com/kergoth/oe-core.git misc
>
> Christopher Larson (3):
>    bluez4: use PACKAGECONFIG to control 'pie'
Not Merged, was not in my list for some reason, will double check

>    initscripts: don't bg mk_dirs in populate-volatile
>    libpcap: fix pcap-config to not return -Wl,-rpath
>
Merged these 2 into OE-Core

Thanks
	Sau!


>   meta/recipes-connectivity/bluez/bluez4.inc         |    6 +++++-
>   meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
>   meta/recipes-connectivity/libpcap/libpcap.inc      |    3 ++-
>   .../initscripts-1.0/populate-volatile.sh           |    4 ++--
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>   5 files changed, 11 insertions(+), 6 deletions(-)
>



