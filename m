Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2912073C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 12:39:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2015 05:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,390,1427785200"; d="scan'208";a="725943513"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.28.13])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2015 05:39:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Fri, 08 May 2015 13:39:15 +0100
Message-ID: <2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <554C98F7.5090005@dresearch-fe.de>
References: <554C98F7.5090005@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: WARNING: The license listed CLOSED was not in the licenses collected for foo
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
X-List-Received-Date: Fri, 08 May 2015 12:39:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steffen,

On Friday 08 May 2015 13:07:35 Steffen Sledz wrote:
> Since switching from dizzy to fido we've some warnings related to some of
> our own closed source packages.
> 
> WARNING: log_check: There is a warn message in the logfile
> WARNING: log_check: Matched keyword: [WARNING:]
> WARNING: log_check: WARNING: The license listed CLOSED was not in the
> licenses collected for foo
> 
> The recipes contain lines like this one:
> 
> LICENSE = "CLOSED"
> 
> How should we fix the recipe to avoid the warning?

I think the part of the code that produces this warning probably should be 
ignoring the CLOSED value. Can I ask you to please file a bug? Feel free to add 
me on CC.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

