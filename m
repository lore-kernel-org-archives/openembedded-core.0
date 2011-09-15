Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4FvU-0006Jv-Rx
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 19:40:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Sep 2011 10:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,388,1312182000"; d="scan'208";a="54090775"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2011 10:35:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 15 Sep 2011 10:35:27 -0700
In-Reply-To: <cover.1316019927.git.paul.eggleton@linux.intel.com>
References: <cover.1316019927.git.paul.eggleton@linux.intel.com>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316108127.1058.82.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Split task-core to reduce build time v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 15 Sep 2011 17:40:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 19:13 +0100, Paul Eggleton wrote:
> This patch makes a significant reduction in the build time for
> console-only images that use task-core-apps-console (from ~4000 down to
> ~2700 in my tests) by avoiding building X11 applications unnecessarily. 
> 
> Since v1, add bug reference and update copyright notices.
> 
> The following changes since commit 8df322abfd3fa8c460fd73c83c1ef0b5e419dc11:
> 
>   core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:27:08 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/task-core-split
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/task-core-split
> 
> Paul Eggleton (1):
>   task-core: split into task-core-console and task-core-x11
> 
>  .../conf/distro/include/distro_tracking_fields.inc |   10 +++++--
>  meta/conf/multilib.conf                            |    3 +-
>  meta/recipes-core/tasks/task-core-console.bb       |   28 ++++++++++++++++++++
>  .../tasks/{task-core.bb => task-core-x11.bb}       |   17 ++----------
>  4 files changed, 40 insertions(+), 18 deletions(-)
>  create mode 100644 meta/recipes-core/tasks/task-core-console.bb
>  rename meta/recipes-sato/tasks/{task-core.bb => task-core-x11.bb} (79%)
> 

Merged into OE-Core, with a minor tweak afterwards.

Thanks
Sau!




