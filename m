Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D493786BD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 00:22:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w060M7ZU009065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 6 Jan 2018 00:22:08 GMT
Message-ID: <1515198127.29722.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>
Date: Sat, 06 Jan 2018 00:22:07 +0000
In-Reply-To: <CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
	<CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: vineethchowz.chowdary@xilinx.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Sat, 06 Jan 2018 00:22:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-05 at 11:15 -0800, Alistair Francis wrote:
> On Thu, Jan 4, 2018 at 12:45 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I ran the qemu upgrade in some builds and both hang in nightly-musl
> > whilst trying to build webkitgtk:
> > 
> > https://autobuilder.yocto.io/builders/nightly-musl/builds/688/steps
> > /BuildImages/logs/stdiohttps://autobuilder.yocto.io/builders/nightl
> > y-musl/builds/687/steps/BuildImages/logs/stdio
> > 
> > Given all the stability issues we've had recently and the trouble
> > I've
> > had getting stable builds, this issue is going to have to be
> > resolved
> > before we can take this upgrade.
> > 
> > FWIW they're hanging in qemu user mode:
> > 
> > run.do_compile.───cmake───make───make───make───sh───g-ir-scanner-
> > wr───python3───g-ir-scanner-qe───qemu-i386───2*[{qemu-i386}]
> Hmm...
> 
> I don't see any hangs. With master webkitgk fails to build with a
> missing header fil (GL/gl.h) and with this patch I still see the
> problem.
> 
> Do you have an easy way to reproduce this hang?

Was this a musl build you tried to reproduce in?

Cheers,

Richard

