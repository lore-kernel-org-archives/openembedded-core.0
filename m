Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TOtHC-0008QB-KH
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 18:48:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9IGZV6a005509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2012 09:35:32 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 18 Oct 2012 09:35:31 -0700
Message-ID: <50802FC0.7060803@windriver.com>
Date: Thu, 18 Oct 2012 12:35:12 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1350571171.git.bruce.ashfield@windriver.com>
	<7b8c12ae454f69996f935aef35cccc6d352b0964.1350571171.git.bruce.ashfield@windriver.com>
	<1350573146.2520.2.camel@ted>
In-Reply-To: <1350573146.2520.2.camel@ted>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel.bbclass: remove explicit version.h target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 16:48:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-10-18 11:12 AM, Richard Purdie wrote:
> On Thu, 2012-10-18 at 10:47 -0400, Bruce Ashfield wrote:
>> The compilation routine for the kernel has an explicit call to
>> build version.h, which works fine for most kernels, but the
>> location of it has recently changes.
>>
>> commit d183e6f5 [UAPI: Move linux/version.h]
>> commit 10b63956 [UAPI: Plumb the UAPI Kbuilds into the user
>>                   header installation and checking]
>>
>> moves the file to include/generated/linux/version.h and then to
>> include/generated/uapi/linux/version.h.
>>
>> As a result kernel builds of 3.7 or bisection builds of intermediate
>> kernel commits will fail with:
>>
>>    make[2]: *** No rule to make target `include/linux/version.h'.  Stop.
>>
>> Making the explicit version.h build conditional on the version, or
>> via a file test would fix the problem, but it introduces some complexity
>> to the build.
>>
>> Even without an explicit call to build version.h, it is always produced
>> by the kernel build, so it can simply be removed.
>>
>> Note: it isn't clear why the explicit build of version.h was originally
>> required, but the prep phases of the kernel have changed significantly,
>> so it should no longer be required.
>
> I had a look through the archives. I think this is a throwback to 2.4,
> we had to build the version.h file to figure out if we had a 2.6 or a
> 2.4 kernel, then we could do the right thing to build it.
>
> Since we don't support 2.4 anymore, this can die!

That makes my day.

Should I resend, or is the RFC patch enough ?

Bruce

>
> Cheers,
>
> Richard
>



