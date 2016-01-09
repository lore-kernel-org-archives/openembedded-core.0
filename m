Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 38ECE73289
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 17:15:00 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ik10so98526795igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pUDWUowNPrkgDJ32POl6kkroylTLK07h04WYKyhII6M=;
	b=b2TNgeS5E2tdV2S5UuLCpWvguO2tnhwMjUltRRhxYrLHywntKNZc1Lq5UeFw1/DJMs
	bRgwdEMhJW6J7pOycU8ZvIJNqijW+w4VGLaMJdRQHjdbBr+ko7B0plCVYC6+Y2DH7T/+
	Y6aks08pY3CWTORF2CQi0/xt9s+khKnjpp9hpidsZY4PzOqeaxZ4UXKe5Aok5K/c2Bum
	xJSRg2YA+R6bNqwizcp1wL20u2CuaQwCty4sBOiXUmNedpqt9B7XMQOuPuFJhu1Pab/W
	PIDh9jDnG/BmPJ+6tWGzNKZVzfnj2mT9hm7wY1s1UROvot8wMg0ISD1hajUMsvMD+29n
	fLRw==
X-Received: by 10.50.79.196 with SMTP id l4mr4699958igx.11.1452359701735; Sat,
	09 Jan 2016 09:15:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sat, 9 Jan 2016 09:14:32 -0800 (PST)
In-Reply-To: <1452277369.7598.136.camel@linuxfoundation.org>
References: <1452277369.7598.136.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Jan 2016 09:14:32 -0800
Message-ID: <CAMKF1somhhQ9h5Bfzg3fQgv1UwB4PahuWWFUPjPXQ1wy4ecwYQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Sat, 09 Jan 2016 17:15:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 10:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> xz gives better compression results than bzip/gz but is often slower.
> Using parallel compression mitigates this somewhat and is particularly
> useful for the SDK.

I have proposed another tool called pxz back in Sept last year
http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110971.html

although pixz seems to be well maintained and active, would be nice to
know what do people mostly use.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb b/meta/recipes-support/pixz/pixz_1.0.6.bb
> new file mode 100644
> index 0000000..e6e4ac2
> --- /dev/null
> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Parallel, indexed xz compressor"
> +
> +DEPENDS = "xz libarchive"
> +
> +SRC_URI = "https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "f6dc5909c9a31b192f69aa397ae8df48"
> +SRC_URI[sha256sum] = "02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5cf6d164086105f1512ccb81bfff1926"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

