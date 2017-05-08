Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B09FF71A05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 11:03:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 08 May 2017 04:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="965759039"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2017 04:02:59 -0700
Date: Mon, 8 May 2017 14:02:24 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20170508110223.GA22705@mbabyjoh-desk.ger.corp.intel.com>
References: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
	<CAHiDW_EKjU-5n3DgXmos36giMwbw-Xajk=s6M3iCoN30rOZvhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EKjU-5n3DgXmos36giMwbw-Xajk=s6M3iCoN30rOZvhA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] connman: upgrade to 1.34
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
X-List-Received-Date: Mon, 08 May 2017 11:03:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jussi,

On Mon, May 08, 2017 at 01:55:19PM +0300, Jussi Kukkonen wrote:
 >>PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 >>+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
         
 > The default is "--with-firewall=iptables", I think it would be reasonable to 
 > make that explicit in the packageconfig line. Also, the iptables dependency 
 > is probably only needed in the iptables case?
 
 Sounds reasonable. Will update as per your suggestion and resend it.

 >  Jussi

 Best Regards,
 Maxin

