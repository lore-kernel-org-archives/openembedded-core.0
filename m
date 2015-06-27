Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 23B5772277
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 07:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5R7GPMb028880; Sat, 27 Jun 2015 08:16:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CxoLY9uZnz63; Sat, 27 Jun 2015 08:16:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5R7GDXp028862
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 27 Jun 2015 08:16:25 +0100
Message-ID: <1435389373.10583.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Sat, 27 Jun 2015 08:16:13 +0100
In-Reply-To: <558E0148.10705@windriver.com>
References: <1435350471-17216-1-git-send-email-Randy.MacLeod@windriver.com>
	<558DB73D.6050708@windriver.com>
	<1435359038.10583.38.camel@linuxfoundation.org>
	<558E0148.10705@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tiff: Update to 4.0.4
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
X-List-Received-Date: Sat, 27 Jun 2015 07:16:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-06-26 at 21:50 -0400, Randy MacLeod wrote:
> On 2015-06-26 06:50 PM, Richard Purdie wrote:
> > On Fri, 2015-06-26 at 16:34 -0400, Randy MacLeod wrote:
> >> On 2015-06-26 04:27 PM, Randy MacLeod wrote:
> >>> Update tiff to latest version. None of the local CVE patches
> >>> are needed based on reviewing the ChangeLog so remove them.
> >>
> >> I didn't want to clutter the long log but I also built for
> >> all qemu arches. On qemux86-64, core-image-sato, I installed
> >> the libtiff-util rpms and ran:
> >>
> >> # tiffinfo /tmp/gmarbles.tif
> >> TIFF Directory at offset 0x8 (8)
> >>     Subfile Type: (0 = 0x0)
> >>     Image Width: 1419 Image Length: 1001
> >>     Resolution: 300, 300 pixels/inch
> >>     Bits/Sample: 8
> >>     Compression Scheme: LZW
> >>     Photometric Interpretation: min-is-black
> >>     Samples/Pixel: 1
> >>     Rows/Strip: 5
> >>     Planar Configuration: single image plane
> >>     Photoshop Data: <present>, 272 bytes
> >>     Predictor: horizontal differencing 2 (0x2)
> >>
> >> I could do more testing but this appears to be bug fixes only.
> >
> > It would be lovely to have this as an automated ptest or other form of
> > sanity test...
> 
> I can do that but I'd like to keep it separate from the upgrade.

Agreed, this was more an observation that it would be nice to have, the
upgrade doesn't depend on this.

> The package has a "make check" target with ~ 70 tests so
> I'll make that build for ptest and try it on some qemu targets.
> 
> Ptests are useful but I wonder if anyone has a way to
> monitor regressions...

The QA team are supposed to be working on this in 1.9 as a major
feature.

Cheers,

Richard


