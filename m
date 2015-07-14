Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B45D565C98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 05:46:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6E5kkjj029870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jul 2015 22:46:47 -0700 (PDT)
Received: from [128.224.163.132] (128.224.163.132) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Mon, 13 Jul 2015 22:46:45 -0700
Message-ID: <55A4A2D8.9040102@windriver.com>
Date: Tue, 14 Jul 2015 13:49:12 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <1436767810-20932-1-git-send-email-xiao.zhang@windriver.com>	<CABcZANnrGkZLwZC+9qoqQJtCMcxd6z4pcSS5d2=WsnFicqpOaQ@mail.gmail.com>	<55A46390.2090904@windriver.com>	<CABcZANnYq6cpB8JV-Rx2QoK1AnveSUjc6JN5aerVNPN+w5yprg@mail.gmail.com>
	<55A46F99.1080606@windriver.com> <55A47DFD.9080902@windriver.com>
In-Reply-To: <55A47DFD.9080902@windriver.com>
X-Originating-IP: [128.224.163.132]
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] logrotate: move binary logrotate back to /usr/sbin
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
X-List-Received-Date: Tue, 14 Jul 2015 05:46:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月14日 11:11, Robert Yang wrote:
>
>
> On 07/14/2015 10:10 AM, zhangxiao wrote:
>> On 2015年07月14日 09:47, Christopher Larson wrote:
>>>
>>> On Mon, Jul 13, 2015 at 6:19 PM, zhangxiao <xiao.zhang@windriver.com
>>> <mailto:xiao.zhang@windriver.com>> wrote:
>>>
>>>     On 2015年07月13日 22:28, Christopher Larson wrote:
>>>
>>>
>>>         On Sun, Jul 12, 2015 at 11:10 PM, Zhang Xiao
>>>         <xiao.zhang@windriver.com <mailto:xiao.zhang@windriver.com>
>>>         <mailto:xiao.zhang@windriver.com
>>>         <mailto:xiao.zhang@windriver.com>>> wrote:
>>>
>>>              Upstream-Status: pending
>>>
>>>              Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com
>>>         <mailto:xiao.zhang@windriver.com>
>>>              <mailto:xiao.zhang@windriver.com
>>>         <mailto:xiao.zhang@windriver.com>>>
>>>
>>>
>>>         There’s no info on why this is being done, only what’s being
>>>         done, in
>>>         this commit message.
>>>
>>>
>>>     Binary logrotate should be installed in /usr/sbin and int fact, at
>>>     the very
>>>     beginning, it was there. While with commit a46d3646a3e1781be44:
>>>     ...
>>>     logrotate: obey our flags
>>>
>>>     Needed to quiet GNU_HASH warnings, and some minor fixes.
>>>     ...
>>>
>>>     Part of its modification as below:
>>>     ...
>>>     -    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
>>>     +    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
>>>     BINDIR=${bindir}
>>>     ...
>>>     moves it to /usr/bin. It is not correct, so move it back to
>>>     /usr/sbin with ${sbindir}.
>>>
>>>
>>> That’s entirely reasonable, but at least some reference to that needs to
>>> be in the commit message, not just email discussion :)
>>
>> So, How about:
>>
>> Commit a46d36 moves logrotate to /usr/bin by mistake. Fix it.
>
> I think that you can your last email as the commit message:
>
> Binary logrotate should be installed in /usr/sbin, at the very
> beginning, it was there. While with commit a46d3646a3e1781be44:
> ...
> logrotate: obey our flags
>
> Needed to quiet GNU_HASH warnings, and some minor fixes.
> ...
>
> Part of its modification as below:
> ...
> -    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
> +    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
> BINDIR=${bindir}
> ...
> moves it to /usr/bin. It is not correct, so move it back to
> /usr/sbin with ${sbindir}.
>

Get it, I will send a new patch.

Thanks
Xiao

> // Robert
>
>>
>> Thanks
>> Xiao
>>> --
>>> Christopher Larson
>>> clarson at kergoth dot com
>>> Founder - BitBake, OpenEmbedded, OpenZaurus
>>> Maintainer - Tslib
>>> Senior Software Engineer, Mentor Graphics
>
>

