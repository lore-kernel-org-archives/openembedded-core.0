Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B92A61037;
	Fri, 16 Aug 2013 01:38:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G1cVEJ011985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Aug 2013 18:38:31 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 15 Aug 2013 18:38:30 -0700
Message-ID: <520D8297.1040405@windriver.com>
Date: Fri, 16 Aug 2013 09:38:31 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130724102648.6C85050201@opal> <20130815174752.GE17945@jama>
In-Reply-To: <20130815174752.GE17945@jama>
X-Originating-IP: [128.224.162.233]
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : useradd.bbclass: add a new base class and code refactor
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
X-List-Received-Date: Fri, 16 Aug 2013 01:38:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2013 01:47 AM, Martin Jansa wrote:
> On Wed, Jul 24, 2013 at 10:26:48AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 2a57bb7e9a7e154578aa7cb9aeebdf398a54ec00
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=2a57bb7e9a7e154578aa7cb9aeebdf398a54ec00
>>
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> Date:   Fri Jul 19 09:52:25 2013 +0800
>>
>> useradd.bbclass: add a new base class and code refactor
>>
>> Add a new base class, useradd_base.bbclass, which is mainly a
>> collection of basic functions for user/group settings.
>>
>> The useradd_base.bbclass is intended to be inherited by useradd.bbclass
>> and the extrausers.bbclass to avoid code cuplication.
> This code is calling bbwarn in postinst scripts, but only implementation
> I've found is in logging.bbclass and isn't included in postinst shell
> code causing:
>
> /tmp/opkg-HtXU0e/dbus-1-Ea0TSc/preinst: 15:
> /tmp/opkg-HtXU0e/dbus-1-Ea0TSc/preinst: bbwarn: not found
Hi Martin,

I'm really sorry for this trouble. I didn't notice this when I first 
made the patch.

I'll send out a patch to fix this.

Thanks for reporting this.

Best Regards,
Chen Qi

