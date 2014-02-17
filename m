Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 86A386E904
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 12:27:11 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 219AA6E7; Mon, 17 Feb 2014 13:27:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id C98AF61B;
	Mon, 17 Feb 2014 13:27:22 +0100 (CET)
Date: Mon, 17 Feb 2014 13:27:07 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140217122706.GD21303@piout.net>
References: <1392482043-28060-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1443af26500.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<20140216141351.GA21303@piout.net>
	<CAJTo0LaA4tVnh9aZ9F+i6Ti1zj9tCvN3BxRLEk8P_t6daUnVyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaA4tVnh9aZ9F+i6Ti1zj9tCvN3BxRLEk8P_t6daUnVyA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] matchbox-keyboard: daemonize launch
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
X-List-Received-Date: Mon, 17 Feb 2014 12:27:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17/02/2014 at 11:23:19 +0000, Burton, Ross wrote :
> On 16 February 2014 14:13, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> >> Also, why do you need another shell instance, out of curiosity. ISTM
> >> that only wastes RAM..
> >
> > We create a shell and start in the background to wait for
> > matchbox-desktop to start. This allows X continue to start and run the
> > next Xsession scripts. And matchbox-desktop has to be the last started
> > program si we don't have any other way. Anyway, once the
> > matchbox-keyboard daemon starts, the shell will exit and not use ram
> > anymore.
> 
> As matchbox-keyboard.sh is being sourced, I don't think we need to subshell.
> 

Indeed, that seems to work, I will send v3.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

