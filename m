Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SgfLK-0002S9-Kk
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 19:02:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2012 09:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181668011"
Received: from unknown (HELO [10.255.12.105]) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2012 09:51:39 -0700
Message-ID: <4FDF5C9B.1000700@linux.intel.com>
Date: Mon, 18 Jun 2012 09:51:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339643088.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1339643088.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] V2 gcc-cross: argument list too long when do_install
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
X-List-Received-Date: Mon, 18 Jun 2012 17:02:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2012 05:18 AM, Robert Yang wrote:
> Changes of V2:
> * Use the patch rather than sed command as Khem suggested.
>
> // Robert
>
> The following changes since commit 7f017cab0b3e4d5a4fc356eccd8eb8429b0531d0:
>
>    connman: bump PR and add some comments (2012-06-13 13:11:23 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/too_long
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/too_long
>
> Robert Yang (1):
>    gcc-cross: argument list too long when do_install
>
>   meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 +
>   .../gcc/gcc-4.6/gcc-argument-list-too-long.patch   |   33 ++++++++++++++++++++
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
>   .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 ++++++++++++++++++++
>   4 files changed, 68 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Merged into OE-Core

Thanks
	Sau!


