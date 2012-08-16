Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2681-0001Wb-Bp
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 21:53:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 12:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181918435"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 12:41:14 -0700
Message-ID: <502D4CDA.3030502@linux.intel.com>
Date: Thu, 16 Aug 2012 12:41:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344341416.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1344341416.git.wenzong.fan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Thu, 16 Aug 2012 19:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 05:14 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Fix the warning form pcmciautils building:
>
> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libsysfs.so.2 => /usr/lib/libsysfs.so.2"
>
> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
> to "/lib*" instead of "/usr/lib*".
>
> [YOCTO #2907]
>
> The following changes since commit 99e6ed0b468d0269c432e250e90e3d0d96b709f1:
>
>    iputils: Break libsysfs dependency (2012-08-07 12:58:02 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/2907
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2907
>
> Wenzong Fan (1):
>    sysfsutils: install libs to base_libdir
>
>   meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>

Merged into OE-Core

Thanks
	Sau!



