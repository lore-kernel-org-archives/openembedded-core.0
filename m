Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 510566A5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:57:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2013 03:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1019,1363158000"; d="scan'208";a="361957441"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2013 03:58:41 -0700
Date: Mon, 8 Jul 2013 13:57:40 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130708105739.GA12906@lpalcu-linux>
References: <cover.1373275874.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1373275874.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dylan][PATCH 00/44] Backports from master (cover letter only)
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
X-List-Received-Date: Mon, 08 Jul 2013 10:57:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2013 at 10:32:18AM +0100, Paul Eggleton wrote:
> 
> Laurentiu Palcu (2):
>   populate_sdk_base, adt_installer: abort install if path contains
>     spaces
The previous patch introduces a bashism which is fixed by this patch
(not merged yet in master):
http://patches.openembedded.org/patch/52979/

So, both patches should go in dylan or, if this is not possible, leave
this one out for now.

Laurentiu

