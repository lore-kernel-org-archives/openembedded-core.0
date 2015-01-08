Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7637672BA2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 12:06:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t08C6Rrb029823
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Jan 2015 04:06:28 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 04:06:27 -0800
Message-ID: <54AE72B7.1020803@windriver.com>
Date: Thu, 8 Jan 2015 20:06:15 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1420613743.git.hongxu.jia@windriver.com>	<1420674899.25779.79.camel@linuxfoundation.org>	<54ADEB14.9060004@windriver.com>
	<CAP9ODKrzqotT1FPxpK4x3KUmXGKXOtQtnJPCyru+ZZeQb6TJww@mail.gmail.com>
In-Reply-To: <CAP9ODKrzqotT1FPxpK4x3KUmXGKXOtQtnJPCyru+ZZeQb6TJww@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] add variable INSTALL_ALL to install all packages in recipes
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
X-List-Received-Date: Thu, 08 Jan 2015 12:06:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2015 07:55 PM, Otavio Salvador wrote:
> On Thu, Jan 8, 2015 at 12:27 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 01/08/2015 07:54 AM, Richard Purdie wrote:
>>> This tells me what the change does. What it doesn't say is why we need
>>> this?
>>>
>>> Its a fairly invasive set of changes but I don't see the usecase...
>>
>> Hi Richard,
>>
>> I am sorry not to say it clearly,
>>
>> 1) We have been asked many times on how to install all the PACKAGES
>>     of a recipe, we can only list them one by one in the RDPENDS (or
>>     IMAGE_INSTALL and so on) currently, especially like dynamic generated
>>     packages (perl-modules, kernel-modules) which depends on many other
>>     packages, it is not easy to remember these package names for customer.
>>     It is helpful for user who does not take care the details that how many
>>     packages generated in a recipe, just want to directly install all of
>> them.
>>
>> 2) Providing a mechanism to install all the PACKAGES of a recipe is helpful
>>     to test all generated packages of a recipe could work, such as the defect
>>     of '[PATCH 3/4]' was found by installing all packages of python3.
>>
>> 3) The fix is based on the usage of IMAGE_INSTALL, so it doesn't affect the
>>     users who do not want to use this feature (We disable it by default).
> For me, it seems those should have a meta package, not a new install
> variable fo this.

What meta package means? I am sorry I don't quite follow it.

//Hongxu


>


