Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 25C02600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:01:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 09:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="40483706"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2017 09:01:23 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F092E6A4080;
	Mon,  6 Feb 2017 09:00:22 -0800 (PST)
Date: Mon, 6 Feb 2017 18:38:57 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20170206163857.GA17774@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <f181ed99-ed09-59d9-96a8-cf5d77a179d7@mender.io>
	<1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
MIME-Version: 1.0
In-Reply-To: <1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 06 Feb 2017 17:01:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2017 at 05:16:45PM +0100, Kristian Amlie wrote:
> 
> Rebased and reran tests. Changes since last patchset:
> 
> - Because of recipe specific sysroots we now need to import the PATH
>   used by wic-tools into the test in order to use its tools.
> 
> - Add specific '-o' parameter while testing wic so that we write into
>   resultdir.
> 
> - Several unrelated changes to poky now means that we need to use an
>   absolute path for new_rootfs in the rootfs.py implementation. This
>   would have been a good idea from the start anyway.
> 
> I hope there are no more outstanding issues with this patchset.
> 

The patchset looks good to me.
All wic test cases have been passed.

--
Regards,
Ed

