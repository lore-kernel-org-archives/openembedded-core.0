Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D1FB8784A6;
	Tue, 12 Sep 2017 06:57:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8C6vKnM023561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 12 Sep 2017 07:57:22 +0100
Message-ID: <1505199440.18640.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 07:57:20 +0100
In-Reply-To: <CA+chaQeR_DWL++fj+R3VC5bhwm7vie0vji10Zisg-zLozUC_+g@mail.gmail.com>
References: <150516459382.22444.17771288767469847708@git.openembedded.org>
	<20170911211634.41CC12328C6@git.openembedded.org>
	<CA+chaQeR_DWL++fj+R3VC5bhwm7vie0vji10Zisg-zLozUC_+g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/36: expat: Don't use getrandom() in the -native case
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
X-List-Received-Date: Tue, 12 Sep 2017 06:57:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-09-12 at 00:59 +0200, Martin Jansa wrote:
> Was this tested with the version in pyro? The patch fails to apply:
> 
> 
> http://errors.yoctoproject.org/Errors/Build/46432/
> 
> NOTE: Applying patch 'autotools.patch' (oe-core/meta/recipes-
> core/expat/expat/autotools.patch)
> NOTE: Applying patch 'no_getrandom.patch' (oe-core/meta/recipes-
> core/expat/expat/no_getrandom.patch)
> ERROR: Command Error: 'quilt --quiltrc TOPDIR/BUILD/work/x86_64-
> linux/expat-native/2.2.0-r0/recipe-sysroot-native/etc/quiltrc push'
> exited with 0  Output:
> Applying patch no_getrandom.patch
> patching file configure.ac
> Hunk #1 FAILED at 151.
> 1 out of 1 hunk FAILED -- rejects in file configure.ac
> Patch no_getrandom.patch does not apply (enforce with -f)

Sorry, I reverted this last night, it was a merge error and mistake on
my part.

Cheers,

Richard

