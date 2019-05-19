Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4827C4F9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 15:05:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4JF4oZa003561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 May 2019 08:05:01 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 19 May 2019 08:04:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1558242037-162349-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj-oX0Diqsz9cuezEE6CdJwPrtuQz4uD_O2p31LgCPaYZQ@mail.gmail.com>
	<b30ae982-ef02-bb3f-f474-9f4f8769f29b@windriver.com>
Message-ID: <8c866cd4-6ae7-7476-63b0-1fdbc8b60e8b@windriver.com>
Date: Sun, 19 May 2019 23:04:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b30ae982-ef02-bb3f-f474-9f4f8769f29b@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: fix compiling failure with `-fvisibility=default'
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
X-List-Received-Date: Sun, 19 May 2019 15:05:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 5/19/19 10:30 PM, Hongxu Jia wrote:
> On 5/19/19 6:10 PM, Alexander Kanavin wrote:
>> On Sun, 19 May 2019 at 07:01, Hongxu Jia <hongxu.jia@windriver.com> 
>> wrote:
>>> +Extern global variable `util_cpu_caps' to multiple C source files is
>>> +not a good habit, it caused linking failure when making a shard object
>>> +in some cross compiling circumstance
>>> +...
>>> +|ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
>>> +R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
>>> +when making a shared object
>>> +|ld: final link failed: bad value
>>> +...
>>> +
>>> +Covert global variable to static and assign it only in one C source 
>>> file,
>>> +provide get function for other C source files
>>> +
>>> +Upstream-Status: Submitted [virglrenderer-devel@lists.freedesktop.org]
>> I do not actually see the submission here:
>> https://lists.freedesktop.org/archives/virglrenderer-devel/2019-May/date.html 
>>
>
> Here is the mailing list reply
>
> ...
>
> Your mail to 'virglrenderer-devel' with the subject
>
>     [PATCH] fix symbol `util_cpu_caps' can not be used when making a
> shared object
>
> Is being held until the list moderator can review it for approval.
>
> The reason it is being held:
>
>     Post by non-member to a members-only list
>
> Either the message will get posted to the list, or you will receive
> notification of the moderator's decision.  If you would like to cancel
> this posting, please visit the following URL:
>
> https://lists.freedesktop.org/mailman/confirm/virglrenderer-devel/131d0999373561efdb12c196276096402856dbc7
>
> ...
> //Hongxu
>
>> I think the patch should be submitted as a merge request here:
>> https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests
>>
I also submit a merge request

https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/239

//Hongxu

>> and I would rather wait for upstream to accept it, and then take it in
>> oe-core as a backport.
>>
>> Alex
>
>


