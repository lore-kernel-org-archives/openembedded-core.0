Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4EF755F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 06:17:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t516HRIs017502
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 May 2015 23:17:27 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 31 May 2015 23:17:26 -0700
Message-ID: <556BF8F5.5030906@windriver.com>
Date: Mon, 1 Jun 2015 14:17:25 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, Phil Blundell <pb@pbcl.net>
References: <5568AEC2.7090606@topic.nl> <1432937385.2461.36.camel@pbcl.net>
	<5569E91D.8070104@topic.nl>
In-Reply-To: <5569E91D.8070104@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: boost fails to build on MIPS
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
X-List-Received-Date: Mon, 01 Jun 2015 06:17:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/31/2015 12:45 AM, Mike Looijmans wrote:
> On 30-05-15 00:09, Phil Blundell wrote:
>> On Fri, 2015-05-29 at 20:24 +0200, Mike Looijmans wrote:
>>> On current OE master, boost fails to build, because something attempts
>>> to add "-m32" to the gcc commandline for no apparent reason.
>>>
>>> Can anyone confirm this, or am I the only MIPS user in the world?
>>
>> This is an upstream boost bug.  See the entertaining history at:
>>
>> https://github.com/boostorg/build/commit/9576ca216cae888d7efb5da97c009c245c5ba567
>
> Strange, I added this fix as a patch to bjam (which seems to be the one causing
> all the troubles), but still get the same build error, even after cleansstate
> both bjam-native and boost.
>
> Maybe some cross-compiler stupidity like that it looks at the build machine's
> arch instead of the target host's?

Hello,

I verified the following 2 patches work:

https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
https://github.com/boostorg/build/commit/9576ca216cae888d7efb5da97c009c245c5ba567

I will send a fix for boost.

// Robert


>
>
>

