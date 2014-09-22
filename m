Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89B0360144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 01:18:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8M1Is8e022005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Sep 2014 18:18:55 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 21 Sep 2014 18:18:54 -0700
Message-ID: <541F78FC.20204@windriver.com>
Date: Mon, 22 Sep 2014 09:18:52 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Randy MacLeod
	<randy.macleod@windriver.com>
References: <CAKuL1XT+=AYT_LVveVWOO2qqoiLwCbi6fP0j_b+xq3aMN7jdSQ@mail.gmail.com>
	<CAJTo0LZZQMBBKRcxpfbOMC2KUWw5ffp=RdBOyymi-wfaq2UL3g@mail.gmail.com>
	<541C389C.90202@windriver.com>
	<CAJTo0LaGKTk=ubSRrv5wsW2eN9qxMOQsB2sKXuRXJUBujym=-g@mail.gmail.com>
In-Reply-To: <CAJTo0LaGKTk=ubSRrv5wsW2eN9qxMOQsB2sKXuRXJUBujym=-g@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: harsh jain <harshjain32@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipe file of Python 2.7.4 of later version
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
X-List-Received-Date: Mon, 22 Sep 2014 01:18:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月19日 22:14, Burton, Ross wrote:
> On 19 September 2014 15:07, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> Also Kai (CCed) is going to maintain an aarch64 branch on:
>>    http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-contrib
>> Kai, let us know when your branch is available; hopefully that
>> will be early next week.
>>
>> This branch will be continually rebased on master over the next
>> month or so and then merged to master after 1.7 is branched.
>> Patches welcome. They should be submitted here on the oe-core
>> list with an aarch64 tag in the subject line and CCing Kai please.
> Great news, thanks Randy and Kai.
>
> (did you mean poky-contrib instead of linux-yocto-contrib?)

I put the git repository at:

   git://git.pokylinux.org/poky-contrib kangkai/qemuarm64
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64


It is ok to build world except 2 known issues.  One depends on valid 
linux-yocto configs,
the other one is libunwind issue which should exclude from world for 
aarch64. And some
patches from Joe Slater are needed too. Joe has sent them to oe-core. If 
not merged, I'll
stage these patches too.

For the kernel support, Zhe has sent the patch to linux-yocto to support 
aarch64. Bruce knows this work.

--Kai

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


