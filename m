Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsf2-00009O-KT
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:25:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2012 14:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93983557"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:15:24 -0700
Message-ID: <4F9B0C6C.1040901@linux.intel.com>
Date: Fri, 27 Apr 2012 14:15:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335227773.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1335227773.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix deb-based rootfs construction
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
X-List-Received-Date: Fri, 27 Apr 2012 21:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2012 02:25 AM, Paul Eggleton wrote:
> The following change since commit 85bebd85c4f6603ac8fc1290121c34b92cc434f9:
>
>    self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-23 23:12:29 +0100)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/dpkg-fflush
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dpkg-fflush
>
> Paul Eggleton (1):
>    dpkg-native: fix deb-based rootfs construction failure on Fedora 16
>
>   .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 ++++++++++++++++++++
>   meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    5 +-
>   2 files changed, 201 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
>

Merged into OE-Core

Thanks
	Sau!


