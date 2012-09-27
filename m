Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THHFL-00041a-12
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:47:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2012 09:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227714983"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2012 09:34:36 -0700
Message-ID: <5064801C.1060906@linux.intel.com>
Date: Thu, 27 Sep 2012 09:34:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: wenzong.fan@windriver.com
References: <cover.1348734058.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1348734058.git.wenzong.fan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] autotools.bbclass: using relative paths for acpaths
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
X-List-Received-Date: Thu, 27 Sep 2012 16:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2012 01:23 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Fix autotools.bbclass to use relative paths for acpaths instead of
> absolute ones. Since absolute paths may cause potential autoreconf
> error like:
>
>      Can't exec "/bin/sh": Argument list too long ...
>
> This error occurs while building coreutils with long TMPDIR, because
> it has bunch of m4 files need to be expanded.
>
> [YOCTO #2766]
>
> The following changes since commit 0b09e50810162a07ef0aecee91ee32b4a36334a3:
>
>    busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/2766
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2766
>
> Wenzong Fan (1):
>    autotools.bbclass: using relative paths for acpaths
>
>   meta/classes/autotools.bbclass |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>

Merged into OE-Core

Thanks
	Sau!



