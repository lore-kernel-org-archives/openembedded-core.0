Return-Path: <Changqing.Li@windriver.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by mail.openembedded.org (Postfix) with ESMTP id A33AA61C77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 04:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RU1ZPl3f3doF6Xz7KbP+wbpbS+EkwUPVrdNSJvJNfxo4JaU85HpxzB6FxjgyPx4dC8m7e0Pri55SSuu3qHxy0V6ToEzJecdvNTzYBxqS0u/ym5WcDN3GNZgou+9XIgO+GmKlgpi/7zAE+2s28Hc0XmqLnqMlcjlE8ITd6C/0MoqzhaoO8VWvgWTg6N9Ql8xwJYnRTchN4fN88yEjqvfaS9X4sZO3Y4/uAv+ftMjDyi5fcS4uVjasPk/xTnv8uDWEYQa5pYxFVKsxk6H4ckUSDiQQonbZ9jDR41B6f8y1zd4fQob5H8u0ctwrTB4aL9s7aErZs35Xb0FRHMx73FCFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gyxSfhzAK+zVG/UxivJkemM2P1O76AltgYU0VM1Eyl8=;
	b=gB3ugl9u5RQxHCWvXGb3lb0RzcC4vnJjlljlleOJX9+MO0auAquOIamtI7IIZN2/LlJtgyD5OAsT1kpxS3dZokGKBmyplCC7n3rezZSrHz3WiVrPHkmzJ8ya2pEkXkUgTgdYV+TfqoZxrYkJWnGES3dPctwNYDCpDadatX9Z61x/ax/d8HcAcxAScMSY66V3YjFXhuOblobZ3WTTPQp2dsB9eQVNopEcY7KsOAGzGpW0JXqWw2W354wiQAR0fcW97P1tF2v5nWobTviEclXblr5A/H7fDmy6yko+E31yyXeSOnxKWciX6iR5k8/3kJXo4gG+s5BLrWS3ITCYw2BeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gyxSfhzAK+zVG/UxivJkemM2P1O76AltgYU0VM1Eyl8=;
	b=o7Di6sh7AkA8mt9tdt3pVZPMeGAYbnLfMavis+pMir/vJOHB5oHgf4GoaWvMzxpnKWKsRaGFq49dzi2poo9y6tU/8h2SFcaezDTEU60rnyYyYVjNJQ5cJj0+fQUx/FjPzbv16OfleICm0QEW7K5V3sNK/B8w9GGZABqYqstNTBo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
	by SN6PR11MB3038.namprd11.prod.outlook.com (2603:10b6:805:cd::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14;
	Fri, 13 Mar 2020 04:38:42 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
	([fe80::ecac:629d:9a5a:4d10]) by
	SN6PR11MB2557.namprd11.prod.outlook.com
	([fe80::ecac:629d:9a5a:4d10%7]) with mapi id 15.20.2793.013;
	Fri, 13 Mar 2020 04:38:42 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1583892804-385900-1-git-send-email-changqing.li@windriver.com>
	<1583892804-385900-2-git-send-email-changqing.li@windriver.com>
	<a47daa466bf5ed0d69e0cef7900164473b6cfa9e.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <51213a60-f041-3b60-1340-2dbea8adbb2a@windriver.com>
Date: Fri, 13 Mar 2020 12:38:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <a47daa466bf5ed0d69e0cef7900164473b6cfa9e.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR06CA0003.apcprd06.prod.outlook.com
	(2603:1096:202:2e::15) To SN6PR11MB2557.namprd11.prod.outlook.com
	(2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HK2PR06CA0003.apcprd06.prod.outlook.com (2603:1096:202:2e::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.16
	via Frontend Transport; Fri, 13 Mar 2020 04:38:41 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bfb2c99-6054-45e8-b9bf-08d7c708685e
X-MS-TrafficTypeDiagnostic: SN6PR11MB3038:
X-Microsoft-Antispam-PRVS: <SN6PR11MB303887153A7DC86B6053F9F982FA0@SN6PR11MB3038.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39850400004)(199004)(6706004)(66946007)(81156014)(44832011)(66556008)(186003)(316002)(26005)(31696002)(2906002)(16526019)(6486002)(36756003)(81166006)(86362001)(956004)(8676002)(66476007)(8936002)(5660300002)(16576012)(2616005)(6666004)(478600001)(52116002)(31686004)(53546011)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR11MB3038;
	H:SN6PR11MB2557.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2s0295RtRvMPxPfjI29avH3ayRGjA97tf9H06lHKZ8SzGf6c16iJ5xHN9DjOSpPRjtOjuWsMGqXnEHBVmFyHM/uzcKwpiEA5EpjdGtp6x39dzg84D+Sdx/0XMjVaEvPR6K4vm8qQbnx9DQ6Nyxf4ZpPFECDhbXRZA+VJxaRnp18x9L05p/r5dMFO+ff2NgtIdV9ssUHaFTK2M9y1C9iyHw4+Y5iENioemX6SCaOuJH0uun/zJ/CWnl1Ww8HL8IhflddYBfzI8nztqLaINK7ScAe2x2hZXO+ibGtK0rEgJl1qVim5tBQFmi3r0FluoK3PbmG4caYBhrqjNLsYMbNvxh18lDvZB7H2OD8eAn9yD0CL3V9rR7YZBdqW9bZVO/41XHf8pqETNcKrO0bCQ+5a41WtHokxLojqYUpWxT9NHgsdW/cbZCudbkyLk1voT1bYHnEg5jAovCA0AkSWRlMdo+aDv2yWbT1QxdqO6zLuJPuIC3heKCobiIwxplWhTJ0KRD0/sb2o27LtoZaPz0eJL3m7dPWYkgm+Zn0i2NEtR8=
X-MS-Exchange-AntiSpam-MessageData: 0nbN5mqpmRJtcMnnnU9JqQJUScEXpAC2jyCpfh5XIYFGMutCZUvtGf1sZaJU/LDWGkk5j5v5LyVyQA+vd/9oLk8yRHw6gjjZjFZMc1F2g6zWT5TxBW+DNg+SLEXJmSsKN0X1iXvyG5ngmiD8ixpjXQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfb2c99-6054-45e8-b9bf-08d7c708685e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 04:38:42.2507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL7mMzxtLsnNqXYv6gc+vztm1XOo0cSs48Cpcv1pS+RPnd36hMhr/83ta155KOcoRAUV7W2ftTtbHZP9N+uzW9+swvLYisOZVw1UaJygQHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3038
Subject: Re: [PATCH 2/2] parselogs.py: whitelist more xserver related error
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
X-List-Received-Date: Fri, 13 Mar 2020 04:38:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/11/20 4:26 PM, Richard Purdie wrote:
> On Wed, 2020-03-11 at 10:13 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> With default config, these errors always exist for
>> core-image-sato, and xserver-nodm.server start successfully,
>> these errors are not critially.
>>
>> If set default syslog to rsyslog, all these errors
>> will go into daemon.log and user.log, then test_parselog
>> will fail, so whitelist these errors
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/lib/oeqa/runtime/cases/parselogs.py | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
>> b/meta/lib/oeqa/runtime/cases/parselogs.py
>> index 6e22520..2a5e5c6 100644
>> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
>> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
>> @@ -58,7 +58,15 @@ common_errors = [
>>       "Failed to rename network interface",
>>       "Failed to process device, ignoring: Device or resource busy",
>>       "Cannot find a map file",
>> -    "[rdrand]: Initialization Failed"
>> +    "[rdrand]: Initialization Failed",
>> +    "libGL error:",
>> +    "[pulseaudio] authkey.c: Failed to open cookie file",
>> +    "[pulseaudio] authkey.c: Failed to load authentication key",
>> +    "FBIOPUT_VSCREENINFO failed, double buffering disabled",
>> +    "xserver-nodm.service: Failed with result 'exit-code'",
>> +    "xinit: server error",
>> +    "matchbox-wm: X error warning",
>> +    "X11 cannot support keycodes above 255"
>>       ]
>>   
>>   video_related = [
>> @@ -86,6 +94,8 @@ qemux86_common = [
>>       'tsc: HPET/PMTIMER calibration failed',
>>       "modeset(0): Failed to initialize the DRI2 extension",
>>       "glamor initialization failed",
>> +    "xf86OpenConsole: Switching VT failed",
>> +    "Fatal server error:",
> "Fatal server error" means the server didn't start correctly? I doubt
> we want to whitelist that one.
>
> With several of these you're right, they have been on the console for a
> while and I'm worried that a) we don't see them in the logs and b) the
> errors are occurring at all, we should really fix some of them, not
> "hide" them.
>
> Can we fix any of them rather than whitelisting?
>
> If we really do want to "hide" them, I think at the very least we need
> open bugs for some of them so we can track and fix the underlying
> problems. We need the bugs open before any patch can merge.
>
> Cheers,
>
> Richard
Thanks. I will do more research about this.
>
>
>
>
>

