Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E36EF6007C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 14:11:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5REB1i1009317
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2013 07:11:01 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 27 Jun 2013 07:10:59 -0700
Message-ID: <51CC47DA.8090905@windriver.com>
Date: Thu, 27 Jun 2013 22:10:34 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51C963C0.5020009@windriver.com> <1810438.1YW5iENKFC@helios>
In-Reply-To: <1810438.1YW5iENKFC@helios>
X-Originating-IP: [128.224.162.205]
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Could qt4.8 build on mips 64 bits platform?
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
X-List-Received-Date: Thu, 27 Jun 2013 14:11:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年06月25日 18:41, Paul Eggleton wrote:
> On Tuesday 25 June 2013 17:32:48 Kang Kai wrote:
>> Could qt4.8 build on mips 64 bits platform?
>>
>> I searched qt-project.org and no such related information.
>> And then grep the source codethat no such mips64 keyword in file
>> qmake.conf under directory mkspecs. In contrast there are mips32 related
>> flags in mkspecs/qws/linux-mips-g++/qmake.conf.
>>
>> Does that mean we still can't build qt 4.8 on mips64?
> I don't have any specific knowledge here; I'd suggest trying it. If additional
> patches are needed the best thing would be to try and get those merged
> upstream.

Thanks a lot. I'll try to build it on mips 64.

Regards,
Kai

>
> Cheers,
> Paul
>


-- 
Regards,
Neil | Kai Kang


