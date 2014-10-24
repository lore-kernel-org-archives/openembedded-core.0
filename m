Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 188D465D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 11:54:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Oct 2014 04:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,779,1406617200"; d="scan'208";a="624597941"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.113])
	by orsmga002.jf.intel.com with ESMTP; 24 Oct 2014 04:54:44 -0700
Date: Fri, 24 Oct 2014 14:54:43 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <20141024115443.GA16788@lpalcu-linux>
References: <1414136470-3075-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1414136470-3075-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.py: Fix error in graph sorting
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
X-List-Received-Date: Fri, 24 Oct 2014 11:54:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 24, 2014 at 09:41:10AM +0200, Pascal Bach wrote:
> The graph sorting algorithm for image dependencies does a look for an
> occurrence of a searched string instead of comparing the chunk to the
> searched string. This leads to the problem that ubifs is recognized as ubi aswell.
> 
> This fixes this by splitting up the string into chunks.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

> ---
>  meta/lib/oe/image.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index c9b9033..5e07187 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -109,7 +109,7 @@ class ImageDepGraph(object):
>          # remove added nodes from deps_array
>          for item in group:
>              for node in self.graph:
> -                if item in self.graph[node]:
> +                if item in self.graph[node].split():
>                      self.deps_array[node][0] -= 1
>  
>              self.deps_array.pop(item, None)
> -- 
> 1.7.10.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

