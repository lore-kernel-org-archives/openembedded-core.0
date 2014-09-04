Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8221471368;
	Thu,  4 Sep 2014 15:03:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s84F3SxC006769
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Sep 2014 08:03:29 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 08:03:28 -0700
Message-ID: <54087F3F.2040103@windriver.com>
Date: Thu, 4 Sep 2014 23:03:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 15:03:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/04/2014 10:12 PM, Burton, Ross wrote:
> Hi,
>
> Quick question of style for the community to bikeshed on:  in the
> general case should recipes be split into foo_1.2.bb and foo.inc, or
> should they only split to bb/inc if there are multiple versions and
> generally there should just be foo_1.2.bb.

I think that put the constants in .inc is helpful for upgrading, for
example, the SUMMARY, DESCRIPTION, HOMEPAGE, SECTION, inherit and so on,
they are unlikely to change when upgrade.

// Robert

>
> Specifically I'm looking at the libunwind patch for oe-core (moving
> from meta-oe) which adds libunwind_1.1.bb and libunwind.inc.
> Personally I feel that splitting them up complicates packaging and
> should only be done if there's actually multiple versions being used.
>
> Ross
>

