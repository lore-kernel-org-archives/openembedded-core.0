Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE2073CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:17:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2016 11:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,484,1459839600"; d="scan'208";a="124110876"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2016 11:16:49 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1466074764-14109-4-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJ86T=WKTAe3imuizQPWAmnZaMq5LvL-+2VqpaFC8GziS=gXxw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <849e6e50-bed5-c8bc-adef-4d39c5ff8b9f@linux.intel.com>
Date: Fri, 17 Jun 2016 21:16:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WKTAe3imuizQPWAmnZaMq5LvL-+2VqpaFC8GziS=gXxw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] security_flags.inc: add epiphany to SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2016 18:17:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2016 05:39 AM, Andre McCurdy wrote:
> Typically these warnings come from assembler and can't be fixed via
> CFLAGS. If this one _can_ be fixed via CFLAGS then it suggests a bug
> in the Epiphany build somewhere (e.g. reusing an object file intended
> for a static lib in an .so). Maybe it's better to track that down and
> fix properly instead of working around it by globally adding -fPIC to
> CFLAGS?

Thanks; I dropped the patch.

Alex


