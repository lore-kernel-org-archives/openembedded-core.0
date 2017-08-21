Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C4656E5CB;
	Mon, 21 Aug 2017 21:08:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7LL8Nrc004585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 21 Aug 2017 22:08:24 +0100
Message-ID: <1503349703.32591.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Peter Kjellerstedt <pkj@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 22:08:23 +0100
In-Reply-To: <CA+chaQfbEAVhPbPeOi=vfMcjds2DMGtMGz256gode6+2NdzMug@mail.gmail.com>
References: <150290188985.5203.15184613586486279186@git.openembedded.org>
	<20170816164450.1447E236566@git.openembedded.org>
	<CA+chaQfbEAVhPbPeOi=vfMcjds2DMGtMGz256gode6+2NdzMug@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 21 Aug 2017 22:08:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/02: package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Mon, 21 Aug 2017 21:08:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-21 at 11:00 +0200, Martin Jansa wrote:
> This seems to find a many more missed dependencies which is good
> thing.
> 
> There is +- 20 failures found in meta-oe recipes and there is still
> at least one in oe-core:
> 
> ERROR: nativesdk-libcheck-0.10.0-r0 do_package_qa: QA Issue:
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/checkmk
> contained in package nativesdk-libcheck requires /usr/local/oecore-
> x86_64/sysroots/x86_64-oesdk-linux/usr/bin/gawk, but no providers
> found in RDEPENDS_nativesdk-libcheck? [file-rdeps]
> 
> I wonder why this one wasn't catched by oe-core autobuilder.

At a guess, nativesdk are excluded from world so nothing in OE-Core
likely depends on nativesdk-libcheck. Thanks for the patch, you beat me
to it!

Cheers,

Richard

