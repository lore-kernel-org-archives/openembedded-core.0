Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1EE609C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:23:39 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 45937F811F0; Wed, 13 Aug 2014 15:23:40 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id DD94BF81188;
	Wed, 13 Aug 2014 15:23:37 -0600 (MDT)
Message-ID: <53EBD780.9060005@mlbassoc.com>
Date: Wed, 13 Aug 2014 15:24:16 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: GCC 4.9 considered evil
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
X-List-Received-Date: Wed, 13 Aug 2014 21:23:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've found that the latest GCC doesn't work very well, at
least not on ARM (and obviously other architectures as well [1])
When I build Google Chromium browser for my i.MX boards using
GCC-4.9.x, no pages can be rendered - massive bloodshed and
failures are shown on the console.  If I use the older GCC 4.8.2,
everything else the same, all is well.

Here's my configuration:
BB_VERSION        = "1.23.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-13.10"
TARGET_SYS        = "arm-amltd-linux-gnueabi"
MACHINE           = "teton-p0382"
DISTRO            = "amltd"
DISTRO_VERSION    = "1.6+snapshot-20140812"
TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
TARGET_FPU        = "vfp-neon"
meta              = "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
meta-amltd        = "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
meta-teton-imx6-p0382 = "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
meta-fsl-arm      = "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
meta-fsl-arm-extra = "master:12e560967b7136222c325d11633295fe3a0c701c"
meta-browser      = "master:da93c8e386133a15eff1414d9307c8f2c7a44787"

Should this be filed as a bug?  I don't have much data other than it
simply breaks (and chrome is not the easiest thing to debug!).  Other
applications seem OK, but I am loathe to trust it...

I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and I hope
it doesn't vanish like 4.7.x did too quickly).

[1] http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken

Note: I've also tried this on qemux86 (a totally different
architecture) and chrome bombs just as badly!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

