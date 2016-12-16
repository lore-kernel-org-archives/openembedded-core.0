Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4459C71C9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 12:28:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBGCSANh014406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Dec 2016 04:28:10 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Dec 2016 04:28:09 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1481856470.git.dengke.du@windriver.com>
	<46f2559616e1f79721500cb2ada13657aa67e225.1481856470.git.dengke.du@windriver.com>
	<1481887924.9843.19.camel@linuxfoundation.org>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <5805f2f4-8a79-d80b-87c2-e3844dd3bf9d@windriver.com>
Date: Fri, 16 Dec 2016 20:28:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481887924.9843.19.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] Revert "subversion: fix "svnadmin create" fail on x86"
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
X-List-Received-Date: Fri, 16 Dec 2016 12:28:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard

Yes, I have a root fix for the subversion failed on x86 and multilib. I 
will send V2 explain it.

// Dengke


On 2016年12月16日 19:32, Richard Purdie wrote:
> On Fri, 2016-12-16 at 10:49 +0800, Dengke Du wrote:
>> This reverts commit cfe6f3e251240c9d9a70354be0501600357f0b87.
> You need to say why.
>
> I'm guessing you've a better fix in the following patch but it is a
> guess and I shouldn't need to guess.
>
> Cheers,
>
> Richard
>


