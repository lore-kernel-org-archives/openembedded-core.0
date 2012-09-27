Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THHmF-0004uA-Qn
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 19:21:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Sep 2012 10:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149922340"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 10:08:37 -0700
Message-ID: <50648815.70308@linux.intel.com>
Date: Thu, 27 Sep 2012 10:08:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1348695851.git.elizabeth.flanagan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] license.bbclass fixes
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
X-List-Received-Date: Thu, 27 Sep 2012 17:21:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 02:50 PM, Elizabeth Flanagan wrote:
> [YOCTO #3118]
>
> license.conf hasn't been being parsed. This commit series ensures that
> license.conf is parsed, that it contains useful variables that should be
> in a global conf file and that those variables are not kept within
> license.bbclass.
>
So where is the inherit license bbclass?

Sau!

> This also fixes an discreprancy between the documentation of LICENSE_PATH (which
> is what we tell people to use) and what we were using "LICENSE_DIR". This ensures
> that when the end user needs to add additional licenses, that they use
> LICENSE_PATH += "path/to/additional/licenses" and that it works.
>

> The following changes since commit 0b09e50810162a07ef0aecee91ee32b4a36334a3:
>
>    busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib eflanagan/LICENSE_PATH
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/LICENSE_PATH
>
> Elizabeth Flanagan (3):
>    license.bbclass: Variable standardization
>    bitbake.conf: parse license config
>    license.conf/bbclass: Move globals to license.conf
>
>   meta/classes/license.bbclass |   67 +-----------------------------------------
>   meta/conf/bitbake.conf       |    1 +
>   meta/conf/licenses.conf      |   64 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 66 insertions(+), 66 deletions(-)
>


