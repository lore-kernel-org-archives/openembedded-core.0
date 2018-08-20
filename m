Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37A79790E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 13:42:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7KDgfLh017725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2018 06:42:41 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 20 Aug 2018 06:42:40 -0700
To: <richard.purdie@linuxfoundation.org>
References: <1534647044-14420-1-git-send-email-bruce.ashfield@windriver.com>
	<411c449a525d073ac6165ed59532e314d08388dd.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5d8c5237-ec3c-04d8-9716-2a46baca8db2@windriver.com>
Date: Mon, 20 Aug 2018 09:42:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <411c449a525d073ac6165ed59532e314d08388dd.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Mon, 20 Aug 2018 13:42:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/19/2018 11:36 AM, richard.purdie@linuxfoundation.org wrote:
> On Sat, 2018-08-18 at 22:50 -0400, Bruce Ashfield wrote:
>> [...]
>>
>> v5:
>>    - added failure catch for x86 purgatory files which changed in 4.18
>>      and hence are not universal across versions
>>    - added explicity bison and flex rdepends for mips64 prepare phase
>>    - added mips64 files required for scripts/prepare phase
>>    - added files required for missing syscall support
> 
> Tests passed so I've merged it, thanks for persevering, we finally got
> there! :)

Excellent! I was hoping v6 wasn't going to be required :D

I'm sure that more corner cases will start popping up as it
gets exercised in the tree.

When they do pop up, I can handle them (via bugs, or whatever),
since I'm pretty familiar with this right now.

Onto 4.18, which I expect to have to you by mid-week.

Cheers,

Bruce

> 
> Cheers,
> 
> Richard
> 


