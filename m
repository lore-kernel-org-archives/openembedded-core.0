Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF8A776D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 08:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D8PpZ0019105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 01:25:51 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 01:25:50 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489391139.git.liezhi.yang@windriver.com>
	<4ae06894c190997f459b4d50aa09d5011b80fb7f.1489391139.git.liezhi.yang@windriver.com>
	<1489393453.13980.28.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a000a202-6910-44fc-8724-da38dc4eab64@windriver.com>
Date: Mon, 13 Mar 2017 16:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1489393453.13980.28.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] devshell.bbclass: add editors for devshell
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
X-List-Received-Date: Mon, 13 Mar 2017 08:25:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/13/2017 04:24 PM, Richard Purdie wrote:
> On Mon, 2017-03-13 at 00:46 -0700, Robert Yang wrote:
>> * The vi, vim, emacs and nano can be used in devshell.
>>
>> * The groups, lesspipe and dircolors are required by
>> /etc/skel/.bashrc on
>>   Ubuntu 14.04, otherwise, there would be warnings when start
>> devshell:
>>     bash: groups: command not found
>>     bash: lesspipe: command not found
>>     bash: dircolors: command not found
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/classes/devshell.bbclass | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/classes/devshell.bbclass
>> b/meta/classes/devshell.bbclass
>> index 4de7ea6fce..055d21ba50 100644
>> --- a/meta/classes/devshell.bbclass
>> +++ b/meta/classes/devshell.bbclass
>> @@ -2,6 +2,12 @@ inherit terminal
>>
>>  DEVSHELL = "${SHELL}"
>>
>> +# Tools used in devshell
>> +HOSTTOOLS_NONFATAL += "vi vim emacs nano"
>
> Thinking about this further, I think we need to restore PATH for the
> devshell. We can't really go down the road of trying to add in links
> for any tool the developer may want to use...

Yes, that would be great.

// Robert

>
> Cheers,
>
> Richard
>

