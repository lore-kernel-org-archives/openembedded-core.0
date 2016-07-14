Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8D06D6067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 12:38:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jul 2016 05:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,362,1464678000"; d="scan'208";a="846191004"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 14 Jul 2016 05:38:11 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 992D76A4080;
	Thu, 14 Jul 2016 05:38:02 -0700 (PDT)
Date: Thu, 14 Jul 2016 15:28:09 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20160714122809.GA3744@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <f797bf73d4af0da787c3bb8dd296fe03bdd16afb.1468322776.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <f797bf73d4af0da787c3bb8dd296fe03bdd16afb.1468322776.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: mountpoint is an optional argument
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
X-List-Received-Date: Thu, 14 Jul 2016 12:38:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maciej,

Thank you for the patch! It looks good to me.

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

BTW, the same effect can be achieved by specifying mount point without
leading slash, i.e. part mirror --ondisk sda ....

On Tue, Jul 12, 2016 at 01:37:25PM +0200, Maciej Borzecki wrote:
> According to wic documentation partition mount point is an optional
> argument. Skipping mount point also makes sense in certain
> configurations when one needs to specify a partition that is not mounted
> by the running system, such as a recovery or a mirror partition (in dual
> rootfs setups).
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  scripts/lib/wic/ksparser.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 6887a7d02441165d7696318ddd132c739c8121b3..0894e2b199a299fbbed272f2e1c95e9d692e3ab1 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -124,7 +124,7 @@ class KickStart():
>          subparsers = parser.add_subparsers()
>  
>          part = subparsers.add_parser('part')
> -        part.add_argument('mountpoint')
> +        part.add_argument('mountpoint', nargs='?')
>          part.add_argument('--active', action='store_true')
>          part.add_argument('--align', type=int)
>          part.add_argument("--extra-space", type=sizetype, default=10*1024)

--
Regards,
Ed

