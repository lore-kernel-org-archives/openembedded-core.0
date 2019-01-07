Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id E02027BEAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:44:58 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id b23so795543ios.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=J4HPOJfzHdO/6Va0urOEJ1i29L+wmJ1WzQ8TQveHnXc=;
	b=QTlvvlry0auKtmbYdA6e3NBZgAuqFVAZEEcpodA9nHVHQnM6QkuGcVkKsGsU5gW6LR
	S5amAZrLHOD2bkKLHg4RETLLrXh1vhtGAqIhX4SDRhEjF3onuTJF1DkHyjfQGBXshZxg
	POyVZqM7GEbcYqrRPj9Or7SWXXGiW3xfV3nKSHk88r6xgiW/yjRFBOCpmpbL0JP4u2Rp
	gUZAqg7HUE0EfuxMyfoApWyQqWisUwWYd6kz8KVlIq3GPfCtrJYOfaTfJOLMC90vPuBK
	IUyEIsMTA2uDWYDTxArjUB0F624IutYriz5gkr/hsUbSh7QfdYl+FyICSHEV1rFGYJYT
	1T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J4HPOJfzHdO/6Va0urOEJ1i29L+wmJ1WzQ8TQveHnXc=;
	b=KVDKQuILScgOUxkLCI+aW8JMIpL293xBr6tBO2kEiyGFpT+/b3K4pq81zWNsBdod3B
	/tMRThlEwJJgX/wW7BYVSCd6AU8On6SO5vxH31EKYHQvXBdyMlX+GbE+jJ1uCyIqexso
	qs3zVt8/F8cIB15HbajFTb9LsNrq48OFsAwgjGmlb7Q7iwYVTsegz2WgnDOgI6e/4vYJ
	d5L3iY+9rV51wVuD88uYxMvG8wrrMZZOZ8anKV/dNb27Lyk2T5wH2KY/UOyrTzPOtnQY
	AtUDvwiqb7Yu9YUw7g9+VvI9knPOIVUhO5BedAVZzTuDOqs0OChG0gjsza7CukIOBMA8
	uHhQ==
X-Gm-Message-State: AJcUukeRHD8OW+3Wfq1A4j7i0bDjq+kcRLBetdD8nf6GShV0o3IRcZ4x
	zHwlVumXjgQ9S3hgHL6P1h0=
X-Google-Smtp-Source: ALg8bN4Aw6L4/wVEApbKY+fIv0EH3owVmZn2iP4oSMVRT4bNAxL8SxJ+nJTXDAC7ysPzvD5X8fOmHw==
X-Received: by 2002:a6b:490f:: with SMTP id u15mr42203152iob.297.1546879499662;
	Mon, 07 Jan 2019 08:44:59 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	i21sm30441809ioo.59.2019.01.07.08.44.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Jan 2019 08:44:58 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <4d020a2be7a89c50d6f29cdabc298d7c2bd80de7.camel@gmail.com>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Jan 2019 10:44:57 -0600
In-Reply-To: <20190107163823.31816-7-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
	<20190107163823.31816-7-ross.burton@intel.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
Subject: Re: [PATCH 7/7] oeqa/sdk: add test to exercise Meson
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
X-List-Received-Date: Mon, 07 Jan 2019 16:44:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-07 at 16:38 +0000, Ross Burton wrote:
> (From OE-Core rev: 29359493e391d68a5a6b4fa4d09ffdc1fe6db620)
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/sdk/cases/buildepoxy.py | 35
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdk/cases/buildepoxy.py
> 
> diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py
> b/meta/lib/oeqa/sdk/cases/buildepoxy.py
> new file mode 100644
> index 00000000000..ef24b4f4ac1
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
> @@ -0,0 +1,35 @@
> +import os
> +import subprocess
> +import tempfile
> +import unittest
> +
> +from oeqa.sdk.case import OESDKTestCase
> +from oeqa.utils.subprocesstweak import errors_have_output
> +errors_have_output()
> +
> +class EpoxyTest(OESDKTestCase):

FWIW: I know that is in the same style as the assimp test, but I always
thought the test should have been called the "cmake" test, since that
is what we actually care about (not specifically that it can build
assimp; any cmake package could have been used AFAIK).

Perhaps this should break that trend and be called the "meson" test?

> +    """
> +    Test that Meson builds correctly.
> +    """
> +    def setUp(self):
> +        if not (self.tc.hasHostPackage("nativesdk-meson")):
> +            raise unittest.SkipTest("GalculatorTest class: SDK
> doesn't contain Meson")
> +
> +    def test_epoxy(self):
> +        with tempfile.TemporaryDirectory(prefix="epoxy",
> dir=self.tc.sdk_dir) as testdir:
> +            tarball = self.fetch(testdir, self.td["DL_DIR"], "
> https://github.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz
> ")
> +
> +            dirs = {}
> +            dirs["source"] = os.path.join(testdir, "libepoxy-1.5.3")
> +            dirs["build"] = os.path.join(testdir, "build")
> +            dirs["install"] = os.path.join(testdir, "install")
> +
> +            subprocess.check_output(["tar", "xf", tarball, "-C",
> testdir])
> +            self.assertTrue(os.path.isdir(dirs["source"]))
> +            os.makedirs(dirs["build"])
> +
> +            self._run("meson -Degl=no -Dglx=no -Dx11=false {build}
> {source}".format(**dirs))
> +            self._run("ninja -C {build} -v".format(**dirs))
> +            self._run("DESTDIR={install} ninja -C {build} -v
> install".format(**dirs))
> +
> +            self.check_elf(os.path.join(dirs["install"], "usr",
> "local", "lib", "libepoxy.so"))
> -- 
> 2.11.0
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


