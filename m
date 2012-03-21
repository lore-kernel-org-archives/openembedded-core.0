Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SAG4q-0001yQ-Bi
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 08:35:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Mar 2012 00:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="123281923"
Received: from dongxiao-osel.sh.intel.com (HELO [10.239.36.11])
	([10.239.36.11])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2012 00:26:29 -0700
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20120316085323.GB3855@jama.jama.net>
References: <cover.1331887433.git.dongxiao.xu@intel.com>
	<3d86bbc3fc0de1c9d0fe4903edf9f643446fde9c.1331887433.git.dongxiao.xu@intel.com>
	<20120316085323.GB3855@jama.jama.net>
Date: Wed, 21 Mar 2012 15:24:23 +0800
Message-ID: <1332314663.10433.10.camel@dongxiao-osel>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/1] bitbake.conf: Exclude some variables when calculating cache hash
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
X-List-Received-Date: Wed, 21 Mar 2012 07:35:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 09:53 +0100, Martin Jansa wrote:
> On Fri, Mar 16, 2012 at 04:48:34PM +0800, Dongxiao Xu wrote:
> > Some variables are not needed when calculating cache's hash, this
> > commit removes them.
> > 
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/conf/bitbake.conf |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 216da75..908adcd 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -738,7 +738,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
> >  # Setup our default hash policy
> >  BB_SIGNATURE_HANDLER ?= "OEBasic"
> >  BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
> > -BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME"
> > +BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK"
> 
> what about that XAUTHORITY I had?

I will make a patch to add XAUTHORITY into the exclusion list.

Thanks,
Dongxiao

> 
> >  
> >  MLPREFIX ??= ""
> >  MULTILIB_VARIANTS ??= ""
> > -- 
> > 1.7.4.1
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




