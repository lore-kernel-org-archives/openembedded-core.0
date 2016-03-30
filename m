Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E26BE601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:42:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U0gHwD029872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Mar 2016 17:42:18 -0700 (PDT)
Received: from [128.224.163.174] (128.224.163.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 17:42:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1459238263.git.liezhi.yang@windriver.com>
	<3148e125ec883b341b1bbbc8bb3f8845bde01eb2.1459238263.git.liezhi.yang@windriver.com>
	<1459252755.21672.21.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56FB20E7.4050406@windriver.com>
Date: Wed, 30 Mar 2016 08:42:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459252755.21672.21.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/3] image-live.bbclass/image-vm.bbclass: remove duplicated code
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
X-List-Received-Date: Wed, 30 Mar 2016 00:42:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/29/2016 07:59 PM, Richard Purdie wrote:
> On Tue, 2016-03-29 at 00:59 -0700, Robert Yang wrote:
>> Move the common code to image.bbclass and remove duplicated ones.
>
> Whilst I do like the idea of this patch set, I don't like generic
> functions called "populate", or adding EFI variables to image.bbclass
> itself.

Thanks, I will update it.

>
> I believe that some refactoring does make a lot of sense here but this
> doesn't look right. The diffstats don't seem to suggest a large volume
> of common code either (as yet).

The patch that removes the duplicated code is:

[OE-core] [PATCH 3/3] image-live.bbclass/image-vm.bbclass: remove duplicated code

  meta/classes/image-live.bbclass | 58 ++++++-----------------------------------
  meta/classes/image-vm.bbclass   | 51 +-----------------------------------
  meta/classes/image.bbclass      | 46 ++++++++++++++++++++++++++++++++
  3 files changed, 55 insertions(+), 100 deletions(-)

It removes 45 lines, I will check whether we can do more on these bbclasses.


// Robert

>
> Cheers,
>
> Richard
>
>

