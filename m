Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Ubexl-0001gD-CE
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 00:41:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4CMNfJ6009583
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2013 15:23:41 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.18.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sun, 12 May 2013 15:23:40 -0700
Message-ID: <5190166A.5050000@windriver.com>
Date: Sun, 12 May 2013 18:23:38 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
	<518FD2F2.5070105@linux.intel.com>
	<020E3790-121B-49E9-87E3-55ACA9095B10@gmail.com>
In-Reply-To: <020E3790-121B-49E9-87E3-55ACA9095B10@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Sun, 12 May 2013 22:41:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-12 5:49 PM, Khem Raj wrote:
>
> On May 12, 2013, at 10:35 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 05/12/2013 09:29 AM, Khem Raj wrote:
>>> Hi Saul
>>>
>>> There is one serious problem that I ran into was that qemuarm 3.8 kernel segfaulted
>>> is it working for you ?
>>>
>> Nope your right there does appear to be a problem with ARM, I thought we where have sanity test issues again, I just completed a build and verified that I get a Kernel paninc with 3.8 Kernel and 4.8 GCC.
>>
>> Not ready yet!
>>
>> Khem, are you looking into it?  I have CC'ed Bruce for the kernel also.
>
> haven't looked into the problem in detail. Its one of those either a problem in gcc or gcc uncovering a latent bug in kernel.

I'll get myself set up and do a build on Monday, see if anything obvious
pops up (i.e. start with the latest and see if it works, then bisect
back). I'm already poking at mips64, so I can do this in parallel.

Bruce

>
>



