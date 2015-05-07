Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A54C60138
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 15:33:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t47FXJs7002966
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 May 2015 08:33:19 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 7 May 2015 08:33:19 -0700
Message-ID: <554B85BE.5040800@windriver.com>
Date: Thu, 7 May 2015 11:33:18 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>	<1430521154.18360.28.camel@linuxfoundation.org>	<55440C90.5060605@windriver.com>	<20150502081346.GD2366@jama>	<55458D0D.6070904@windriver.com>	<20150506144241.GA2067@jama>	<554A2C1C.5040304@windriver.com>	<20150506153325.GB2067@jama>	<1430927086.8074.65.camel@linuxfoundation.org>	<20150506160708.GD2067@jama>	<554A536C.5060608@windriver.com>	<1430947966.8074.108.camel@linuxfoundation.org>
	<CA+chaQfarqYbkkfZyCpFfNm9qLXkOPf4HAnnmygDmBAVYt3BXw@mail.gmail.com>
In-Reply-To: <CA+chaQfarqYbkkfZyCpFfNm9qLXkOPf4HAnnmygDmBAVYt3BXw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 07 May 2015 15:33:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-06 06:49 PM, Martin Jansa wrote:
> I use tmpfs in most of my builds, so in most cases when I see the error
> from the build, tmpfs is already gone (purged by next build executed on
> the same sever).

ross just found something like this in one of his local builds .. I'm
pretty sure I see the race.

Fix coming shortly, and then the bigger changes I was mentioning before
as well.

Cheers,

Bruce

>
> On Wed, May 6, 2015 at 11:32 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Wed, 2015-05-06 at 13:46 -0400, Bruce Ashfield wrote:
>     > On 2015-05-06 12:07 PM, Martin Jansa wrote:
>     > > I've used master-next week or two ago (mostly to test bluez4 and python3
>     > > changes) and soon after that dropped all linux-yocto related changes
>     > > from it assuming that it's indeed cause for the issues I'm seeing, but
>     > > it's not and it's still failing with master as well (and my
>     > > jenkins/world builds are just small portion of my builds executed
>     > > elsewhere where I see similar issues).
>     >
>     > Richard: How can we sort out the differences between the build
>     > environment that Martin uses versus what the autobuilder is showing?
>     >
>     > There's nothing particularly complex happening during that build,
>     > it's a checkout and generation of a config.
>     >
>     > I'm unable to reproduce any of the failures, and neither is the
>     > autobuilder.
>
>     This is a tough one and I'm struggling a little. We could try looking at
>     the tmp/stamps/qemux86-poky-linux/linux-yocto/* files (sigdata in
>     particular) as well as
>     tmp/work/qemux86-poky-linux/linux-yocto/*/temp/log.task_order
>
>     Martin, would you be able to share the above somewhere? I'm hoping this
>     would give us a clue as to what the difference is between the builds and
>     allow us to reproduce the problem.
>
>     Cheers,
>
>     Richard
>
>
>


