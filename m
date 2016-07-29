Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4E1C60746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T7QIBD008983; Fri, 29 Jul 2016 08:26:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id psRDUR2tSmzx; Fri, 29 Jul 2016 08:26:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T7QDsa008980
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 08:26:15 +0100
Message-ID: <1469777173.9142.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Fri, 29 Jul 2016 08:26:13 +0100
In-Reply-To: <1948585.XiSYCAuUde@peggleto-mobl.ger.corp.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZZD0poopBgYb9BbeJ_UUaJc5KZxTXSV5jndnLJC8EiCQ@mail.gmail.com>
	<1493839.LtSXxTmLfS@peggleto-mobl.ger.corp.intel.com>
	<1948585.XiSYCAuUde@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Fri, 29 Jul 2016 07:28:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-07-25 at 19:42 +1200, Paul Eggleton wrote:
> On Sat, 23 Jul 2016 13:11:39 Paul Eggleton wrote:
> > On Fri, 22 Jul 2016 23:31:38 Burton, Ross wrote:
> > > On 22 July 2016 at 13:38, Paul Eggleton <
> > > paul.eggleton@linux.intel.com>
> > > 
> > > wrote:
> > > > Some fixes and enhancements centered around how the toolchain
> > > > is
> > > > incorporated in the eSDK, as well as a couple of tweaks for
> > > > buildhistory
> > > > that I found we needed during development.
> > > 
> > > This is happening in mut, could your branch be responsible:
> > > 
> > > http://errors.yoctoproject.org/Errors/Details/73022/
> > > 
> > > Ross (who will look further when its not 23:30 on Friday!)
> > 
> > Hmm, it will be, but I can't tell immediately from the error
> > message what
> > could be wrong...
> 
> Ah, I believe this is bash vs. dash. Fix incoming, just need to test
> it.

Thanks for that fix. I think but am not 100% sure that this patchset
may have also caused:

https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/build
s/865

which happens only on OE-Core testing :/.

Cheers,

Richard

