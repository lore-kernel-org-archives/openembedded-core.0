Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 87633719F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:12:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 17 Nov 2016 09:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,506,1473145200"; d="scan'208";a="787659800"
Received: from brfu-mobl2.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.154.192])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2016 09:12:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Nov 2016 06:12:29 +1300
Message-ID: <6218991.02WXMRo2H0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LYTbP3h5T+YEMiESUCwq0YM6QXtj5+_nr0ZWMH1Z3mhNQ@mail.gmail.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<20161117065519.7693.7868@do.openembedded.org>
	<CAJTo0LYTbP3h5T+YEMiESUCwq0YM6QXtj5+_nr0ZWMH1Z3mhNQ@mail.gmail.com>
MIME-Version: 1.0
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEZpeGVzIGZvciBlU0RLIGFuZCB0ZXN0c2RrZXh0?=
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
X-List-Received-Date: Thu, 17 Nov 2016 17:12:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 17 Nov 2016 09:02:21 Burton, Ross wrote:
> On 17 November 2016 at 06:55, Patchwork <
> 
> patchwork@patchwork.openembedded.org> wrote:
> > * Patch            [7/8] oeqa/sdkext/devtool.py: skip
> > test_extend_autotools_recipe_creation when no libxml2
> > 
> >   Issue            Commit shortlog is too long [test_shortlog_length]
> >   Suggested fix    Edit shortlog so that it is 80 characters or less
> > 
> > (currently 82 characters)
> 
> I'm not sure we've ever been super-strict on this, so I'm wondering if
> warning over 90 is sensible so that we allow an extra two characters when
> function names are long but still detect when someone has put an essay in
> the first line (which does happen if the submitter isn't aware of the git
> convention).

Yep I'd support that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

