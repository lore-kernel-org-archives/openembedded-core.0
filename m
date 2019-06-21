Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E09B7E478
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:20:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5L9JsXn010778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jun 2019 02:20:05 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 21 Jun 2019 02:19:44 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<d02500d78c61f9cdee7a5f4bc99148379054cfcd.1561018476.git.liezhi.yang@windriver.com>
	<162e4e6b1a2b9162e9702921cf171937bce5a024.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <2f6677b4-2dfa-a4b4-905a-c7fe3a7b17e3@windriver.com>
Date: Fri, 21 Jun 2019 17:20:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <162e4e6b1a2b9162e9702921cf171937bce5a024.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/4] update-alternatives.bbclass: run update-alternatives firstly in postinst script
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
X-List-Received-Date: Fri, 21 Jun 2019 09:20:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I can reproduce it now, sorry about that, I'm working on it.

// Robert

On 6/20/19 11:33 PM, Richard Purdie wrote:
> On Thu, 2019-06-20 at 16:15 +0800, Robert Yang wrote:
>> Recipes like postfix run command newaliases in postinst, but
>> newaliases is
>> installed newaliases.postfix, and need run update-alternatives to
>> update it to
>> newaliases, so we would get the error when install postinst on
>> target.
>>
>> Fixed:
>> $ opkg install postfix
>> Configuring postfix.
>> ///var/lib/opkg/info/postfix.postinst: line 4: newaliases: command
>> not found
>>
>> Run update-alternatives firstly will fix the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/update-alternatives.bbclass | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> This seemed to result in:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/724
> 
> Cheers,
> 
> Richard
> 
> 

