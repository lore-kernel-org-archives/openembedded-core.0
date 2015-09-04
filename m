Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75FD674242
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:11:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 04 Sep 2015 05:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="782611221"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2015 05:11:07 -0700
Message-ID: <55E98AC2.7050107@linux.intel.com>
Date: Fri, 04 Sep 2015 15:12:50 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYdE-XZkCASy9n3uuL_HrrFTZKC5a3aA0Mj4FU4kOPnew@mail.gmail.com>
	<CAHiDW_EOBOQEzZbQRa7kyapoNWTod-pNDtZQ90u6e0fVv+=OSg@mail.gmail.com>
In-Reply-To: <CAHiDW_EOBOQEzZbQRa7kyapoNWTod-pNDtZQ90u6e0fVv+=OSg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 12:11:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2015 02:56 PM, Jussi Kukkonen wrote:

> I don't think it's likely but there is a chance that gnome-icon-theme
> contained icons that Adwaita does not provide (comparing them all turned
> out to be tricky). So double-checking how pcmanfm looks with Adwaita
> might make sense in any case.

I just did some tests and indeed pcmanfm looks bad when there is no icon 
theme at all, or when there is gnome-icon-theme, but looks ok with 
adwaita. So it needs a soft dependency on that, and gnome-icon-theme can 
still be dropped. If we find any other app that needs icons, then 
adwaita is the provider (which reminds me, I need to put the same 
dependency into epiphany recipe).

Alex


