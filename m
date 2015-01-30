Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64C3C60132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 07:56:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0U7ucW2025121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Jan 2015 23:56:38 -0800 (PST)
Received: from yu.wr (128.224.163.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 29 Jan 2015 23:56:37 -0800
Message-ID: <54CB3932.2090308@windriver.com>
Date: Fri, 30 Jan 2015 15:56:34 +0800
From: Pengyu Ma <pengyu.ma@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
	<CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
	<CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
	<54CAE393.2020605@windriver.com>
	<CAP71Wjxk0XFr5L6YL55GBUeGkx0q+dyh1fw245qi7O7j7gJE9w@mail.gmail.com>
In-Reply-To: <CAP71Wjxk0XFr5L6YL55GBUeGkx0q+dyh1fw245qi7O7j7gJE9w@mail.gmail.com>
X-Originating-IP: [128.224.163.160]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Fri, 30 Jan 2015 07:56:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/30/2015 03:51 PM, Nicolas Dechesne wrote:
> On Fri, Jan 30, 2015 at 2:51 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
>> mesa_git bb will keep sync the latest version 10.4.3, that's why we keep
>> both _git and 10.4.0.
>> Now all all the version of xorg-video-intel, libdrm, and xserver-xorg are
>> the same with Intel Graphic stack 2014 Q4.
>> So mesa_10.4.0 will make a stable and verified solution here,
>> and _git version will make the latest version here.
>>
> i think you missed the point. you cannot justify the need for 10.4.0
> because it is the 'prefered' Intel version. the policy is that we
> provide in OE-core the most recent stable releases of upstream
> components. when/if I need a specific version of mesa (or anything
> else) for my project, i have a recipe in my own project layer, but
> OE-core is agnostic to that.
>
> now, if a specific version of mesa is known to be broken, upstream, or
> in very special circumstances, we might want to not use it... but that
> isn't the case here, especially since both Ross and I are asking you
> to upgrade to 10.4.3..
>
> if you don't submit 10.4.3, someone else will anyways. and actually i
> have submitted a libdrm upgrade yesterday which is likely to be merged
> soon..
Understood, but there are 2 version mesa_xxx.bb and mesa_git.bb.
Is there any reason why keep two versions?
If I updated mesa_xxx.bb to 10.4.3, it will be the same as mesa_git.bb.

Regards,
Pengyu
>
> cheers
> nicolas


