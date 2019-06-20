Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 610307E6B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:12:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5K9CV3j001967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2019 02:12:31 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 20 Jun 2019 02:12:30 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1561000443-320248-1-git-send-email-changqing.li@windriver.com>
	<20190620073529.GB27107@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7140cbf6-0801-6b9e-6f0d-33fdfbe3cfbf@windriver.com>
Date: Thu, 20 Jun 2019 17:12:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620073529.GB27107@localhost>
X-Originating-IP: [128.224.162.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mdadm: fix systemd service start up failure
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
X-List-Received-Date: Thu, 20 Jun 2019 09:12:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/20/19 3:35 PM, Adrian Bunk wrote:
> On Thu, Jun 20, 2019 at 11:14:03AM +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> 1. mdadm: No mail address or alert command - not monitoring
>>
>> with --monitor mode, mdadm needs a mail address and/or a program.
>> This can be given with "mailaddr" and "program" lines to that
>> monitoring can be started using.
>>
>> fix by given a mail address, user can replace with a valid one
>> when use.
>> ...
>> +        sed -i -e 's/#MAILADDR root@mydomain.tld/MAILADDR root@mydomain.tld/g' ${D}${sysconfdir}/mdadm.conf
>> ...
> Defaulting to try to send emails to an invalid address is worse than not
> having an email address configured.
>
> Looking at the manpages I would have expected syslog-only monitoring to
> work if neither mailaddr nor program are configured.
> If this isn't working, is this something upstream considers a bug?
Thanks, I will check this, and try find another solution.
>
> cu
> Adrian
>
-- 
BRs

Sandy(Li Changqing)


