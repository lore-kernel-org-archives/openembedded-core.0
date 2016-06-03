Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 80AB077501
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 18:46:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 03 Jun 2016 11:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,413,1459839600"; d="scan'208";a="980381038"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2016 11:46:08 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id A427C6A4008; Fri,  3 Jun 2016 12:33:35 -0700 (PDT)
Received: from 10.252.18.48 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 3 Jun 2016 22:33:35 +0300 (EEST)
Message-ID: <54951.10.252.18.48.1464982415.squirrel@linux.intel.com>
In-Reply-To: <cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
	<cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
Date: Fri, 3 Jun 2016 22:33:35 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Mark Hatle" <mark.hatle@windriver.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] rpm: update patch to support db-6.2.23
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
X-List-Received-Date: Fri, 03 Jun 2016 18:46:08 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On 6/3/16 6:39 AM, Maxin B. John wrote:
>> Refresh the rpm-db60.patch to support db-6.2.23
>
> NAK NAK NAK
>
> Please do NOT merge this set.
>
> 6.2.23 does NOT work with the version of RPM.

Should db be updated to the latest 6.1 release then?

Generally, Mark, do you want to be the maintainer of db recipe? Since it
is so tightly coupled with rpm, and is full of nontrivial issues like
this, it makes sense that you take care of updating both.

Alex

