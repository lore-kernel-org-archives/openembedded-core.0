Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4036560557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 22:02:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 05 Feb 2015 13:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,526,1418112000"; d="scan'208";a="662204872"
Received: from msdesadl-mobl.amr.corp.intel.com (HELO [10.252.141.171])
	([10.252.141.171])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2015 14:01:41 -0800
Message-ID: <1423173702.21935.0.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 05 Feb 2015 16:01:42 -0600
In-Reply-To: <1423090118-13921-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423090118-13921-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: print partition alignment when available
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
X-List-Received-Date: Thu, 05 Feb 2015 22:02:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-04 at 23:48 +0100, Alexandre Belloni wrote:
> When printing a partition, the --align parameter was shown when present
> but not its value.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Acked-by: Tom Zanussi >tom.zanussi@linux.intel.com>

> ---
>  scripts/lib/wic/kickstart/custom_commands/micpartition.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/kickstart/custom_commands/micpartition.py b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
> index 43d04f12945c..d6be008cebf2 100644
> --- a/scripts/lib/wic/kickstart/custom_commands/micpartition.py
> +++ b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
> @@ -32,7 +32,7 @@ class Mic_PartData(FC4_PartData):
>          retval = FC4_PartData._getArgsAsStr(self)
>  
>          if self.align:
> -            retval += " --align"
> +            retval += " --align=%d" % self.align
>          if self.extopts:
>              retval += " --extoptions=%s" % self.extopts
>          if self.part_type:
> -- 
> 2.1.0
> 



