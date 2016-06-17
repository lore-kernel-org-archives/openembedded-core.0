Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB83731D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:49:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 17 Jun 2016 12:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,485,1459839600"; d="scan'208";a="830427183"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 17 Jun 2016 12:49:15 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJ86T=UitAFS4sBsTNEbYMvmqHhBOhCX_T_mVeM1yhZiNEVrkA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bc8119e9-5854-9ea7-408b-43e435fc32d3@linux.intel.com>
Date: Fri, 17 Jun 2016 22:49:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UitAFS4sBsTNEbYMvmqHhBOhCX_T_mVeM1yhZiNEVrkA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] security_flags.inc: add SECURITY_NO_PIE_CFLAGS to libgcc and gcc-sanitizers
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
X-List-Received-Date: Fri, 17 Jun 2016 19:49:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2016 05:56 AM, Andre McCurdy wrote:
> On Thu, Jun 16, 2016 at 3:59 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> These recipes no longer seem to need full exclusion from security hardening.
>
> Did you also confirm that for gcc 4.9 and 5.3?


I just did; they build with both.


Alex


