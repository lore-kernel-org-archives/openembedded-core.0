Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3079606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 14:42:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 17 Aug 2015 07:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,695,1432623600"; d="scan'208";a="785334683"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.46])
	([10.219.5.46])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2015 07:42:31 -0700
Message-ID: <55D1F315.8010308@linux.intel.com>
Date: Mon, 17 Aug 2015 09:43:33 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
	<CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
	<CAJTo0LaTHTHis8e3X+5STP8VDsJ0z8mcNLGjJQS9RFLGmZNDSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaTHTHis8e3X+5STP8VDsJ0z8mcNLGjJQS9RFLGmZNDSQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Mon, 17 Aug 2015 14:42:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ross/Raj, thanks for your comments. I will send a v2 patches, this time 
with the correct checks (invalid characters are those non-UTF8) and 
patch titles.

On 08/13/2015 02:34 PM, Burton, Ross wrote:
> On 13 August 2015 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
>
>> but check it still fine isnt it.
>>
>
> Of course, gracefully handling encoding failures is still sensible.
>
> Ross
>

