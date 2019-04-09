Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9F88C7CFE1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 12:41:23 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id q14so4611894itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7atTyT4MlCEJ/G1UoRrx6iB9j14Uwr0vpSvdiblj14s=;
	b=Nm90Hb9nmCk0G365glUNBIcYjccl4AkquaMh1hEcNd1Nw5Q38hGo+W2yXPGkWylnoT
	BCV9jC0A06M+as01og4tyTWfQvSuMK9J183gU0yrWom3DxFuQKQDv0M0nnZNfsh/bDlK
	+WVmZPRQTOHWUbH5qkV379KoGAMNnbLJqHAy7XK+4xKI8IxTiVHfH76G998FIo9JCcpT
	dSlJMvQfnjoNUREjM8WV0DYVwrxx+V+KfxVt14ewTA4RoUDytFXPSejGXFV6zPeqVy5A
	fYVgm8jVd4jCaWxJA6zfK3d/WldRy+q/vWP/V8Rauwj27zYrmietg6ZoyBv7q3Hn/KLM
	3VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7atTyT4MlCEJ/G1UoRrx6iB9j14Uwr0vpSvdiblj14s=;
	b=k5NqkhENHcv6V730jTjOd08dkUdEjsCoGxpKlB7sB5ovy+L4dtWEW2ujxfcDS/7khc
	MjLPhBux3dUEjYf4J6y2gHZm0KovbdqyrBONIKXRDZ8Hkqoda6yNVbx/a5hQNLFUtJK5
	WC+tEJqbBFEwK76TbniwmRjHQCJ92vCcFsE8wqrBtv3oF/1phfub9BYbyKJIAnuxmSOh
	3OS3hnT8iDYZMA6/FFPdnJHQhXuvLDpFA1DikcWa4zxONJpD3/Nw88Et2QAqJSJ4kHjx
	JABgrkdPe99ZaY+Kk60fI4cHjreKOpdzA6sZZ/zDK9cIhDwTFbdVZAoQO3ShmCo2UHuM
	CIyQ==
X-Gm-Message-State: APjAAAV+oTWo3ZY18ZjyesiuP0yloGySLqNzM55U5JtDbZuC78YDURm5
	M/x0iBnHsMDi7ZlWAyzJ5nVV9sBVw8MMgaYzAhf0sg==
X-Google-Smtp-Source: APXvYqxZwbfvXhHS7EcgxJiDkO7w4gmzd8bhXdtzNVClgTyJj+iRnBtQRUtrQgpQ/4r2hCFScydQnZwsz99+17Prs7U=
X-Received: by 2002:a02:924d:: with SMTP id y13mr23122489jag.24.1554813684594; 
	Tue, 09 Apr 2019 05:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190403132619.17948-1-sno@netbsd.org>
In-Reply-To: <20190403132619.17948-1-sno@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2019 13:41:12 +0100
Message-ID: <CAJTo0LY1veuFqq3SexiZRiU_Q9_EYnfjzMJywaqst8izZO2YuQ@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-sanity: support cpan versions of core modules
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
X-List-Received-Date: Tue, 09 Apr 2019 12:41:23 -0000
Content-Type: text/plain; charset="UTF-8"

Something here isn't working quite right:

WARNING: core-image-base-1.0-r0 do_image_qa: /usr/bin/cpan is a broken link
etc etc

/usr/bin/cpan is a symlink to /usr/bin/cpan.perl, which isn't in the
image.  In fact, it's in perl-misc:

perl-misc:
        /usr/bin/corelist.perl
        /usr/bin/cpan.perl
        /usr/bin/enc2xs.perl
        /usr/bin/encguess.perl
        /usr/bin/h2ph.perl
        /usr/bin/h2xs.perl
        /usr/bin/instmodsh.perl
        /usr/bin/json_pp.perl
        /usr/bin/libnetcfg.perl
        /usr/bin/perlbug
        /usr/bin/perldoc
        /usr/bin/perlivp
        /usr/bin/perlthanks
        /usr/bin/piconv.perl
        /usr/bin/pl2pm.perl
        /usr/bin/pod2html.perl
        /usr/bin/pod2man.perl
        /usr/bin/pod2text.perl
        /usr/bin/pod2usage.perl
        /usr/bin/podchecker.perl
        /usr/bin/podselect.perl
        /usr/bin/prove.perl
        /usr/bin/ptar.perl
        /usr/bin/ptardiff.perl
        /usr/bin/ptargrep.perl
        /usr/bin/shasum.perl
        /usr/bin/splain.perl
        /usr/bin/xsubpp.perl
        /usr/bin/zipdetails.perl

Can you fix the FILES so that the binaries go into the right packages?

Ross

On Wed, 3 Apr 2019 at 14:26, Jens Rehsack <sno@netbsd.org> wrote:
>
> Most of perl core modules are dual-life modules which exists on CPAN
> as well as they do in perl core. Sometime, fixes are uploaded to CPAN
> before a new perl is released which contains the fix of the core
> module. Also, some modules recent releases aren't fully backported
> to earlier releases (out of support, lack of specific feature, ...),
> which makes it up to the distribution build to choose between core
> or CPAN version, respectively.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../perl-sanity/perl_5.28.1.bb                | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
> index 5aa7cd3ee1..e609c056d0 100644
> --- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
> +++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
> @@ -172,6 +172,39 @@ perl_package_preprocess () {
>              ${PKGD}${libdir}/perl5/config.sh
>  }
>
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +
> +ALTERNATIVE_${PN} = "corelist cpan enc2xs encguess h2ph h2xs instmodsh json_pp libnetcfg \
> +                     piconv pl2pm pod2html pod2man pod2text pod2usage podchecker podselect \
> +                     prove ptar ptardiff ptargrep shasum splain xsubpp zipdetails"
> +ALTERNATIVE_LINK_NAME[corelist] = "${bindir}/corelist"
> +ALTERNATIVE_LINK_NAME[cpan] = "${bindir}/cpan"
> +ALTERNATIVE_LINK_NAME[enc2xs] = "${bindir}/enc2xs"
> +ALTERNATIVE_LINK_NAME[encguess] = "${bindir}/encguess"
> +ALTERNATIVE_LINK_NAME[h2ph] = "${bindir}/h2ph"
> +ALTERNATIVE_LINK_NAME[h2xs] = "${bindir}/h2xs"
> +ALTERNATIVE_LINK_NAME[instmodsh] = "${bindir}/instmodsh"
> +ALTERNATIVE_LINK_NAME[json_pp] = "${bindir}/json_pp"
> +ALTERNATIVE_LINK_NAME[libnetcfg] = "${bindir}/libnetcfg"
> +ALTERNATIVE_LINK_NAME[piconv] = "${bindir}/piconv"
> +ALTERNATIVE_LINK_NAME[pl2pm] = "${bindir}/pl2pm"
> +ALTERNATIVE_LINK_NAME[pod2html] = "${bindir}/pod2html"
> +ALTERNATIVE_LINK_NAME[pod2man] = "${bindir}/pod2man"
> +ALTERNATIVE_LINK_NAME[pod2text] = "${bindir}/pod2text"
> +ALTERNATIVE_LINK_NAME[pod2usage] = "${bindir}/pod2usage"
> +ALTERNATIVE_LINK_NAME[podchecker] = "${bindir}/podchecker"
> +ALTERNATIVE_LINK_NAME[podselect] = "${bindir}/podselect"
> +ALTERNATIVE_LINK_NAME[prove] = "${bindir}/prove"
> +ALTERNATIVE_LINK_NAME[ptar] = "${bindir}/ptar"
> +ALTERNATIVE_LINK_NAME[ptardiff] = "${bindir}/ptardiff"
> +ALTERNATIVE_LINK_NAME[ptargrep] = "${bindir}/ptargrep"
> +ALTERNATIVE_LINK_NAME[shasum] = "${bindir}/shasum"
> +ALTERNATIVE_LINK_NAME[splain] = "${bindir}/splain"
> +ALTERNATIVE_LINK_NAME[xsubpp] = "${bindir}/xsubpp"
> +ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
> +
>  require perl-ptest.inc
>
>  FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/libperl.so* \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

