Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6096570975
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 09:05:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jul 2014 02:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,770,1400050800"; d="scan'208";a="578115090"
Received: from sawijeko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.98])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2014 02:05:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Leah <leah@wolfssl.com>
Date: Thu, 31 Jul 2014 10:05:14 +0100
Message-ID: <23852972.XdYKTrkO3Z@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
References: <CAL0pqZ0w0qmwPUhtEOfc6DCMggH6t_ELWOxhpWPSCxETta-u9A@mail.gmail.com>
	<CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add recipe to openembedded, adjust layer
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
X-List-Received-Date: Thu, 31 Jul 2014 09:05:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leah,

On Wednesday 30 July 2014 11:53:34 Leah wrote:
> I have a recipe - cyassl_3.1.0.bb, a lightweight ssl library that I would
> like to add to openembedded. I am not sure as to the best location, perhaps
> recipes-connectivity? Do I need to submit this recipe the same way I would
> submit a layer?
> 
> Also, is there a way to edit my current layer's information(meta-wolfssl)
> on the openembedded layer index?

You can edit a layer's information if you are a maintainer of that layer; you 
simply create an account with the same email address as in the maintainer 
entry and then once logged in there will be an edit button on the top right of 
the layer index page.

Alternatively we're happy to make edits on request (including adding / 
replacing maintainers) if needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

