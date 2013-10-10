Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE6006CF2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:16:30 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q14so1636367vbe.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 07:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=U1gHIq3SYPWaEXABvzKhDVfat2X5BBXtMh7l94dyn5o=;
	b=f+H9pofmXHFk0ZbWO0Q4e+l/9u0iiEG2yFgiCk3oKi85XOldBOKbymj6ZFS3/Nu2kP
	p+vvLoUd1AfycjSGtePp0dgz148U94xLflVebRDtjnTq7fzHc+uwiJUDEDcj1Uq6JmKF
	+9YxcSQppso8eEeDccosRShLixfCQV52QX3maw3zG4PBGz6JOsciDdMKc1AvoYrhFcbt
	tqCroe5AcDLrfvzaAoLSdeRVNd/Q4COkmvBGKA49GRZNSq/zcsS/LiBaE/uaREKAh6Yh
	RyNnNoftyh+eTIM7MuJOPMPv36Ge5xxHKZJlVeTwut9H741CzqdFipfBroV/fdLyDuPR
	qwqw==
X-Gm-Message-State: ALoCoQlfpi2s/79A4tXYi09iAmP2315vnsfJuZA9hmAGNsyMmvy7pJ5I84jCnacpvqEtGh1XKulr
X-Received: by 10.221.41.67 with SMTP id tt3mr7347161vcb.91.1381414592459;
	Thu, 10 Oct 2013 07:16:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 10 Oct 2013 07:16:11 -0700 (PDT)
In-Reply-To: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Oct 2013 15:16:11 +0100
Message-ID: <CAJTo0LaW6XJThFnBGydYNDBMZ-_ONt=BRgbnosNapadyDyoqFg@mail.gmail.com>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] wayland : Bump to 1.2.0 version
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
X-List-Received-Date: Thu, 10 Oct 2013 14:16:33 -0000
Content-Type: text/plain; charset=UTF-8

On 10 October 2013 13:23, Ewan LE BIDEAU-CANEVET
<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
> -SRC_URI_append_class-native = " file://just-scanner.patch"

That patch -  as it says - serves a useful purpose.  What is the
rationale for deleting it?  If there's a good reason, please say what
it is.

> -# Wayland installs a M4 macro for other projects to use. This M4 macro includes
> -# a path to a Makefile fragment to get the rules to generate stubs from protocol
> -# description files.  The paths to the sysroot end up incorrect, so fix them.
> -do_configure_append_class-native() {
> -  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
> -      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
> -      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
> -      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
> -  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
> -}

Wayland is still installing this m4 file, so why delete this fix?
From a glance at Wayland 1.2 it looks like it isn't required anymore
as pkgconfig is used to determine the paths, but you need to state
this in the commit message.

Also, there's a 1.2.1 release now.

Ross

