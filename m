Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC306DF30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 08:58:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB8wns8020446
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Dec 2013 00:58:50 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 11 Dec 2013 00:58:48 -0800
Message-ID: <52A82947.5000405@windriver.com>
Date: Wed, 11 Dec 2013 16:58:47 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>,
	<openembedded-core@lists.openembedded.org>
References: <1385647771-24485-1-git-send-email-sledz@dresearch-fe.de>
	<52A5D813.8020803@dresearch-fe.de> <52A6DBB9.50700@windriver.com>
	<52A81F91.8020105@dresearch-fe.de>
In-Reply-To: <52A81F91.8020105@dresearch-fe.de>
Subject: Re: [PATCH][for-dora] gdb-7.6: fix cygwin check in configure script
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
X-List-Received-Date: Wed, 11 Dec 2013 08:58:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/11/2013 04:17 PM, Steffen Sledz wrote:
> On 10.12.2013 10:15, Robert Yang wrote:
>> Thanks, applied to dora-next.
>
> Great. Thanx.
>
> Just for my understanding. May be i somehow overlooked relevant announcements.
>
> * Where is the dora-next branch available (not at git://git.openembedded.org/openembedded-core if i'm looking right)?

The dora-next is still in developing, not stable if you need the dev
branch, it is here:

# For poky:
git://git.pokylinux.org/poky-contrib robert/dora-next

# For oe-core only:
git://git.pokylinux.org/poky-contrib robert/dora-next-oecore

> * And what is the policy about dora-next and dora?
>

dora is the stable branch, dora-next isn't, dora-next is based on
dora, it will be merged into dora when reviewed and approved.

// Robert

> Steffen
>

