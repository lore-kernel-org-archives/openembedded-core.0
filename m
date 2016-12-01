Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 68B5071A90
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 15:57:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 01 Dec 2016 07:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="197924096"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2016 07:57:37 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F2A316A4006;
	Thu,  1 Dec 2016 07:56:52 -0800 (PST)
Date: Thu, 1 Dec 2016 17:57:05 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20161201155705.GA11043@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480354083-1495-1-git-send-email-ed.bartosh@linux.intel.com>
	<969465ac-9c0b-81b6-b0a8-69ee69613474@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <969465ac-9c0b-81b6-b0a8-69ee69613474@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory-diff: report directory renames
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
X-List-Received-Date: Thu, 01 Dec 2016 15:57:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2016 at 03:51:21PM +0200, Alexander Kanavin wrote:
> On 11/28/2016 07:28 PM, Ed Bartosh wrote:
> >The script detects directory renaming if two different
> >directories with the same set of files are added and removed.
> 
> What happens if the sets of files are slightly different? (e.g. a
> couple of files are added or removed). Can we get some wiggle space
> here?
> 
In this case script will behave like it does currently. It will show all
added and removed files.

--
Regards,
Ed

