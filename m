Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0457277F69;
	Mon,  3 Jul 2017 16:02:09 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 62so173230692wmw.1;
	Mon, 03 Jul 2017 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OPiOJrOFHrRAKGGztdSpzNc8wcBftW06NkLdiWN1SvA=;
	b=u0tv5D5pcDqKqGTxSG7LtMsraqSOcDSY6xxh76HolaWiKfqg0D/Q5ADzG7+88m2znh
	k/hdKz2KvgsoQcWYRKz1pUi8J1NP24dGffiEETqiraf2l59r36m9aozzQiLu66nCM8Xe
	DeK2j5aMWYQR41JnnER5WYUY7/UAhrt/WYlboK6+SU75PZt2yTa6hE9ZT7sxduNW8ust
	IBi/8l3i9X19KdLqsVcEwzXyoXPRaVx3xmxMB6NyejpmrxX8YioJeUtRZI4F8s8sj2/+
	HJndHRyGec+13MwIYtq9SqMi9ezqA2ZgFipr4oJ2KVOjlCTmLj8ycTZIR6yTBSAY/OZU
	5kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OPiOJrOFHrRAKGGztdSpzNc8wcBftW06NkLdiWN1SvA=;
	b=QqIW/Ch/CjmQ0QWnc1CmwI0N4yyS8zA29bkvYUuPirkgAUD0V/UoUZ4Ca14G8+kSg9
	zPnoGAJK+1nl64R/ImWuYd60OsK31s6vkaLu3dPDsu3XEjNUKDTEBY0ylUy26GgGpzi2
	/FJem8N5VjbhqXWDGTZEsxfR1sCW62JfUQxucDNt6JgKbZeJ4l8cQKIqqVnZFxCFrFvl
	o4n4YM3VpVZZ2Av4xxM8eHMOpJGtVOIq3ObdNGhzWd0fqxXdAiHRXheqI1qOTAA5IOig
	gnVqfvhyQ6ggMrxmXMex2DmlUZOXpVSHw4HgjFWC+FUj/HGkPrGV++3YIPGFMPDWxuyZ
	N4wA==
X-Gm-Message-State: AKS2vOyF8K5XHphf8Oj+MX6Oyle8GDxwjGUmycEBhG8nO9JVbGpYX5kS
	mUh+CPwug2VsS4b5B45+kFO+eLZo4g==
X-Received: by 10.80.151.49 with SMTP id c46mr15736603edb.30.1499097730228;
	Mon, 03 Jul 2017 09:02:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Mon, 3 Jul 2017 09:01:39 -0700 (PDT)
In-Reply-To: <CA+chaQeKdNstTz6s1KMLcM+oHE2Rb3CZ0PWo0+j+wM4kzbcQFw@mail.gmail.com>
References: <CA+chaQeKdNstTz6s1KMLcM+oHE2Rb3CZ0PWo0+j+wM4kzbcQFw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jul 2017 09:01:39 -0700
Message-ID: <CAMKF1sqX_v0KA2ETEdT7wYBtx-nAybPk-t1TOZRsjLaENNjCvQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-07-02
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
X-List-Received-Date: Mon, 03 Jul 2017 16:02:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 3, 2017 at 4:20 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date     !!colspan='3'|Failed tasks    !!|Signatures
> !!colspan='14'|QA !!Comment
> |-
> || ||qemuarm ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards ||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path ||
> |-
> ||2017-07-02 ||7 ||8 ||5 ||0 ||0 ||1 ||4 ||0 ||0 ||1238 ||1 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2017-07-02 ==
>
> INFO: jenkins-job.sh-1.8.24 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170702_225940.log
>
> === common (3) ===
>     *
> meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:do_configure
>     *
> meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb:do_package
>     *
> virtual:native:meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_populate_sysroot
>
> === common-x86 (2) ===
>     * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>     *
> openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:do_compile_ptest_base
>
> === qemuarm (4) ===
>     *
> meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb:do_fetch
>     *
> meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb:do_fetch
>     *

these worked ok for me. Seems to be transitory failures.

