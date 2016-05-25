Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CDA8460767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 12:17:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 25 May 2016 05:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="814504054"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 25 May 2016 05:17:27 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 7BA4C6A4083; Wed, 25 May 2016 06:04:56 -0700 (PDT)
Received: from 10.252.8.31 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 25 May 2016 16:04:56 +0300 (EEST)
Message-ID: <51142.10.252.8.31.1464181496.squirrel@linux.intel.com>
In-Reply-To: <1464159563.9570.90.camel@linuxfoundation.org>
References: <57453968.9080600@mlbassoc.com>
	<60AB59B2-92D3-426A-8EB8-9FC717EC087E@gmail.com>
	<57454A49.7030700@mlbassoc.com>
	<1464159563.9570.90.camel@linuxfoundation.org>
Date: Wed, 25 May 2016 16:04:56 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: sip.bbclass?
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
X-List-Received-Date: Wed, 25 May 2016 12:17:34 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Nothing in OE-Core uses extrenalsrc directly but we'd still want
> something like that in the core so I don't think the rule is absolute.
> What we wouldn't want to see is multiple layers maintaining different
> and potentially incompatible versions of a class file.
>
> That said, I think there are a few that we probably could clean up.

As for sip.bblclass, nothing is using it in oe-core or meta-oe. So I just
removed it as a part of oe-core py3 patchset, because it's doing some
python 2 based magic, and I can't figure out what exactly without any
recipes to test with.

Alex

