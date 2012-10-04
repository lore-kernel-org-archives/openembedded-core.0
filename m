Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mneergaa@cisco.com>) id 1TJktH-0006Tx-6j
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 14:50:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=887; q=dns/txt; s=iport;
	t=1349354280; x=1350563880;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=NvlQQVvMQkdaMk+37hAa4Bn7LSwgltXNNXTa70HevXI=;
	b=H9SrfWswutS6wKJkY7QwVhSE0vzRQSe41DWGA78qW6GeSO2Y/uRqBHzx
	4Ii+V8ImqucUfvq2uh7DdIB1IldizaNV12I5nYnZzRtwyWi3dKJIYxZ04
	KUtSADif8Qx87w6t+Kt3d/SZ1vOfyw4s3CmN01/kCQgK83m5ysTnpnltu Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuwNAIeBbVCQ/khL/2dsb2JhbABFhUhHt2wCAgIBgQiBCIIgAQEBBBIBEFYQCxcBAgImAgIUOw4TIodjmH+NG5JvBIEhjwwyYAOVaAGOQoFpgm8
X-IronPort-AV: E=Sophos;i="4.80,535,1344211200"; d="scan'208";a="77179204"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-2.cisco.com with ESMTP; 04 Oct 2012 12:36:54 +0000
Received: from kattastrofe (dhcp-10-54-74-65.cisco.com [10.54.74.65])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q94Cas30000930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 4 Oct 2012 12:36:54 GMT
Date: Thu, 4 Oct 2012 14:36:54 +0200
From: Morten Minde Neergaard <mneergaa@cisco.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121004123654.GB26670@cisco.com>
References: <1349352468.32611.164.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1349352468.32611.164.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Only one copy of bitbake should be run against a build directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 12:50:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

At 13:07, Thu 2012-10-04, Phil Blundell wrote:
> Since updating my copy of bitbake to one which does this extra locking,
> I've come to realise that the constraint of having only one copy of
> bitbake running is a bit of a nuisance when making use of devshells.

In Message-ID: <20120924074452.GH2254@kattastrofe.rd.tandberg.com>,
Subject: [OE-core] Customize devshell terminal command / environment, I
suggested the patch found in https://gist.github.com/3774736

This patch would allow you to customize the terminal used, including
spawning a terminal that detaches itself from the bitbake. So, my setup
is: patch plus bitbake running in a screen instance plus these settings:

OE_TERMINAL = "custom"
OE_TERMINAL_CUSTOMCMD = "screen"
OE_TERMINAL_EXPORTS += "STY"

(Should I submit this (non-obtrusive) patch somewhere? (-: )


Smiles,
-- 
Morten Minde Neergaard


