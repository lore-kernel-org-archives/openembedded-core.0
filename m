Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9D2179015
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O9BPmB027018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 02:11:25 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 24 Aug 2018 02:11:24 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1535094031-35363-1-git-send-email-hongxu.jia@windriver.com>
	<b6ef0030-8c15-7dee-e993-681b2aced85f@windriver.com>
	<8ab2dfe5f21ed72bbf4da87126e6172b6d413ee2.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d0743f1d-b7e2-10a5-7521-88ab3eda7bf3@windriver.com>
Date: Fri, 24 Aug 2018 17:11:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8ab2dfe5f21ed72bbf4da87126e6172b6d413ee2.camel@linuxfoundation.org>
Subject: Re: [PATCH] package.bbclass: only one hardlink of separated debug info file in each directory
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
X-List-Received-Date: Fri, 24 Aug 2018 09:11:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月24日 16:39, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-08-24 at 15:16 +0800, Hongxu Jia wrote:
>> Hi RP,
>>
>> With this fix, we could not use yesterday's workaround fix
>> `git: create symlink rather than hardlink between bin/ and libexec/',
>>
>> But it is no harm for us, btw, Ubuntu use symlink in git , and Fedora
>> use hardlink in git
> Thanks, I was thinking there probably was a problem in package.bbclass
> which your change to git was working around and you've now fixed it!
>
> I think I'd prefer to leave git using hardlinks so that we can
> potentially spot problems like this in future. There are other recipes
> that use hardlinks where the breakage may be more subtle (e.g.
> e2fsprogs) so having some recipes using hardlinks is good.
>
> I wondered if you'd fancy creating a new additional oqea test for this
> debug hardlink issue so that we'd detect any problems in future? The
> test I added was:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=318595754b66e8e4f3db1bce1ac086a2409e2eca
>
> and with the addition of a few directories, it could probably be extended?

Got it, I am very pleasure to do it, I will extend the case with 
multiple dirs

//Hongxu

> Cheers,
>
> Richard
>
>
>
>


