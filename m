Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A59937021B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 08:02:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B82GVf027549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jul 2014 01:02:16 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Fri, 11 Jul 2014 01:02:16 -0700
Message-ID: <53BF9A05.1020100@windriver.com>
Date: Fri, 11 Jul 2014 16:02:13 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1404869333.git.Chong.Lu@windriver.com>
	<b7aeaae2912f4cbaf11091a64c8c620574ec4e2d.1404869333.git.Chong.Lu@windriver.com>
	<53BF3CF3.609@windriver.com>
	<5076045.c5iu4589rZ@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <5076045.c5iu4589rZ@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/insane: Show QA check name
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
X-List-Received-Date: Fri, 11 Jul 2014 08:02:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/11/2014 01:45 PM, Paul Eggleton wrote:
> Hi Chong,
>
> On Friday 11 July 2014 09:25:07 Chong Lu wrote:
>> On 07/09/2014 09:39 AM, Chong Lu wrote:
>>> QA errors/warnings would show the name of the QA failure in the
>>> error/warning message.>
>>> The format is listed:
>>> 	[The name of QA] QA Issue: messages
>>>
>>> You can see which QA check you need to disable if you want to disable it.
> The way I had envisaged this being shown was <message> [QA check name]; since
> the message is the important part (in general we really want to encourage
> people to fix the QA issues rather than disabling them). This also matches up
> with gcc's warning message behaviour.
>
> Cheers,
> Paul
>
Hi Paul,

Thanks your reply. I will change format of message and resend a V2.

Best Regards
Chong

