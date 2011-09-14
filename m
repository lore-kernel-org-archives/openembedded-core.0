Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R3uI6-00005l-FR
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:34:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2011 11:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="48837669"
Received: from unknown (HELO [10.255.14.158]) ([10.255.14.158])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2011 11:29:16 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 11:29:11 -0700
In-Reply-To: <762ff1254aa06eec0a2d681026b957909a84afcf.1316019927.git.paul.eggleton@linux.intel.com>
References: <cover.1316019927.git.paul.eggleton@linux.intel.com>
	<762ff1254aa06eec0a2d681026b957909a84afcf.1316019927.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316024956.2156.26.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] task-core: split into task-core-console and task-core-x11
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
X-List-Received-Date: Wed, 14 Sep 2011 18:34:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 19:13 +0100, Paul Eggleton wrote:
> [YOCTO #1481]
> 
> Since tasks are referred to almost exclusively via RDEPENDS, and bitbake
> will build an entire task recipe when only one of its task packages are
> actually needed, building a console-only image that uses
> task-core-apps-console (or less directly, has apps-console in its
> IMAGE_FEATURES) will cause a build of a whole list of X11 applications
> that aren't needed. Splitting the task-core recipe into X11 and console
> portions prevents this issue.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>

<snip>

> -RECIPE_STATUS_pn-task-core = "green"
> -RECIPE_LATEST_VERSION_pn-task-core = "1.0"
> -RECIPE_MAINTAINER_pn-task-core = "Dongxiao Xu <dongxiao.xu@intel.com>"
> +RECIPE_STATUS_pn-task-core-console = "green"
> +RECIPE_LATEST_VERSION_pn-task-core-console = "1.0"
> +RECIPE_MAINTAINER_pn-task-core-console = "Dongxiao Xu <dongxiao.xu@intel.com>"
> +
> +RECIPE_STATUS_pn-task-core-x11 = "green"
> +RECIPE_LATEST_VERSION_pn-task-core-x11 = "1.0"
> +RECIPE_MAINTAINER_pn-task-core-x11 = "Dongxiao Xu <dongxiao.xu@intel.com>"

What ever happened to "you change it, you own it"? ;-)

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



