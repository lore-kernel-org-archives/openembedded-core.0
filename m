Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuyqA-00056o-H3
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:09:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2012 20:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105149640"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2012 20:01:02 -0800
Message-ID: <4F31F37E.2070102@linux.intel.com>
Date: Tue, 07 Feb 2012 20:01:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1328288631.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1328288631.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] bootimg: Use the same OS files for each boot method
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
X-List-Received-Date: Wed, 08 Feb 2012 04:09:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2012 09:04 AM, Darren Hart wrote:
> The following changes since commit 41e92923a0b2fe047ecaa9f9ffb564d6069f784f:
>
>    classes/patch: optionally return non-patch sources (2012-02-03 16:51:30 +0000)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/bug/1951
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/bug/1951
>
> Darren Hart (1):
>    bootimg: Use the same OS files for each boot method
>
>   meta/classes/bootimg.bbclass  |   31 ++++++++++++++++++++++++-------
>   meta/classes/grub-efi.bbclass |   28 +++++++++-------------------
>   meta/classes/syslinux.bbclass |   34 +++++++++++++---------------------
>   3 files changed, 46 insertions(+), 47 deletions(-)
>

Merged into OE-core

Thanks
	Sau!


