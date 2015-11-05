Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 6E22376E70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:23:48 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 95F94237C4;
	Thu,  5 Nov 2015 15:23:48 +0100 (CET)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B56B6.6070307@pseudoterminal.org>
	<CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <563B6674.1030106@pseudoterminal.org>
Date: Thu, 5 Nov 2015 15:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 14:23:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2015 03:22 PM, Otavio Salvador wrote:
> Hello Carlos,
>
> On Thu, Nov 5, 2015 at 11:16 AM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> So, this is because of the TOOLCHAIN_OPTIONS ?
>> Also, what about the ${CC} ? Right now it won't work properly with clang for
>> example.
> The clang is problem might involve us to rework something but all this
> needs to be based on last U-Boot releases; we shouldn't put
> workarounds and hacks on OE-Core without good reasons.
>
> Has the clang been tested with 2015.10?
>

Still, then I'd add something to output an error message like "U-Boot 
can only be compiled with gcc". Right now, the error messages that would 
occur would be highly confusing and misleading.

