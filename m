Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01B976AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 22:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5QMopO3014060; Fri, 26 Jun 2015 23:50:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MTL_3BK-Wgod; Fri, 26 Jun 2015 23:50:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5QMocY3014054
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 26 Jun 2015 23:50:50 +0100
Message-ID: <1435359038.10583.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Fri, 26 Jun 2015 23:50:38 +0100
In-Reply-To: <558DB73D.6050708@windriver.com>
References: <1435350471-17216-1-git-send-email-Randy.MacLeod@windriver.com>
	<558DB73D.6050708@windriver.com>
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
X-List-Received-Date: Fri, 26 Jun 2015 22:50:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-06-26 at 16:34 -0400, Randy MacLeod wrote:
> On 2015-06-26 04:27 PM, Randy MacLeod wrote:
> > Update tiff to latest version. None of the local CVE patches
> > are needed based on reviewing the ChangeLog so remove them.
> 
> I didn't want to clutter the long log but I also built for
> all qemu arches. On qemux86-64, core-image-sato, I installed
> the libtiff-util rpms and ran:
> 
> # tiffinfo /tmp/gmarbles.tif
> TIFF Directory at offset 0x8 (8)
>    Subfile Type: (0 = 0x0)
>    Image Width: 1419 Image Length: 1001
>    Resolution: 300, 300 pixels/inch
>    Bits/Sample: 8
>    Compression Scheme: LZW
>    Photometric Interpretation: min-is-black
>    Samples/Pixel: 1
>    Rows/Strip: 5
>    Planar Configuration: single image plane
>    Photoshop Data: <present>, 272 bytes
>    Predictor: horizontal differencing 2 (0x2)
> 
> I could do more testing but this appears to be bug fixes only.

It would be lovely to have this as an automated ptest or other form of
sanity test...

Cheers,

Richard


