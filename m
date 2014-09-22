Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 395D16FD28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 15:27:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8MFRB7f027725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Sep 2014 08:27:11 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 22 Sep 2014 08:27:11 -0700
Message-ID: <54203FCE.3080901@windriver.com>
Date: Mon, 22 Sep 2014 11:27:10 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<2251278.GaOGmN6XgQ@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2251278.GaOGmN6XgQ@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Mon, 22 Sep 2014 15:27:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-22 11:24 AM, Paul Eggleton wrote:
> On Thursday 06 February 2014 02:05:05 Khem Raj wrote:
>> This also make a change where for kernel
>> S != B, this is done because when S = B
>> and we use O= option or set KBUILD_OUTPUT
>> to point to objectdir, kernel build system
>> ends up denoting itself dirty and asking for
>> running mrproper during later build steps
>> after do_configure but works perfectly
>> for when S != B
>>
>> Additional fixes make sure that we do not
>> assume directory paths when accessing files
>>
>> Move exporting KBUILD_OUTPUT from kernel-yocto
>> into kernel class
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> So discussion on this patch seems to have stalled - did you guys make any
> progress offline?

I have an updated patch that I've been carrying in my tree ever
since.

>
> Looking over the patch I'd guess we'd want to try to avoid cd'ing and instead
> be explicit about the path where needed.

I have some more cleanups to this effect, and will send them post
1.7.

But the reports we've been getting have been that externalsrc
builds are working for kernels, and linux-yocto without the change
in place, so I'm looking to reduce the patch footprint and re-submit.

Bruce

>
> Cheers,
> Paul
>


