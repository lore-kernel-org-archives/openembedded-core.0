Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZRqe-0005qg-2B
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 19:40:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2011 10:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="85027230"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2011 10:33:42 -0800
Message-ID: <4EE3A606.50205@linux.intel.com>
Date: Sat, 10 Dec 2011 10:33:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323536396.git.elizabeth.flanagan@intel.com>
	<ec285d5f7ed5fde668744bb167d70e5409ee4f1d.1323536396.git.elizabeth.flanagan@intel.com>
In-Reply-To: <ec285d5f7ed5fde668744bb167d70e5409ee4f1d.1323536396.git.elizabeth.flanagan@intel.com>
Subject: Re: [PATCH 1/1] [YOCTO #1819] license: PR bump failure
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
X-List-Received-Date: Sat, 10 Dec 2011 18:40:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2011 09:03 AM, Beth Flanagan wrote:
> From: Elizabeth Flanagan<elizabeth.flanagan@intel.com>
>
> This addtask for do_populate_lic should be reverted back
> to before do_package as before do_compile causes failures
> when recipes are updated.
>
Beth,

The [YOCTO #1819] goes in the commit body, not the "subject part"

Sau!


> Signed-off-by: Elizabeth Flanagan<elizabeth.flanagan@intel.com>
> ---
>   meta/classes/license.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 4689aaf..dd5d1bc 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -6,7 +6,7 @@
>   LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
>   LICSSTATEDIR = "${WORKDIR}/license-destdir/"
>
> -addtask populate_lic after do_patch before do_compile
> +addtask populate_lic after do_patch before do_package
>   do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
>   do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
>


