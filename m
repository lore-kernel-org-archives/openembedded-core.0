Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 545FC6BC15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 02:15:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2018 18:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,238,1539673200"; d="scan'208";a="106700460"
Received: from keng1-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.146.241])
	by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2018 18:15:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 16 Nov 2018 15:15:46 +1300
Message-ID: <2245203.9ONnnPL5vZ@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1534647044-14420-1-git-send-email-bruce.ashfield@windriver.com>
References: <1534647044-14420-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 16 Nov 2018 02:15:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bruce

I just came across this the other day and I had one question:

On Sunday, 19 August 2018 2:50:44 PM NZDT Bruce Ashfield wrote:
> The existing kernel-devsrc package starts with a full copy of the kernel
> source and then starts to strip out elements that are not required.
> 
> This results in extra time (I/O) and extra space being taken up in the
> final package. The main purpose of the kernel-devsrc package has been to
> build modules against the running kernel, not to include a full copy of
> the source code for re-building the kernel. The end result was a
> 600M kernel-devsrc package.
> 
> This restructuring of the package uses an approach similar to other
> distros, where the kernel-devsrc package is for building against the
> running kernel and uses a curated set of copied infrastructure, versus
> a mass copy of the entire kernel.
> ...
>  - There is also a symlink from /lib/modules/<version>/source -> build
>    to reserve a spot for a new package that is simply the kernel
>    source. That package is not part of this update.

Did you manage to get to this or is it still planned?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



