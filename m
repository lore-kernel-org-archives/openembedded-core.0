Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7831C6FF93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:01:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3Q91E6K026381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Apr 2016 02:01:14 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 02:01:13 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e1d663a4f78339b9df14168beec65fa0d3a1e45f.1461592183.git.liezhi.yang@windriver.com>
	<1461660963.31320.147.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571F2E58.1070402@windriver.com>
Date: Tue, 26 Apr 2016 17:01:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461660963.31320.147.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/6] insane.bbclass: package_qa_check_license -> do_qa_populate_lic
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
X-List-Received-Date: Tue, 26 Apr 2016 09:01:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/26/2016 04:56 PM, Richard Purdie wrote:
> On Mon, 2016-04-25 at 06:51 -0700, Robert Yang wrote:
>> The package_qa_check_license() was in do_qa_configure which had a
>> potential problem, when the recipe sets do_configure[noexec] = "1",
>> then
>> the license checking won't run, which may hidden license issues.
>> Rename
>> it to do_qa_populate_lic() and run in do_populate_lic[postfuncs]
>> which
>> is more reasonable (when no populate license, no license checking).
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/insane.bbclass | 15 ++++++---------
>>   1 file changed, 6 insertions(+), 9 deletions(-)
>
> There is a convention that "do_" as a function prefix means its a task.
> In this case its not a task but a function, so can you use a different
> prefix please?

Ah, yes, thanks, I will update it after Ross replies.

// Robert

>
> Cheers,
>
> Richard
>

