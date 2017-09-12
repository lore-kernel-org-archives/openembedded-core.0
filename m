Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 278AE783DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:30:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8CCULTX013438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 12 Sep 2017 13:30:22 +0100
Message-ID: <1505219421.18640.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 13:30:21 +0100
In-Reply-To: <20170908102218.23790-1-enrico.scholz@sigma-chemnitz.de>
References: <20170908102218.23790-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] image_types: support lz4 compressed squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 12:30:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-08 at 12:22 +0200, Enrico Scholz wrote:
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes/image_types.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This seems to cause "oe-selftest -r
imagefeatures.ImageFeatures.test_image_fstypes" to fail:


2017-09-12 12:20:48,435 - oe-selftest - INFO - ======================================================================
2017-09-12 12:20:48,435 - oe-selftest - INFO - FAIL [61.543s]: test_image_fstypes (imagefeatures.ImageFeatures)
2017-09-12 12:20:48,435 - oe-selftest - INFO - ----------------------------------------------------------------------
2017-09-12 12:20:48,436 - oe-selftest - INFO - Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 228, in test_image_fstypes
    "%s image %s doesn't exist" % (itype, image_path))
AssertionError: False is not true : squashfs-lz4 image /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.squashfs-lz4 doesn't exist

(from https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/512/steps/Running%20oe-selftest/logs/stdio)

Cheers,

Richard

