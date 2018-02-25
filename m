Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB5B7874E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:56:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 13:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,394,1515484800"; d="scan'208";a="177997048"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by orsmga004.jf.intel.com with ESMTP; 25 Feb 2018 13:56:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Date: Mon, 26 Feb 2018 10:56:15 +1300
Message-ID: <253268833.XyhE8v2TBP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <bb76902073b54d2bba0774471fd64543@XBOX04.axis.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
	<e1e012bd3bb79e363b65b911f805989301f4188f.1519354910.git.paul.eggleton@linux.intel.com>
	<bb76902073b54d2bba0774471fd64543@XBOX04.axis.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] lib/oe/path: implement is_path_under()
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
X-List-Received-Date: Sun, 25 Feb 2018 21:56:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ola,

On Friday, 23 February 2018 8:42:34 PM NZDT Ola x Nilsson wrote:
> > +def is_path_under(path1, possible_parent):
> 
> Changing the signature to is_path_under(possible_parent, *paths) will make
> the list management more natural.

Right, it does simplify things a little. In fact given the parameter order is 
changing I'll rename it to is_path_parent() at the same time.

> This function will return True if path1 is the empty list. Is that
> intentional?

I don't believe so. I'll change the function to return False in that case, 
well spotted.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



