Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E743F6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 12:14:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 05:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="110216780"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 25 May 2016 05:14:11 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 0FA026A4008; Wed, 25 May 2016 06:01:40 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 16:01:39 +0300 (EEST)
Message-ID: <51113.10.252.8.31.1464181299.squirrel@linux.intel.com>
In-Reply-To: <e0ab0ad1-fb6d-a8a0-a31f-913b9fa4dcc2@windriver.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<e0ab0ad1-fb6d-a8a0-a31f-913b9fa4dcc2@windriver.com>
Date: Wed, 25 May 2016 16:01:39 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Mark Hatle" <mark.hatle@windriver.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/45] Move recipes to use Python 3 whenever possible
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
X-List-Received-Date: Wed, 25 May 2016 12:14:12 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Consequently, rpm's python bindings (required by smartpm) stay at python
>> 2 as well
>> for now, even tough python 3 seems to be supported.
>
> Is there a porting guide or similar that can used to help identify what
> types of
> changes are needed.  I am not at all familiar with what python 3 needs
> specifically, but I do expect we will need to port these items.

Of course, there's a ton of such guides on the net. Here's the official one:
https://docs.python.org/3/howto/pyporting.html

> The yum version of createrepo will not work.  We need to port forward the
> component as appropriate -- or modify smartpm to use a newer version --
> assuming
> we can add missing pieces, as necessary.  (key is smartpm and createrepo
> need to
> be kept in sync.)

Can you say why it won't work, specifically, if we also replace smartpm
with yum or dnf at the same time? The only alternative I see is that we
have to fork the old version of createrepo and the abandoned upstream of
smartpm, port them to Python 3, and maintain them going forward - not a
light undertaking.

> Please create one (or three) defects and assign them to me for smartpm,
> createrepo, and rpm python3 support.  (I doubt I'll be the one doing the
> work,
> but I'll do my best to find someone to do the work.)

Yes, I'll do that now.

>> 5) LSB spec is implicitly requiring Python 2 (via requirement for
>> '/usr/bin/python').
>
> I expect the LSB will require python 2 for a while.  So we will need to
> continue
> to ensure that python 2 works, as well as python3.

Of course, Python 2 will be supported by upstream at least until 2020, and
so it'll be provided by oe-core at least until then. 2.7.12 should appear
soon.

Alex


