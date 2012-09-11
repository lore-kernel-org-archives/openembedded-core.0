Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TBPps-0008Ly-2A
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 14:45:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BCWQ4A006768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Sep 2012 05:32:26 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 11 Sep 2012 05:32:26 -0700
Message-ID: <504F2F50.6010903@windriver.com>
Date: Tue, 11 Sep 2012 08:32:16 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<20120911045038.GE2980@sakrah.homelinux.org>
	<504EC385.6060008@windriver.com>
	<20120911045557.GF2980@sakrah.homelinux.org>
	<504EC4F3.30705@windriver.com>
	<20120911051602.GA3035@sakrah.homelinux.org>
	<504EC96B.7090205@windriver.com>
	<20120911052205.GC3035@sakrah.homelinux.org>
In-Reply-To: <20120911052205.GC3035@sakrah.homelinux.org>
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
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
X-List-Received-Date: Tue, 11 Sep 2012 12:45:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-09-11 01:22 AM, Khem Raj wrote:
> On (11/09/12 01:17), Bruce Ashfield wrote:
>> On 12-09-11 1:16 AM, Khem Raj wrote:
>>> On (11/09/12 00:58), Bruce Ashfield wrote:
>>>> On 12-09-11 12:55 AM, Khem Raj wrote:
>>>>> On (11/09/12 00:52), Bruce Ashfield wrote:
>>>>>> On 12-09-11 12:50 AM, Khem Raj wrote:
>>>>>>> On (10/09/12 14:11), Bruce Ashfield wrote:
>>>>>>>> Updating to 3.4.10 which has been soaking for a bit now, as well
>>>>>>>> as picking up the following meta commits from Tom Z:
>>>>>>>
>>>>>>> would it also need bumping linux-libc-headers too ?
>>>>>>
>>>>>> There's no new interfaces in the -stable updates, so there's no reason
>>>>>> to bump. I typically elect to jump to a 3.x.0 and leave it there, but
>>>>>> we had an interim bump that I wouldn't have done .. so we sit at 3.4.3
>>>>>> at the moment (which is still fine).
>>>>>
>>>>> OK. Next question is, do stable updates get changes such that we need to
>>>>> bump the linux-libc-headers ?
>>>>
>>>> Not that I've ever seen.
>>>
>>> OK thats what I was expecting to hear
>>> so in theory if we always pin linux-libc-headers to major release we are
>>> good. say 3.4.0 and then 3.6.0 and so on we really dont need 3.4.1 or
>>> later and similarly for other versions. In this case we only bump
>>> the linux-libc-headers recipe when we add a new major kernel release
>>
>> Correct. If you check the mailing list archives, I was a bit surprised
>> to see it go to 3.4.3, but going forward, expect to only see major rev
>> bumps.
>
> yes essentually IIRC I mentioned that recipe should be called
> blah_3.4.bb and blah_3.6.bb and so on and not really blah_3.4.x etc.
> OK I am glad we are on same page boundary here :)

Agreed. We are in sync.

Bruce




