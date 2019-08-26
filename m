Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC11C7F5B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 03:07:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7Q37ORn028742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2019 20:07:24 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 25 Aug 2019 20:07:23 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190823081945.49883-1-kai.kang@windriver.com>
	<CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com>
	<b0cbad63-7ead-a303-b870-b72773e7e060@windriver.com>
	<CAMKF1sqj+65uA31KbYGD4Mo4ggkFjkRfnXpD4vjTS-TVihAuVg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <cc8e0645-3e91-5a3f-6dcd-2c2002b8fc17@windriver.com>
Date: Mon, 26 Aug 2019 11:06:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqj+65uA31KbYGD4Mo4ggkFjkRfnXpD4vjTS-TVihAuVg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libwacom: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2019 03:07:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/26 上午10:54, Khem Raj wrote:
> On Sun, Aug 25, 2019 at 6:29 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/8/23 下午6:21, Alexander Kanavin wrote:
>>
>> On Fri, 23 Aug 2019 at 10:20, <kai.kang@windriver.com> wrote:
>>> Package libinput has a package config 'libwacom'. When it is set,
>>> package libwacom is required. So add the recipe of libwacom.
>>
>> This recipe probably needs to go to meta-oe? Why oe-core?
>>
>> Because libinput is in openembedded-core/meta/recipes-graphics/wayland/libinput_1.13.4.bb.
>> If package config 'libwacom' is enabled and libwacom belongs to meta-oe, then oe-core may need meta-oe.
>>
> there are many packageconfig options like that in oe-core, the key is
> they are disabled by default.
> idea is not to provide all the extended features with in oe-core

OK. I'll sent it to meta-oe.

Regards,
Kai



>> Regards,
>> Kai
>>
>>
>>
>> Alex
>>
>>
>> --
>> Kai Kang
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Kai Kang


