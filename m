Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr7s9-0007jT-TD for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:26:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACMEaY021439;
	Wed, 10 Aug 2011 13:22:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20864-03; Wed, 10 Aug 2011 13:22:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACM5hG021433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 10 Aug 2011 13:22:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B6CD83BDA9@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B5FF85AB28@shsmsx502.ccr.corp.intel.com>
	<4E40B92A.1000903@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B5FF85AF9D@shsmsx502.ccr.corp.intel.com>
	<4E414D03.1060301@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B6CD83BDA9@shsmsx502.ccr.corp.intel.com>
Date: Wed, 10 Aug 2011 13:21:31 +0100
Message-ID: <1312978891.14274.359.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Wed, 10 Aug 2011 12:26:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 11:18 +0800, Cui, Dexuan wrote:
> Darren Hart wrote on 2011-08-09:
> > On 08/09/2011 07:04 AM, Cui, Dexuan wrote:
> >> Hi Darren, thanks a lot for all the suggestions! I appreciate your
> >> efforts to help to make the patch better. Below is the updated patch
> >> (also pasted at the end of the mail):
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcu i/
> >> bug-671&id=2ece3a84d646bb4bf83f3c8aa3067cb99989da47
> >> 
> >> -- Dexuan
> >> 
> >> commit 2ece3a84d646bb4bf83f3c8aa3067cb99989da47
> >> Author: Dexuan Cui <dexuan.cui@intel.com>
> >> Date:   Thu Aug 4 14:53:20 2011 +0800
> >> 
> >>     scripts/oe-buildenv-internal: improve the error detecting for
> >> $BDIR
> >> 
> >>     The previous fix for a bug in Ubuntu 10.04 readlink,
> >>     be2a2764d8ceb398d81714661e6f199c8b11946c, notified the user when a
> >>     trailing slash was used. As there is no semantic difference, simply
> >>     remove any trailing slashes and proceed without nagging the user.
> >>     
> >>     See [YOCTO #671] for more details.
> >>     
> >>     Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> >>     Cc: Darren Hart <dvhart@linux.intel.com>
> >>     Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> > 
> > Looks good,
> > 
> > Acked-by: Darren Hart <dvhart@linux.intel.com>
> Thanks, Darren!
> 
> Hi RP, could you please pull the patch? 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcui/bug-671&id=2ece3a84d646bb4bf83f3c8aa3067cb99989da47

Merged to master, thanks.

Richard



