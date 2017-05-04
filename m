Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9332577AC0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 10:08:18 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 03:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="97135921"
Received: from othmanm-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.26])
	by fmsmga005.fm.intel.com with ESMTP; 04 May 2017 03:08:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 04 May 2017 22:07:09 +1200
Message-ID: <2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <24ebf3f4-9855-8aea-7019-3951973d37e1@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<2897866.bodmxEm400@peggleto-mobl.ger.corp.intel.com>
	<24ebf3f4-9855-8aea-7019-3951973d37e1@linux.intel.com>
MIME-Version: 1.0
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOiB1cGRhdGUgdG8gMi4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Thu, 04 May 2017 10:08:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Thursday, 4 May 2017 9:33:02 PM NZST Alexander Kanavin wrote:
> On 05/04/2017 12:43 AM, Paul Eggleton wrote:
> > On Thursday, 4 May 2017 1:31:52 AM NZST Patchwork wrote:
> >> * Issue             Series sent to the wrong mailing list
> > [test_target_mailing_list]
> >>   Suggested fix    Send the series again to the correct mailing list (ML)
> >>   Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/
cgit/
> > cgit.cgi/poky/]
> >
> > Leo - looks like this is another false positive.
> 
> Actually, no - one of the patches accidentally included a file from 
> meta-poky. Still, could be reported better:
> 
> 1) Should refer to a specific patch where the issue is
> 2) Should, if possible, refer to specific files in the patch that are 
> causing the problem.

Right, agreed on both counts. I guess we were trying to catch the more common 
case of people sending entire patchsets to the wrong list.

> 3) The problem is not the wrong mailing list, the problem is that the 
> patch should be splitted up and sent to several lists :)

The question is can an automated tool tell the difference? I guess even if it 
can't though we can be honest about that in the message i.e. "Wrong mailing 
list, or incorrectly split patch" or something like that.

> In general, why run these checks after the patches have been already 
> posted for review? That is adding unnecessary friction. Why not have 
> them as a git hook, that is run locally when making the commit?

The original idea was that the tests could also be run from your local machine 
(could easily be as a git hook), and whilst it's not as easy as I might have 
liked it is doable - however even if it were much easier, we have to be 
realistic and acknowledge that most people still won't do it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

