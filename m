Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24yQ-0000Ah-1k
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:39:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2012 11:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187348896"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 11:27:15 -0700
Message-ID: <502D3B83.3050309@linux.intel.com>
Date: Thu, 16 Aug 2012 11:27:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344589278.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1344589278.git.mihaix.lindner@linux.intel.com>
Subject: Re: [PATCH 0/1] sysklogd: removed tabs from syslog.conf
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
X-List-Received-Date: Thu, 16 Aug 2012 18:39:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2012 02:07 AM, Mihai Lindner wrote:
> Yocto #2926: syslog.conf should not have tabs within the selector field.
> Removed tabs from the selector field of syslog rules. Tabs or spaces
> should be used, in syslog.conf, only when separating selectors from
> actions.
>
> Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
> ---
> The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:
>
>    foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib ml/syslog.conf
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ml/syslog.conf
>
> Mihai Lindner (1):
>    sysklogd: removed tabs from syslog.conf
>
>   meta/recipes-extended/sysklogd/files/syslog.conf |   23 +++++++++++----------
>   meta/recipes-extended/sysklogd/sysklogd_1.5.bb   |    2 +-
>   2 files changed, 13 insertions(+), 12 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



