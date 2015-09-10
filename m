Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 147EF60132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 18:07:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 10 Sep 2015 11:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,506,1437462000"; d="scan'208";a="802487845"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2015 11:07:51 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 235A26A4087; Thu, 10 Sep 2015 11:06:59 -0700 (PDT)
Received: from 10.252.58.194
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 10 Sep 2015 21:06:59 +0300 (EEST)
Message-ID: <57616.10.252.58.194.1441908419.squirrel@linux.intel.com>
In-Reply-To: <55F1A3D3.30106@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com> <55F16E82.1070708@gmail.com>
	<55F172C9.3030601@linux.intel.com> <55F1A3D3.30106@gmail.com>
Date: Thu, 10 Sep 2015 21:06:59 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "akuster808" <akuster808@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 18:07:53 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> And the autobuilder could automatically reject or flag a patch that adds
>> custom 'Pending' patches, if the patch author is determined to be on the
>> 'naughty' list :-)
>
> That might just alter peoples behavior and change them to use
> "Submitted" and still not do anything. It does not address the issue.

Of course 'Submitted' must include a proof link of the submission, or a
notice that the only way to submit upstream is by private email (which is
very rare). Such link is necessary anyway to follow up later what happened
with the submission.

Regards,
Alex

