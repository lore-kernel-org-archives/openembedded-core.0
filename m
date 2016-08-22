Return-Path: <ml@embed.me.uk>
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 6C90973286
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:48:25 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 1A930DC8E5;
	Mon, 22 Aug 2016 13:48:25 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20160822130516.5719-1-ml@embed.me.uk>
	<84941321-4129-4a17-7eea-2fbea6513369@embed.me.uk>
	<CAJTo0Lb6fi9Xa1oeEb4KjsBNM0Hh9nfaWpp4L1ap+Z1_j6aUvQ@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <2e948106-ac15-2c16-5bb6-f234079be725@embed.me.uk>
Date: Mon, 22 Aug 2016 14:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6fi9Xa1oeEb4KjsBNM0Hh9nfaWpp4L1ap+Z1_j6aUvQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: install path variables should be relative to the prefix path
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
X-List-Received-Date: Mon, 22 Aug 2016 13:48:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/16 14:24, Burton, Ross wrote:
>
> On 22 August 2016 at 14:23, Jack Mitchell <ml@embed.me.uk
> <mailto:ml@embed.me.uk>> wrote:
>
>     On second thoughts this isn't doing quite what I expected, how would
>     one remove the prefix from a variable when it's expanded in this manner?
>
>
> You curse cmake for needing install paths to be relative to the prefix?
>
> Ross

That was last weeks agenda ;)

Could it be done with some inline python? I'm really not all that clued 
up on which variables are available when and where to be manipulated. I 
was thinking something along the lines of

${@d.getVar('bindir').replace(d.getVar('prefix', ''))}

However, this just breaks spectacularly.

