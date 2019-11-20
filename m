Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 316B67F828
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:57:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2019 03:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="209509687"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2019 03:57:48 -0800
To: openembedded-core@lists.openembedded.org
References: <CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
	<CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
	<CAMKF1spXYo2-Qor9YpPs13+EgCpxLq+f7Bc69YUXPmHwEJRdAw@mail.gmail.com>
	<20191119163036.GA4044@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f63e4c7f-c961-453a-ba91-5175675829b2@intel.com>
Date: Wed, 20 Nov 2019 11:57:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119163036.GA4044@localhost>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Wed, 20 Nov 2019 11:57:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/11/2019 16:30, Adrian Bunk wrote:
> You want meta-oe to have a LAYERDEPENDS on a new python2 layer that is
> not in meta-openembedded?

Would that be a bad thing?  Layers shouldn't care about where they are 
hosted.

My ideal would be that meta-python2 exists with both the python2 recipes 
and all of the py2 parts of meta-python.  Until meta-oe is Py3-only, it 
can either depend on this layer or recipes are blacklisted unless the 
layer is present.

Ross

