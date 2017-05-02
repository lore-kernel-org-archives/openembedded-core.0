Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A2BC471DEF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 14:51:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 02 May 2017 07:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="81517665"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 02 May 2017 07:51:11 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 805E86A4080;
	Tue,  2 May 2017 07:50:57 -0700 (PDT)
Date: Tue, 2 May 2017 17:37:31 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
Message-ID: <20170502143731.GA17616@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
MIME-Version: 1.0
In-Reply-To: <20170421121145.9797-1-andreas.reichel@tngtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic patch 0/5] Add option to wic and use argparse
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
X-List-Received-Date: Tue, 02 May 2017 14:51:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 21, 2017 at 02:11:40PM +0200, Andreas J. Reichel wrote:
>     * wic uses optparse and a rather complicated approach of its
>         initialization. It is much easier to switch from the
>         deprecated optparse to the argparse library, which also
>         supports sub-commands, which wic heavily makes use of.
>         The second patch replaces optparse by argparse.

Thank you for the patchset!

I'm going to fix failing test case and test argparse-related patches
as a separate patchset.

Feel free to update and re-send the rest of the patches.

--
Regards,
Ed

