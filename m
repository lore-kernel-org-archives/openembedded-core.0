Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C9A5665C5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:52:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 14 Nov 2016 06:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,638,1473145200"; d="scan'208";a="191196142"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2016 06:52:10 -0800
Received: from drozhkov-desk.fi.intel.com (drozhkov-desk.fi.intel.com
	[10.237.72.60])
	by linux.intel.com (Postfix) with ESMTP id 133766A4080;
	Mon, 14 Nov 2016 06:51:30 -0800 (PST)
Message-ID: <1479135128.4026.360.camel@linux.intel.com>
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 16:52:08 +0200
In-Reply-To: <20161110061149.20570-1-raj.khem@gmail.com>
References: <20161110061149.20570-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [RFT][PATCH] systemd: Upgrade to 232
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
X-List-Received-Date: Mon, 14 Nov 2016 14:52:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-11-09 at 22:11 -0800, Khem Raj wrote:
> * Drop support for rcS.d SysV init scripts.
>   These are prone to cause dependency loops, and almost all packages
> with
>   rcS scripts now ship a native systemd service.
> 
> * Drop mount propagation patch, it only happens with libseccomp, OE
> doesnt
>   enable it
> 
> * kdbus option has disappeared from configure
> 
> * Ignore dev-so for PN now since systemd introduced private .so see
>   https://github.com/systemd/systemd/issues/3810
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I've "smoke"-tested systemd-resolved's new functionality: seems to work
as expected and I haven't noticed regressions so far in the rest of
SystemD.

BR,
Dmitry

