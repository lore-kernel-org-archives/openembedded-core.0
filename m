Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4CD60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:35:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2015 02:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,394,1444719600"; d="scan'208";a="868219211"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2015 02:35:24 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 614516A4087;
	Mon,  7 Dec 2015 02:34:14 -0800 (PST)
Date: Mon, 7 Dec 2015 12:04:03 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Matt Madison <matt@madison.systems>
Message-ID: <20151207100403.GA6782@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1449420803-12282-1-git-send-email-matt@madison.systems>
MIME-Version: 1.0
In-Reply-To: <1449420803-12282-1-git-send-email-matt@madison.systems>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: insert local Python paths at front
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
X-List-Received-Date: Mon, 07 Dec 2015 10:35:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matt,

Thank you for the patch!

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Sun, Dec 06, 2015 at 08:53:22AM -0800, Matt Madison wrote:
> This follows how bitbake performs path insertion, and fixes a
> failure to start wic on Ubuntu 15.10 with the distribution's
> version of python-ply installed.
> 
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  scripts/wic | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/wic b/scripts/wic
> index 7ad2b19..2286f20 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -41,12 +41,12 @@ from distutils import spawn
>  # External modules
>  scripts_path = os.path.abspath(os.path.dirname(__file__))
>  lib_path = scripts_path + '/lib'
> -sys.path.append(lib_path)
> +sys.path.insert(0, lib_path)
>  
>  bitbake_exe = spawn.find_executable('bitbake')
>  if bitbake_exe:
>      bitbake_path = os.path.join(os.path.dirname(bitbake_exe), '../lib')
> -    sys.path.append(bitbake_path)
> +    sys.path.insert(0, bitbake_path)
>      from bb import cookerdata
>      from bb.main import bitbake_main, BitBakeConfigParameters
>  else:
> -- 
> 2.5.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Ed

