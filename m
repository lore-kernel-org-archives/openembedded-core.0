Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96C386CBA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:46:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G0kAsp027522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 17:46:10 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 17:46:10 -0700
Message-ID: <525DE1D4.40109@windriver.com>
Date: Wed, 16 Oct 2013 08:46:12 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
	<E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
In-Reply-To: <E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Wed, 16 Oct 2013 00:46:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/15/2013 06:10 PM, Koen Kooi wrote:
>
> Op 15 okt. 2013, om 10:12 heeft rongqing.li@windriver.com het volgende geschreven:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Otherwise system will hang since nfs is not disconnected
>>
>> and remove the judgement of initscript DISTRO_FEATURE when install init
>> script connman, because inherit systemd will remove init script
>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>
> [..]
>
>> diff --git a/meta/recipes-connectivity/connman/connman/connman-nfs.service b/meta/recipes-connectivity/connman/connman/connman-nfs.service
>> new file mode 100644
>> index 0000000..9f9b690
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman/connman-nfs.service
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=Connection service
>> +After=syslog.target
>> +
>> +[Service]
>> +Type=dbus
>> +BusName=net.connman
>> +Restart=on-failure
>> +ExecStartPre=-/usr/lib64/connman/wired-setup
>> +ExecStart=/usr/bin/connman-nfs
>
> Those hardcoded paths aren't going to work. And isn't:
>

Thanks, I will fix it.

> ConditionKernelCommandLine!=root=/dev/nfs
>

What is your meaning?

-Roy


> A lot cleaner to use in systemd?
>

-- 
Best Reagrds,
Roy | RongQing Li

