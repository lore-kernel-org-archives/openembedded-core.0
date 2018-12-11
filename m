Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E27B56C4BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:18:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBB9Ilsr016851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Dec 2018 01:18:47 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 01:18:47 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
	<37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <117c2412-f698-45a5-d82a-e1ee3210ec44@windriver.com>
Date: Tue, 11 Dec 2018 17:24:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Tue, 11 Dec 2018 09:18:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/10/18 6:29 PM, Richard Purdie wrote:
> On Sun, 2018-12-09 at 18:24 -0800, Robert Yang wrote:
>> The code is in setup_hosttools_dir(), it searches ccache in PATH in
>> reverse order, I can't figure out what it is used for, maybe it is
>> aimed to use host's ccache rather than recipe-sysroot-
>> native/usr/bin/ccache, but the later one isn't in original PATH, so
>> remove the code.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/base.bbclass | 2 --
>>   1 file changed, 2 deletions(-)
> 
> We should document it and I think its still needed.
> 
> Some distros have a "gcc" which automatically wraps ccache behind the
> scenes. This code lets us find the real gcc and bypass ccache.

Ah, thanks for the explanations, I got it now. I think that we don't need the
code any more since we don't use host's ccache, and I have removed ccache from
HOSTTOOLS.

I will update commit message and send a V2.

// Robert

> 
> There would be oe-selftest failures on such a distro if we didn't do
> that.
> 
> Cheers,
> 
> Richard
> 
> 

