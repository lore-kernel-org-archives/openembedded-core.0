Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC3870016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 20:49:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7FKnXTZ015282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 21:49:34 +0100
Message-ID: <d0d153b0c79ee58e266fad16836e355afd722296.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, "Burton,
	Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2018 21:49:33 +0100
In-Reply-To: <CALbNGRSBASPR5fZs-qHZeTZTp4HG1quJRSADAqGveXo5BABbOg@mail.gmail.com>
References: <20180704001137.41385-1-raj.khem@gmail.com>
	<CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
	<CALbNGRSBASPR5fZs-qHZeTZTp4HG1quJRSADAqGveXo5BABbOg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Wed, 15 Aug 2018 20:49:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-08-15 at 21:52 +0200, Andreas Müller wrote:
> On Wed, Jul 4, 2018 at 6:28 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > FWIW historically we just prepended PKG_CONFIG_SYSROOT or whatever
> > the
> > spelling was to the result of the pkg-config calls.  I didn't know
> > about PKG_CHECK_VAR before, that's really useful!
> > 
> > Have you tried pushing this upstream?  Also note that I've a branch
> > moving Mesa to Meson so we'll need to fix this again...
> > 
> > Ross
> 
> Hi Ross,
> 
> this is a bit late and off-topic: Where can I find this branch - I
> need to test a mesa patch before sending it

Its probably:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/mesa

Cheers,

Richard

