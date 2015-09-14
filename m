Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 73D4E73D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 08:19:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 01:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,526,1437462000"; d="scan'208";a="561251738"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2015 01:19:20 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9043F6A4005;
	Mon, 14 Sep 2015 01:18:26 -0700 (PDT)
Date: Mon, 14 Sep 2015 11:19:14 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: George McCollister <george.mccollister@gmail.com>
Message-ID: <20150914081914.GA14951@linux.intel.com>
References: <1441906252-28516-1-git-send-email-george.mccollister@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1441906252-28516-1-git-send-email-george.mccollister@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][fido] wic: fix path parsing, use last occurrence
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Sep 2015 08:19:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi George,

Thank you for the fix!

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Sep 10, 2015 at 12:30:52PM -0500, George McCollister wrote:
> If the path contains 'scripts' more than once the first occurrence will be
> incorrectly used. Use rfind instead of find to find the last occurrence.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  scripts/lib/wic/plugin.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
> index 41a8017..3acd5b4 100644
> --- a/scripts/lib/wic/plugin.py
> +++ b/scripts/lib/wic/plugin.py
> @@ -42,7 +42,7 @@ class PluginMgr(object):
>  
>      def __init__(self):
>          wic_path = os.path.dirname(__file__)
> -        eos = wic_path.find('scripts') + len('scripts')
> +        eos = wic_path.rfind('scripts') + len('scripts')
>          scripts_path = wic_path[:eos]
>          self.scripts_path = scripts_path
>          self.plugin_dir = scripts_path + PLUGIN_DIR
> -- 
> 2.4.5
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

