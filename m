Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CA4CA72F89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 11:44:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 03:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,219,1484035200"; d="scan'208";a="53910941"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2017 03:44:41 -0800
Received: from drozhkov-desk.fi.intel.com (drozhkov-desk.fi.intel.com
	[10.237.72.60])
	by linux.intel.com (Postfix) with ESMTP id 808476A4080;
	Tue, 28 Feb 2017 03:44:39 -0800 (PST)
Message-ID: <1488282279.3608.169.camel@linux.intel.com>
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 28 Feb 2017 13:44:39 +0200
In-Reply-To: <1488279122.7785.34.camel@intel.com>
References: <1487690288-18275-1-git-send-email-dmitry.rozhkov@linux.intel.com>
	<1488279122.7785.34.camel@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu: avoid overridden user input for bootparams
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
X-List-Received-Date: Tue, 28 Feb 2017 11:44:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-28 at 11:52 +0100, Patrick Ohly wrote:
> On Tue, 2017-02-21 at 17:18 +0200, Dmitry Rozhkov wrote:
> > 
> > Currently runqemu hardcodes the "ip=" kernel boot parameter
> > when configuring QEMU to use tap or slirp networking. This makes
> > the guest system to have a network interface pre-configured
> > by kernel and causes systemd to fail renaming the interface
> > to whatever pleases it:
> > 
> >   Feb 21 10:10:20 intel-corei7-64 systemd-udevd[201]: Error
> > changing
> >       net interface name 'eth0' to 'enp0s3': Device or resource
> > busy,
> > 
> > Always append user input for kernel boot params after the ones
> > added by the script. This way user input has priority over
> > runqemu's
> > default params.
> 
> Presumably the user's bootparams then would include "ip="?

Yes, exactly that. "ip=" in the user's bootparams is the input that
shouldn't be ignored.

> Either way, the change looks good to me. I did something similar for
> the
> qemu parameters in "runqemu: let command line parameters override
> defaults".
> 

BR,
Dmitry

