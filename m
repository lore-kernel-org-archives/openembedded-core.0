Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 88B407F4B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:22:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 14:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="189737157"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga007.jf.intel.com with ESMTP; 28 Oct 2019 14:22:42 -0700
To: openembedded-core@lists.openembedded.org
References: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
	<CAJ86T=WBz6OkPcOLWH2gyH8JGnC8-d2-9=TE8ThtjeD4rE+ssg@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1853bfbf-6129-314b-0b99-9458e917d5e1@intel.com>
Date: Mon, 28 Oct 2019 21:22:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WBz6OkPcOLWH2gyH8JGnC8-d2-9=TE8ThtjeD4rE+ssg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bug fixes for makedevs.c
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
X-List-Received-Date: Mon, 28 Oct 2019 21:22:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 28/10/2019 19:11, Andre McCurdy wrote:
> On Mon, Oct 28, 2019 at 10:15 AM Frazer Leslie Clews
> <frazer.clews@codethink.co.uk> wrote:
>>
>> fixes a few bugs in some print statements and an overflow bug with usr_buf
>>
>> Frazer Leslie Clews (2):
>>    fix format strings in makedevs.c in print statements
>>    fix invalidScanfFormatWidth to prevent overflowing usr_buf
> 
> Perhaps fixing these issues would be a good opportunity to align with
> the Buildroot (ie upstream?) version instead of diverging even more.
> 
>    https://git.buildroot.net/buildroot/tree/package/makedevs/makedevs.c

Yes, this.

If we can just fetch makedevs from buildroot that's one less piece of 
code we have to look after.

Ross

