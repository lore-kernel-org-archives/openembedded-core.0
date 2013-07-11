Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 603A06226A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:49:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2013 05:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="343921713"
Received: from unknown (HELO helios.localnet) ([10.252.122.35])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2013 05:49:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Thu, 11 Jul 2013 13:49:49 +0100
Message-ID: <6391172.XjBtrIKksh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373540849.git.Qi.Chen@windriver.com>
References: <cover.1373540849.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Thu, 11 Jul 2013 12:49:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Thursday 11 July 2013 19:11:36 Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This patchset mainly does two things:
> 1. code refactor to avoid code duplication
> 2. add a method for image level user/group configuration
> 
> The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:
> 
>   meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib ChenQi/user_group_settings
>  
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/user_group_set
> tings
> 
> Chen Qi (3):
>   userbase.bbclass: add a new bbclass
>   useradd.bbclass: code refactor
>   usersettings.bbclass: add a new bbclass
> 
>  meta/classes/useradd.bbclass      |  103 ++---------------
>  meta/classes/userbase.bbclass     |  230
> +++++++++++++++++++++++++++++++++++++ meta/classes/usersettings.bbclass |  
> 48 ++++++++
>  3 files changed, 290 insertions(+), 91 deletions(-)
>  create mode 100644 meta/classes/userbase.bbclass
>  create mode 100644 meta/classes/usersettings.bbclass

In terms of naming I'd rather see the base class be called useradd_base to
match the naming of similar existing classes. For the new class, I'm not sure
usersettings is really an appropriate name, perhaps something like
"useradd_real" or "useraccount" or something else that more accurately reflects 
what it is for?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

