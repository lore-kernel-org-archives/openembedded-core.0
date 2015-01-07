Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E59B65C66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 21:20:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07LKRm7014409
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 7 Jan 2015 13:20:27 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 13:20:26 -0800
Message-ID: <54ADA30C.4090804@windriver.com>
Date: Wed, 7 Jan 2015 16:20:12 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Darren Hart
	<dvhart@linux.intel.com>
References: <1420633589.25779.69.camel@linuxfoundation.org>	
	<54AD331F.5060009@windriver.com>
	<D0D2B965.B6633%darren.hart@intel.com>
	<1420665363.25779.73.camel@linuxfoundation.org>
In-Reply-To: <1420665363.25779.73.camel@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Further kernel build process changes?
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
X-List-Received-Date: Wed, 07 Jan 2015 21:20:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 15-01-07 04:16 PM, Richard Purdie wrote:
> On Wed, 2015-01-07 at 10:33 -0800, Darren Hart wrote:
>> On 1/7/15, 5:22 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:
>>> On 2015-01-07 7:26 AM, Richard Purdie wrote:
>>>>
>>>> External module builds do work in this configuration *if* you pass in
>>>> the correct options e.g.:
>>>>
>>>> make -C work-shared/MACHINE/kernel-source
>>>> O=work-shared/MACHINE/kernel-build M=${S}
>>>>
>>>> I've put together a quick proof of concept of this below.

<snip>

>>>>    KERNEL_OBJECT_SUFFIX = ".ko"
>>>>
>>>>    # kernel modules are generally machine specific
>>>>    PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>
>>>> +do_configure[depends] += "virtual/kernel:do_install"
>>
>>
>> I¹m not clear on the separation of do_shared_workdir and do_install now...
>
> See above, this probably needs to change.
>
> The patch was really a test to see how badly a build would explode with
> separate source and builddir and whether the kernel build system can
> cope with three separate locations (source, build objects, module). From
> that perspective it passed in that I could build oprofile, perf and some
> kernel modules. From here we need a step back and to go through and do
> it "properly".

Agreed. I've queued all the known patches, and have proven that my
builds work with this applied with minor adaptations.

I've got a first pass through with the consolidation and some other
scribbles notes. I'll generate a topic branch and send it out when
it looks reasonably sane (but not complete .. since we don't want to
sit on large private changes).

Cheers,

Bruce

>
> Cheers,
>
> Richard
>


