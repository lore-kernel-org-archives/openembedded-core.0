Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8ABC960111
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 22:10:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jun 2016 15:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,518,1459839600"; d="scan'208";a="127550160"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.149.208])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2016 15:10:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 10:10:52 +1200
Message-ID: <1989845.BISI2eGfos@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <10c9f0e4d8316f79212cb3d346e6ff5218edc928.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
	<10c9f0e4d8316f79212cb3d346e6ff5218edc928.1466683248.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/10] classes/populate_sdk_ext: eliminate double execution on install
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
X-List-Received-Date: Thu, 23 Jun 2016 22:10:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 24 Jun 2016 00:07:03 Paul Eggleton wrote:
> One result of this change is that you get the errors printed on the
> console during normal output rather than this going to the
> preparing_build_system.log file first. In OE-Core revision
> 227d2cbf9e0b8c35fa6644e3d72e0699db9607fa, we changed to always print the
> contents of preparing_build_system.log on failure, but now at least the
> error contents of that log is duplicated. Besides, I intentionally
> didn't print out the contents of that log during normal usage because
> it's quite verbose - the bug that we were attempting to fix was about
> not getting this information when seeing failures in the automated
> tests, thus I've moved printing the log to the test handling code
> instead.

I just realised, this comment and the associated changes should have been 
squashed into patch 9/10 and not this one. Accordingly I have moved them there 
and pushed a new paule/startup-oe branch - ultimately the code at the end of 
the series ends up being exactly the same though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

