Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CD74C71C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 12:15:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 05:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="1166091566"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2017 05:15:49 -0700
Date: Mon, 8 May 2017 15:16:44 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170508121643.GA7360@mbabyjoh-desk.ger.corp.intel.com>
References: <1494244017-3933-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZfcvtMKTXbpjVp9v14SOsFLbQZEXKCV_gdJ5ddzkg-wA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZfcvtMKTXbpjVp9v14SOsFLbQZEXKCV_gdJ5ddzkg-wA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: upgrade to 1.34
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
X-List-Received-Date: Mon, 08 May 2017 12:15:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Mon, May 08, 2017 at 01:04:54PM +0100, Burton, Ross wrote:
>>On 8 May 2017 at 12:46, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    +PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
>>    +PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
> What happens if neither iptables or nftables is specified?

In that case, build fails with " Xtables library is required". 

We have provided "iptables" as the default choice in PACKAGECONFIG though. 

> Ross

Best Regards,
Maxin

