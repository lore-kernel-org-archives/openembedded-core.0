Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C199C731D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:22:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jan 2016 02:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,288,1449561600"; d="scan'208";a="632707723"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2016 02:22:12 -0800
Date: Wed, 13 Jan 2016 12:24:32 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160113102432.GA5979@mbabyjoh-mobl.fi.intel.com>
References: <1452615632-5232-1-git-send-email-maxin.john@intel.com>
	<1452615632-5232-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LY1Zqd6qtve-LBaDKikidHihhjxGwhEWsQrkNouzAtK6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY1Zqd6qtve-LBaDKikidHihhjxGwhEWsQrkNouzAtK6A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sqlite3: upgrade to version 3.10.0
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
X-List-Received-Date: Wed, 13 Jan 2016 10:22:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Jan 12, 2016 at 06:44:35PM +0000, Burton, Ross wrote:
>>On 12 January 2016 at 16:20, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    3.9.2 -> 3.10.0
>>
>>        Fixed a parallel build problem.
>>
>
>        buildhistory-diff reports:
>
>        packages/corei7-64-poky-linux/sqlite3/sqlite3-dbg: RRECOMMENDS: removed "readline-dbg"
>        packages/corei7-64-poky-linux/sqlite3/sqlite3: RDEPENDS: removed all items "readline (['>= 6.3'])"
>
>        Which indicates that sqlite3 has a non-deterministic and autodetected dependency on readline.  Can you add a PACKAGECONFIG or similar for this please?

Sure. Thanks for noticing it. I will send v2 with PACKAGECONFIG for readline.

>        Ross
Thanks and Regards,
Maxin

