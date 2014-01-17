Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB896A467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:16:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jan 2014 06:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,670,1384329600"; d="scan'208";a="460512916"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.195])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2014 06:11:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 17 Jan 2014 14:11:39 +0000
Message-ID: <66190526.u9bvojJavk@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.7-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <0522b744ff3e02f6ef1f794294f759ec1f176923.1388992959.git.Qi.Chen@windriver.com>
References: <cover.1388992959.git.Qi.Chen@windriver.com>
	<0522b744ff3e02f6ef1f794294f759ec1f176923.1388992959.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 2/2] Add missing RDEPENDS of initscripts-functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 14:16:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Monday 06 January 2014 15:27:35 Chen Qi wrote:
> Now that the initscripts-functions has been packaged separately,
> packages which may use the functions script should have a runtime
> dependency on it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
>  meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    1 +
>  .../irda-utils/irda-utils_0.9.18.bb                |    2 ++
>  .../nfs-utils/nfs-utils_1.2.9.bb                   |    4 ++--
>  meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
>  meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    1 +
>  meta/recipes-core/dbus/dbus.inc                    |    2 +-
>  meta/recipes-core/systemd/systemd_208.bb           |    2 +-
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
>  meta/recipes-devtools/distcc/distcc_3.1.bb         |    1 +
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
>  meta/recipes-extended/at/at_3.1.14.bb              |    3 +--
>  meta/recipes-extended/cronie/cronie_1.4.11.bb      |    2 ++
>  meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    2 ++
>  meta/recipes-extended/sysklogd/sysklogd.inc        |    2 ++
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 +
>  .../oprofile/oprofileui-server_git.bb              |    2 +-
>  17 files changed, 22 insertions(+), 11 deletions(-)

Sorry to come back on this patchset again, but could we not detect 
installation of an initscript requiring these functions in update-rc.d.bbclass 
and just add the RDEPENDS automatically? Otherwise it's just another thing 
people can get wrong when writing a recipe, not to mention all of the existing 
recipes outside OE-Core that install initscripts.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

