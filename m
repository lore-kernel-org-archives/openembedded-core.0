Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D236A77166
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 13:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u89DgKaE014257; Fri, 9 Sep 2016 14:42:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PIhX6Gdoz17u; Fri,  9 Sep 2016 14:42:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u89DgHRK014254
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 9 Sep 2016 14:42:19 +0100
Message-ID: <1473428537.20226.287.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Darander <anders@chargestorm.se>,
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Sep 2016 14:42:17 +0100
In-Reply-To: <20160905065822.fivzxjjyotyzifgt@ad.chargestorm.se>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
	<075b7a5f-14d8-5999-2fda-da8bae3d893e@windriver.com>
	<e83ab03a-ae9f-cf9a-2838-1b16b15a4e16@linux.intel.com>
	<20160905065822.fivzxjjyotyzifgt@ad.chargestorm.se>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 00/28] Enable gtk-doc
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
X-List-Received-Date: Fri, 09 Sep 2016 13:42:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-09-05 at 08:58 +0200, Anders Darander wrote:
> * Alexander Kanavin <alexander.kanavin@linux.intel.com> [160902
> 17:08]:
> 
> > 
> > On 09/02/2016 12:59 AM, Randy MacLeod wrote:
> > > 
> > > > 
> > > > Gtk-doc generation happens if 'api-documentation' distro
> > > > feature is
> > > > enabled
> > > > (it is by default), and 'qemu-usermode' is in machine features.
> > 
> > > 
> > > Should this really be enabled by default?
> > > What does it do to a typical build wrt time and space?
> > 
> > The default distro feature list also includes all of the available
> > communication stacks, full x11 stack, pulseaudio etc. It seems to
> > me that
> > the aim is to enable as many various features as possible by
> > default.
> > Distros can and should trim the list to their specific needs.
> Sure, but as far as I remember, doc building is disabled in most
> cases.
> And personally, I'd prefer to have the doc-generation disabled per
> default. (As usually, most people I've met, won't use the doc's built
> here anyway).

There is a fairly big performance hit to enabling gtk-doc. We've
adjusted the patchset so when disabled, there isn't much of a
performance hit and I've merged things with the default being "off" for
now. We can then work through the other details and see if there is
anything we can do about the performance.

This is one of the reasons the patch series has taken a while to merge
and there were a number of issues trying to make the M3 build work and
pass testing (see the weekly status reports).

Cheers,

Richard



