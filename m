Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3507276019
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 21:25:24 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id c15-v6so1371191otl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TEeGzAHEGibgPRJOmhWOcopCegwu6kvS/7uzrd4O1KI=;
	b=apZFuOQ766xSz/d9KTQhrrCP+j1VCZCNUILxinSQ0v88XcG3e1+2KYKvAqkDJkyN6T
	Vyb+k+/5Pl93kDW2ZDcTE2ONl5m2cXw//fUhlfD9oAw91T7UHeJvnJ5lIfDJWbFJSP3P
	pCSw+vAA6XHBy1i898pYf0uf4e9U0ePInazPcc2f32YkCdELHmD2QI8hmOPAVrzjkgNV
	AwEuwRPGT+d6Y6ZmZq+H3MBHrhzCW+NOL47pq+xLHD/GRxNSMwsoHWW025BDLAl9hUkd
	+CeNxoA6cIvskRKVLF+eds1USTvGWZAIUoys+fKYF+cHO6hFOfw0ku6NmMQXB0tj+ewy
	BpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TEeGzAHEGibgPRJOmhWOcopCegwu6kvS/7uzrd4O1KI=;
	b=CLPzPcvH/cXrMAoyOO+lojz47V8haX2Pms/Yl0CLHO1fyJ9ykADgL/XxDO186LtD64
	ama9hsx3gtfv7qH3v0i4/aRgcjg4HaSKl3XdL9+hDHGLwwuN4+LYuKJeAg6x3R90tykk
	Jkk0S425A9EBtaGhpIt0RXnq5PTctcWnfMyzaYWqXh2pWVmYW8dYALnNwEu3k/0tgRNx
	0Searpxwe3kFqCNUsRMxS/xYNrgRjhifTDhfY92zhCrKGFTh1rebNZIXoFM2Fpyp4TK+
	FCkM4O+0J/42+1YpJ8iZRF6jx2k0dAwlQbJ6WtDSKUylgY1n3A6ZFCG51I5d2KJ+LodV
	pZKw==
X-Gm-Message-State: APt69E3f5AV/f0N2disMWx5yrpBvXcJlFbJ2/yGf8mUmjQQAuRI47wr7
	7h+6Q7l9PAdN77cJm4N3Ts3LcPPzFPpEZt2IlSc=
X-Google-Smtp-Source: ADUXVKJTeMj7fVspiWfa7g6RUuXpGl40FD2ma+ZVEG4g6gQXPDLkzdQTJnVoPVr09KlqvIQgK3xss/EDgzSt4gKI31w=
X-Received: by 2002:a9d:4609:: with SMTP id
	y9-v6mr10462156ote.259.1529443525231; 
	Tue, 19 Jun 2018 14:25:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 14:25:24
	-0700 (PDT)
In-Reply-To: <20180619202029.5338-1-ptsneves@gmail.com>
References: <20180619202029.5338-1-ptsneves@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jun 2018 00:25:24 +0300
Message-ID: <CANNYZj9O89YaqZ8upHXf_-WYY6vmec8We=nb=WKvwY1H2L0Wwg@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson-with-tests: Allows for build time tests of meson
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
X-List-Received-Date: Tue, 19 Jun 2018 21:25:24 -0000
Content-Type: text/plain; charset="UTF-8"

qemu is notoriously fragile, or non-existent for some MACHINEs. If
something fails, the failure should be reported as a warning.

Also, can this be enabled for anything in oe-core that currently
utilizes plain meson? That way the class will actually get used and
tested.

Alex

2018-06-19 22:20 GMT+02:00 Paulo Neves <ptsneves@gmail.com>:
> meson build system has the functionality of setting
> an executable wrapper to run cross-compiled
> binaries. The setting is called exe_wrapper and can
> be defined in the meson.cross file. With a valid
> exe_wrapper meson build system can test if the built
> binary is sane.
>
> Another advantage of setting exe_wrapper setting
> is that we can run the tests defined in the meson
> build system. This way if this class is inherited
> not only are the default targets built, their tests
> will also run and have an opportunity to fail the
> the build at the recipe level if necessary.
>
> The user of this class should not inherit meson
> directly but leave it to this class. This class
> may later be merged into meson.bbclass itself.
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/classes/meson-with-tests.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta/classes/meson-with-tests.bbclass
>
> diff --git a/meta/classes/meson-with-tests.bbclass b/meta/classes/meson-with-tests.bbclass
> new file mode 100644
> index 0000000000..ddaeebc726
> --- /dev/null
> +++ b/meta/classes/meson-with-tests.bbclass
> @@ -0,0 +1,26 @@
> +inherit meson
> +
> +DEPENDS_append += "qemu-native"
> +
> +do_write_config_append() {
> +  #You need to pass qemu with the sysroot path
> +  #arguments, but internally meson uses Popen
> +  #so we could try lists of arguments
> +  #While passing a list directly in the exe_wrapper
> +  #parameter passes the sanity test, it later on
> +  #fails in the actual test run with:
> +  #TypeError: expect bytes or str, not list
> +  #So we create an in here wrapper.
> +  cat > ${WORKDIR}/meson_exe_wrapper.sh << EOF
> +#!/bin/sh
> +qemu-${TARGET_ARCH} -L ${RECIPE_SYSROOT} \$@
> +EOF
> +
> +  chmod u+x ${WORKDIR}/meson_exe_wrapper.sh
> +
> +  sed "/binaries/a\exe_wrapper = '${WORKDIR}/meson_exe_wrapper.sh'" -i ${WORKDIR}/meson.cross
> +}
> +
> +do_compile_append() {
> +  ninja test
> +}
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

