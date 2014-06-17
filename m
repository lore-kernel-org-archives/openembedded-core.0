Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 481B56FF64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 12:33:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2014 05:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,493,1400050800"; d="scan'208";a="549170235"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.19])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2014 05:33:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Jun 2014 13:33:17 +0100
Message-ID: <3393068.dWaMXD2vQY@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1402073854-10723-1-git-send-email-Martin.Jansa@gmail.com>
References: <1402073854-10723-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d: Allow to use different initscripts provider
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
X-List-Received-Date: Tue, 17 Jun 2014 12:33:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Friday 06 June 2014 18:57:34 Martin Jansa wrote:
> * until now all recipes were respecting VIRTUAL-RUNTIME_initscripts
>   variable but commit bba835fed88c3bd5bb5bd58962034aef57c408d8
>   hardcoded "initscripts" runtime dependency
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/update-rc.d.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/update-rc.d.bbclass
> b/meta/classes/update-rc.d.bbclass index ca9486b..19b081d 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -1,7 +1,8 @@
>  UPDATERCPN ?= "${PN}"
> 
>  DEPENDS_append = " update-rc.d-native"
> -DEPENDS_append_class-target = " initscripts"
> +VIRTUAL-RUNTIME_initscripts ?= "initscripts"
> +DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
>  UPDATERCD = "update-rc.d"
>  UPDATERCD_class-cross = ""
>  UPDATERCD_class-native = ""

Technically this isn't right either though - VIRTUAL-RUNTIME_initscripts is 
for the runtime package name not the recipe as is being added here. It just so 
happens that they are the same thing for initscripts.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

