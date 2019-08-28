Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5EA87ECAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 00:03:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7S037oA020943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 17:03:07 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 17:03:06 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190821002750.52062-1-jason.wessel@windriver.com>
	<0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <1bd6ab16-628d-2326-d6c3-c6097d7ba698@windriver.com>
Date: Tue, 27 Aug 2019 19:03:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
Subject: Re: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Wed, 28 Aug 2019 00:03:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/27/19 5:58 PM, Richard Purdie wrote:
> Hi Jason,
> Somehow this change is responsible for this build failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/976
>
> (steps 5c and 7c so failure during testimage).
>
> I have bisected it to this change, I haven't looked into why.


Thanks for tracking it down.   I am sure how to try an duplicate this.  I clicked around to try and find out a bit about what it is running for these phases of the build but it is not very obvious.

Is there a local.conf I can try along with what ever commands it ran?


Jason.


