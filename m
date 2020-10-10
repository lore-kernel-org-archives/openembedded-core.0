Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web11.3637.1602359023603757972
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 12:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.3] (unknown [117.147.6.139])
	by kozue.soulik.info (Postfix) with ESMTPSA id 6F865100BF2;
	Sun, 11 Oct 2020 04:42:22 +0900 (JST)
Subject: Re: [OE-core] [PATCH] meson: add sysroot property
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200930150545.3882859-1-ayaka@soulik.info>
 <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
 <34ad6791-d6db-4f37-a804-36df55b3472e@soulik.info>
 <CANNYZj_o=iZkZc51088ACJXGkDFeaCTCxGoETzCakh3HJZ-snA@mail.gmail.com>
 <CAMKF1sq2dGdBsLJHAEyf84qiuah_DPwd-YAw0PvKVH4WL6kAWg@mail.gmail.com>
From: "Randy Li" <ayaka@soulik.info>
Message-ID: <8673800a-caec-13f7-8516-ed8b52c87598@soulik.info>
Date: Sun, 11 Oct 2020 03:43:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq2dGdBsLJHAEyf84qiuah_DPwd-YAw0PvKVH4WL6kAWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 02/10/2020 04:38, Khem Raj wrote:
> On Thu, Oct 1, 2020 at 2:22 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> On Thu, 1 Oct 2020 at 06:15, ayaka <ayaka@soulik.info> wrote:
>>> It is the nativesdk meson has this problem, that is what cross build
>>> requests for.
>>>
>>> You can try the Intel MediaSDK, I reported this issue to Gstreamer for
>>> this but it comes to the issue of OE.
>>>
>>> Or you mean the native meson for the target system ? I don't think they
>>> need a cross build file.
>>
>> native meson does use a cross file when building target packages, and things work without sysroot property, including using pkg-config:
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/meson.bbclass
>>
> if meson used its defaults ( which means looking into native rootfs on
> build system ) perhaps is fine for native packages since they don't
> execute on
> other build systems, but not so for nativesdk and target packages

Yes, I didn't make myself clearly, I am using the SDK from populate_sdk

I didn't try the latest master next but this issue still happened until 
the current stable version

>> So I worry that your patch is fixing a symptom and not the problem.
>>
>> Alex
>>
>>
>>
>>
>> 
>>
