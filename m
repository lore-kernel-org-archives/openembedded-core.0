Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 203F7766B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 22:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAAMdjt6009677; Tue, 10 Nov 2015 22:39:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fznPtsV5NXdo; Tue, 10 Nov 2015 22:39:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAAMdPTp009658
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Nov 2015 22:39:39 GMT
Message-ID: <1447195164.3559.228.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 10 Nov 2015 22:39:24 +0000
In-Reply-To: <56423693.5050207@windriver.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com>
	<CAJTo0LYEYg+1oP8WwBbNYfM2mWGrFNyM3LgOXQUdL3JPC5BTsQ@mail.gmail.com>
	<56423693.5050207@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 22:39:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-11-10 at 12:25 -0600, Mark Hatle wrote:
> On 11/10/15 11:40 AM, Burton, Ross wrote:
> > 
> > On 10 November 2015 at 16:39, Mark Hatle <mark.hatle@windriver.com
> > <mailto:mark.hatle@windriver.com>> wrote:
> > 
> >     Let me rephrase.  Instead of calling out to qemu (or a real target) for a
> >     gobject and result.  Can the result be cached (like we do with the config-site
> >     info?)  This would allow me to run say a MIPS64 n64 gobject build, cache the
> >     results and use it on my octeon3 build (which can't run in QEMU.)
> > 
> > 
> > The metadata contains stuff like type sizes and alignment but wouldn't it be
> > possible to have some sort of map from machine to close-enough qemu machine?  So
> > for octeon3 is qemumips64 is close enough, run that.
> > 
> > (to be honest I thought the qemu runner support as used by the postinsts already
> > did this)
> 
> That would work in many cases.. the problem is that it requires "yet another"
> sysroot or whatnot to be able to build the runner.
> 
> (I think QEMU supports pretty much all of the major, and some minor
> architectures these days... it just doesn't support many of the semi-specific
> optimizations.)

As I understand it, there are at least two ways we could solve this:

a) build a native version of the recipe and run that to get the
introspection data
b) cache the introspection data and reuse it

There are obviously advantages and disadvantages to each but as I
understand it the data is architecture independent.

Using qemu is the least ugly from a build performance impact though
without getting into cache problems.

Cheers,

Richard


