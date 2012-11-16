Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TZU5P-0000lZ-9y
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 23:08:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Nov 2012 13:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,266,1352102400"; d="scan'208";a="169358848"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Nov 2012 13:54:29 -0800
Message-ID: <50A6B615.2030809@linux.intel.com>
Date: Fri, 16 Nov 2012 13:54:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1353031471.git.kai.kang@windriver.com>
In-Reply-To: <cover.1353031471.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@WINDRIVER.COM, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Remove package lsbsetup
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
X-List-Received-Date: Fri, 16 Nov 2012 22:08:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2012 10:41 PM, Kang Kai wrote:
> The following changes since commit 9e0d3c0faa9cc80ce8f2ce0eb31dcd20ef875955:
>
>    sstate: Bump version number to deal with layout fixes (2012-11-14 23:37:45 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/lsb
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb
>
> Kang Kai (1):
>    lsbsetup: remove it
>
This contains more than just removing lsbsetup, this should be broken up 
and documented properly.

Sau!

>   .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |   10 +-
>   meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |  230 --------------------
>   meta/recipes-extended/lsb/lsbsetup_1.0.bb          |   26 ---
>   meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    9 +-
>   .../packagegroups/packagegroup-core-lsb.bb         |    3 +-
>   5 files changed, 18 insertions(+), 260 deletions(-)
>   delete mode 100644 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
>   delete mode 100644 meta/recipes-extended/lsb/lsbsetup_1.0.bb
>


