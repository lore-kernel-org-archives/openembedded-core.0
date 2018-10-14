Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 299A979B22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 11:40:46 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p125-v6so13027783oic.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 04:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VN8NVKl46alckG3it8jQ0GzDCsyLMxQaQKyTwFMoR9g=;
	b=CnZj75gvGFsVWZMCSc1Cua+DJFDzvx0OWRCFkxZbKnq4FtY4HH03Dopz8ohoq8AYND
	1dCmH4ULEiNlWnCpt2pBfMgNQPkip683ltSEJQ47Cn4gBXKd0YsM99K/75/Pw3kxq8S3
	XqZRP7yyukFuxPIFC+OF/ZwFIKZp9Djgs9UhsJtjUyr1RGNLPlbi4GDgOWiHHUMcQ9qi
	Wm3wJof/lLNF4fHT7BQgub3cVXtCTCZEYDUBNwxpnQUlsZ1G8MFZJq2eLTMOudvYq3ka
	L7idmI1v4Z2wu2DgaPsHey5giHUlf2fRCO21azvhw1K0Tc+nqHtyoYX3uicL0DqMQXMM
	BTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VN8NVKl46alckG3it8jQ0GzDCsyLMxQaQKyTwFMoR9g=;
	b=bgm1i70ZsYKGAW01KS//wyfq3/xJbsYm2imB9o2TqRjMQeFFFqML3NkHCzn5z50rPI
	295vj2tVwM5b5HMDkzEj7r+xF7PK4ZbawaL4GihHbvgI2vm9V/jpbyk2hrEjxNH1Z+0Z
	g5MLKTtBGsJ/n36LmXUBb5/dMrOCuOfmLET4fAIg6KOHg6ZY7wTv3EjVVMyGRgymACEY
	vjxGHweg4H1eLqfiCbrusQXsBdci/8fqEfguQ+cWoeWrmqJoFOQkL4ovmu596vB6HGAG
	XyJpCKaoxdpPULISlUO9FS74dND/LNnx2nlNLZCVbfYqLkwvRzkL7NqMnmalooLYmADd
	Sf2Q==
X-Gm-Message-State: ABuFfogR/y3HUlV6lXyS6KsnSfNy8JOo/h9lcWSFU8HkFlRv/SR5m+fq
	dIMBk71zcCznWRQK/4zJ6+eaRBiYTwSKCjGI/TE=
X-Google-Smtp-Source: ACcGV63rx/vJmYebvn33sRLpi3pSRDy5gf71n1Wf6I9+3Vq6wfx7hyV51037BtPvRKaViVkf+s6ybYiBiQGJR/58fQg=
X-Received: by 2002:aca:4b56:: with SMTP id
	y83-v6mr7202201oia.88.1539517247844; 
	Sun, 14 Oct 2018 04:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
	<CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
	<CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
	<f50185f96f49dd8e3e094549bcccdb9c100adbd0.camel@linuxfoundation.org>
	<CA+chaQcLQSmXABciMyrUvnVrBoqLqr+jYH+tXV8oOgCGhFrSFA@mail.gmail.com>
	<bda03d36ae78dfbe63c48b2747d223e5e1e1ec18.camel@linuxfoundation.org>
In-Reply-To: <bda03d36ae78dfbe63c48b2747d223e5e1e1ec18.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Oct 2018 13:40:36 +0200
Message-ID: <CANNYZj9jJK9twMhWxZeEft1PuRMMY=BFr5+5QJj3Low+KRVd3g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Sun, 14 Oct 2018 11:40:47 -0000
Content-Type: text/plain; charset="UTF-8"

This is probably related to this issue?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12913

Alex
On Sun, 14 Oct 2018 at 13:21, <richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2018-10-13 at 23:16 +0200, Martin Jansa wrote:
> > I was checking my builds and here is what I've found.
>
> Thanks for digging into this, it has highlighted a few important
> issues. I've queued the patches.
>
> > $ grep locale-base env.bash
> > $
> >
> > And in the build without the bbappend:
> >
> > # $RDEPENDS_bash-ptest [3 operations]
> > #   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
> > #     " make"
> > #   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-
> > native data_smart.py:641 [renameVar]
> > #     ""
> > #   override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-
> > nativesdk data_smart.py:641 [renameVar]
> > #     ""
> > # pre-expansion value:
> > #   " make locale-base-fr-fr locale-base-de-de"
> > RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
> >
> > but also without the RDEPENDS_${PN}-ptest history:
> >
> > $ grep RDEPENDS.*ptest env.bash
> > #   override[bash-ptest]:rename from RDEPENDS_${PN}-ptest data.py:116
> > [expandKeys]
> > #   override[bash-ptest_class-native]:rename from RDEPENDS_${PN}-
> > ptest_class-native data_smart.py:641 [renameVar]
> > #   override[bash-ptest_class-nativesdk]:rename from RDEPENDS_${PN}-
> > ptest_class-nativesdk data_smart.py:641 [renameVar]
> > # $RDEPENDS_bash-ptest [3 operations]
> > #   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
> > #   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-
> > native data_smart.py:641 [renameVar]
> > #   override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-
> > nativesdk data_smart.py:641 [renameVar]
> > RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
> > # $RDEPENDS_bash-ptest_class-native
> > #   rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:641
> > [renameVar]
> > RDEPENDS_bash-ptest_class-native=""
> > # $RDEPENDS_bash-ptest_class-nativesdk
> > #   rename from RDEPENDS_${PN}-ptest_class-nativesdk
> > data_smart.py:641 [renameVar]
> > RDEPENDS_bash-ptest_class-nativesdk=""
> >
> > $ grep locale-base env.bash
> > #   " make locale-base-fr-fr locale-base-de-de"
> > RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
> [...]
> > It just magically appears in pre-expansion value.
> >
> > Shouldn't bitbake -e show that "locale-base-fr-fr locale-base-de-de"
> > were appended (and in the build with bbappend that they were appended
> > and then removed)? That would help me to find out what's going on
> > much faster.
>
> Agreed, bitbake needs to do better here. I had a quick poke around and
> came up with this:
>
> diff --git a/bitbake/lib/bb/data_smart.py b/bitbake/lib/bb/data_smart.py
> index 7b09af5cf1b..4434142a02e 100644
> --- a/bitbake/lib/bb/data_smart.py
> +++ b/bitbake/lib/bb/data_smart.py
> @@ -267,6 +267,16 @@ class VariableHistory(object):
>              return
>          self.variables[var].append(loginfo.copy())
>
> +    def rename_variable_hist(self, oldvar, newvar):
> +        if not self.dataroot._tracking:
> +            return
> +        if oldvar not in self.variables:
> +            return
> +        if newvar not in self.variables:
> +            self.variables[newvar] = []
> +        for i in self.variables[oldvar]:
> +            self.variables[newvar].append(i.copy())
> +
>      def variable(self, var):
>          remote_connector = self.dataroot.getVar('_remote_data', False)
>          if remote_connector:
> @@ -619,6 +629,7 @@ class DataSmart(MutableMapping):
>
>          val = self.getVar(key, 0, parsing=True)
>          if val is not None:
> +            self.varhistory.rename_variable_hist(key, newkey)
>              loginfo['variable'] = newkey
>              loginfo['op'] = 'rename from %s' % key
>              loginfo['detail'] = val
>
>
> which now shows:
>
> # $RDEPENDS_bash-ptest [8 operations]
> #   append /media/build1/poky/meta/recipes-extended/bash/bash.inc:26
> #     "make"
> #   _append[libc-glibc] /media/build1/poky/meta/recipes-extended/bash/bash.inc:29
> #     " locale-base-fr-fr locale-base-de-de"
> #   _remove[libc-glibc] /media/build1/poky/meta/recipes-extended/bash/bash_4.4.18.bb:43
> #     "locale-base-fr-fr locale-base-de-de"
> #   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
> #     "make"
> #   override[class-native]:set /media/build1/poky/meta/classes/ptest.bbclass:13
> #     ""
> #   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:652 [renameVar]
> #     ""
> #   override[class-nativesdk]:set /media/build1/poky/meta/classes/ptest.bbclass:14
> #     ""
> #   override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:652 [renameVar]
> #     ""
> # pre-expansion value:
> #   "make"
> RDEPENDS_bash-ptest="make"
>
> which is better but I'm confused why there are the "rename from" for
> the overrides which aren't being applied (this is for bash, not bash-
> native or bash-nativesdk).
>
> So more investigation is needed...
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

