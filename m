Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2BE70200
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:48:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6VFmEhW012750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Jul 2014 08:48:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 31 Jul 2014 08:48:14 -0700
Message-ID: <53DA653D.2050305@windriver.com>
Date: Thu, 31 Jul 2014 10:48:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Sujith H <sujith.h@gmail.com>
References: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
	<CAMKF1sqJGzLrLBpXpb7H6g8WgYZFbn6h-9=bZ1V1K_ox066Lcg@mail.gmail.com>
In-Reply-To: <CAMKF1sqJGzLrLBpXpb7H6g8WgYZFbn6h-9=bZ1V1K_ox066Lcg@mail.gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 31 Jul 2014 15:48:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/14, 10:42 AM, Khem Raj wrote:
> On Thu, Jul 31, 2014 at 7:59 AM, Sujith H <sujith.h@gmail.com> wrote:
>> +       echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hosts
>
> recipe will become MACHNE specific. Can this be done via post
> processing funcs instead ?
>

I had the same comment.  We don't want to do this in the recipe itself.  Instead 
we want to likely add a rootfs/image configuration step, like the 
zap_root_password and similar actions.

This way it can be enabled/disabled more easily based on user requirements.

--Mark

