Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E20E460043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:40:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Apr 2015 03:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="709827940"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Apr 2015 03:40:12 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BA48B6A4090;
	Tue,  7 Apr 2015 03:39:49 -0700 (PDT)
Date: Tue, 7 Apr 2015 13:40:06 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20150407104006.GA19718@linux.intel.com>
References: <1428402119-31945-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1428402119-31945-1-git-send-email-alexandre.belloni@free-electrons.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 1/2] wic: rawcopy: ensure comparison is done on int
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
X-List-Received-Date: Tue, 07 Apr 2015 10:40:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2015 at 12:21:58PM +0200, Alexandre Belloni wrote:
> The size comparison may fail because it is done on strings rather than
> integers.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  scripts/lib/wic/plugins/source/rawcopy.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
> index cf6236a04f91..ba7fda787ed7 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -77,7 +77,7 @@ class RawCopyPlugin(SourcePlugin):
>          out = exec_cmd(du_cmd)
>          filesize = out.split()[0]
>  
> -        if filesize > part.size:
> +        if int(filesize) > int(part.size):
>              part.size = filesize
>  
>          part.source_file = dst

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

--
Regards,
Ed

