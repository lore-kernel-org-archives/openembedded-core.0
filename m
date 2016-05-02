Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 95D2F600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 10:05:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2016 03:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,566,1455004800"; d="scan'208";a="970692010"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2016 03:05:42 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1461761088-15117-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAMKF1spLRX=XrS+Kf8GeC=XufwtTPxQJ-oeEQHH1ay2sOZb4Wg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5727269A.30405@linux.intel.com>
Date: Mon, 2 May 2016 13:06:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spLRX=XrS+Kf8GeC=XufwtTPxQJ-oeEQHH1ay2sOZb4Wg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-powerpc64.inc: disable the use of qemu usermode on ppc64
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
X-List-Received-Date: Mon, 02 May 2016 10:05:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2016 11:34 PM, Khem Raj wrote:
> should we replace qemu-ppc with qemu-ppc64 instead of disabling it

qemu-ppc64 is already used on 64 bit powerpc, the problem is that it 
always crashes.

Alex


