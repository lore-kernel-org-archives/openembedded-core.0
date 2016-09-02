Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 454B360762
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 01:58:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u821w0Yn003210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 18:58:01 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 1 Sep 2016 18:58:00 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0Lajz4nb5S5T4rq=F6fmfGvRPEuAyKF=U-OZdWfo+JoOqQ@mail.gmail.com>
	<57C00BB4.8050607@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57C8DBBD.7020701@windriver.com>
Date: Fri, 2 Sep 2016 09:54:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <57C00BB4.8050607@windriver.com>
X-Originating-IP: [128.224.163.140]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] groff: add file-homedir-perl to RDEPENDS
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
X-List-Received-Date: Fri, 02 Sep 2016 01:58:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

Thanks,

On 2016年08月26日 17:28, Yu, Mingli wrote:
>
>
> On 2016年08月26日 16:55, Burton, Ross wrote:
>>
>> On 26 August 2016 at 03:25, <mingli.yu@windriver.com
>> <mailto:mingli.yu@windriver.com>> wrote:
>>
>>     The series add file-homedir-perl to RDEPENDS for groff as
>>     glilypond rdepends on File/HomeDir.pm provided by file-homedir-perl
>>
>>
>> Isn't lilypond the music score layout tool?
>
> glilypond which is provided by groff transforms sheet music written in
> the lilypond language into the groff language using the .PSPIC request,
> such that groff can transform it into a format that can be displayed
> directly.
>
>   This seems very
>> specialist.  I suggest adding the new recipes to meta-perl, and then if
>> someone does want to use it then the requirements are available.
>>
>> Unless you're only hitting this because of testing, in which case I'd
>> suggest skipping this test.
>
> The command glilypond needs File::HomeDir perl module which is provided
> by file-homedir-perl
>
> Thanks,
> Grace
>
>>
>> Ross

