Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D00F165CED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 05:52:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43117521"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Nov 2014 13:49:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAA5qS6x002372;
	Mon, 10 Nov 2014 13:52:28 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Mon, 10 Nov 2014 13:52:41 +0800
Date: Mon, 10 Nov 2014 13:52:37 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141110135237.1a9c3eca@Fedora>
In-Reply-To: <CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com>
References: <1415077496-11116-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Bluez5: Add gatttool to new package bluez5-tools
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
X-List-Received-Date: Mon, 10 Nov 2014 05:52:45 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 7 Nov 2014 12:42:14 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 4 November 2014 05:04, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> 
> >         # at_console doesn't really work with the current state of OE, so
> > punch some more holes so people can actually use BT
> > +        install -m 0755 ${S}/attrib/gatttool ${D}/${bindir}/
> >         install -m 0644 ${WORKDIR}/bluetooth.conf
> > ${D}/${sysconfdir}/dbus-1/system.d/
> >  }
> >
> 
> Because of where you put the install, it looks like installing gatttool is
> related to the DBus configuration.

Hi Ross, thank you for your review.

Sorry for making you confused, the install should be put before the comment. I
just want to install gatttool to bin directory and it is nothing related to
dbus. I'll correct it in the next version.

> >  ALLOW_EMPTY_libasound-module-bluez = "1"
> > -PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
> > +PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex
> > ${PN}-tools"
> >
> 
> Two questions:
> 1) If we're installing gatttool, why not the other tools that are noinst
> (obex-client-tool, obexctl, etc).  Patching the makefile would install all
> the tools that upstream build.

Because in bluez4, gatttool was installed by default but obex-client-tool,
obexctl were not. 

> 2) Do these deserve a separate package, or as they're for testing should
> they go into PN-testtools?

gatttool is not a test tool, but a develop tool. In bluez4 it is in package
bluez4(not in bluez4-testtools). I don't think it's good to put it to any
existed package.


Qian Lei.

