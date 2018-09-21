Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA6A60197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:09:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8L897Nm029254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Sep 2018 01:09:07 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 21 Sep 2018 01:09:06 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
	<f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
	<983d28517b9e9015b590405bbb7f91ffc0d6aa48.camel@linuxfoundation.org>
	<009c3d50-37ee-f2e7-30f4-f9a083233ded@windriver.com>
	<a67901f5659bea6428a41bb3277b2d8e3d4e4110.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <5ec9dd0c-82e5-782f-26ca-bf274944f98d@windriver.com>
Date: Fri, 21 Sep 2018 16:09:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a67901f5659bea6428a41bb3277b2d8e3d4e4110.camel@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Fri, 21 Sep 2018 08:09:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月21日 11:47, richard.purdie@linuxfoundation.org wrote:
> The problem I really want to fix is the hang as openssh-server starts.
> Without the defconfig options above, openssh server hangs at key
> generation. With the changes I've mentioned applied, key generation
> proceeds, the server starts and we can ssh into the machine.
OK, I will workaround the issue by depending openssl10 on qemuarm64.

But the root cause is the hung of getrandom in kernel

//Hongxu
> The errors you mention above are worrying/annoying but are separate to
> the issue of openssh hanging (they could be related in that they both
> involve entropy in the random pool).
>
> Cheers,
>
> Richard



