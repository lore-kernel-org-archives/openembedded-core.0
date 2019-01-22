Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2AA6B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 02:13:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0M2DeRZ011088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2019 18:13:40 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 21 Jan 2019 18:13:39 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1548062956.git.Qi.Chen@windriver.com>
	<f2b0687b21913c2806aebdb3355a6444649ec08d.1548062956.git.Qi.Chen@windriver.com>
	<adcb2224cfb62745ee54c5f04c1c75ff9d803ed1.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <5b260b75-4792-2914-58cd-1f545b0ce6fc@windriver.com>
Date: Tue, 22 Jan 2019 10:22:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <adcb2224cfb62745ee54c5f04c1c75ff9d803ed1.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.141]
Subject: Re: [PATCH 1/1] devtool.py: remove fetch results from download directory to avoid failure
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
X-List-Received-Date: Tue, 22 Jan 2019 02:13:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2019 05:53 PM, Richard Purdie wrote:
> On Mon, 2019-01-21 at 17:29 +0800, Chen Qi wrote:
>> The fetch results need to be removed from the download directory to
>> avoid
>> failures like below.
>>
>>    Submodule path 'doxyport': checked out
>> 'db3e1a6eb8677d3166d90d82c3068689803ce547'
>>
>>    fatal: reference is not a tree:
>> 67cad692720982ac3cbd99bf1c3421edc69b08f9
>>    Unable to checkout '67cad692720982ac3cbd99bf1c3421edc69b08f9' in
>> submodule path 'doxygen2jsdoc'
>>
>>    ERROR: Function failed: base_do_unpack
> I'd like to understand the problem here a bit more. My worry is that
> deleting files manually from DL_DIR is bad practise, particularly if
> that directory is shared between builds like on our autobuilder.
>
> We've had similar problems with cleansstate since that can also remove
> artefacts from the sstate cache which another build may be using. We
> can do this only when the sstate directory is not shared.
>
> Cheers,
>
> Richard
>
>
I just pulled to latest master and did the tests again. Things worked 
well. This patch is not needed.
It seems that Mark's commits regarding gitsm in bitbake has fixed the 
problem I met.

Best Regards,
Chen Qi

