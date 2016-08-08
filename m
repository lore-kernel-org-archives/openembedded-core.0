Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABBB77180
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:13:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2016 09:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="745853021"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2016 09:13:29 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1470665264-16321-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LZ5FtoL7__MRMTeSJ59E3_AD=9U5C99W8uV1bppDambWg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <273f31f6-c70a-d796-45f6-3dbf9fff4dc0@linux.intel.com>
Date: Mon, 8 Aug 2016 19:12:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ5FtoL7__MRMTeSJ59E3_AD=9U5C99W8uV1bppDambWg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Mon, 08 Aug 2016 16:13:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2016 06:58 PM, Burton, Ross wrote:
>     -SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
>
>
> Did you test this?
>
> For intel-corei7-64 with hardening enabled it fails like this:

The world build with this patch was tested several weeks ago, for a i686 
target. I'll test again.

Alex


