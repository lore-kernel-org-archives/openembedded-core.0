Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A291E71DDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 06:44:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 11 Oct 2017 23:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,364,1503385200"; d="scan'208";a="1229902394"
Received: from summit.tm.intel.com (HELO [10.237.55.126]) ([10.237.55.126])
	by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2017 23:44:52 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20171010122706.6975-1-mikko.ylinen@linux.intel.com>
	<CAP9ODKp7DA_jTo0GnM6Z+Zos=tGnvvAzPg0E29U1Vkdrs4ZTZA@mail.gmail.com>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <b745d962-0288-6896-78b4-461360f98d4b@linux.intel.com>
Date: Thu, 12 Oct 2017 09:44:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp7DA_jTo0GnM6Z+Zos=tGnvvAzPg0E29U1Vkdrs4ZTZA@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: make i.MX SDMA split complete
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
X-List-Received-Date: Thu, 12 Oct 2017 06:44:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,


On 11/10/17 17:29, Otavio Salvador wrote:
> Hello Mikko,
>
> On Tue, Oct 10, 2017 at 9:27 AM, Mikko Ylinen
> <mikko.ylinen@linux.intel.com> wrote:
>> The commit to split i.MX SDMA firmware blobs in their
>> own packages was not complete and results in a failure
>> when trying to install full linux-firmware:
>>
>>   * Solver encountered 1 problem(s):
>>   * Problem 1/1:
>>   *   - nothing provides linux-firmware-imx-sdma-license needed
>>   *     by linux-firmware-1:0.0+git0+a61ac5cf83-r0.all
>>   *
>>   * Solution 1:
>>   *   - do not ask to install a package providing linux-firmware
>>
>> Make the split complete by installing the license in
>> ${PN}-imx-sdma-license and have the blob packages depend on it.
>>
>> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> First, thanks for fixing my mistake ... I will try to find what I did
> wrong here as I did test it.
>
>

No problem. I'm guessing you did not install linux-firmware (perhaps
just the newly created packages only). The recipe builds fine but fails
to install resulting .ipk/.rpm.

-- Mikko

