Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B24367319F;
	Fri,  5 Aug 2016 08:39:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 05 Aug 2016 01:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,473,1464678000"; d="scan'208";a="1008909324"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2016 01:39:32 -0700
Date: Fri, 5 Aug 2016 11:40:30 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160805084029.GA1920@mbabyjoh-desk.ger.corp.intel.com>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195648.2D3B95017B@opal.openembedded.org>
	<CA+chaQfEmQ9jAMZB6CTDw3m_6tqQ_AyNCffRjtjz_qrtuz+8Gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfEmQ9jAMZB6CTDw3m_6tqQ_AyNCffRjtjz_qrtuz+8Gw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 10/10: packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Fri, 05 Aug 2016 08:39:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

>On Thu, Aug 04, 2016 at 10:10:07PM +0200, Martin Jansa wrote:
>NAK pointercal-xinput is useless without xinput-calibrator.
>
>Just remove pointercal and let x11-common pull xinput-calibrator with pointercal-xinupt by RRECOMMENDS.

Thank you very much for reviewing it. Will update the patches as per your suggestion.

On Thu, Aug 4, 2016 at 9:56 PM, <git@git.openembedded.org> wrote:
>> rpurdie pushed a commit to branch master-next in repository openembedded-core.
>>
>> commit 7242599ff64e40d24383dd1852616a8f99416d0d
>> Author: Maxin B. John <maxin.john@intel.com>
>> AuthorDate: Tue Jul 12 17:07:41 2016 +0300
>> packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput

Thanks and Regards,
Maxin

