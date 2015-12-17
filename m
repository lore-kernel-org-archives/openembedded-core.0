Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31B8C6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:49:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 17 Dec 2015 04:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="843210907"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2015 04:49:23 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id DC57F6A4087;
	Thu, 17 Dec 2015 05:37:23 -0800 (PST)
Date: Thu, 17 Dec 2015 14:17:58 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151217121758.GA30559@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1450353748-14381-1-git-send-email-joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <1450353748-14381-1-git-send-email-joshua.lock@collabora.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/help.py: document that mountpoint is optional for part command
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
X-List-Received-Date: Thu, 17 Dec 2015 12:49:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Joshua,

Thank you for the patch!

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Dec 17, 2015 at 12:02:28PM +0000, Joshua Lock wrote:
> If no mountpoint is specified for a partition command the partition
> will be created but not mounted — mention this in the kickstart
> help text.
> 
> [YOCTO #8820]
> 
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  scripts/lib/wic/help.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 89fb7be..be334e7 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -617,7 +617,7 @@ DESCRIPTION
>         This command creates a partition on the system and uses the
>         following syntax:
>  
> -         part <mountpoint>
> +         part [<mountpoint>]
>  
>         The <mountpoint> is where the partition will be mounted and
>         must take of one of the following forms:
> @@ -626,6 +626,9 @@ DESCRIPTION
>  
>           swap: The partition will be used as swap space.
>  
> +       If a <mountpoint> is not specified the partition will be created
> +       but will not be mounted.
> +
>         The following are supported 'part' options:
>  
>           --size: The minimum partition size. Specify an integer value
--
Regards,
Ed

