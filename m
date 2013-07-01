Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66D996AF21
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 01:53:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r611rG5F024130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 30 Jun 2013 18:53:16 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 30 Jun 2013 18:53:14 -0700
Message-ID: <51D0E0EA.5040902@windriver.com>
Date: Mon, 1 Jul 2013 09:52:42 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1371802236.git.kai.kang@windriver.com>
	<7a0305f34aa1f986856e699b69242e353986b6dc.1371802236.git.kai.kang@windriver.com>
	<5322253.NAOJVtts1F@helios>
In-Reply-To: <5322253.NAOJVtts1F@helios>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: add configure options libaio and acl
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
X-List-Received-Date: Mon, 01 Jul 2013 01:53:18 -0000
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit

On 2013Äê06ÔÂ29ÈÕ 01:16, Paul Eggleton wrote:
> On Friday 21 June 2013 16:12:21 Kai Kang wrote:
>> Add strace configure options libaio and acl to enable or disable build
>> with them. Then PACKAGECONFIG can be used to handle dependency.
>>
>> Set "libaio" as a default feature of PACKAGECONFIG.
>> ...
>>
>> +PACKAGECONFIG_class-target ?= "libaio"
>> +PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl',
>> 'acl', '', d)}"

Hi Paul,

> I realise this has already been merged, but I think there are a couple of issues
> with the above. Firstly, for consistency, I think the first option should be
> called "aio" and not "libaio". 
OK, I'll update it.

> Secondly, although this seems to work the use
> of overrides, += and ?= together is a little bit confusing. Perhaps the following
> would be a bit clearer:
>
> PACKAGECONFIG_class-target ?= "aio \
>                                ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
I considered this way.
When 'acl' in distro feature, I want strace enable acl support. But
PACKAGECONFIG could be overwritten that even 'acl' in distro feature but
not in 'PACKAGECONFIG'.

Thanks,
Kai

>
> Cheers,
> Paul
>


-- 
Regards,
Neil | Kai Kang


