Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5C360116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 21:51:45 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 14:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,388,1503385200"; d="scan'208";a="163818817"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.138])
	([10.219.128.138])
	by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2017 14:51:46 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1507756545-30087-1-git-send-email-jose.a.lamego@linux.intel.com>
	<CAJTo0LaW02YE1dEP+duJPL2g2TprCiNYyNqdPDQ7XiA=b5rdVQ@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <841551c8-a979-e1b5-9b2c-5b4edcc2afe9@linux.intel.com>
Date: Mon, 16 Oct 2017 16:51:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaW02YE1dEP+duJPL2g2TprCiNYyNqdPDQ7XiA=b5rdVQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-numpy: upgrade to 1.13.3
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
X-List-Received-Date: Mon, 16 Oct 2017 21:51:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/16/2017 04:45 PM, Burton, Ross wrote:
> On 11 October 2017 at 22:15, Jose Lamego <jose.a.lamego@linux.intel.com>
> wrote:
>
>> -SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
>> -SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf
>> 8d4c2525379900f9cb478cc613a1e7cd93"
>> +SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
>> +SRC_URI[sha256sum] = "4c6b4eef790528bebb7ec9590d74cc
>> 193868940fe68e4109a91c196df"
>>
> ERROR: python3-numpy-1.13.3-r0 do_fetch: Fetcher failure for URL: '
> https://github.com/numpy/numpy/releases/download/v1.13.3/numpy-1.13.3.tar.gz'.
> Checksum mismatch!
> File: '/home/ross/Yocto/downloads/numpy-1.13.3.tar.gz' has sha256 checksum
> 4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094 when
> 4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df was expected
> If this change is expected (e.g. you have upgraded to a new version without
> updating the checksums) then you can use these lines within the recipe:
> SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
> SRC_URI[sha256sum] =
> "4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094"
>
> Looks like the copy/paste for the checksum was truncated, no idea how this
> built!
>
> I've fixed locally and am build testing now.

I'm pretty sure this was my mistake. Thanks

>
> Ross
>

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


