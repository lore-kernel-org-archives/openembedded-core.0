Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7F41B7320F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:15:59 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2016 19:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,372,1477983600"; d="scan'208";a="43974016"
Received: from samanna-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.219])
	by orsmga005.jf.intel.com with ESMTP; 18 Dec 2016 19:15:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 19 Dec 2016 16:15:56 +1300
Message-ID: <1741618.15EvijL4zK@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1481920245-21689-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1481920245-21689-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: look for wks files in <layer>/recipes-images
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
X-List-Received-Date: Mon, 19 Dec 2016 03:16:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

On Fri, 16 Dec 2016 22:30:45 Ed Bartosh wrote:
> Currently wic looks for wks files in
> <layer dir>/scripts/lib/wic/canned-wks/ directories.
> This path is too nested and doesn't look consistent with the
> naming scheme of layer directories.
>
> Added 'recipes-images' directory to the list of paths
> to look for wks files.

I agree we ought to change this, but "recipes-images" isn't especially 
consistent with how paths are used in OE layers. Recipes are found using 
BBFILES, and at least in OE-Core its meta/recipes-*/*/*.bb - i.e. one layer 
down from recipes-images.

If I were to suggest an alternative it would be to just use a different name 
that doesn't imply connection with how images are found (e.g. "canned-wks" or 
"wic" or something like that).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

