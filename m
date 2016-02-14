Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 659A673170
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EEbrWs021328; Sun, 14 Feb 2016 14:37:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 56xUvZYj07jm; Sun, 14 Feb 2016 14:37:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EEbosm021320
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 14 Feb 2016 14:37:51 GMT
Message-ID: <1455460670.16142.408.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Sun, 14 Feb 2016 14:37:50 +0000
In-Reply-To: <20160214115245.GC3028@jama>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
	<20160214115245.GC3028@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Sun, 14 Feb 2016 14:37:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-02-14 at 12:52 +0100, Martin Jansa wrote:
> On Tue, Feb 09, 2016 at 10:26:43PM +0000, Burton, Ross wrote:
> > On 8 February 2016 at 14:59, Nicolas Dechesne <
> > nicolas.dechesne@linaro.org>
> > wrote:
> > 
> > > * update SRC_URI and checksum.
> > > * add PACKAGECONFIG to offer choice of crypto implementation (for
> > > sha1
> > > functions)
> > > * use libcrypto by default. In upstream commit a24bdce4, support
> > > for
> > >   SHA-1 was copied from xserver repo, so let's use the same
> > > default for
> > >   --with-sha1 option that we use in xserver recipe in OE core.
> > > 
> > 
> > Forgot to ask - what real hardware was this tested on, and was
> > anything
> > like Piglit used to verify it is working properly?
> 
> It looks like non-x11 builds gained X11 dependency and mesa fails to
> build in DISTROs without x11 in DISTRO_FEATURES:
> 
> mesa-11.1.1/src/loader/loader_dri3_helper.c:28:27: fatal error:
> X11/xshmfence.h: No such file or directory

I did test this recently:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
s/23/steps/BuildImages/logs/stdio

which uses mesa 11.1.1 and didn't see an issue. I therefore suspect
there is a bit more to the exact configuration needed to reproduce
this.

Cheers,

Richard


