Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACF76AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 01:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4I1qpjD006761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 May 2015 18:52:51 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 17 May 2015 18:52:51 -0700
Message-ID: <555945F2.9020708@windriver.com>
Date: Mon, 18 May 2015 09:52:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <55555B65.80600@windriver.com>
	<1431812050.4956.5.camel@linuxfoundation.org>
In-Reply-To: <1431812050.4956.5.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Mon, 18 May 2015 01:52:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/17/2015 05:34 AM, Richard Purdie wrote:
> On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
>> Hello,
>>
>> Is is useful/possible if we add something like bitbake <recipe> -cmenuconfig,
>> just like kernel's make menuconfig ?
>>
>> We can use the menuconfig to config the vars such as MACHINE, DL_DIR,
>> DISTRO_FEATURES, MACHINE_FEATURES and all the variables which are
>> configurable, I think that this would help the newbie a lot.
>>
>> I think that we can add a menuconfig.bbclass (or other names) to do this,
>> and I'd like to work on it.
>
> Why would you want to specify a <recipe> when configuring MACHINE? I
> understand why you're thinking this but it isn't well thought out and in
> this form would confuse users more than help them.
>
> I don't think the system will even parse without a valid MACHINE, let
> alone execute tasks.

Hi RP,

I meant that we need something to help configure the build easier, it
can generate something like local.conf.append, not configure the recipe.

The example "bitbake <recipe> -cmenuconfig" wasn't right enough, it's
just a rough thought, we can use the current default local.conf
(MACHINE = qemux86) to make system parse.

The problem is that we have many bbclasses in oe-core, a lot of them
has specify configurations, and also a lot of vars in the conf file such
as bitbake.conf, it's not easy to know how and what to config, especially,
for newbies. The "bitbake -cmenuconfig" maybe not a good idea, I think that
we need something to help config the build (generate local.conf) easier,
do you have any suggestions, please ?

// Robert

>
> Cheers,
>
> Richard
>
>
>

