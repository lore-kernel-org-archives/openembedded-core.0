Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 03893729C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:40:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2015 08:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508212065"
Received: from unknown (HELO localhost.localdomain) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 08:35:17 -0800
Message-ID: <54AC1017.3050907@linux.intel.com>
Date: Tue, 06 Jan 2015 08:40:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
	<7bfbcb4ca6a19b4377fa223f10c69309a8a009b7.1420558836.git.sgw@linux.intel.com>
	<CAJTo0LYq8Bm7opRJwq0yEuwpuGYPZcxnW_baKbeD+koQbw1taA@mail.gmail.com>
In-Reply-To: <CAJTo0LYq8Bm7opRJwq0yEuwpuGYPZcxnW_baKbeD+koQbw1taA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/12] gnu-efi: Upgrade to 3.0w
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
X-List-Received-Date: Tue, 06 Jan 2015 16:41:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2015 08:37 AM, Burton, Ross wrote:
> On 6 January 2015 at 15:42, Saul Wold <sgw@linux.intel.com> wrote:
>
>> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
>> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0w.bb
>> @@ -8,6 +8,7 @@ SRC_URI = "
>> http://downloads.sourceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz \
>>              file://parallel-make.patch \
>>              file://parallel-make-archives.patch \
>>             "
>> +
>>   SRC_URI[md5sum] = "d15d3c700e79a1e2938544d73edc572d"
>>   SRC_URI[sha256sum] =
>> "3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e"
>>
>
> No change to the checksums, presumably they didn't brute-force a sha256sum
> attack to do that. ;)
>

Looking at this, it would probably have helped if I actually updated the 
tarball, Sorry for the noise with this gnu-efi non-update!

Sau!

> Ross
>

