Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B746273E65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 09:36:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2015 02:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="589432127"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.18.65])
	by orsmga003.jf.intel.com with ESMTP; 17 Jun 2015 02:36:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Wed, 17 Jun 2015 10:36:35 +0100
Message-ID: <2071087.3Bvkg31YSM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1434022456-26266-10-git-send-email-markus.lehtonen@linux.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1434022456-26266-10-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 09/10] devtool: remove some unused return values
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
X-List-Received-Date: Wed, 17 Jun 2015 09:36:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 June 2015 14:34:15 Markus Lehtonen wrote:
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/devtool                 | 1 -
>  scripts/lib/devtool/standard.py | 3 ---
>  2 files changed, 4 deletions(-)
> 
> diff --git a/scripts/devtool b/scripts/devtool
> index 0100eb8..307846a 100755
> --- a/scripts/devtool
> +++ b/scripts/devtool
> @@ -157,7 +157,6 @@ def _enable_workspace_layer(workspacedir, config,
> basepath): bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
> if not os.path.exists(bblayers_conf):
>          logger.error('Unable to find bblayers.conf')
> -        return -1

I appreciate the actually returned value might not be used, but simply 
dropping the return entirely allows the function to continue after the error, 
which is wrong.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

