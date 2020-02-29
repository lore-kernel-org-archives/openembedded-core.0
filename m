Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF2161A35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:53:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v2so6663594wrp.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=s3xHQzuNs818c2zSSV81bgbvttJqXFg4uNYJsuEqpV0=;
	b=SHh5kFxUOlEcAPbimLZRRCF3rgJFUvFYgbdTncefqDEzy3gDZQpPUf5OeoaQ6dumtj
	9UXPJ3g6gcd6KAxYlw4cf3ikyVJz2lWvhdYByF5DbDpAztUQW+tIwl4Y4TBg52beLLsW
	kWuqi62wMXYfXYJFWR5U+Ra9KmoeVhFwpUlFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=s3xHQzuNs818c2zSSV81bgbvttJqXFg4uNYJsuEqpV0=;
	b=lzQdiG9qs5BtZ687V7kb+6a0qiNQ71e3pk634THN/6m09THiSvhzXIKukf3dD885+k
	S9pTqTkjvahv1LgqYH8+QdtKtfKvBvaZHcEyKsRCF4mOvjNZ60K6A1T/lMiYgNQzS53I
	0O5XTbiEZke51NsnTrP8O1DDhq8JMNwNc1XY9DY9AhLMFLfyhyuYfu0jkjlNg0w2U/iw
	IaQb53Bl3XUwV/GMd0obAZPPeJ2KthMXNX91zaBQHV0rfAQTkHC82E5YWfTHKqV5E1XT
	xWce1qv2MLI6yAaTu6JxnuD/W/QoI1kue5XsOcsYZwS3vqXA96j3b14E4T3BdeaHM627
	QWJA==
X-Gm-Message-State: ANhLgQ0C/VQcL3G97m9W9iKLNTroDvvI2WtZAKBhhRbJ0CN9XgCU6uT7
	ycoz6WCGLku7lcOoLwRv6ctMZQ==
X-Google-Smtp-Source: ADFU+vt9/Iddov7/pQUGcZmxdSB2c/xT+Vkz61FP/acSsZwZFE0egsd+hVvJNvYiLTHjmLJRqQtpwA==
X-Received: by 2002:a5d:538e:: with SMTP id d14mr23264wrv.62.1582984383149;
	Sat, 29 Feb 2020 05:53:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n8sm16260737wrx.42.2020.02.29.05.53.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 05:53:02 -0800 (PST)
Message-ID: <c70d9ceacc5b7a557179ff9fc1b05100b7aa4065.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Feb 2020 13:53:00 +0000
In-Reply-To: <da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
	<4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
	<da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 13:53:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 13:42 +0000, Richard Purdie wrote:
> On Sat, 2020-02-29 at 13:22 +0000, Richard Purdie wrote:
> > On Sat, 2020-02-29 at 07:46 +0100, Petr Vorel wrote:
> > > At least we know, that once we solve this problem, we can remove
> > > 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> > > 
> > > Please, how to reproduce this build locally? Is it:
> > > . oe-init-build-env
> > > TCLIBC=musl bitbake ltp
> > 
> > Yes, that should be enough.
> > 
> > > Or do I need to put something into config files conf/local.conf
> > > or conf/bblayers.conf ?
> > > 
> > > I need to double check if musl-fts is really built and whether
> > > the
> > > order of
> > > -lfts is correct. But all this has been solved even for static
> > > build
> > > for Buildroot,
> > > so I guess it's some issue related to openembedded.
> > > Unfortunately,
> > > I'm not much
> > > experienced in openembedded (stepped in, because nobody else has
> > > updated LTP
> > > package yet).
> > > 
> > > Khem, any idea, what can be wrong?
> > 
> > FWIW I'll run a build here and see if I can spot anything but I'm
> > trying to do other things today!
> 
> I was able to confirm that fts is in the recipe sysroot and that the
> compile step is running "make -j 88 LIBC=musl LIBS=-lfts", i.e. its
> being passed in to ltp. Beyond that I'm a little out my depth to know
> how/why its not ending up where it should unfortunately. At least the
> issue does appear to reproduce though...

Grep suggests LIBS is a configure option, not a makefile one. I tried:

diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index 847f267b0b7..5be9489a756 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -16,7 +16,8 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
 DEPENDS_append_libc-musl = " fts "
-EXTRA_OEMAKE_append_libc-musl = " LIBC=musl LIBS=-lfts "
+EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
+EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
 
 # since ltp contains x86-64 assembler which uses the frame-pointer register,
 # set -fomit-frame-pointer x86-64 to handle cases where optimisation

and this does seem to build for musl. Might be worth runtime testing
that on the autobuilder?

Cheers,

Richard


