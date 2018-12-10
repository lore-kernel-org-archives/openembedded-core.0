Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2936C0EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 01:33:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBA1XPEd005803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Dec 2018 17:33:25 -0800 (PST)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Dec 2018 17:33:25 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<poky@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <cover.1544102766.git.kai.kang@windriver.com>
	<c2e11d2a6ebb8da6177c0b0d7174a0e2047093db.1544102766.git.kai.kang@windriver.com>
	<81b73451de8a9149beda328186cbdf4adb4452ea.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <43cb0c8d-ad86-ecf2-c55d-f5775c51fbbf@windriver.com>
Date: Mon, 10 Dec 2018 09:31:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <81b73451de8a9149beda328186cbdf4adb4452ea.camel@linuxfoundation.org>
Subject: Re: [poky] [meta-poky][PATCH 1/1] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Mon, 10 Dec 2018 01:33:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/12/10 上午2:12, Richard Purdie wrote:
> On Thu, 2018-12-06 at 20:53 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Move configurations from local.conf.sample.extended to
>> local.conf.sample
>> to make systemd as default init manager for poky.
>>
>> [YOCTO #13031]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-poky/conf/local.conf.sample          | 8 ++++++++
>>   meta-poky/conf/local.conf.sample.extended | 8 --------
>>   2 files changed, 8 insertions(+), 8 deletions(-)
> I had a feeling there would be some issues to fix before we could do
> this by default:
>
> systemd fails to compile with x32:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/76
>
> sanity tests on qemux86-64 core-image-sato-sdk:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/77/steps/7/logs/step1c
>
> sanity tests on qemuarm core-image-sato-sdk with poky-lsb:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/77/steps/7/logs/step1c
>
> dpkg issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/77/steps/7/logs/step2c
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/77/steps/7/logs/step1c
>
> wic failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/33/steps/7/logs/step2d
> (postinstall problem?)
>
> musl sanity test issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/77/steps/7/logs/step1c
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/78/steps/7/logs/step1c


Got it. I am going to fix fix them.

Regards,
Kai


>
>
> Hopefully its a small number of issues at the heart of this but we need
> to sort this out before it can merge.
>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


