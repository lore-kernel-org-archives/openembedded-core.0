Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 974CA731C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u15IUw0v018398; Fri, 5 Feb 2016 18:31:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NF9VspcjAMZ8; Fri,  5 Feb 2016 18:31:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u15IVYKL018453
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 5 Feb 2016 18:31:35 GMT
Message-ID: <1454697094.27087.280.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Mike Crowe <mac@mcrowe.com>
Date: Fri, 05 Feb 2016 18:31:34 +0000
In-Reply-To: <CAMKF1srahWOS2zu2G6JEXZiwcX9sgqXQ9LOb4z6n0te73H=RDg@mail.gmail.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
	<1454452885.27087.127.camel@linuxfoundation.org>
	<20160205173256.GA7728@mcrowe.com>
	<CAMKF1srahWOS2zu2G6JEXZiwcX9sgqXQ9LOb4z6n0te73H=RDg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 05 Feb 2016 18:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-05 at 10:22 -0800, Khem Raj wrote:
> On Fri, Feb 5, 2016 at 9:32 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote:
> > > > I've compile-tested qemux86 and qemuarm for core-image-sato.
> > > > qemumips
> > > > is building now.
> > 
> > Since then I've collected enough patches to make "bitbake world"
> > build
> > successfully for qemux86, qemuarm, qemuppc and qemumips. qemux86-64
> > is
> > building now. The recipes that needed fixing to explicitly set
> > EXTRA_OEMAKE = "-e MAKEFLAGS=" were:
> > 
> >   meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
> >   meta/recipes-bsp/libacpi/libacpi_0.2.bb
> >   meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
> >   meta/recipes-connectivity/openssl/openssl.inc
> >   meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
> >   meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
> >   meta/recipes-devtools/perl/perl-native_5.22.1.bb
> >   meta/recipes-devtools/perl/perl_5.22.1.bb
> >   meta/recipes-extended/ed/ed_1.9.bb
> >   meta/recipes-extended/iputils/iputils_s20151218.bb
> >   meta/recipes-extended/pigz/pigz.inc
> >   meta/recipes-extended/stat/stat_3.3.bb
> >   meta/recipes-extended/sysklogd/sysklogd.inc
> >   meta/recipes-extended/unzip/unzip_6.0.bb
> >   meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
> >   meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> > 
> > I will submit patches for these shortly.
> 
> then there are other layers besides OE-Core where this will be
> needed.
> so phase it right so it doesnt cause land slide work for other layers

How do we do that?

Obviously I can merge the above into OE-Core and then there is just the
final bitbake.conf patch. How long do we need to wait for other layers
to sort this out though?

I'm facing this dilemma with a few patches atm...

Cheers,

Richard


