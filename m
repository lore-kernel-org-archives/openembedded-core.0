Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpMeB-0001RY-LO for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:49:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75FiqNs013486
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 16:44:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13182-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 16:44:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75Fikn1013480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 16:44:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312558899.6733.23.camel@phil-desktop>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
	<1312495032.3169.6.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
	<1312530654.3169.12.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F892@orsmsx504.amr.corp.intel.com>
	<1312558899.6733.23.camel@phil-desktop>
Date: Fri, 05 Aug 2011 16:44:22 +0100
Message-ID: <1312559062.14274.114.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Fri, 05 Aug 2011 15:49:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 16:41 +0100, Phil Blundell wrote:
> On Fri, 2011-08-05 at 08:37 -0700, Kamble, Nitin A wrote:
> > Changing TARGET_ARCH is not correct way to handle it. Because HW/ARCH is 
> > not different, the difference is in the ABI of the OS. 
> 
> Well, I'm not entirely sure I agree with what you're saying here.  There
> are at least a few precedents for encoding ABI details (eg hardfloat
> parameter passing, endianness) into TARGET_ARCH, and it seems to me that
> they belong there more naturally than in TARGET_OS.

Equally, there are several precedents for encoding ABI into TARGET_OS,
arm-gnueabi springs to mind...

It really comes down to the formats that the various magic files accept
and whilst its the regexps are lax on arm, they are less lax on x86 and
I suspect the TARGET_OS path is the one of less resistance in this case.

Even so, it shouldn't be necessary to change the default TARGET_OS.

Cheers,

Richard



