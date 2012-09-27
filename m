Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGT1-000104-4w
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:57:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Sep 2012 08:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149886143"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 08:44:41 -0700
Message-ID: <50647469.8020000@linux.intel.com>
Date: Thu, 27 Sep 2012 08:44:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1348561895.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1348561895.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] package_rpm.bbclass: two fixes
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
X-List-Received-Date: Thu, 27 Sep 2012 15:57:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 06:38 AM, Robert Yang wrote:
> * Two fixes
>    - Change the arch's "-" to "_" in /etc/rpm/platform
>    - Fix the incremental rpm image generation
>
> // Robert
>
> The following changes since commit 8b3aa00029e62df6d05710cf166fd5d09bdb29cf:
>
>    documentation/poky-ref-manual/ref-variables.xml: Update B variable (2012-09-24 16:36:09 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/rpm_arch_inc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_arch_inc
>
> Robert Yang (2):
>    package_rpm.bbclass: change the arch's "-" to "_" for platform
>    package_rpm.bbclass: no initial_solution in the second build
>
>   meta/classes/package_rpm.bbclass | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
Merged both into OE-Core

Thanks
	Sau!



