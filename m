Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDB9756C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:10:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2015 08:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,672,1427785200"; d="scan'208";a="513568083"
Received: from cmbrigha-mobl1.amr.corp.intel.com (HELO [10.254.189.220])
	([10.254.189.220])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2015 08:10:24 -0700
User-Agent: Microsoft-MacOutlook/14.5.1.150515
Date: Wed, 24 Jun 2015 08:10:21 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <D1B01660.D55DF%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] tune-i586-nlp: Add new tune file to support
	Quark/X1000 CPU
References: <1435072967-10333-1-git-send-email-sgw@linux.intel.com>
	<1435075347.11489.87.camel@linuxfoundation.org>
	<D1AEE18F.D4FA6%dvhart@linux.intel.com>
	<1435079991.2483.418.camel@pbcl.net>
In-Reply-To: <1435079991.2483.418.camel@pbcl.net>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Wed, 24 Jun 2015 15:10:29 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 6/23/15, 10:19 AM, "Phil Blundell" <pb@pbcl.net> wrote:

>On Tue, 2015-06-23 at 10:17 -0700, Darren Hart wrote:
>> Hrm... The thing we need to avoid is quark machines accepting an i586
>> package in lieu of a i586-nlp package. I don't think that's a problem
>>here
>> is it? The PACKAGE_EXTRA_ARCHS makes it so the i586-nlp package can be
>> used on machines that require i586, but not vice versa - correct?
>
>No, exactly the opposite to that.

Right, duh. For some reason I was looking at this from the wrong angle
yesterday I guess.


-- 
Darren Hart
Intel Open Source Technology Center




