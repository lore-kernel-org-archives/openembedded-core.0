Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1CB37E5A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:10:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5B99iTw030909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2019 02:10:05 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 11 Jun 2019 02:09:49 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190611083731.190996-1-kai.kang@windriver.com>
	<cefb49e59c432b787b341d6df11ebf4608daa53d.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <8d4f4bd8-5fc7-c8ad-72e3-5204b9f13f22@windriver.com>
Date: Tue, 11 Jun 2019 17:07:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cefb49e59c432b787b341d6df11ebf4608daa53d.camel@linuxfoundation.org>
Subject: Re: [PATCH] gnome.bbclass: inherit upstream-version-is-even
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
X-List-Received-Date: Tue, 11 Jun 2019 09:10:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/6/11 下午4:41, Richard Purdie wrote:
> On Tue, 2019-06-11 at 04:37 -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> According to gnome versioning policy, "Even/odd minor package
>> versions
>> can be used respectively for stable/unstable releases.". Make
>> gnome.bbclass inherit upstream-version-is-even to comply with the
>> policy.
>>
>> Ref:
>> https://developer.gnome.org/programming-guidelines/stable/versioning.html.en#stable-unstable-versions
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/classes/gnome.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> The question is whether all recipes using the gnome class use the gnome
> version policy? I'm not sure that is true?

My thought was gnome.bbclass inherits gnonebase.bbclass which means the 
sources from gnome and should comply the version policy of gnome.
But I check it again and find that some packages override the SRC_URI 
such as pavucontrol which doesn't obey the policy. Please ignore it.


Thanks,
Kai


>
> Cheers,
>
> Richard
>
>
>
>

-- 
Kai Kang


