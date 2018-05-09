Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id ED413750AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 22:05:01 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id x9-v6so39822pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 15:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v9ur+vZMFGdYG5oU/1kIGhVzs0HD8KxQ49hj5ofxqUk=;
	b=nMZ7BGEwofB+Rhen9Fx/YvHsP3usD/G5gCoKQszs/AejvZ9tsh/0uAXJIE0N8rePnN
	BtwM10+xIMGaZJB8ypkpma815vbzYLDXrrWU4LlGpXYqeVs+ZcEFo21rD8POcMWe7spW
	YKtD8n8SaVoR/thlzsYOIlIqH23YTsNW0BOPr9/g/LfeJLQsp6srAM+geatWOmgiW7VX
	kUBbJC7+ATYcQpZuptbhekWNk1wKK1sbPbhx0lWjvQguVvc9rFfu2KXb85lAg7vIGC8w
	spgRUhJhETxSgfN0aN3AfzDDAwnocjLgY3I1b5EEZZcg++/0IuUbdN3jh0yQw9r3c/9P
	niBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v9ur+vZMFGdYG5oU/1kIGhVzs0HD8KxQ49hj5ofxqUk=;
	b=PtPxGbsLtNN0kBVEzrez8MoA+ULSPimEE7sDHUHN1P3Ba04nWrSTGgLdNUxepE1f5J
	L/IjlE3CHrNc05K9YwYj74yblq8OaNUKhqP309mSIBGclfhQExoBYaxwQXV3mLTunXZH
	7enfiQS7cn33fkF0PvUIGCknjW+RYERUv4u/WZarVrMMGNL2HvNQq4DZcizmxYIaaEzF
	qifhDMcb+7Htgpi6PtgqH5K1kpXTnb7N3FXgl+ixe//7nWpoxDK1Y56tw3O883IFfzOz
	kMXcKz41Lf66LyJ79dfdjJWi3YCNdFP3+7jvo+xH4mC4bgYaJucK9pamPkgzSKONqIGE
	hY/w==
X-Gm-Message-State: ALQs6tDqjbbYny6PZW3y+belIH5okkuuOy1GXbFVuXQLg6Ypal31fNqU
	QUV9Om3DR9v3wOtdwHimtuM3OIp71R4UM6PM27Y=
X-Google-Smtp-Source: AB8JxZp8Hzovu3dVEMA0wkD+FxxlbjW34UCjj3mN+4Y+HdvFTUzYFMBGXgmveHuy1RFr/ynkAxffEWBHJgYZU/8nRKI=
X-Received: by 2002:a63:41c1:: with SMTP id
	o184-v6mr36948717pga.393.1525903502432; 
	Wed, 09 May 2018 15:05:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.143.9 with HTTP; Wed, 9 May 2018 15:04:32 -0700 (PDT)
In-Reply-To: <1525902408-6796-2-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
	<1525902408-6796-2-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2018 15:04:32 -0700
Message-ID: <CAMKF1sqTLPYtMDpA6Sb0VBoJZQACMBpBvcAWCCGDdy0=2uD99g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/8] babeltrace: move ASNEEDED over-ride into the babeltrace recipe
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
X-List-Received-Date: Wed, 09 May 2018 22:05:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 9, 2018 at 2:46 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Move the recipe specific over-ride for ASNEEDED into the recipe to
> make it more apparent that the over-ride is being applied (and that
> it should be re-checked on version updates, etc).
>

I think this patchset is good however two things, squash all Oe-core as-needed
moves to one commit. secondly, check if they are still needed, if so then a line
or two documenting what the problem is may be as a followup
Thirdly, deleted as-needed.inc and append this option to TARGET_LDFLAGS
directly in bitbake.conf

> Also misc minor recipe cleanup (re-order variables to follow the OE
> style guide, etc).
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/distro/include/as-needed.inc        |  1 -
>  meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 12 ++++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
> index 6a8ad9d..38de3a1 100644
> --- a/meta/conf/distro/include/as-needed.inc
> +++ b/meta/conf/distro/include/as-needed.inc
> @@ -1,7 +1,6 @@
>
>  ASNEEDED = "-Wl,--as-needed"
>
> -ASNEEDED_pn-babeltrace = ""
>  ASNEEDED_pn-console-tools = ""
>  ASNEEDED_pn-distcc = ""
>  ASNEEDED_pn-openobex = ""
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> index 5d7a7ef..2a2fa1e 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> @@ -2,18 +2,18 @@ SUMMARY = "Babeltrace - Trace Format Babel Tower"
>  DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
>  HOMEPAGE = "http://www.efficios.com/babeltrace/"
>  BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
> -
>  LICENSE = "MIT & GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
>
>  DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>
> -inherit autotools pkgconfig
> +SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
> +SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
> +
> +S = "${WORKDIR}/git"
>
> -SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
> -"
> +inherit autotools pkgconfig
>
>  EXTRA_OECONF = "--disable-debug-info"
>
> -S = "${WORKDIR}/git"
> -SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
> +ASNEEDED = ""
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

