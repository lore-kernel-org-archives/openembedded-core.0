Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF397808D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 17:16:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 10:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; d="scan'208";a="1154194079"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2017 10:16:19 -0700
Message-ID: <1496078693.26945.48.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 May 2017 12:24:53 -0500
In-Reply-To: <CAJTo0LZUsLuPFgEb-G79VVhBxsNKstenHgk_V-njU51YRGotAg@mail.gmail.com>
References: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LaJrNTwML2jQbPR+p5y3EOnwm=D2nDiD5VcHtfer8m+gA@mail.gmail.com>
	<1495658864.26945.1.camel@linux.intel.com>
	<CAJTo0LZUsLuPFgEb-G79VVhBxsNKstenHgk_V-njU51YRGotAg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package_ipk: correct ipk descriptions
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
X-List-Received-Date: Mon, 29 May 2017 17:16:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-24 at 23:08 +0100, Burton, Ross wrote:
> 
> On 24 May 2017 at 21:47, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>         I will check that particular recipe and bb world just so see
>         if some
>         other recipe is broken with this change, then provide a v3.
>         
> 
> And double check what opkg expects :)
> 
Right.  in my narrow Google search I can see that ipk is poorly
documented but this is what I found from web archive [1]

"Description should be a short, (less than 80 characters) description of
the program. It may also include a long description on subsequent lines,
(each indented by a single space character). Blank lines in the long
description may be indicated by a line consisting of a space character
followed by a period, ie " ."


So a multiline description, every line (including the first one) must
have a leading space. I tried the latter and worked so v3 to be sent
soon.


https://web.archive.org/web/20100727133051/http://handhelds.org:80/moin/moin.cgi/BuildingIpkgs
> 
> Ross



