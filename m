Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA6D772F24
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:59:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v65CxPYU021300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Jul 2017 13:59:26 +0100
Message-ID: <1499259565.9571.173.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Khem Raj
	<raj.khem@gmail.com>
Date: Wed, 05 Jul 2017 13:59:25 +0100
In-Reply-To: <CAP9ODKrYceNRtaSu9Sg157OC_a9Lj2oWuPgHPj3Xeo-2ORSXZQ@mail.gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
	<CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
	<CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
	<CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
	<CAMKF1srQZZss3qf3SvGC1cy1S2OXpoPhdN7g2w-a-akQXZJMfg@mail.gmail.com>
	<CAP9ODKrYceNRtaSu9Sg157OC_a9Lj2oWuPgHPj3Xeo-2ORSXZQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 05 Jul 2017 13:59:26 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Wed, 05 Jul 2017 12:59:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-07-05 at 09:52 -0300, Otavio Salvador wrote:
> On Tue, Jul 4, 2017 at 8:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > On Tue, Jul 4, 2017 at 3:16 PM, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > 
> > > On Tue, Jul 4, 2017 at 7:11 PM, Burton, Ross <ross.burton@intel.c
> > > om> wrote:
> > > > 
> > > > 
> > > > On 4 July 2017 at 23:08, Otavio Salvador <otavio.salvador@ossys
> > > > tems.com.br>
> > > > wrote:
> > > > > 
> > > > > 
> > > > > Ross, please apply it as it has been causing problems for
> > > > > many users.
> > > > > It is applied in master
> > > > > OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54
> > > > I would, but I'm not Pyro maintainer ...
> > > Sorry, who is? I must have missed the announcement.
> > Richard as of now see https://wiki.yoctoproject.org/wiki/Releases
> Added RP on Cc.

Its in the pyro-next branch.

Cheers,

Richard

