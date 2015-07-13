Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54753741CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 05:33:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D5Xcc8025432
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Jul 2015 22:33:38 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 12 Jul 2015 22:33:38 -0700
Message-ID: <55A34DB0.4030608@windriver.com>
Date: Mon, 13 Jul 2015 13:33:36 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1436506574-3408-1-git-send-email-wenzong.fan@windriver.com>
	<1436537761.3310.12.camel@linuxfoundation.org>
In-Reply-To: <1436537761.3310.12.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rpcbind: handle rpcbind options
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
X-List-Received-Date: Mon, 13 Jul 2015 05:33:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2015 10:16 PM, Richard Purdie wrote:
> On Fri, 2015-07-10 at 13:36 +0800, wenzong.fan@windriver.com wrote:
>> From: Li Wang <li.wang@windriver.com>
>>
>> the patch refers to:
>> https://bugs.launchpad.net/ubuntu/+source/rpcbind/+bug/835833
>>
>> Run test:
>> $ systemctl restart rpcbind
>> $ systemctl status rpcbind
>
>
> I shouldn't have to follow a link to figure out what the patch is for,
> why or how. Please improve the commit message.

Ok, I have updated the commit message and re-sent V2 both for:

[OE-core] [PATCH 1/1 v2] rpcbind: handle rpcbind options
[OE-core] [PATCH 1/1 v2] netbase: add rpcbind as an alias to sunrpc

Thanks
Wenzong

>
> Cheers,
>
> Richard
>
>

