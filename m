Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 52E1B60125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:37:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Sep 2015 04:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,552,1437462000"; d="scan'208";a="807340253"
Received: from thomasda-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.18])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2015 04:37:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Date: Fri, 18 Sep 2015 12:37:50 +0100
Message-ID: <6871706.tbebiTIoD4@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0Lai9oeh3Kvg8wAB9OPFOBG4WaBYqnGRidv-zt9bNrGqgA@mail.gmail.com>
References: <1442522311-15326-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAJTo0Lai9oeh3Kvg8wAB9OPFOBG4WaBYqnGRidv-zt9bNrGqgA@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/buildoptions: pexpect not a builtin module
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
X-List-Received-Date: Fri, 18 Sep 2015 11:37:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 18 September 2015 12:05:35 Burton, Ross wrote:
> On 17 September 2015 at 21:38, Benjamin Esquivel <
> 
> benjamin.esquivel@linux.intel.com> wrote:
> > put the import of pexpect around a try statement so it can tell you
> > why it failed to import when in a system that has the module unreachable
> 
> As the failing import is throwing an exception, can't the calling code
> display the exception correctly?

If we're going to trap this I think we should be displaying something like 
"Please install pexpect (python-pexpect)".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

