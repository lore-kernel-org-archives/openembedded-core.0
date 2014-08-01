Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36115701CD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 00:20:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s710KvNX018895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 17:20:57 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 31 Jul 2014 17:20:56 -0700
Message-ID: <53DADD68.8070008@windriver.com>
Date: Thu, 31 Jul 2014 19:20:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>	<ly8un9biuj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKpYgA9jQ2u4Nwh2=+NoQJcZiydtZdkDu0-jvnKfZxHvvg@mail.gmail.com>
In-Reply-To: <CAP9ODKpYgA9jQ2u4Nwh2=+NoQJcZiydtZdkDu0-jvnKfZxHvvg@mail.gmail.com>
Subject: Re: [PATCH] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Fri, 01 Aug 2014 00:21:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/14, 3:44 PM, Otavio Salvador wrote:
> On Thu, Jul 31, 2014 at 1:20 PM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
>> Sujith H <sujith.h-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> +     echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hosts
>>
>> This is a very questionable setup which causes a lot of harm.  When
>> really wanted, it should be made optional and not the default.
>
> What kind of harm you see?
>
> I think moving this to postinst works for me and does not cause
> problems I think.
>

The only default configuration for 127.0.0.1 (not 1.1) should be localhost. 
Anything after that is installation independent and should be configured outside 
of the 'package' scope...

I recommend ROOTFS_POSTINSTALL_COMMAND...

--Mark

