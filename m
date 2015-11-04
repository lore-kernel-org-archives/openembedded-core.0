Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9C93660125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 15:43:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Nov 2015 07:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,243,1444719600"; d="scan'208";a="811654649"
Received: from atharazi-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.130.179])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2015 07:43:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tzu-Jung Lee <roylee17@currantlabs.com>
Date: Wed, 04 Nov 2015 15:43:34 +0000
Message-ID: <2284541.9QoD5dI8B4@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.11; x86_64; ; )
In-Reply-To: <1446492085-29311-1-git-send-email-roylee17@currantlabs.com>
References: <1446492085-29311-1-git-send-email-roylee17@currantlabs.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: include do_patch in SRCTREECOVEREDTASKS
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
X-List-Received-Date: Wed, 04 Nov 2015 15:43:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 November 2015 19:21:25 Tzu-Jung Lee wrote:
> The external source of kernel has been patched during the
> construction of git repository. Include the do_patch task in the
> SRCTREECOVEREDTASKS.
> 
> Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 7b87558..a7747c7 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -623,7 +623,7 @@ def modify(args, config, basepath, workspace):
>              f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
> 
>          if bb.data.inherits_class('kernel', rd):
> -            f.write('SRCTREECOVEREDTASKS = "do_validate_branches
> do_kernel_checkout do_fetch do_unpack"\n') +           
> f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout
> do_fetch do_unpack do_patch"\n') if initial_rev:
>              f.write('\n# initial_rev: %s\n' % initial_rev)
>              for commit in commits:

Seems reasonable - I can't think why this would have been legitimately 
excluded, though I wonder if it had something to do with linux-yocto vs. more 
traditional OE kernel recipes.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

(This will get queued for master, but we can backport to jethro after the 
release.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

