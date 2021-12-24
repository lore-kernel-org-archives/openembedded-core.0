Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8596FC433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 06:00:36 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.42642.1640325635423988756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 22:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WihoGhNl;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id f9so6912197qtk.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 22:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uYOYUiXbIbDTfW5FnQ80kTJTCNWhVHlpU5H2HYvN8u0=;
        b=WihoGhNlXquj1wUhZrbV+o8W3lHWLhhqUbWGISFxQuJZxjUckm50tvh3RqNnZpG2kx
         HJq4a/xiPD+T3B6QFFxNvwFVPJCspVwhKgcyKOjy1VXRRKnjHPP4fEjTDyGdytr4WsDI
         inwl6pRFKG69iJgIkFbbYo2OpqXzEIaaFY2GcmUK4EK7yz3VmF/qvn0AfkmtE7Y7AQDd
         3sTlTfpzWchPoCMbmnPTyUHoje9awv96rFqi8tPc9Absq2i71GKxuEl4eBOVbTYXyhKj
         E/3zv7QX788EFWqC34BiuoigXUtS9fcv5M5X1Gas8Ojyi/Y+B7EBwCvcjhhd0pjVVD9Y
         N2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uYOYUiXbIbDTfW5FnQ80kTJTCNWhVHlpU5H2HYvN8u0=;
        b=QmAG5HZzYxxPpWx6bf19hk3SpCTHIoe91ng+m8Nk6haN+ej2BV80j2jNN1luAsaCEm
         +uV/HrOmj322I+AaBT8B1EtSLMc6JxDH2/80SrcX5Zou9SWO3S9c2NeyBx3D/3Mpxjum
         IAjAk/dJyafPMZr2gKVpfuhfUA+FH0FgmOyzHZjE2/ZWAtZriXg9fEdo0WI66Rjn15gw
         69gK5Hc+983SMsrEja1OR9Wh+quApEMysQOql0NzQu32Z/X5nEOb8S0rH06HSguO+3Wl
         NWPQ1tgWeMB2Nwk0ZsrmhUKTXT+4wgBsbZY0mwNkcCybVfTct2EzISSyovzYTPNANHf+
         uxkw==
X-Gm-Message-State: AOAM533KQYZ0cf50U5sAJiNNStUS4jNdBloZ5zDexS5f2iLXjMNgsuRh
	Xz/GsDlQy9d/x7ZQgBklPftFKKAXMh1Inh+qB24=
X-Google-Smtp-Source: 
 ABdhPJzk85Hv9rIDHfpg9aDYzJFapBry+aSHxulhwgIwhoTZXfbwFEXURMnukSRqrBKVRHTSXj/ErPDBQ9Fj86ucgXQ=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr4488559qtw.185.1640325634457;
 Thu, 23 Dec 2021 22:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2021 22:00:08 -0800
Message-ID: 
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 06:00:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159995

is this list of failures due to this patch ?
https://errors.yoctoproject.org/Errors/Build/137579/

On Wed, Dec 22, 2021 at 3:20 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Use the newly added nonetwork task flag to disable network access where
> possible in unpack/patch/configure/compile/install tasks.
>
> We can't disable networking in sstate tasks due to sstate downloads and
> also so we can report hash equivalence to the server.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass  | 4 ++++
>  meta/classes/patch.bbclass | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b709777f243..e4c6c983b59 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {
>      oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
>  }
>  do_unpack[postfuncs] += "create_source_date_epoch_stamp"
> +do_unpack[nonetwork] = "1"
>
>  def get_source_date_epoch_value(d):
>      return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
> @@ -358,6 +359,7 @@ base_do_configure() {
>                 echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
>         fi
>  }
> +do_configure[nonetwork] = "1"
>
>  addtask compile after do_configure
>  do_compile[dirs] = "${B}"
> @@ -368,11 +370,13 @@ base_do_compile() {
>                 bbnote "nothing to compile"
>         fi
>  }
> +do_compile[nonetwork] = "1"
>
>  addtask install after do_compile
>  do_install[dirs] = "${B}"
>  # Remove and re-create ${D} so that is it guaranteed to be empty
>  do_install[cleandirs] = "${D}"
> +do_install[nonetwork] = "1"
>
>  base_do_install() {
>         :
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 8de70254919..57aaf7c31d1 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>
>  addtask patch after do_unpack
>  do_patch[dirs] = "${WORKDIR}"
> +do_patch[nonetwork] = "1"
>  do_patch[depends] = "${PATCHDEPENDENCY}"
>
>  EXPORT_FUNCTIONS do_patch
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159965): https://lists.openembedded.org/g/openembedded-core/message/159965
> Mute This Topic: https://lists.openembedded.org/mt/87909311/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

