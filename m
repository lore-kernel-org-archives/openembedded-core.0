Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QOG8S-0006pC-Uh
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 23:24:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2011 14:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,253,1304319600"; 
   d="scan'208";a="2689389"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2011 14:21:28 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2011 14:21:23 -0700
In-Reply-To: <ba11e66609ecaad27a4c225ee1e21d60a330d8f9.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
	<ba11e66609ecaad27a4c225ee1e21d60a330d8f9.1306089781.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1306099288.1995.2.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 4/9] package_rpm.bbclass: create method for createrepo cmd
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
X-List-Received-Date: Sun, 22 May 2011 21:24:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Can we have an explanation of why this change was made in the commit
message?

Thanks,
Joshua

On Sun, 2011-05-22 at 11:48 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 1d8c686..666eb54 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -15,6 +15,10 @@ python package_rpm_install () {
>  	bb.fatal("package_rpm_install not implemented!")
>  }
>  
> +package_createrepo () {
> +	createrepo ${DEPLOY_DIR_RPM}
> +}
> +
>  RPMCONF_TARGET_BASE = "${DEPLOY_DIR_RPM}/solvedb"
>  RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
>  #
> @@ -816,6 +820,6 @@ python do_package_write_rpm () {
>  do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
>  addtask package_write_rpm before do_package_write after do_package
>  
> -PACKAGEINDEXES += "package_update_index_rpm; createrepo ${DEPLOY_DIR_RPM};"
> +PACKAGEINDEXES += "package_update_index_rpm; package_createrepo"
>  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"

-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



