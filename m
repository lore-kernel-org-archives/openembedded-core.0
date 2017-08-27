Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3895978204
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 21:42:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 27 Aug 2017 14:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,438,1498546800"; d="scan'208";a="894566761"
Received: from ykhoo5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.79.63])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2017 14:42:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: daniela.plascencia@linux.intel.com
Date: Mon, 28 Aug 2017 09:42:37 +1200
Message-ID: <3819756.duRYhGLYzp@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1503686996-29982-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1503686996-29982-1-git-send-email-daniela.plascencia@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/buildhistory-diff: use of argparse instead of optparse
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
X-List-Received-Date: Sun, 27 Aug 2017 21:42:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Daniela,

On Saturday, 26 August 2017 6:49:56 AM NZST daniela.plascencia@linux.intel.com wrote:
> -    except gitdb.exc.BadObject as e:
> -        if len(args) == 1:
> +        changes = process_changes(args.buildhistory_dir, fromrev, torev,
> +                                  args.report_all, args.report_ver, args.sigs,
> +                                  args.sigsdiff, args.exclude_path)
> +    except gitdb.exc.BadName as e:

This change wasn't mentioned in the commit message and isn't directly
related. Did you see a different exception in your testing? Are you sure 
BadObject won't also be raised?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

