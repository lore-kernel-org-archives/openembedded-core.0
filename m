Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2751679EFB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 01:22:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA21MdvJ008102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Nov 2018 18:22:39 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 1 Nov 2018 18:22:39 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LYypr91Kg0V=ke_WhFcOcSOfN_wSsX1rdYDQrZ_Oz25sw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <8f8f7241-6858-ba50-4dd5-7f9a57ec95f5@windriver.com>
Date: Fri, 2 Nov 2018 09:22:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYypr91Kg0V=ke_WhFcOcSOfN_wSsX1rdYDQrZ_Oz25sw@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: update SRC_URI
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
X-List-Received-Date: Fri, 02 Nov 2018 01:22:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/1/18 7:12 PM, Burton, Ross wrote:
> Why are we using ubuntu's archive instead of the canonical Debian
> repository?  The idiom for Debian packages is to use
> snapshot.debian.org.
>
> Ross

I have checked snapshot.debian.org.  apt_1.2.24 don't  on it.  so I use 
current link.


//changqing

> On Thu, 1 Nov 2018 at 03:16, <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> update SRC_URI since previous link is not valid now
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/apt/apt.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
>> index f1cde30..50f22c8 100644
>> --- a/meta/recipes-devtools/apt/apt.inc
>> +++ b/meta/recipes-devtools/apt/apt.inc
>> @@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
>>   LICENSE = "GPLv2.0+"
>>   SECTION = "base"
>>
>> -SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
>> +SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz \
>>              file://use-host.patch \
>>              file://makerace.patch \
>>              file://no-nls-dpkg.patch \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
BRs

Sandy(Li Changqing)


