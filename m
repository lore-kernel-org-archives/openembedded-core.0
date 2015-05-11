Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8325E60043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 22:25:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 11 May 2015 15:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,411,1427785200"; d="scan'208";a="492288715"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.23]) ([10.218.98.23])
	by FMSMGA003.fm.intel.com with ESMTP; 11 May 2015 15:24:52 -0700
Message-ID: <1431383081.3137.4.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 11 May 2015 19:24:41 -0300
In-Reply-To: <1431381853.3920.17.camel@pbcl.net>
References: <1431367371-7716-1-git-send-email-bruno.bottazzini@intel.com>
	<1431367371-7716-2-git-send-email-bruno.bottazzini@intel.com>
	<1431381853.3920.17.camel@pbcl.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 1/3] dbus: split tools package.
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
X-List-Received-Date: Mon, 11 May 2015 22:25:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Seg, 2015-05-11 at 23:04 +0100, Phil Blundell wrote:
> On Mon, 2015-05-11 at 15:02 -0300, Bruno Bottazzini wrote:
> > +FILES_${PN}-tools += "${bindir}/dbus-uuidgen \
> 
Hello Phil,

It is a post-install script of a Dbus package.

Best Regards,

Bruno Bottazzini


> Doesn't the dbus startup script use dbus-uuidgen?
> 
> p.
> 
> 



