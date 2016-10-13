Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D08076AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:25:44 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 12 Oct 2016 23:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,338,1473145200"; d="scan'208";a="19167142"
Received: from ychiu-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.183.245])
	by orsmga005.jf.intel.com with ESMTP; 12 Oct 2016 23:25:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2016 19:25:40 +1300
Message-ID: <2376202.r0WsJfyIoP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.6-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1sp8heZDKvpAmYW+MQnQzdNS71Jaus8s-5VKi2DJ9prTiw@mail.gmail.com>
References: <20161012132615.GC2923@jama>
	<3373280.EktDFKHOVZ@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sp8heZDKvpAmYW+MQnQzdNS71Jaus8s-5VKi2DJ9prTiw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK_OLDEST_KERNEL vs OLDEST_KERNEL
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
X-List-Received-Date: Thu, 13 Oct 2016 06:25:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 13 Oct 2016 08:14:07 Khem Raj wrote:
> On Oct 13, 2016 5:23 AM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
> wrote:
> > Thinking about it - even if that were fixed, would setting it to 2.6.32
> > actually work on master? We are now using glibc 2.24 and that requires a
> > minimum kernel version of 3.2.0.
> 
> For x86/x86_64  2.6.32 would still work which is the most common arch for
> sdk host.

Ah, I see - that exception was not mentioned in the commit message. I see it 
is in the glibc release notes though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

