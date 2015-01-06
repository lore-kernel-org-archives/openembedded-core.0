Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0301B7289C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 12:15:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 04:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="437044671"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.68])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2015 04:02:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Date: Tue, 06 Jan 2015 12:15:20 +0000
Message-ID: <5285278.bn4TMnSXug@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CAPbeDCmcdS36_2anNvZpT2aO2Vft6so3MmTqsjtFo65itxyOXw@mail.gmail.com>
References: <CAPbeDCmcdS36_2anNvZpT2aO2Vft6so3MmTqsjtFo65itxyOXw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: perl installation in the SDK references $OECORE_NATIVE_SYSROOT ?
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
X-List-Received-Date: Tue, 06 Jan 2015 12:15:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jacob,

On Sunday 07 December 2014 16:07:44 Jacob Kroon wrote:
> Like the topic says, I grepped for "OECORE" in the native sysroot of my SDK
> installation, and the only hit I got was this:
> 
> usr/bin/perl:export
> PERL5LIB=$PERL5LIB:$OECORE_NATIVE_SYSROOT//usr/lib/perl:$OECORE_NATIVE_SYSRO
> OT//usr/lib/perl/5.20.0
> 
> I'm wondering if this reference is intentional, or if its something that
> should have been sed:ed out during sdk installation ?

I believe this variable is set by the environment setup script, which we 
expect to be run prior to using the SDK, so yes I believe this is intentional.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

