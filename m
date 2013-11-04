Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A345D60F15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 12:09:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA4C93t5024437
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Nov 2013 04:09:03 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 04:09:02 -0800
Message-ID: <52778E5A.4060507@windriver.com>
Date: Mon, 4 Nov 2013 20:08:58 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1383558655.git.hongxu.jia@windriver.com>
	<1383565168.6271.107.camel@ted>
In-Reply-To: <1383565168.6271.107.camel@ted>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/5] fix WARNING: QA Issue on kmod/udev/nfs-utils (unsafe references [/ references to /usr/lib])
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
X-List-Received-Date: Mon, 04 Nov 2013 12:09:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2013 07:39 PM, Richard Purdie wrote:
> On Mon, 2013-11-04 at 17:56 +0800, Hongxu Jia wrote:
>> Change in V2: The fourth patch fixed the QA Issue on udev, it was missed on previous version.
>>
>> //Hongxu
>>
>> The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:
>>
>>    bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib hongxu/fix-qa-issue
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qa-issue
>>
>> Hongxu Jia (5):
>>    insane.bbclass: support to skip  unsafe references in binaries qa
>>      check.
>>    kmod: fix QA issue
>>    udev: fix  QA issue
>>    udev: fix QA issue
>>    nfs-utils: fix QA issue
> Last time these warnings came up I asked for a clear plan about what
> needed to live in / and what needed to live in /usr and how we were
> going to fix things once and for all (or forget this idea).
>
> Where is the plan? Why is it ok to just ignore these particular
> warnings?

I am afraid there is no plan, let's drop this patch.

//Hongxu

> Cheers,
>
> Richard
>


