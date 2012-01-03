Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEIQ-00022I-1S
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:01:34 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jan 2012 15:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102877746"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 15:54:12 -0800
Message-ID: <4F039524.4030306@linux.intel.com>
Date: Tue, 03 Jan 2012 15:54:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325079532.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325079532.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 0/1] Locale package installation
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
X-List-Received-Date: Wed, 04 Jan 2012 00:01:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 05:43 AM, Paul Eggleton wrote:
> Implement locale package installation as we had in OE-Classic; please
> review. In particular I'm not sure of the naming of
> rootfs_check_package_exists() (since it resolves the package to a
> filename in the case of RPM). Note that because of the default value of
> IMAGE_LINGUAS this patch will result in images growing slightly.
>
> The following change since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
>
>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/image-linguas
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/image-linguas
>
> Paul Eggleton (1):
>    classes/image: implement generic locale package installation
>
>   meta/classes/image.bbclass      |   37 +++++++++++++++++++++++++++++++++++++
>   meta/classes/rootfs_deb.bbclass |   37 +++++++++++++++++++++++++++----------
>   meta/classes/rootfs_ipk.bbclass |   30 +++++++++---------------------
>   meta/classes/rootfs_rpm.bbclass |   35 +++++++++++------------------------
>   4 files changed, 84 insertions(+), 55 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


