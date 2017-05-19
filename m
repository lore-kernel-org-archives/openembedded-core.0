Return-Path: <erik.boto@pelagicore.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id BA178780C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 18:25:00 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id 99so5261545lfu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Z7cjv4SKRCWPKQxTrcC5aV/nGFl8ifZdxqMD8OdxDww=;
	b=tkfEy6XOsrgg3SLlI9RQGuOreg72hz9xvUW7swCX3Dx9K+jurASdpaR3O7QujLZr+/
	S5TuIM+Nev1W9G9xmQSq+sXYzt08mhgpq/+WsHfu4ZLLpC7zjyHY6wB+91KiacMclcys
	jcy/TMbgybyl2SzBaV2ysxYQsVtXFLsaWCJEYwABCvbcceIw/ZaWZ3zYfED9kyBGVeKr
	Lcy7e8CAEG0AB2YZYIysVggSPtmM+vM0dC+x1Ma4lRzlMYzVrq3id31kaBJmavQOwFnB
	bGekDdmx8jfvN5B+Orc0Bhrtec+WIYD4PKliW3F/644vc47+ymhzhkTR31+7IkcqOPj2
	nsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Z7cjv4SKRCWPKQxTrcC5aV/nGFl8ifZdxqMD8OdxDww=;
	b=fEtbIg3GM7wXzYmEAIegQ0EXsZw26G+43SETL5TIqic5ki23sFIfS3tqOOKKviIhtp
	yhrwG+N8cLtnvW3hYfXDEVr4gxTZvVaefV70p+eFxc2C1n+n+bsKT9d5T9navMHG37aq
	V7IR6nLCuk8CtItn5EBrxDAJ4dbSjH6r/LWYscsmFqJC8dq68kQjPkvi8sCJX+TPWueP
	y0RIp1ytohgwBewv9tSQKHq1dydWH6Dqt380/NYIHP/9T8U/Lv78to1e/mzjNAycfNVQ
	6bqg9cOH7Z3FdF1YSpnus8if9dTvkHNcjAuL0XkiR1n4N2rzDWoBV2kTcb6owgbYER3w
	c9Zw==
X-Gm-Message-State: AODbwcBxRRLP5We9QhmfxtZE7WTT8EwUKguqSC6L6tynegJdE3RGQ2XC
	+s+Mn0xsdql2IWxj
X-Received: by 10.25.29.145 with SMTP id d139mr2504902lfd.126.1495218301204;
	Fri, 19 May 2017 11:25:01 -0700 (PDT)
Received: from [192.168.2.123] (90-231-152-48-no92.tbcn.telia.com.
	[90.231.152.48]) by smtp.gmail.com with ESMTPSA id
	u18sm1075961lff.10.2017.05.19.11.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 11:24:59 -0700 (PDT)
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	=?UTF-8?Q?Erik_Bot=c3=b6?= <erik.boto@pelagicore.com>
References: <20170519142004.32682-1-erik.boto@pelagicore.com>
	<1495205983.1761.105.camel@linux.intel.com>
From: =?UTF-8?Q?Erik_Bot=c3=b6?= <erik.boto@pelagicore.com>
Message-ID: <bd5c66a5-2d26-4973-c438-58bd0a35c0b7@pelagicore.com>
Date: Fri, 19 May 2017 20:24:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495205983.1761.105.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Fri, 19 May 2017 18:25:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2017-05-19 16:59, Leonardo Sandoval wrote:

> On Fri, 2017-05-19 at 16:20 +0200, Erik Botö wrote:
>> On systemd systems calling reboot over an ssh connection doesn't
>> return as expected causing an exception, therefore wrap the call
>> to reboot in order to avoid this issue.
>>
>> Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
>> ---
>>   meta/lib/oeqa/controllers/masterimage.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
>> index 07418fcda1..6cdcfa3068 100644
>> --- a/meta/lib/oeqa/controllers/masterimage.py
>> +++ b/meta/lib/oeqa/controllers/masterimage.py
>> @@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>>               time.sleep(10)
>>               self.power_ctl("cycle")
>>           else:
>> -            status, output = conn.run("reboot")
>> +            status, output = conn.run("{ sleep 1; reboot; } > /dev/null &")
> what would make the difference having the sleep before reboot?

It's an extra safety measure to make sure that reboot hasn't had time to 
do anything before the command returns. Inspired by: 
https://unix.stackexchange.com/questions/58271/closing-connection-after-executing-reboot-using-ssh-command

>
>>               if status != 0:
>>                   bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
>>   
>> -- 
>> 2.11.0
>>
>


