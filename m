Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED3246FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 10:04:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 02:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635411801"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 02:04:53 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0DF362C8002;
	Mon, 18 Jan 2016 02:52:48 -0800 (PST)
Date: Mon, 18 Jan 2016 10:08:23 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <20160118080823.GA9555@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1452519231-13332-1-git-send-email-joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <1452519231-13332-1-git-send-email-joshua.g.lock@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/help.py: document requirements for valid fstab generation
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
X-List-Received-Date: Mon, 18 Jan 2016 10:04:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

Thank you for the patch!

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Mon, Jan 11, 2016 at 01:33:51PM +0000, Joshua Lock wrote:
> Without one of the --ondrive, --ondisk or --use-uuid options for a
> partition with a mountpoint specified the automatically generated
> fstab entry will be invalid.
> 
> [YOCTO #8844]
> 
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  scripts/lib/wic/help.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index be334e7..f5587bb 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -629,6 +629,13 @@ DESCRIPTION
>         If a <mountpoint> is not specified the partition will be created
>         but will not be mounted.
>  
> +       Partitions with a <mountpoint> specified will be automatically mounted.
> +       This is achieved by wic adding entries to the fstab during image
> +       generation. In order for a valid fstab to be generated one of the
> +       --ondrive, --ondisk or --use-uuid partition options must be used for
> +       each partition that specifies a mountpoint.
> +
> +
>         The following are supported 'part' options:
>  
>           --size: The minimum partition size. Specify an integer value
> -- 
> 2.5.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

