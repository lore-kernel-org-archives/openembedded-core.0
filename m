Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 350616FDA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 23:57:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5HNvT5a012195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 16:57:30 -0700 (PDT)
Received: from server.local (128.224.23.62) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 17 Jun 2014 16:57:29 -0700
Message-ID: <53A0D6C5.3030204@windriver.com>
Date: Tue, 17 Jun 2014 20:01:09 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
	<1403043506.2104.4.camel@ted>
In-Reply-To: <1403043506.2104.4.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: 3.4, 3.10 and 3.14 updates
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
X-List-Received-Date: Tue, 17 Jun 2014 23:57:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-06-17, 6:18 PM, Richard Purdie wrote:
> On Tue, 2014-06-17 at 11:26 -0400, Bruce Ashfield wrote:
>> Richard/Saul,
>>
>> Here are my collect stable updates to 3.4 -> 3.14. Build and boot sanity
>> passed here, but with three versions being updated, its a lot of build
>> testing :)
>>
>> I also have an update for NAND support on the mpc8315e reference board,
>> which allows us to shake out flash filesystem issues. I'll follow up
>> with a meta-yocto-bsp change to enable the changes there as well.
>
> I merged these two series and we've started seeing:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/119
>
> which is a 3.14 kernel lttng-modules failure on the autobuilder :(
>
> Are we missing an update to lttng?

Nothing that should have been required. lttng is completely separate
from the kernel .. and being an out of tree module (which I really,
really don't like), it can be broken from time to time.

The real fix is to do like Greg does for LTSI, and merge the support
into the tree itself.

I'll have a look at this ASAP.

Bruce

>
> Cheers,
>
> Richard
>
>
>


