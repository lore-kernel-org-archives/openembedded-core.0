Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFD160EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 02:01:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H21i4K022172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2013 19:01:44 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 16 Oct 2013 19:01:44 -0700
Message-ID: <525F450B.4030908@windriver.com>
Date: Thu, 17 Oct 2013 10:01:47 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com> <1381925550.29912.463.camel@ted>
In-Reply-To: <1381925550.29912.463.camel@ted>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Thu, 17 Oct 2013 02:01:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/2013 08:12 PM, Richard Purdie wrote:
> On Wed, 2013-10-16 at 14:34 +0800, Rongqing Li wrote:
>>
>> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
>>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>
>>>> [YOCTO #5287]
>>>>
>>>> tar failed and reported that file changed as we read it, now
>>>> we workaround it
>>>>
>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>
>>> You must be kidding right?! loop 5 times?!? why not fix the root cause
>>> of the change?
>>>
>>
>> Sorry, I do not know the root cause, and I see many people spent
>> lots of efforts to investigate, but do not find the root cause,
>> sometime we suspect it is the building servers kernel issue,
>> if it is true, we can not fix the building servers, we only
>> workaround the code.
>
> This workaround is not going into master, its horrid. Do we know which
> versions of the kernel on the server have the issue. I'd much rather
> tell people to fix their broken filesystems for example and refuse to
> run on them.
>

I saw it happened on CentOS 5.9 and RedHat 5.5, and We deployed lots
of them, it is hard to replace them.

The bug did not happen everytime, only intermittently, this workaround
is ugly, but it is better than fixing the servers, or declaring them
as unsupported server.


-Roy



> Cheers,
>
> Richard
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

