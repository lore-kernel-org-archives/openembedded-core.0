Return-Path: <mark.hatle@windriver.com>
X-Greylist: delayed 4283 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 23:00:34 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 841E460167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 23:00:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s46LnAFw010792
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 May 2014 14:49:10 -0700 (PDT)
Received: from msp-dhcp25.wrs.com (172.25.34.25) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 6 May 2014 14:49:09 -0700
Message-ID: <536958D5.2090806@windriver.com>
Date: Tue, 6 May 2014 16:49:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
	<5369533B.9010209@windriver.com> <20140506214430.GG11339@denix.org>
In-Reply-To: <20140506214430.GG11339@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 23:00:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/14, 4:44 PM, Denys Dmytriyenko wrote:
> On Tue, May 06, 2014 at 04:25:15PM -0500, Mark Hatle wrote:
>> On 5/6/14, 3:56 PM, Khem Raj wrote:
>>> On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>>> Do you know that OE toolchain is not relocatable?
>>>
>>> is that true ?
>>>
>>
>> It's the load path of the executables, they use the libc-nativesdk,
>> so they need a hard path to the correct ld.so to get started.
>
> More specifically, it's PT_INTERP section of the ELF header in every binary
> that hardcodes the full path to our own dynamic linker/loader (i.e. mentioned
> libc-nativesdk). I wish it would support the use of $ORIGIN similar to RPATH
> and RUNPATH for libraries, but I bet there are all kinds of corner cases with
> that... :)
>

$ORIGIN, RPATH and RUNPATH are all implemented by the ld.so, there is no way to 
dynamically assign the interpreter (ld.so).

--Mark

