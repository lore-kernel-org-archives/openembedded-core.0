Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPbkO-0003dB-Nz for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 16:41:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QEc9kf016470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:38:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16049-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:38:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QEc2TR016464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:38:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306407015.2525.311.camel@phil-desktop>
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<1306407015.2525.311.camel@phil-desktop>
Date: Thu, 26 May 2011 15:37:59 +0100
Message-ID: <1306420679.27470.186.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 May 2011 14:41:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 11:50 +0100, Phil Blundell wrote:
> On Wed, 2011-05-25 at 22:02 -0700, Darren Hart wrote:
> > COMPATIBLE_MACHINES is not easily extended due to
> > its regex syntax: "(machine_a|machine_b)", making it difficult to extend the
> > u-boot recipe in bbappend files without resorting to machine specific overrides.
> 
> Not that I have an objection to your patch, but I think this remark
> about COMPATIBLE_MACHINE is wrong.  AFAIK, you can disregard the
> parenthesis and just splice extra alternates on the end, viz:
> 
> COMPATIBLE_MACHINE_append = "|mymachine"
>
> so there oughtn't to be any reason, in general, for .bbappends to have a
> hard time extending that field.

u-boot in OE-Core would need something like COMPATIBLE_MACHINE = ""
which makes this harder.

Its usually seem to work out easier to just do:

COMPATIBLE_MACHINE_mymachine = "mymachine"

which avoids several potential issues.

Cheers,

Richard



