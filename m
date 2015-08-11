Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D954C767EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:10:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 08:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,653,1432623600"; d="scan'208";a="746448333"
Received: from aakula-mobl2.amr.corp.intel.com (HELO [10.254.73.1])
	([10.254.73.1])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2015 08:09:03 -0700
Message-ID: <55CA101E.2000002@linux.intel.com>
Date: Tue, 11 Aug 2015 10:09:18 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1439305030-5911-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LY_LepwMxG647pCOVWeFq=HywMmEL94b81z=5R=7Afz1A@mail.gmail.com>
In-Reply-To: <CAJTo0LY_LepwMxG647pCOVWeFq=HywMmEL94b81z=5R=7Afz1A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] mc: Fix QA warning RDEPENDS of util-linux-libmount
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
X-List-Received-Date: Tue, 11 Aug 2015 15:10:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The QA warnings saya "mc rdepends on util-linux-libmount",

May be the QA message need to be fixed.

     alimon

On 11/08/15 09:59, Burton, Ross wrote:
> On 11 August 2015 at 15:57, Aníbal Limón <anibal.limon@linux.intel.com>
> wrote:
>
>> +RDEPENDS_${PN} = "ncurses-terminfo util-linux"
>>
> DEPENDS, no RDEPENDS.
>
> Ross
>


