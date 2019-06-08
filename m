Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id EFC077E575
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 07:13:46 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id h9so6173824itk.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2019 00:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Qkwy6aqJkHodHL9W7udavdP5QEHQt0Xa7VqIZZFvnw=;
	b=0AUjmQFf5MjaCuEgr+H7hIvk+SgPcsIpHAYffCCbc0wHlT9REe7OKZfrXJr7SaER5C
	XLCJh/f2iTlLZjSZvG6QZsrGlXgze9mS2tSRYm8no2CHtoKqXHmyU70ZfYwWpIrqQnjh
	XFqrQr0BJH2qoF/T9SkUlQYQl18CPoP7+5UDXofGY89qjweBXPUg+dSGlKhVcJ9cTg23
	3J6BbVgOgqS0r83ilHUNSB3nrVzXlfxyWo6sBD4CTh0wN5cfHongdlctA8A46Nf90UX3
	jGniI1Uj1lQiNEnko3Vuz0d0pmrreotC0my5y7LTgSBW65TGmbgJgF5aCRdAf8GnVoHL
	nG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Qkwy6aqJkHodHL9W7udavdP5QEHQt0Xa7VqIZZFvnw=;
	b=HCcaat0oNX47mtKhPtuxVyhawOgi4wNeFtgq/lMIHML0fygBPiD/IUa4yJ5sBNam+E
	fkZPuZ5KKov2ufXNa5xpMF7SNI8cBYK01OkYk/tT7xtWVmF0YVRovb3s5XR2/8JYivjF
	u3bG7ZGpa4OjqbSipXUbGKFT5p7VR93VxdkWzNDDCRe9wSeOF2GUBeQU1cE5DDOcnIP6
	tEVbL4q6GnSq5VaBO/TvArnhZbN1Zu7lam7zNHWRZZkfa4FPjhg6G8bQnfleTtDe84iM
	PXKeGk0Wl7A1ZxkgDOqYV773mX0u0/QwKIqPWA5zOAuOfvbISbY0/Uo44etEGShSBnAK
	bFKg==
X-Gm-Message-State: APjAAAWXFyz8lopOIKrD6w9Db9BT5LyPPCKNJsJMjCWEpf6AcpRe/aHv
	fdDAWrcJN+uhG4sEWpcggXQVzdwkG1aI3UDSPcsamg==
X-Google-Smtp-Source: APXvYqwOlrCkmCivF4tsLBy/cB9qxSb3/NOzj8W48g/33TiDZoirr/H8d1oStrD50zacR+qZJa1AckM3N0u59JtYttE=
X-Received: by 2002:a24:edc1:: with SMTP id r184mr6434036ith.133.1559978027574;
	Sat, 08 Jun 2019 00:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 8 Jun 2019 08:13:35 +0100
Message-ID: <CAJTo0LaCcAVe0F4GNRzywazKzztUKWcCnfOfgkj8Vm1Q+Q6w=Q@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Move SCons to Python 3
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
X-List-Received-Date: Sat, 08 Jun 2019 07:13:47 -0000
Content-Type: text/plain; charset="UTF-8"

Hurrah, last time I looked at this the Py3 support wasn't quite ready yet.

Ross

On Sat, 8 Jun 2019 at 00:49, Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> python-scons and python-scons-native are perhaps the last python2 only
> recipes in oe-core. With Python 2 going EOL in or before 2020, it's time
> to switch everything to Python 3.
>
> I updated scons.bbclass to use python3-scons-native. Tested build with serf.
>
> I also added a simple oeqa/runtime test while I was at it.
>
> I did not drop python-scons and python-scons-native, although we should
> at some point soon.
>
> [YOCTO #13381]
>
> The following changes since commit 666f6192aaa9e847ad0d920a487b82d984b58d26:
>
>   gnutls: Use the sysconfdir variable for the ca-certificates path (2019-06-07 09:10:34 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib timo/python3-scons
>   http://cgit.openembedded.org//log/?h=timo/python3-scons
>
> Tim Orling (4):
>   python3-scons-{native}: add recipe for v3.0.5
>   scons.bbclass: use python3-scons
>   serf: switch to python3-scons-native
>   oeqa/runtime: add simple test for scons
>
>  meta/classes/scons.bbclass                    |  2 +-
>  meta/conf/distro/include/maintainers.inc      |  2 +
>  meta/lib/oeqa/runtime/cases/scons.py          | 37 +++++++++++++++++++
>  meta/lib/oeqa/runtime/files/SConstruct        |  1 +
>  meta/lib/oeqa/runtime/files/hello.c           |  5 +++
>  .../python/python3-scons-native_3.0.5.bb      |  8 ++++
>  .../python/python3-scons_3.0.5.bb             | 29 +++++++++++++++
>  meta/recipes-support/serf/serf_1.3.9.bb       |  2 +-
>  8 files changed, 84 insertions(+), 2 deletions(-)
>  create mode 100644 meta/lib/oeqa/runtime/cases/scons.py
>  create mode 100644 meta/lib/oeqa/runtime/files/SConstruct
>  create mode 100644 meta/lib/oeqa/runtime/files/hello.c
>  create mode 100644 meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-scons_3.0.5.bb
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

