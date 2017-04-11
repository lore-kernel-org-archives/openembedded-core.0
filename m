Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE2C177CE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:12:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3BIC55Z010254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Apr 2017 11:12:05 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 11:12:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
	<97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
	<1491931143.12091.34.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <3b1ff3b4-b992-5500-d29d-57580a8a17f3@windriver.com>
Date: Tue, 11 Apr 2017 13:12:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491931143.12091.34.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 18:12:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 4/11/17 12:19 PM, Richard Purdie wrote:
> On Tue, 2017-04-11 at 10:16 -0500, Mark Hatle wrote:
>> On 4/11/17 9:56 AM, Patrick Ohly wrote:
>>>
>>> gdb-cross used to be specific to the tune flags, but isn't
>>> anymore. Therefore it is enough to use TARGET_SYS instead of
>>> TUNE_PKGARCH to create a unique path.
>> Are you sure about this.  On non-intel architectures, it used to be
>> VERY common
>> that the specific instruction set for a process was programmed into
>> gdb.
>>
>> Sometimes the user could (after loading gdb) change the instructions,
>> but this
>> was an aweful user experience.
>>
>> Good example of this would be Power, e500, etc.  The instruction sets
>> are not
>> actually compatible with each other, so GDB needs to know the
>> specific
>> instruction in order to work.
> 
> This may or may not be an issue with gdb however I'd note that we only
> build one gdb-cross regardless, we don't configure it with any target
> tune specifics and the gdb we build for the sdk is built similarly. So
> if it is an issue, its not one we've had reported to us and we don't
> configure gdb in any target specific way so this patch should be
> safe...

As long as the set processor is docuemnted (gdb docs, not OE/YP) and works.  I'm
fine with this explanation.

--Mark

> Cheers,
> 
> Richard
> 


