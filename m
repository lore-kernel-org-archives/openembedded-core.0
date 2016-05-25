Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 419166FF23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 12:01:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2016 05:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="110210078"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 25 May 2016 05:01:00 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 30BD56A4008; Wed, 25 May 2016 05:48:29 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 15:48:29 +0300 (EEST)
Message-ID: <51048.10.252.8.31.1464180509.squirrel@linux.intel.com>
In-Reply-To: <20160524180648.GA7403@ad.chargestorm.se>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
	<20160524180648.GA7403@ad.chargestorm.se>
Date: Wed, 25 May 2016 15:48:29 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Robert Yang" <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Wed, 25 May 2016 12:01:14 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> * Robert Yang <liezhi.yang@windriver.com> [160524 05:25]:
>
>> They were required by buildtools-tarball, now replaced by python3 ones.
>
> Do you plan to add those recipes to meta-python?
>
> I think quite a few of them are usefull for quite some situations.

Oe-core does provide Python 3 versions of these recipes. Does meta-python
really need to add more Python 2 stuff which may not be actually used by
anyone? Maybe it's time to draw the line?

Alex


