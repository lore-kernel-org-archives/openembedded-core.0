Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 49116734B8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 10:01:38 +0000 (UTC)
Received: from poczta.nazwa.pl (unknown [10.252.0.18])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 04CB72D7D54;
	Sat, 13 Feb 2016 11:01:36 +0100 (CET)
Date: Sat, 13 Feb 2016 11:01:36 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Reply-To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org, 
	Joshua G Lock <joshua.g.lock@linux.intel.com>
Message-ID: <1932407995.429489.1455357696984.JavaMail.open-xchange@ox8.netart.com.pl>
In-Reply-To: <1455313743.3546.23.camel@linux.intel.com>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
	<548649854.435770.1455297246525.JavaMail.open-xchange@ox1.netart.com.pl>
	<1455313743.3546.23.camel@linux.intel.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.6.2-Rev33
X-Originating-Client: com.openexchange.ox.gui.dhtml
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Sat, 13 Feb 2016 10:01:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Dnia 12 luty 2016 o 22:49 Joshua G Lock <joshua.g.lock@linux.intel.com>
> napisa=C5=82(a):
>
>
> On Fri, 2016-02-12 at 18:14 +0100, Maciej Borzecki wrote:
> > > Dnia 12 luty 2016 o 13:15 Dmitry Rozhkov <dmitry.rozhkov@intel.com>
> > > napisa=C5=82(a):
> > >=20
> > > This becomes crucial when ClearLinux's software
> > > update mechanism is integrated into builds, because
> > > its client side ignores VERSION_ID's value if it
> > > doesn't conform the definition.
> >
> > Is this integration work already published somewhere? I'm interested
> > in trying out swupdate with Yocto, but the lack of publicly available
> > repo is kind of holding this back (yes, I'm ware of SRPMs).
>
> I'm working on integrating swupd into OE-Core, it's a work in progress
> and so far nothing has been published (the work is not yet in a
> functional state).
>
> The recipes we are currently using for swupd-server and swupd-client
> use the src.rpm's from clearlinux.org
>
> > Do you mind sharing the some details if there is a larger plan for
> > getting Clear closer to Yocto/OE?
>
> We have a couple of tickets in the Yocto Project bugzilla[1][2] which
> give an overview of the approach I'm taking for this initial
> implementation.
>
> The approach is fairly conservative in an attempt to get something
> usable integrated that lets us work with the swupd developers to iron
> out issues with utilising swupd from within OE.
>

Thanks for taking the time to respond. I'll keep an eye on both BZ issues.

--
Maciej Borz=C4=99cki
Senior Software Engineer at Open-RnD Sp. z o.o.
www.open-rnd.pl, Facebook, Twitter

