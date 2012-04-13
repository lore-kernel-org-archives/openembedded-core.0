Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIoyy-0007e9-2E
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 00:28:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 15:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153422618"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2012 15:19:21 -0700
Message-ID: <4F88A669.1080801@linux.intel.com>
Date: Fri, 13 Apr 2012 15:19:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <36ED13F3654AE54CA763E6821D93A5711043A0EE@szxeml534-mbs.china.huawei.com>
In-Reply-To: <36ED13F3654AE54CA763E6821D93A5711043A0EE@szxeml534-mbs.china.huawei.com>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] eglibc: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 22:28:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 04:44 AM, Venkata ramana gollamudi wrote:
> Task do_patch_append calling do_fix_ia_headers is removing files using "rm" not "rm -f".
> So first time execution of patch task is success, while re-execution of patch task
> fails as it tries to remove the files already removed.
>
> So changed "rm" to "rm -f".
>
> [Yocto #2194]
>
> Signed-off-by: Venkata Ramana Gollamudi<ramana.gollamudi@huawei.com>
> ---
>   meta/recipes-core/eglibc/eglibc_2.13.bb |    8 ++++----
>   meta/recipes-core/eglibc/eglibc_2.15.bb |    8 ++++----
>   2 files changed, 8 insertions(+), 8 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



