Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2F773C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 17:08:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 05 May 2015 10:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,373,1427785200"; d="scan'208";a="705638505"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.31]) ([10.218.98.31])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2015 10:08:35 -0700
Message-ID: <1430845713.29908.4.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Andrea Di Chiara <andrea.dichiara79@gmail.com>
Date: Tue, 05 May 2015 14:08:33 -0300
In-Reply-To: <5548F63F.6090800@gmail.com>
References: <5548F63F.6090800@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: upstart init manager
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
X-List-Received-Date: Tue, 05 May 2015 17:08:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrea,

I would totally suggest you to use systemd which it does as the same as
upstart but it has more features and it is a lot faster.

However, if you really want to use it, you should verify if you have a
recipe for upstart on your yocto.

If not, you could create it, or search if there is one created. I think
you will find it on meta-freescale or something like this.

Regards,

On Ter, 2015-05-05 at 18:56 +0200, Andrea Di Chiara wrote:
> Hi,
> I'm building my own distribution using Yocto Project and I'm trying to 
> setup Upstart as init manager. In my local.conf I have added these lines:
> 
> DISTRO_FEATURES_append = “ upstart”
> VIRTUAL-RUNTIME_init_manager = “upstart”
> 
> but no recipe seems to exist. Am I wrong? I have searched through 
> openembedded layers but I found only a recipe for WebOS distribution. Is 
> it possible to use it with Yocto Dora or Yocto Daisy? There is another 
> recipe?
> 
> thank you for the attention,
> best regards,
> Andrea
> 



